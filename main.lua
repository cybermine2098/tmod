--- STEAMODDED HEADER
--- MOD_NAME: Battle for Jimbo
--- MOD_ID: BFDI
--- MOD_AUTHOR: [WusGud, Nitro, Caldox]
--- MOD_DESCRIPTION: A Balatro mod themed around BFDI which adds 75 brand new jokers to the game!


SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}

-- Modular Joker loading
local joker_defs = {}
local lfs = require("lfs")
for file in lfs.dir("jokers") do
    if file:match("%.lua$") and file ~= "init.lua" then
        table.insert(joker_defs, file:gsub("%.lua$", ""))
    end
end
for _, joker in ipairs(joker_defs) do
    local def = require('jokers.' .. joker)
    SMODS.Joker(def)
end
