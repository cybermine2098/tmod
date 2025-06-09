return{
    key = 'joker16',
    loc_txt = {
        name = 'Pie', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:mult}+3.14 {}Mult',
            'If a {C:attention}Flush{} of {C:clubs}Clubs {}is',
            'played, explode and grant {C:money}$10'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 8, y = 4},
    config = { extra = {
        mult = 3.14, type = 'Flush', suit = 'Clubs', dollars = 10
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult, card.ability.extra.dollars, localize(card.ability.extra.suit, 'suits_singular'), localize(card.ability.extra.type, 'poker_hands')}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local all_clubs = true
            for _ , playing_card in ipairs(context.scoring_hand) do
                if not playing_card:is_suit('Clubs', nil, true) then
                    all_clubs = false
                    break
                end
            end
            if all_clubs and context.scoring_name == card.ability.extra.type then
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
                    dollars = card.ability.extra.dollars,
                    message = localize('k_extinct_ex')
                }
            end
            return { 
                mult = card.ability.extra.mult
            }
        end
    end
}