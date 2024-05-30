/// @description informativos

draw_set_font(-1);

draw_text(20, 120, "STM: " + string(stamina));

draw_text(20, 140, "VEL: " + string(veloc));

draw_text(20, 160, "FPS: " + string(sprite_get_speed(sprite_index)));

draw_text(20, 180, "EEG: " + string(cardio));

draw_text(20, 200, "ALM: " + string(alarm[1]));

draw_text(20, 220, "ZOI: " + string(dirOlhar));

draw_text(20, 240, "ZOI: " + string( gamepad_axis_value(global.controle, gp_axisrh)) + "/" + 
	string( gamepad_axis_value(global.controle, gp_axisrv)));