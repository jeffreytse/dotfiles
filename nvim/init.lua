-----------------------------------
-- Plugin copilot-chat settings.
-----------------------------------

require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
  window = {
    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
    width = 0.4,         -- fractional width of parent, or absolute width in columns when > 1
    height = 0.5,        -- fractional height of parent, or absolute height in rows when > 1
  },
  mappings = {
    -- Fix a conflict between CopilotChat and how it takes control of the <TAB>
    -- key from coc.nvim & cmp-nvim.
    complete = {
      detail = 'Use @<Tab> or /<Tab> for options.',
      insert = '<C-Tab>',
    }
  }
}

-----------------------------------
-- Colorizer
-----------------------------------

require'colorizer'.setup()

