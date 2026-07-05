local AI = require("config.ai")

return {

  "milanglacier/minuet-ai.nvim",
  event = "InsertEnter",
  opts = {
    provider = "openai_fim_compatible",
    mode = "fim",
    n_completions = 1,
    debounce = 200,
    request_timeout = AI.generation.completion.timeout / 1000,
    add_single_line_entry = true,
    provider_options = {
      openai_fim_compatible = {
        api_key = "TERM",
        end_point = AI.completion_url("/completions"),
        model = AI.completion_model(),
        max_tokens = AI.generation.completion.max_tokens,
        temperature = AI.generation.completion.temperature,
      },
    },
  },
}
