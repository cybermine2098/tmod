return{
    key = 'joker10',
    loc_txt = {
        name = 'Eggy', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Increases the {C:attention}sell value{}',
            'of adjacent jokers by {C:money}$2{}',
            'and gives {C:money}$3{} at the end',
            'of each round.',
            '{C:green}#3# in 6{} chance of this card',
            'being destroyed at the',
            'end of round as well.'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 8, y = 0},
    config = { extra = {
        dollars = 3, price = 2, odds = 6
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.dollars, card.ability.extra.price, (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('vremade_gros_michel') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_extinct_ex')
                }
            else
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        left_joker = G.jokers.cards[i - 1]
                        right_joker = G.jokers.cards[i + 1]
                    end
                end
                if left_joker ~= nil then
                    left_joker.ability.extra_value = left_joker.ability.extra_value + card.ability.extra.price
                end
                if right_joker ~= nil then
                    right_joker.ability.extra_value = right_joker.ability.extra_value + card.ability.extra.price
                end
                if left_joker ~= nil then
                    left_joker:set_cost()
                end
                if right_joker ~= nil then
                    right_joker:set_cost()
                end
                if left_joker ~= nil or right_joker ~= nil then
                    return {
                        message = localize('k_val_up'),
                        colour = G.C.MONEY
                    }
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}