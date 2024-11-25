-- Created By L3D34N ->

-- Menu ->
menu.add_check_box("Enable fps boost")
client.log("Fps boost successfully loaded!")

-- Fps Boost ->
local function FpsBoost()

    if menu.get_bool("Enable fps boost") then
        
        -- Disable Shadows ->
        console.set_string("r_shadows", "0")
        console.set_string("cl_csm_enabled", "0")
        console.set_string("cl_csm_static_prop_shadows", "0")
        console.set_string("cl_csm_shadows", "0")
        console.set_string("cl_csm_world_shadows", "0")
        console.set_string("cl_foot_contact_shadows", "0")
        console.set_string("cl_csm_viewmodel_shadows", "0")
        console.set_string("cl_csm_rope_shadows", "0")
        console.set_string("cl_csm_sprite_shadows", "0")

        -- Disable Blood ->
        console.set_string("violence_hblood", "0")

        -- Disable 3dsky ->
        console.set_string("r_3dsky", "0")

        -- Disable Decals ->
        console.set_string("r_drawdecals", "0")

        -- Disable Rain ->
        console.set_string("r_drawrain", "0")

        -- Disable Ropes ->
        console.set_string("r_drawropes", "0")

        -- Disable Sprites ->
        console.set_string("r_drawsprites", "0")

        -- Disable Water Fog ->
        console.set_string("fog_enable_water_fog", "0")

        -- Disable Other ->
        console.set_string("cl_showhelp", "0")
        console.set_string("cl_autohelp", "0")
        console.set_string("cl_disablehtmlmotd", "1")
        console.set_string("cl_disablefreezecam", "1")

    else

        -- Enable Shadows ->
        console.set_string("r_shadows", "1")
        console.set_string("cl_csm_enabled", "1")
        console.set_string("cl_csm_static_prop_shadows", "1")
        console.set_string("cl_csm_shadows", "1")
        console.set_string("cl_csm_world_shadows", "1")
        console.set_string("cl_foot_contact_shadows", "1")
        console.set_string("cl_csm_viewmodel_shadows", "1")
        console.set_string("cl_csm_rope_shadows", "1")
        console.set_string("cl_csm_sprite_shadows", "1")
        
        -- Enable Blood ->
        console.set_string("violence_hblood", "1")
        
        -- Enable 3dsky ->
        console.set_string("r_3dsky", "1")
        
        -- Enable Decals ->
        console.set_string("r_drawdecals", "1")
        
        -- Enable Rain ->
        console.set_string("r_drawrain", "1")
        
        -- Enable Ropes ->
        console.set_string("r_drawropes", "1")
        
        -- Enable Sprites ->
        console.set_string("r_drawsprites", "1")
        
        -- Enable Water Fog ->
        console.set_string("fog_enable_water_fog", "1")
        
        -- Enable Other ->
        console.set_string("cl_showhelp", "1")
        console.set_string("cl_autohelp", "1")
        console.set_string("cl_disablehtmlmotd", "0")
        console.set_string("cl_disablefreezecam", "0")
    end
end

-- Callback ->
client.add_callback("on_paint", FpsBoost)