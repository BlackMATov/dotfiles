local comment_status, comment = pcall(require, "comment")
if not comment_status then
    print("comment not found")
    return
end

comment.setup()
