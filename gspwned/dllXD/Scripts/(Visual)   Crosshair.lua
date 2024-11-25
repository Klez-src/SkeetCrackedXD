local function on_paint()

    local lc = entitylist.get_local_player()
    
    if lc ~= nil then

    is_scoped = lc:is_scoped()

    end

    console.set_int("weapon_debug_spread_show", is_scoped and 0 or 3)


end

client.add_callback("on_paint", on_paint)

