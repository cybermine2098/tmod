return{
    key = 'joker13',
    loc_txt = {
        name = 'Clock', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'The amount of hands used',
            'in the {C:attention}small{} and {C:attention}big{} blinds',
            'gets added to the total',
            'hands for the {C:attention}boss blind{}.',
            'resets after each ante.',
            '{C:inactive}(Currently {C:blue}+#1#{}{C:inactive} hands)'
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
    pos = {x = 1, y = 1},
    config = { extra = { 
        hands = 0, hands_mod = 1
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.hands, center.ability.extra.hands_mod}}
    end,
    calculate = function(self,card,context) --calculation later
        if context.joker_main then
            card.ability.extra.hands = card.ability.extra.hands + card.ability.extra.hands_mod
        end
        if context.setting_blind and G.GAME.blind.boss then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_hands_played(card.ability.extra.hands)
                            SMODS.calculate_effect(
                                { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                                context.blueprint_card or card)
                                
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.hands = 0
            return {
            message = 'Reset!'
            }
        end
    end
}