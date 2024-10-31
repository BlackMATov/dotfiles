local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
    print("bufferline not found")
    return
end

bufferline.setup()
