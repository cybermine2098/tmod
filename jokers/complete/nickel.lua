return{
     key = 'joker68',
    loc_txt = {
        name = 'Nickel',
        text = {
            'Gives {C:chips}+#1#{} Chips',
            'for each{C:spade} Spade Card',
            'in your {C:attention}full deck{}',
            '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 1, y = 7},
    config = { extra = { 
        chips = 50
    }
    },
    loc_vars = function(self,info_queue,center)
        local spade_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Spades') then spade_tally = spade_tally + 1 end
            end
        end
        return { vars = { center.ability.extra.chips, center.ability.extra.chips * spade_tally } }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local spade_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Spades') then spade_tally = spade_tally + 1 end
            end
            return {
                chips = card.ability.extra.chips * spade_tally,
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card:is_suit('Spades') then
                return true
            end
        end
        return false
    end
}
