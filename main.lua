--- STEAMODDED HEADER
--- MOD_NAME: Battle for Jimbo
--- MOD_ID: BFDI
--- MOD_AUTHOR: [WusGud, Nitro, Caldox, Cyber98]
--- MOD_DESCRIPTION: A Balatro mod themed around BFDI which adds 75 brand new jokers to the game!
SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}
local mod_path = "" .. SMODS.current_mod.path
-- Loading all ASSETS and whatnot
local files = NFS.getDirectoryItems(mod_path .. "jokers")
print("[BDFI] Mod path located:"..mod_path)
-- updated this a little bit to support subdirectories
loadFromDir(mod_path .. "jokers")
local function loadFromDir(dirname)
    print("[BDFI] Loading [.] from directory "..dirname)
    local files = NFS.getDirectoryItems(dirname)
    local directories = NFS.getDirectoryItems(dirname, true)
    for _, file in ipairs(files) do
        if file:match("%.lua$") then
            local chunk, err = SMODS.load_file(dirname .. "/" .. file)
            if err then
                error(err)
            end
            local f = chunk() -- call the loaded function to get the table
            print("[BDFI] Successfully loaded "..f.loc_txt.name.."!")
            SMODS.Joker(f)
        end
    end
    for _, dir in ipairs(directories) do
        if dir ~= "." and dir ~= ".." then
            loadFromDir(dirname .. "/" .. dir)
        end
    end
end