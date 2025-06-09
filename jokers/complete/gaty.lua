return{
    key = 'joker17',
    loc_txt = {
        name = 'Gaty', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {C:mult}+1{} Mult',
            'if played hand contains',
            'a {C:attention}Pair{}',
            '{C:inactive}(Currently {C:red}+#3#{}{C:inactive} Mult)'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 5, y = 1},
    config = { extra = {
        mult_mod = 1, mult = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult_gain,localize('Pair','poker_hands'),card.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and not context.blueprint and (next(context.poker_hands['Pair']) or next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House']) or next(context.poker_hands['Three of a Kind']) or next(context.poker_hands['Four of a Kind']) or next(context.poker_hands['Five of a Kind'])) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}