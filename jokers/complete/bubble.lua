return{
    key = 'joker57',
    loc_txt = {
        name = 'Bubble', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains',
            '{X:mult,C:white}X#2#{} Mult at the {C:attention}end{}',
            'of every round',
            '{C:green}#3# in #4#{} chance this',
            'card is destroyed',
            'at end of round,',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 5, y = 5},
    config = { extra = {
        Xmult = 1, Xmult_mod = 2, odds = 2
    }
    },
    loc_vars = function(self,info_queue,center)
        return { 
           vars = { 
                center.ability.extra.Xmult, 
                center.ability.extra.Xmult_mod,
                (G.GAME and G.GAME.probabilities.normal or 1),
                center.ability.extra.odds 
           }
      }
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
                    message = 'popped!'
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    message_card = card
                }
            end
        end
        if context.joker_main then
            return {
            card = card,
            Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult .. ' Mult',
            color = G.C.MULT
            }
        end
    end
}