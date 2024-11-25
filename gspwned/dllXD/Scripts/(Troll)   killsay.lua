menu.add_check_box("Kill Say")

local randomNo
local killtext

function killsay(event)
    if menu.get_bool("Kill Say") then
        local attacker = engine.get_player_for_user_id(event:get_int("attacker"))
        local dead = engine.get_player_for_user_id(event:get_int("userid"))
        local me = engine.get_local_player_index()
        
        if attacker == me then
            killtext = {"1",
            "*miss* HAHAH !",
            "1 garbage fucking",
            "TOPSHEAD",
            "HEAFtap",
            "Get GAYMESENSE looser",
			"*MISS* HAHAH",
			"GET GAYMESENSE LOOSER",
			"hello mind explaining what happened there",
			"nice nixware retard",
			"MISS?",
			"WHAT?!?",
			"ROFL(TAP YOU NOOBS)",
			"why did you fly away",
			"lmao ur so ugly irl like bro doesnt it hurt to live like that, btw you know you can just end it all",
			"ROFL NICE *DEAD* HHHHHHHHHHHHHHHHHH, take the cooldown and let your team surr retard",
			"uid GAYMESENSE PLS",
			"FUKKING",
			"the beggar flew away",
			"*DEAD* fix the resolver",
			"you can see uid issue hula here",
			"Mom that cfg Issue buy from me кфг otc user",
			"fuck you",
			"tranny holzed",
			"bottled lol, tranny holzed",
			"police officer drove open the door fuck",
			"bitch don't disgrace and get out lol",
			"and you in life newcomer ????",
			"Mom that cfg Issue was that you gave birth",
			"miss to crack AHAH ????",
			"LOL",
			"HS, Hs , HS , HS, TAPPpppS",
			"pounce out of your window disgusting tranny, you shouldnt exist in this world",
			"and you wedges?",
			"pissed meme user lol",
			"why did you fly away",
			"*DEAD* fix the beggars",
			"the beggar flew away",
			"go take some estrogen tranny",
			"uid police here present your user identification number right now",
			"lmao ur so ugly irl like bro doesnt it hurt to live like that, btw you know you can just end it all",
			"lol, you not have't top cfg, otc",
			"egfewfw",
			"cleans?",
			"nice memesense retard",
			"retard blasted",
			"tap",
			"131fcw",
			"Fucked trash",
			"1 garbage fucking",
			"LOL",
			"131fcw",
            "nn dogs"}
            randomNo = math.random (1,12)
         console.execute ("say " .. killtext[randomNo])
    end
end
end

events.register_event("player_death", killsay)

