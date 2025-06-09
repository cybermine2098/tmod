return{
    key = 'joker26',
    loc_txt = {
        name = 'Basketball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gives {C:money}#2#{}',
            'dollars at the end of',
            'round for every {C:attention}5 times{}',
            'your most played hand',
            'has been played',
            '{C:inactive}(Currently {C:money}$#1#{}{C:inactive} Dollars)'
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
    pos = {x = 7, y = 5},
    config = {extra = { dollars = 0, increase = 2 }},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.dollars, center.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            local _planet, _hand, _tally = nil, nil, 0
            for k, v in ipairs(G.handlist) do
                 if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            local multiple5s = 0
            local maxhands = 1
            local placeholder = multiple5s
            if maxhands > 0 then
                multiple5s = math.floor(_tally / 5)
                card.ability.extra.dollars = card.ability.extra.increase * multiple5s
                if multiple5s ~= placeholder then
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MONEY
                    }
                end
                placeholder = multiple5s
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
    local shmell = 0
        if card.ability.extra.dollars == 0 then
            shmell = shmell + 1
        else
            return card.ability.extra.dollars
        end
    end
}