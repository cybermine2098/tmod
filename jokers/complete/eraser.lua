return{
    key = 'joker41',
    loc_txt = {
        name = 'Eraser', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:attention}Destroys{} all cards held in hand',
            'at the end of each {C:attention}Blind'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 9, y = 3},
    config = { extra = {

    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round then
            for _, playing_card in ipairs(G.hand.cards) do
                SMODS.destroy_cards(playing_card)
            end
        end
    end
}