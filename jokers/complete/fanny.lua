return{
    key = 'joker15',
    loc_txt = {
        name = 'Fanny', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:attention}Levels up{} your',
            'played hand if',
            'that hand is {C:attention}not{}',
            'the most played'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 1},
    config = { extra = {
    }
    },
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and not context.blueprint then
            local most_played = true
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            for k, v in pairs(G.GAME.hands) do
                if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
                    most_played = false
                    break
                end
            end
            if not most_played then
                return {
                level_up = true,
                message = localize('k_level_up_ex')
                }
            end
        end
    end
}