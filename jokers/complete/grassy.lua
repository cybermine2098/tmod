return{
    key = 'joker9',
    loc_txt = {
        name = 'Grassy',
        text = {
            'When {C:attention}High Card{} is',
            'played, equal chance',
            'for either {C:mult}+15{} Mult,',
            '{C:chips}+50{} Chips, or {X:mult,C:white}x3{} Mult'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 7, y = 0},
    config = { extra = {
        mult = 15, chips = 50, Xmult = 3, type = 'High Card'
    }
    },
    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.Xmult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self,card,context) --calculation later
        if context.joker_main and context.scoring_name == card.ability.extra.type then
            local grassy_num = math.random(1, 3)
            if grassy_num == 1 then
                return {
                    mult = card.ability.extra.mult
                }
            end
            if grassy_num == 2 then
                return {
                    chips = card.ability.extra.chips
                }
            end
            if grassy_num == 3 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}