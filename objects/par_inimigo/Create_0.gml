event_inherited();
randomize();

estado = escolherEstado;
prox_estado = 0;

// Visão
dist_aggro = 50;
dist_desaggro = 100;

// Movimentação
veloc = 0.2;
velocPers = 0.6;

dest_x = 0;
dest_y = 0;
caminho = path_add();

// Combate
vidaMax = 5;
vida = vidaMax;
empurrado_veloc = 0;
tomou_hit = false;