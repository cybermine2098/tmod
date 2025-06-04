--- STEAMODDED HEADER
--- MOD_NAME: Battle for Jimbo
--- MOD_ID: BFDI
--- MOD_AUTHOR: [WusGud, Nitro, Caldox, and cyber!!!!]
--- MOD_DESCRIPTION: A Balatro mod themed around BFDI which adds 75 brand new jokers to the game!


SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}
-- Get the directory of this file (main.lua)
local info = debug.getinfo(1, 'S')
local script_path = info.source:match("@(.*[\\/])") or "./"
local mod_path = script_path:gsub('[\\/]+$', '')

if not BFDI then BFDI = {} end
BFDI.path = mod_path
BFDI_config = BFDI_config or {}

-- Modular Joker loading (Cryptid-style)
BFDI.object_registry = {}
BFDI.object_buffer = {}
local function process_joker(f)
    local ret = f()
    if ret then
        -- Register with SMODS
        SMODS.Joker(ret)
        -- Optionally, add to registry/buffer for further processing if needed
        BFDI.object_registry[ret.key or ret.loc_txt and ret.loc_txt.name or '?'] = ret
        BFDI.object_buffer[#BFDI.object_buffer+1] = ret
    end
end

local joker_files = {}
local joker_dir = mod_path .. "/jokers/"
local ok, lfs = pcall(require, 'lfs')
if ok and lfs then
    for file in lfs.dir(joker_dir) do
        if file:match("%.lua$") then
            joker_files[#joker_files+1] = file
        end
    end
else
    joker_files = {
        'balloony', 'bottle', 'cake', 'eggy', 'grassy',
        'lollipop', 'pillow', 'taco', 'winner',
    }
end

for _, file in ipairs(joker_files) do
    local joker_file = joker_dir .. file
    local f, err = loadfile(joker_file .. ".lua")
    if not f then
        print('[BFDI] Error loading', joker_file .. ':', err)
    else
        local ok, res = pcall(f)
        if not ok then
            print('[BFDI] Error running', joker_file .. ':', res)
        else
            print('[BFDI] Successfully loaded', joker_file)
            process_joker(function() return res end)
        end
    end
end
