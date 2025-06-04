return{
    key = 'joker4', -- The joker key (i have no idea what this does -cyber)
    loc_txt = {
        name = 'Winner', -- Display name (In game, english locale (important!))
        text = { -- how the description is made
            'If all cards in',
            'scored hand are {C:attention}7s{},',
            'get {X:mult,C:white}X3{} Mult'
        }
    },
    atlas = 'Jokers', -- What kind of card it is
    rarity = 1,
    cost = 5, -- Base price
    unlocked = true, -- Is it discovered by default (think legendary)
    discovered = false,
    blueprint_compat = true, -- does blueprint and brainstorm work?
    eternal_compat = true, -- Is it compatible with the eternal sticker in black stake?
    perishable_compat = true, -- Is it compatible with the perishable sticker in Orange(?) stake?
    pos = {x = 2, y = 0}, -- Where in the lookup texture to look (hey i know this one!)
    config = { extra = { -- Data the game knows what to do with
        Xmult = 3
    }
    },
    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.Xmult} } -- local scoped stuff the card is allowed to use
    end,
    calculate = function(self, card, context) -- i fixed ur code, it was slow, but i didn't update the real file
        if context.joker_main and context.scoring_hand and #context.scoring_hand > 0 then
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() ~= 7 then
                    return
                end
            end
            return { Xmult = card.ability.extra.Xmult } -- this is what the game is actually looking for
        end
    end
}