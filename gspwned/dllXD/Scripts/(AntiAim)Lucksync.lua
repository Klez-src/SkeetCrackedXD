menu.add_check_box("Enable lucksync")
menu.add_slider_int("Start first static yaw", 1, 180, 16)
menu.add_slider_int("End first static yaw", 1, 180)
menu.add_slider_int("Start first walkmode yaw", 1, 180)
menu.add_slider_int("End first walkmode yaw", 1, 180)
menu.add_slider_int("Start first fastwalkmode yaw", 1, 180)
menu.add_slider_int("End first fastwalkmode yaw", 1, 180)
menu.add_slider_int("Start second static yaw", 1, 180)
menu.add_slider_int("End second static yaw", 1, 180)
menu.add_slider_int("Start second walkmode yaw", 1, 180)
menu.add_slider_int("End second walkmode yaw", 1, 180)
menu.add_slider_int("Start second fastwalkmode yaw", 1, 180)
menu.add_slider_int("End second fastwalkmode yaw", 1, 180)

menu.add_slider_int("Start lag walkmode fake", 1, 100)
menu.add_slider_int("End lag walkmode fake", 1, 100)
menu.add_slider_int("Start lag fastwalkmode fake", 1, 100)
menu.add_slider_int("End lag fastwalkmode fake", 1, 100)
menu.add_slider_int("Start non-lag walkmode fake", 1, 100)
menu.add_slider_int("End non-lag walkmode fake", 1, 100)
menu.add_slider_int("Start non-lag fastwalkmode fake", 1, 100)
menu.add_slider_int("End non-lag fastwalkmode fake", 1, 100)

menu.add_slider_int("Start first walkmode lean", 1, 100)
menu.add_slider_int("End first walkmode lean", 1, 100)
menu.add_slider_int("Start first fastwalkmode lean", 1, 100)
menu.add_slider_int("End first fastwalkmode lean", 1, 100)
menu.add_slider_int("Start second walkmode lean", 1, 100)
menu.add_slider_int("End second walkmode lean", 1, 100)
menu.add_slider_int("Start second fastwalkmode lean", 1, 100)
menu.add_slider_int("End second fastwalkmode lean", 1, 100)

menu.add_slider_int("Start first static speed", 1, 15)
menu.add_slider_int("End first static speed", 1, 15)
menu.add_slider_int("Start first walkmode speed", 1, 15)
menu.add_slider_int("End first walkmode speed", 1, 15)
menu.add_slider_int("Start first fastwalkmode speed", 1, 15)
menu.add_slider_int("End first fastwalkmode speed", 1, 15)
menu.add_slider_int("Start second static speed", 1, 15)
menu.add_slider_int("End second static speed", 1, 15)
menu.add_slider_int("Start second walkmode speed", 1, 15)
menu.add_slider_int("End second walkmode speed", 1, 15)
menu.add_slider_int("Start second fastwalkmode speed", 1, 15)
menu.add_slider_int("End second fastwalkmode speed", 1, 15)

local yaw = true
local function createmove()
    if menu.get_bool("Enable lucksync") and cmd.get_send_packet() == true then
    	local FS1 = menu.get_int("Start first static yaw")
		local SS1 = menu.get_int("Start second static yaw")
		local FS2 = menu.get_int("End first static yaw")
		local SS2 = menu.get_int("End second static yaw")
		local FW1 = menu.get_int("Start first walkmode yaw")
		local SW1 = menu.get_int("Start second walkmode yaw")
		local FW2 = menu.get_int("End first walkmode yaw")
		local SW2 = menu.get_int("End second walkmode yaw")
		local FF1 = menu.get_int("Start first fastwalkmode yaw")
		local SF1 = menu.get_int("Start second fastwalkmode yaw")
		local SF2 = menu.get_int("End first fastwalkmode yaw")
		local SS2 = menu.get_int("End second fastwalkmode yaw")

		local FWF1 = menu.get_int("Start lag walkmode fake")
		local SWF1 = menu.get_int("Start non-lag walkmode fake")
		local FWF2 = menu.get_int("End lag walkmode fake")
		local SWF2 = menu.get_int("End non-lag walkmode fake")
		local FFF1 = menu.get_int("Start lag fastwalkmode fake")
		local SFF1 = menu.get_int("Start non-lag fastwalkmode fake")
		local SFF2 = menu.get_int("End lag fastwalkmode fake")
		local SSF2 = menu.get_int("End non-lag fastwalkmode fake")

        if yaw then
            yaw = false
        else
            yaw = true
        end

        if yaw then
        	if menu.get_key_bind_state(key_binds.double_tap) == false and menu.get_key_bind_state(key_binds.hide_shots) == false then
            	menu.set_int("1Antiaim.desync_range", math.random(FWF1, FWF2))
            	menu.set_int("2Antiaim.desync_range", math.random(FFF1, FFF2))
        	else
            	menu.set_int("1Antiaim.desync_range", math.random(SWF1, SWF2))
            	menu.set_int("2Antiaim.desync_range", math.random(SFF1, SFF2))
            end

            menu.set_int("0Antiaim.range", math.random(FS1, FS2))
            menu.set_int("1Antiaim.range", math.random(FW1, FW2))
            menu.set_int("2Antiaim.range", math.random(FF1, FF2))
        else
        	menu.set_int("0Antiaim.range", math.random(SS1, SS2))
        	menu.set_int("1Antiaim.range", math.random(SW1, SW2))
            menu.set_int("2Antiaim.range", math.random(SF1, SF2))
        end
    end
