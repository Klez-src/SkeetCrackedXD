local function bomb_plant(event)
    if event:get_int("site") == 447  then
    console.execute("say_team BOMB PLANTED | SITE A")
    elseif event:get_int("site") == 448  then
    console.execute("say_team BOMB PLANTED | SITE B")
end
    if event:get_int("site") == 281 then
    console.execute("say_team BOMB PLANTED | SITE A")
    elseif event:get_int("site") == 282 then
    console.execute("say_team BOMB PLANTED | SITE B")
end
    if event:get_int("site") == 370 then
    console.execute("say_team BOMB PLANTED | SITE A")
    elseif event:get_int("site") == 459 then
    console.execute("say_team BOMB PLANTED | SITE B")
end
end
local function hostage_follows(event)
    console.execute("say_team «¿ÀŒ∆Õ»  ¡€À ” –¿ƒ≈Õ!")
end
events.register_event("hostage_follows", hostage_follows)
client.add_callback("on_paint", bomb_plant)
events.register_event("bomb_planted", bomb_plant)