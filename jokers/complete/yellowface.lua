return{
    key = 'joker61',
    loc_txt = {
        name = 'Yellow Face',
        text = {
            'When held gives a',
            '{C:attention}25%{} discount on',
            'all items in shop',
            'as well as giving',
            'a coupon tag when',
            '{C:attention}Boss Blind{} is defeated'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 9, y = 5},
    config = { extra = {
        discount = 25
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.discount}}
    end,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
        G.GAME.discount_percent = 25
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
        G.GAME.discount_percent = 0
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag('tag_coupon'))
                            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end)
                    }))
                end,
                message = 'coupon!'
            }
        end
    end
}