end

local lean = false
local function createlean()
	if menu.get_bool("Enable lucksync") and cmd.get_send_packet() == true then
		local FWL1 = menu.get_int("Start first walkmode lean")
		local SWL1 = menu.get_int("Start second walkmode lean")
		local FWL2 = menu.get_int("End first walkmode lean")
		local SWL2 = menu.get_int("End second walkmode lean")
		local FFL1 = menu.get_int("Start first fastwalkmode lean")
		local SFL1 = menu.get_int("Start second fastwalkmode lean")
		local SFL2 = menu.get_int("End first fastwalkmode lean")
		local SSL2 = menu.get_int("End second fastwalkmode lean")

        if lean then
            lean = false
        else
            lean = true
        end

        if lean then
        	menu.set_int("1Antiaim.body_lean", math.random(FWL1, FWL2))
            menu.set_int("2Antiaim.body_lean", math.random(FFL1, FFL2))
        else
        	menu.set_int("1Antiaim.body_lean", math.random(SWL1, SWL2))
			menu.set_int("2Antiaim.body_lean", math.random(SFL1, SFL2))
        end
    end   
end

local ilean = false
local function createilean()
    if menu.get_bool("Enable lucksync") and cmd.get_send_packet() == true then
        if ilean then
            ilean = false
        else
            ilean = true
        end

        if ilean then
            menu.set_int("1Antiaim.inverted_body_lean", math.random(FWL1, FWL2))
            menu.set_int("2Antiaim.inverted_body_lean", math.random(FFL1, FFL2))
            menu.set_int("3Antiaim.inverted_body_lean", math.random(FAL1, FAL2))
        else
            menu.set_int("1Antiaim.inverted_body_lean", math.random(SWL1, SWL2))
            menu.set_int("2Antiaim.inverted_body_lean", math.random(SFL1, SFL2))
            menu.set_int("3Antiaim.inverted_body_lean", math.random(SAL1, SAL2))
        end
    end
end

local speed = false
local function createspeed()
	if menu.get_bool("Enable lucksync") and cmd.get_send_packet() == true then
		local FSS1 = menu.get_int("Start first static speed")
		local SSS1 = menu.get_int("Start second static speed")
		local FSS2 = menu.get_int("End first static speed")
		local SSS2 = menu.get_int("End second static speed")
		local FWS1 = menu.get_int("Start first walkmode speed")
		local SWS1 = menu.get_int("Start second walkmode speed")
		local FWS2 = menu.get_int("End first walkmode speed")
		local SWS2 = menu.get_int("End second walkmode speed")
		local FFS1 = menu.get_int("Start first fastwalkmode speed")
		local SFS1 = menu.get_int("Start second fastwalkmode speed")
		local SFS2 = menu.get_int("End first fastwalkmode speed")
		local SSS2 = menu.get_int("End second fastwalkmode speed")

		if speed then
            speed = false
        else
            speed = true
        end

        if speed then
        	menu.set_int("0Antiaim.speed", math.random(FSS1, FSS2))
            menu.set_int("1Antiaim.speed", math.random(FWS1, FW2S))
            menu.set_int("2Antiaim.speed", math.random(FFS1, FFS2))
            menu.set_int("3Antiaim.speed", math.random(FAS1, FAS2))
        else
        	menu.set_int("0Antiaim.speed", math.random(SSS1, SSS2))
        	menu.set_int("1Antiaim.speed", math.random(SWS1, SWS2))
            menu.set_int("2Antiaim.speed", math.random(SFS1, SFS2))
            menu.set_int("3Antiaim.speed", math.random(SAS1, SAS2))
        end
    end
end


client.add_callback("on_createmove", createmove)
client.add_callback("on_createmove", createlean)
client.add_callback("on_createmove", createilean)
client.add_callback("on_createmove", createspeed)



---made by Akvil