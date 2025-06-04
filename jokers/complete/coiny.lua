return{
    key = 'joker48',
    loc_txt = {
        name = 'Coiny',
        text = {
            'Gives {X:mult,C:white}X#1#{} Mult',
            'for each{C:red} Heart Card',
            '{s:0.7}(only real ones will get this){}',
            'in your {C:attention}full deck{}',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
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
    pos = {x = 6, y = 4},
    config = { extra = { 
        Xmult = 0.1
    }
    },
    loc_vars = function(self,info_queue,center)
        local heart_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Hearts') then heart_tally = heart_tally + 1 end
            end
        end
        return { vars = { center.ability.extra.Xmult, 1 + center.ability.extra.Xmult * heart_tally } }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local heart_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Hearts') then heart_tally = heart_tally + 1 end
            end
            return {
                Xmult = 1 + card.ability.extra.Xmult * heart_tally,
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card:is_suit('Hearts') then
                return true
            end
        end
        return false
    end
}