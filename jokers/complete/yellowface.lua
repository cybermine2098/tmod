return{
    key = 'joker61',
    loc_txt = {
        name = 'Yellow Face',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
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
    calculate = function(self,card,context) --calculation later
    local sellpercent = 25
        if context.selling_self then
            sellpercent = 0
            G.E_MANAGER:add_event(Event({func = function()
            G.GAME.discount_percent = sellpercent
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
        else
            G.E_MANAGER:add_event(Event({func = function()
            G.GAME.discount_percent = sellpercent
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            sellpercent = 25
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