/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


draw_text(120, 120, "X: " + string(x));

draw_text(120, 140, "Y: " + string(y));

draw_text(120, 160, "X: " + string(par_personagem.x));

draw_text(120, 180, "Y: " + string(par_personagem.y));

draw_text(120, 200, "D: " + string(distance_to_object(obj_jogador)));

draw_text(120, 220, "Dp: " + string(obj_jogador.x - obj_camera.x));

draw_text(120, 240, "Da: " + string(obj_jogador.y - obj_camera.y));

draw_text(120, 260, "Vx: " + string(vHorz));

draw_text(120, 280, "Vx: " + string(lengthdir_x(1, vDir)));