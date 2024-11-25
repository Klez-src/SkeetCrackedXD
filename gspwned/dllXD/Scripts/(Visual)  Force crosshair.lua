local function force_crosshair()
    console.set_string("weapon_debug_spread_show", "3")
end
client.add_callback("on_paint", force_crosshair)