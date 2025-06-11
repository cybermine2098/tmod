return{
    key = 'joker44',
    loc_txt = {
        name = 'Purple Face',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 4},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS.Purple
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and not context.blueprint then
            local thingies = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_suit('Hearts', nil, true) or scored_card:is_suit('Diamonds', nil, true) or scored_card:is_suit('Clubs', nil, true) or scored_card:is_suit('Spades', nil, true) then
                    thingies[#thingies + 1] = scored_card
                    scored_card:set_seal("Purple", nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #thingies > 0 then
                return {
                    message = 'Purple',
                    colour = G.C.PURPLE
                }
            end
        end
    end
}