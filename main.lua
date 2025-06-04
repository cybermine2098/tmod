--- STEAMODDED HEADER
--- MOD_NAME: Battle for Jimbo
--- MOD_ID: BFDI
--- MOD_AUTHOR: [WusGud, Nitro, Caldox]
--- MOD_DESCRIPTION: A Balatro mod themed around BFDI which adds 75 brand new jokers to the game!

if not SMODS then
    error("This mod requires Steamodded to run!")
end
if not BBFJ then
    BBFJ = {}
end
SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}
local mod_path = "" .. SMODS.current_mod.path
-- Loading all ASSETS and whatnot
local files = NFS.getDirectoryItems(mod_path .. "jokers")
print("Mod path located:"..mod_path)
for _, file in ipairs(files) do
    print("[BBFJ] Loading file " .. file)
    local chunk, err = SMODS.load_file("jokers/" .. file)
    if err then
        error(err)
    end
    local f = chunk() -- call the loaded function to get the table
    print("Successfully loaded "..f.loc_txt.name)
    SMODS.Joker(f)
end