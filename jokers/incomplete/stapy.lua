return{
    key = 'joker27',
    loc_txt = {
        name = 'Stapy',
        text = {
            '{C:green}#2# in 2 {}chance to',
            'convert the {C:attention}highest{} ranked card in',
            'played hand into a {C:attention}Bonus Card'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 7, y = 3},
    config = { extra = {
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.odds, (G.GAME and G.GAME.probabilities.normal or 1)}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            local temp_Mult, temp_ID = 2, 2
            local raised_card = nil
            for i = 1, #context.scoring_hand do
                if temp_ID <= context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then
                    temp_Mult = context.scoring_hand[i].base.nominal
                    temp_ID = context.scoring_hand[i].base.id
                    raised_card = context.scoring_hand[i]
                end
            end
            if math.random() < G.GAME.probabilities.normal / card.ability.extra.odds then
                if raised_card == context.other_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            return true
                        end
                    }))
                    if not SMODS.has_enhancement(raised_card, 'm_bonus') then
                        raised_card:set_ability('m_bonus', true)
                        return {
                            message = 'Stapled!',
                            colour = G.C.CHIPS
                        }
                    else
                        return {
                            message = 'Already Stapled!',
                            colour = G.C.CHIPS
                        }
                    end
                end
            end
        end
    end
}