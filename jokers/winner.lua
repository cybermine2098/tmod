return{
    key = 'joker4',
    loc_txt = {
        name = 'Winner', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'If all cards in',
            'scored hand are {C:attention}7s{},',
            'get {X:mult,C:white}X3{} Mult'
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
    pos = {x = 2, y = 0},
    config = { extra = {
        Xmult = 3
    }
    },
    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.Xmult} }
    end,
    calculate = function(self,card,context)
        local all_sevens = true
        if context.joker_main then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:get_id() ~= 7 then
                    all_sevens = false
                    break
                end
            end
            if all_sevens then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}