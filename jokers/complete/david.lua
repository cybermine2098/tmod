return{
     key = 'joker37',
    loc_txt = {
        name = 'David', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Aw seriously!'
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
        slots = 2, rounds = 6
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
                G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                card.config.center.loc_txt.text = { 'testing testing 123' }
                return {
                    message = ('+2 Joker Slots'),
                    colour = G.C.RED
                }
            end
        end
    end 
}