return function(setup, commands)
  local loaded = false

  local function load()
    if loaded then
      return
    end
    for name in pairs(commands) do
      vim.api.nvim_del_user_command(name)
    end
    setup()
    loaded = true
  end

  for name, options in pairs(commands) do
    local opts = vim.tbl_extend("force", { nargs = "*" }, options)
    if opts.nargs ~= 0 and not opts.complete then
      opts.complete = function(_, line)
        load()
        return vim.fn.getcompletion(line, "cmdline")
      end
    end
    vim.api.nvim_create_user_command(name, function(ctx)
      load()
      local range = ctx.range > 0 and (ctx.line1 .. "," .. ctx.line2) or ""
      vim.cmd(ctx.mods .. " " .. range .. name .. (ctx.bang and "!" or "") .. " " .. ctx.args)
    end, opts)
  end

  return load
end
