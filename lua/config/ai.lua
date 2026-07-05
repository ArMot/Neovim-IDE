local M = {}

----------------------------------------------------------------------
-- Backend Selection
----------------------------------------------------------------------

M.backends = {
  completion = "lmstudio",
  chat = "aikar",
}

----------------------------------------------------------------------
-- Providers
----------------------------------------------------------------------

M.providers = {
  --------------------------------------------------------------------
  -- LM Studio
  --------------------------------------------------------------------
  lmstudio = {
    endpoint = "http://127.0.0.1:1234/v1",
    api_key_name = nil,

    models = {
      completion = "qwen2.5-coder-3b",
      chat = "qwen3-coder-30b",
    },
  },

  --------------------------------------------------------------------
  -- AI-KAR
  --------------------------------------------------------------------
  aikar = {
    endpoint = "https://api.ai-kar.com/v1",
    api_key_name = "AIKAR_API_KEY",

    default = "fast",

    models = {
      fast = "qwen/qwen3-coder-30b-a3b-instruct",
      next = "qwen/qwen3-coder-next",
      best = "qwen/qwen3-coder-480b-a35b-instruct",
    },
  },
}

----------------------------------------------------------------------
-- Generation
----------------------------------------------------------------------

M.generation = {
  completion = {
    timeout = 30000,
    temperature = 0.2,
    max_tokens = 256,
  },

  chat = {
    timeout = 30000,
    temperature = 0.6,
    max_tokens = 8192,
  },
}

----------------------------------------------------------------------
-- Helpers
----------------------------------------------------------------------

local function provider(kind)
  return M.providers[M.backends[kind]]
end

----------------------------------------------------------------------
-- Completion
----------------------------------------------------------------------

function M.completion_provider()
  return provider("completion")
end

function M.completion_endpoint()
  return provider("completion").endpoint
end

function M.completion_api_key_name()
  return provider("completion").api_key_name
end

function M.completion_model()
  local p = provider("completion")

  if p.models.completion then
    return p.models.completion
  end

  return p.models[p.default]
end

function M.completion_url(path)
  return M.completion_endpoint() .. path
end

----------------------------------------------------------------------
-- Chat
----------------------------------------------------------------------

function M.chat_provider()
  return provider("chat")
end

function M.chat_endpoint()
  return provider("chat").endpoint
end

function M.chat_api_key_name()
  return provider("chat").api_key_name
end

function M.chat_model()
  local p = provider("chat")

  if p.models.chat then
    return p.models.chat
  end

  return p.models[p.default]
end

return M
