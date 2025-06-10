return{
    key = 'joker37',
    loc_txt = {
        name = 'David', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Aw, seriously!'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 3},
    config = { extra = {
        slots = 1, rounds = 6
    }
    },
    loc_vars = function(self,info_queue,card)
            return {
                vars = {card.ability.extra.slots, card.ability.extra.rounds}
            }
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds == 0 then
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
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                G.GAME.pool_flags.vremade_gros_michel_extinct = true
                return {
                    message = ('Aw, seriously!'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end
        end
    end,
    in_pool = function(self, args)
        return not G.GAME.pool_flags.vremade_gros_michel_extinct
    end
}