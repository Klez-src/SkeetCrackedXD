menu.add_check_box("Kill Say")

local randomNo
local killtext

function killsay(event)
    if menu.get_bool("Kill Say") then
        local attacker = engine.get_player_for_user_id(event:get_int("attacker"))
        local dead = engine.get_player_for_user_id(event:get_int("userid"))
        local me = engine.get_local_player_index()
       
        if attacker == me then
            killtext = {"�� ������� ��������� ����, ���� � ��� ���� �����",
            "��� ������� �������, ��� ��� ����� - ����� �����",
            "���� ������ ����� � ���� - �� ���������� � ������",
            "� ���� ������, ��� � ���������",
            "����� ���� ���� �� �����, ��� ����� �����������",
            "����� ����� ���� �������, �� ��������� �� ������",
            "���� ������, ���� ��� ����� �����",
            "˸��-˸��, ������, ��� ��� �����, ��� ������",
            "����� ����� �������, ���� ����� ���� �����?",
            "������ ������, ����� �������, �������� ����� ������������",
            "���������� ������� ��������� ��������",
            "���� ������� � ���� ������, ����� ���� ������ ����"}
            randomNo = math.random (1,12)
         console.execute ("say " .. killtext[randomNo])
    end
end
end

events.register_event("player_death", killsay)