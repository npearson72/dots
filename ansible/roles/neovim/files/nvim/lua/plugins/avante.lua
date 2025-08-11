--[[
temperature = 0.5: This is a sweet spot for pair programming.

It's high enough to encourage the model to be a creative partner.
It won't just regurgitate the most predictable solution but will
explore viable alternatives. This is useful when you're stuck and
need a different angle.

It's low enough to keep the output grounded in reality and prevent
the model from "hallucinating" or providing completely nonsensical
code. The suggestions will still be logical and based on the context
of your code.

---

max_tokens = 2048: This value is a bit lower than the maximum
(4096) for a specific reason.

A good pair programming session involves back-and-forth
communication. You don't want the AI to dump an entire, complete
file. Instead, you want it to provide a concise block of code or a
clear explanation that you can discuss and iterate on.

A lower max_tokens value encourages the AI to be more focused and
to provide code snippets or explanations that fit within a
reasonable screen size, making it easier for you to review and
respond. You can always ask for more, but starting with a concise
response is better for a collaborative process.

---

top_p = 0.9 and top_k = 40: These two parameters work together to
control the diversity of the output in a balanced way.

top_k = 40: ensures the model only considers a pool of the 40 most
likely next tokens. This keeps the output relevant and prevents it
from going completely off-topic.

top_p = 0.9: then applies a filter to that pool, ensuring that the
model doesn't get stuck on a single, overly-deterministic path.
This allows for a good amount of variation in the model's
suggestions, which is what you want in a pair programming
scenario. The combination of both makes the suggestions diverse
but still highly relevant to the task at hand.
]]

local providers = {
  copilot_gpt_5 = {
    __inherited_from = 'copilot',
    model = 'gpt-5',
    extra_params = {
      temperature = 0.5,
      max_tokens = 2048,
      top_p = 0.9,
      top_k = 40,
    },
  },
  gemini_pro = {
    __inherited_from = 'gemini',
    api_key_name = "AVANTE_GEMINI_API_KEY",
    model = 'gemini-1.5-pro',
    temperature = 0,
    max_tokens = 4096,
  },
  gemini_flash = {
    __inherited_from = 'gemini',
    api_key_name = "AVANTE_GEMINI_API_KEY",
    model = 'gemini-1.5-flash',
    temperature = 0.5,
    max_tokens = 2048,
    top_p = 0.9,
    top_k = 40,
  }
}

local config = function()
  require('avante').setup({
    selector = {
      provider = 'telescope'
    },
    hints = { enabled = false },
    input = {
      provider = 'telescope',
      provider_opts = {
        title = 'Avante Input',
        icon = ' ',
      },
    },
    provider = 'gemini_flash',
    providers = providers,
    web_search_engine = {
      provider = "tavily",
    }
  })
end

return {
  {
    'yetone/avante.nvim',
    build = 'make',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- Never set this value to '*'! Never!
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-tree/nvim-web-devicons',
    },
    config = config -- Corrected from `confg` to `config`
  }
}
