menu.add_check_box("Disable blur")

function PaintTraverse()
  if(menu.get_bool("Disable blur")) then
  console.set_int("@panorama_disable_blur", 1)
  else
  console.set_int("@panorama_disable_blur", 0)
  end
end
client.add_callback("on_paint", PaintTraverse)
-- Get good. Get legendware.