local jdtls = require("jdtls")

-- Mason package paths
local jdtls_path = vim.fn.expand("$MASON/packages/jdtls")
local java_debug_path = vim.fn.expand("$MASON/packages/java-debug-adapter")
local java_test_path = vim.fn.expand("$MASON/packages/java-test")

-- Bundles for debugging and testing
local bundles = {
  vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", true), "\n"))

-- Project-specific workspace directory
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local config = {
  cmd = {
    jdtls_path .. "/bin/jdtls",
    "-data",
    workspace_dir,
  },
  root_dir = vim.fs.root(0, { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }),
  settings = {
    java = {
      inlayHints = { parameterNames = { enabled = "all" } },
      signatureHelp = { enabled = true },
    },
  },
  init_options = {
    bundles = bundles,
  },
  on_attach = function(_, bufnr)
    jdtls.setup_dap()

    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "JDTLS: " .. desc })
    end
    map("<leader>jo", jdtls.organize_imports, "Organize Imports")
    map("<leader>jv", jdtls.extract_variable, "Extract Variable")
    map("<leader>jc", jdtls.extract_constant, "Extract Constant")
    map("<leader>jt", jdtls.test_nearest_method, "Test Nearest Method")
    map("<leader>jT", jdtls.test_class, "Test Class")

    vim.keymap.set("v", "<leader>jm", function()
      jdtls.extract_method(true)
    end, { buffer = bufnr, desc = "JDTLS: Extract Method" })
  end,
}

jdtls.start_or_attach(config)
