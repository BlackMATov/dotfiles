local everforest_status, everforest = pcall(require, "everforest")
if not everforest_status then
    print("everforest not found")
    return
end

everforest.setup()
everforest.load()
