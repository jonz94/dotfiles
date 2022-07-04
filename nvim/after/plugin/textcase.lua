-- preserve original `ga` & `ge` keymap
vim.keymap.set('n', '<Leader>ga', 'ga')
vim.keymap.set('n', '<Leader>ge', 'ge')

if vim.g.vscode then
  -- stylua: ignore start
  -- [extension] hjdarnel.vscode-change-case
  vim.keymap.set('n', 'gau', '<Cmd>call VSCodeNotify("extension.changeCase.upper")<CR>')
  vim.keymap.set('n', 'gal', '<Cmd>call VSCodeNotify("extension.changeCase.lower")<CR>')
  vim.keymap.set('n', 'gas', '<Cmd>call VSCodeNotify("extension.changeCase.snake")<CR>')
  vim.keymap.set('n', 'gad', '<Cmd>call VSCodeNotify("extension.changeCase.kebab")<CR>')
  vim.keymap.set('n', 'gan', '<Cmd>call VSCodeNotify("extension.changeCase.constant")<CR>')
  vim.keymap.set('n', 'gao', '<Cmd>call VSCodeNotify("extension.changeCase.dot")<CR>')
  vim.keymap.set('n', 'gaa', '<Cmd>call VSCodeNotify("extension.changeCase.sentence")<CR>')
  vim.keymap.set('n', 'gac', '<Cmd>call VSCodeNotify("extension.changeCase.camel")<CR>')
  vim.keymap.set('n', 'gap', '<Cmd>call VSCodeNotify("extension.changeCase.pascal")<CR>')
  vim.keymap.set('n', 'gat', '<Cmd>call VSCodeNotify("extension.changeCase.title")<CR>')
  vim.keymap.set('n', 'gaf', '<Cmd>call VSCodeNotify("extension.changeCase.path")<CR>')

  -- [extension] bragov4ik.change-case-of-symbol
  vim.keymap.set('n', 'gaS', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.snakeCase")<CR>')
  vim.keymap.set('n', 'gaD', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.paramCase")<CR>')
  vim.keymap.set('n', 'gaN', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.constantCase")<CR>')
  vim.keymap.set('n', 'gaO', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.dotCase")<CR>')
  vim.keymap.set('n', 'gaA', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.sentenceCase")<CR>')
  vim.keymap.set('n', 'gaC', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.camelCase")<CR>')
  vim.keymap.set('n', 'gaP', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.pascalCase")<CR>')
  vim.keymap.set('n', 'gaF', '<Cmd>call VSCodeNotify("changeCaseOfSymbol.pathCase")<CR>')
  -- stylua: ignore end

  return
end

local textcase_status_ok, textcase = pcall(require, 'textcase')
if not textcase_status_ok then
  return
end

-- stylua: ignore start
vim.keymap.set('n', 'gau', function() textcase.current_word('to_upper_case')    end)
vim.keymap.set('n', 'gal', function() textcase.current_word('to_lower_case')    end)
vim.keymap.set('n', 'gas', function() textcase.current_word('to_snake_case')    end)
vim.keymap.set('n', 'gad', function() textcase.current_word('to_dash_case')     end)
vim.keymap.set('n', 'gan', function() textcase.current_word('to_constant_case') end)
vim.keymap.set('n', 'gao', function() textcase.current_word('to_dot_case')      end)
vim.keymap.set('n', 'gaa', function() textcase.current_word('to_phrase_case')   end)
vim.keymap.set('n', 'gac', function() textcase.current_word('to_camel_case')    end)
vim.keymap.set('n', 'gap', function() textcase.current_word('to_pascal_case')   end)
vim.keymap.set('n', 'gat', function() textcase.current_word('to_title_case')    end)
vim.keymap.set('n', 'gaf', function() textcase.current_word('to_path_case')     end)

vim.keymap.set('n', 'gaU', function() textcase.lsp_rename('to_upper_case')    end)
vim.keymap.set('n', 'gaL', function() textcase.lsp_rename('to_lower_case')    end)
vim.keymap.set('n', 'gaS', function() textcase.lsp_rename('to_snake_case')    end)
vim.keymap.set('n', 'gaD', function() textcase.lsp_rename('to_dash_case')     end)
vim.keymap.set('n', 'gaN', function() textcase.lsp_rename('to_constant_case') end)
vim.keymap.set('n', 'gaO', function() textcase.lsp_rename('to_dot_case')      end)
vim.keymap.set('n', 'gaA', function() textcase.lsp_rename('to_phrase_case')   end)
vim.keymap.set('n', 'gaC', function() textcase.lsp_rename('to_camel_case')    end)
vim.keymap.set('n', 'gaP', function() textcase.lsp_rename('to_pascal_case')   end)
vim.keymap.set('n', 'gaT', function() textcase.lsp_rename('to_title_case')    end)
vim.keymap.set('n', 'gaF', function() textcase.lsp_rename('to_path_case')     end)

vim.keymap.set('n', 'geu', function() textcase.operator('to_upper_case')    end)
vim.keymap.set('n', 'gel', function() textcase.operator('to_lower_case')    end)
vim.keymap.set('n', 'ges', function() textcase.operator('to_snake_case')    end)
vim.keymap.set('n', 'ged', function() textcase.operator('to_dash_case')     end)
vim.keymap.set('n', 'gen', function() textcase.operator('to_constant_case') end)
vim.keymap.set('n', 'geo', function() textcase.operator('to_dot_case')      end)
vim.keymap.set('n', 'gea', function() textcase.operator('to_phrase_case')   end)
vim.keymap.set('n', 'gec', function() textcase.operator('to_camel_case')    end)
vim.keymap.set('n', 'gep', function() textcase.operator('to_pascal_case')   end)
vim.keymap.set('n', 'get', function() textcase.operator('to_title_case')    end)
vim.keymap.set('n', 'gef', function() textcase.operator('to_path_case')     end)
