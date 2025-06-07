--- STEAMODDED HEADER
--- MOD_NAME: Battle for Jimbo
--- MOD_ID: BFDI
--- MOD_AUTHOR: [WusGud, Nitro, Caldox, Cyber98]
--- MOD_DESCRIPTION: A Balatro mod themed around BFDI which adds 75 brand new jokers to the game!
-- extra comment
SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}
local function loadFromDir(dirname, visited)
    visited = visited or {}
    local norm_dir = dirname:gsub("[/\\]+$", "")
    if visited[norm_dir] then
        print("[BDFI] Skipping already visited directory: " .. norm_dir)
        return
    end
    visited[norm_dir] = true
    print("[BDFI] Loading [.] from directory " .. norm_dir)
    local files = NFS.getDirectoryItems(norm_dir)
    local directories = NFS.getDirectoryItems(norm_dir, true)
    for _, file in ipairs(files) do
        if file:match("%.lua$") then
            -- Compute the path relative to the mod root for SMODS.load_file
            local rel_path = norm_dir:sub(#SMODS.current_mod.path + 1) .. "/" .. file
            local chunk, err = SMODS.load_file(rel_path, SMODS.current_mod.id)
            if err then
                error(err)
            end
            local f = chunk()
            print("[BDFI] Successfully loaded " .. f.loc_txt.name .. "!")
            SMODS.Joker(f)
        end
    end
    for _, dir in ipairs(directories) do
        if dir ~= "." and dir ~= ".." then
            local subdir = norm_dir .. "/" .. dir
            -- Prevent recursive root repetition
            if not visited[subdir] then
                loadFromDir(subdir, visited)
            end
        end
    end
end
local mod_path = "" .. SMODS.current_mod.path
-- Loading all ASSETS and whatnot
local files = NFS.getDirectoryItems(mod_path .. "jokers")
print("[BDFI] Mod path located:"..mod_path)
-- updated this a little bit to support subdirectories
loadFromDir(mod_path .. "jokers")
