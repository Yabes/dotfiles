local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

--- Gets a path to a package in the Mason registry.
--- Prefer this to `get_package`, since the package might not always be
--- available yet and trigger errors.
---@param pkg string
---@param path? string
local function get_pkg_path(pkg, path)
  pcall(require, "mason")
  local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
  path = path or ""
  local ret = root .. "/packages/" .. pkg .. "/" .. path
  return ret
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
      -- {
      --   "mxsdev/nvim-dap-vscode-js",
      --   config = function()
      --     require("dap-vscode-js").setup({
      --       debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
      --       adapters = {
      --         "chrome",
      --         "pwa-node",
      --         "pwa-chrome",
      --         "pwa-msedge",
      --         "pwa-extensionHost",
      --         "node-terminal",
      --         "node",
      --       },
      --     })
      --   end,
      -- },
      -- virtual text for the debugger
    },
    config = function()
      local dap = require("dap")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- setup dap config by VsCode launch.json file
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
            "${port}",
          },
        },
      }

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Auto-attach
          {
            type = "pwa-node",
            request = "attach",
            name = "Auto Attach",
            cwd = vim.fn.getcwd(),
            protocol = "inspector",
          },
          -- Debug single nodejs files
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
          },
          -- Debug nodejs processes started with --inspect
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
          },
          -- Debug web app
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
                function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end,
              })
            end,
            webRoot = "${workspaceFolder}",
            skipFiles = { "<node_internals>/**/*.js" },
            protocol = "inspector",
            sourceMaps = true,
            useDataDir = false,
          },
          -- Divider
          {

            name = "----- ⬇ launch.json configs ⬇ ----",
            type = "",
            request = "launch",
          },
        }
      end
    end,
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Run/Continue",
      },
      {
        "<leader>da",
        function()
          if vim.fn.filereadable(".vscode/launch.json") then
            local dap_vscode = require("dap.ext.vscode")
            dap_vscode.load_launchjs(nil, {
              ["pwa-node"] = js_based_languages,
              ["node"] = js_based_languages,
              ["chrome"] = js_based_languages,
              ["pwa-chrome"] = js_based_languages,
            })
          end

          require("dap").continue()
        end,
        desc = "Run with Args",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup(opts)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",

      {
        "theHamsta/nvim-dap-virtual-text",

        opts = {},
      },
    },
  },
}
