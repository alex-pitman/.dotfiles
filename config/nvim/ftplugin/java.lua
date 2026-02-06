local function get_jdtls_path()
  -- Return where mason installed the jdtls binary
  return vim.fn.expand("$MASON/packages/jdtls")
end

local function get_workspace_dir()
  -- Construct the workspace directory for the currently opened project
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  return vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
end

local function get_bundles()
  -- Find where mason installed the debug adapater and test binaries
  local debug_path = vim.fn.expand("$MASON/packages/java-debug-adapter")
  local test_path = vim.fn.expand("$MASON/packages/java-test")

  -- Construct the bundles
  local bundles = {
    vim.fn.glob(debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
  }
  vim.list_extend(bundles, vim.split(vim.fn.glob(test_path .. "/extension/server/*.jar", true), "\n"))

  return bundles
end

local function get_settings()
  -- Configure jdtls settings
  local settings = {
    java = {
      -- Configure code generation to resemble IntelliJ
      codeGeneration = {
        -- Use Java 7 Objects method for hashCode and equals methods
        hashCodeEquals = {
          useInstanceof = true,
          useJava7Objects = true,
        },
        -- Configure toString to resemble IntelliJ
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        -- Enforce code blocks when generating code
        useBlocks = true,
      },
      -- Download sources for eclipse projects
      eclipse = {
        downloadSources = true,
      },
      -- Enable inlay hints for parameter names
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
      -- Download sources for maven/gradle projects
      maven = {
        downloadSources = true,
      },
      -- Enable method signature help
      signatureHelp = {
        enabled = true,
      },
      -- Prevent wildcarding imports
      sources = {
        starThreshold = 9999,
        staticThreshold = 9999,
      },
    },
  }
  return settings
end

local function setup_keymaps(bufnr)
  local map = function(mode, keys, func, desc)
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  local jdtls = require("jdtls")

  -- Normal mode keymaps
  map("n", "<leader>jo", jdtls.organize_imports, "[J]ava [O]rganize Imports")
  map("n", "<leader>jv", jdtls.extract_variable, "[J]ava Extract [V]ariable")
  map("n", "<leader>jc", jdtls.extract_constant, "[J]ava Extract [C]onstant")
  map("n", "<leader>jt", jdtls.test_nearest_method, "[J]ava [T]est Method")
  map("n", "<leader>jT", jdtls.test_class, "[J]ava [T]est Class")

  -- Visual mode keymaps
  map("v", "<leader>jm", function()
    jdtls.extract_method(true)
  end, "[J]ava Extract [M]ethod")
end

local function setup_jdtls()
  -- Retrieve paths necessary to start jdtls
  local jdtls_path = get_jdtls_path()
  local workspace_dir = get_workspace_dir()

  -- Create the command to start jdtls
  local cmd = {
    jdtls_path .. "/bin/jdtls",
    "-data",
    workspace_dir,
  }

  -- Get the root directory of the project
  local root_dir = vim.fs.root(0, { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" })

  -- Get debug adapter and test runner extensions
  local bundles = get_bundles()
  local init_options = {
    bundles = bundles,
  }

  -- Get the settings for jdtls
  local settings = get_settings()

  -- Create the on_attach callback
  local on_attach = function(_, bufnr)
    require("jdtls").setup_dap()

    -- Delay until server is ready
    vim.defer_fn(function()
      require("jdtls.dap").setup_dap_main_class_configs()
    end, 1000)
    setup_keymaps(bufnr)
  end

  -- Create the jdtls config
  local config = {
    cmd = cmd,
    root_dir = root_dir,
    init_options = init_options,
    settings = settings,
    on_attach = on_attach,
  }

  -- Start or attach to jdtls
  require("jdtls").start_or_attach(config)
end

setup_jdtls()
