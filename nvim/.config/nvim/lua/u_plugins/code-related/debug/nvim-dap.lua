-----------------------------------------------------------
-- Plugin for debbuging protocols
-----------------------------------------------------------

local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

local vm = vim

dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/alacritty';
  args = { '-e' };
}
-- dap.defaults.fallback.force_external_terminal = true

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vm.fn.stdpath("data") .. '/mason/bin/OpenDebugAD7',
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = vm.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vm.fn.input('Path to executable: ', vm.fn.getcwd() .. '/', 'file')
    end,
    cwd = vm.fn.getcwd(),
    stopAtEntry = true,

    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vm.fn.input('Path to executable: ', vm.fn.getcwd() .. '/', 'file')
    end,

    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
}

dap.configurations.c = dap.configurations.cpp


dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.

      local cwd = vm.fn.getcwd()
      if vm.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vm.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
      -- local venv = os.getenv("VIRTUAL_ENV")
      -- return vim.fn.getcwd() .. string.format("%s/bin/python", venv)
    end;
  },
}
