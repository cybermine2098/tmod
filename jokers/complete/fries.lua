return{
    key = 'joker65',
    loc_txt = {
        name = 'Fries',
        text = {
            'When {C:attention}Blind{} is won,',
            'gives a {C:attention}random{} tag',
            '{s:0.7,C:inactive}(Better get digging. The tags{}',
            '{s:0.7,C:inactive}are probably underground.){}'
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
    pos = {x = 3, y = 6},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false then
            local fries_tag = math.random(1,23)
            local tag_var = ('tag_uncommon')
            if fries_tag == 1 then
                tag_var = ('tag_uncommon')
            end
            if fries_tag == 2 then
                tag_var = ('tag_rare')
            end
            if fries_tag == 3 then
                tag_var = ('tag_negative')
            end
            if fries_tag == 4 then
                tag_var = ('tag_foil')
            end
            if fries_tag == 5 then
                tag_var = ('tag_holo')
            end
            if fries_tag == 6 then
                tag_var = ('tag_polychrome')
            end
            if fries_tag == 7 then
                tag_var = ('tag_investment')
            end
            if fries_tag == 8 then
                tag_var = ('tag_voucher')
            end
            if fries_tag == 9 then
                tag_var = ('tag_boss')
            end
            if fries_tag == 10 then
                tag_var = ('tag_standard')
            end
            if fries_tag == 11 then
                tag_var = ('tag_charm')
            end
            if fries_tag == 12 then
                tag_var = ('tag_meteor')
            end
            if fries_tag == 13 then
                tag_var = ('tag_buffoon')
            end
            if fries_tag == 14 then
                tag_var = ('tag_handy')
            end
            if fries_tag == 15 then
                tag_var = ('tag_garbage')
            end
            if fries_tag == 16 then
                tag_var = ('tag_ethereal')
            end
            if fries_tag == 17 then
                tag_var = ('tag_coupon')
            end
            if fries_tag == 18 then
                tag_var = ('tag_double')
            end
            if fries_tag == 19 then
                tag_var = ('tag_juggle')
            end
            if fries_tag == 20 then
                tag_var = ('tag_d_six')
            end
            if fries_tag == 21 then
                tag_var = ('tag_top_up')
            end
            if fries_tag == 22 then
                tag_var = ('tag_skip')
            end
            if fries_tag == 23 then
                tag_var = ('tag_economy')
            end
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag(tag_var))
                            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end)
                    }))
                end,
                message = 'Better get digging'
            }
        end
    end
}
