if not pcall(require, 'Comment') then
  return
end

local comment_status_ok, comment = pcall(require, 'Comment')
if not comment_status_ok then
  return
end

comment.setup()
