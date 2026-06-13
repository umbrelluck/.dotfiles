local configs = {
    "preloaders",
    "globals",
    "options",
    "remaps",
    "lazy",
    "afterloaders"
}

root = "config."

for _, cname in ipairs(configs) do
    local ok, _ = pcall(require, root .. cname)
    if not ok then
        print("Error: Could not load <" .. root .. cname .. ">")
    end
end
