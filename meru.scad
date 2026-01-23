// ====================================================
// DaiMeru - Conta Meru para Japamala
// ====================================================
// Projeto: https://github.com/guimasan/DaiMeru
// Esfera dividida ao meio com canal em T para passagem
// dos cordões nas faces planas que se encontram
// ====================================================

// ========== PARÂMETROS PRINCIPAIS ==========
diametro_esfera = 18;        // Diâmetro total da esfera (mm)
raio_esfera = diametro_esfera / 2;

diametro_cordao = 2;         // Diâmetro do cordão (mm)
raio_cordao = diametro_cordao / 2;
folga_cordao = 0.4;          // Folga adicional para o cordão passar (mm)

profundidade_canal = 1.2;    // Profundidade do canal em T na face plana (mm)
espessura_parede = 1.5;      // Espessura mínima da parede (mm)
profundidade_relevo = 1.2;   // Profundidade do relevo (baixo-relevo)
raio_relevo = raio_esfera * 0.98;  // Raio do motivo dharmachakra (quase toda a esfera)
largura_anel_relevo = 1.8;   // Espessura do anel externo do dharmachakra
largura_raio_relevo = 1.6;   // Largura dos raios
largura_anel_interno = 1.4;  // Espessura do anel interno
raio_ponta_raio = largura_raio_relevo * 1.2; // Raio do disco nas pontas dos raios

// Parâmetros da textura de caracóis
num_caracois_verticais = 5;  // Número de caracóis verticalmente
num_caracois_horizontal = 10; // Número de caracóis ao redor
tamanho_caracol = 2.5;       // Tamanho de cada caracol (mm)
profundidade_caracol = 0.8;  // Profundidade do relevo (mm)
voltas_caracol = 2.5;        // Número de voltas de cada caracol
largura_linha_caracol = 0.25; // Largura da linha do caracol (mm)

// ========== SISTEMA DE ENCAIXE (FRICTION FIT) ==========
diametro_pino = 2;           // Diâmetro dos pinos de encaixe (mm)
altura_pino = 2.5;           // Altura dos pinos (mm)
tolerancia_encaixe = 0.15;   // Tolerância para friction fit (mm)
num_pinos = 4;               // Número de pinos
raio_circulo_pinos = raio_esfera * 0.7;  // Distância do centro aos pinos
comprimento_pino_total = altura_pino * 2; // Comprimento de cada pino solto (para atravessar as duas metades)

// Ângulos dos pinos - posicionados FORA do caminho do canal em T
// Canal horizontal passa em 0° e 180° (laterais)
// Canal vertical (pé do T) passa em 270° (frente)
angulos_pinos = [45, 135, 225, 315];  // Posições nos cantos, evitando o canal T

// Qualidade de renderização
$fn = 100;                   // Quanto maior, mais suave (50-200)

// ========== CÁLCULOS ==========
raio_canal = raio_cordao + folga_cordao;

// Canal horizontal: vaza completamente pelas laterais
comprimento_canal_horizontal = diametro_esfera + 4;

// Canal vertical: vaza completamente pela borda externa
comprimento_canal_vertical = raio_esfera + 3;

// ========== MÓDULOS ==========

// Pinos de encaixe distribuídos na face plana (evitando o canal T)
module pinos_encaixe() {
    for (i = [0 : num_pinos - 1]) {
        angulo = angulos_pinos[i];
        rotate([0, 0, angulo])
            translate([raio_circulo_pinos, 0, 0])
                cylinder(h = altura_pino, 
                         r = diametro_pino / 2, 
                         center = false);
    }
}

// Furos para os pinos (com tolerância para friction fit)
module furos_encaixe() {
    for (i = [0 : num_pinos - 1]) {
        angulo = angulos_pinos[i];
        rotate([0, 0, angulo])
            translate([raio_circulo_pinos, 0, -0.5])
                cylinder(h = altura_pino + 0.8, 
                         r = (diametro_pino / 2) + tolerancia_encaixe, 
                         center = false);
    }
}

// Meio canal em forma de T esculpido na face plana (semicírculo)
// Quando coladas, as duas metades formam o canal completo
module canal_T_face_plana() {
    // Barra horizontal do T (entra pelas laterais) - metade superior do cilindro
    intersection() {
        rotate([0, 90, 0])
            cylinder(h = comprimento_canal_horizontal, 
                     r = raio_canal, 
                     center = true);
        // Corta apenas a metade superior (z >= 0)
        translate([0, 0, raio_canal/2])
            cube([comprimento_canal_horizontal + 2, raio_canal * 3, raio_canal], center = true);
    }
    
    // Pé vertical do T (sai pela borda) - metade superior do cilindro
    intersection() {
        translate([0, 0, 0])
            rotate([90, 0, 0])
                cylinder(h = comprimento_canal_vertical, 
                         r = raio_canal, 
                         center = false);
        // Corta apenas a metade superior (z >= 0)
        translate([0, -comprimento_canal_vertical/2, raio_canal/2])
            cube([raio_canal * 3, comprimento_canal_vertical + 2, raio_canal], center = true);
    }
}

// Motivo Dharmachakra em 2D (usado para relevo)
module dharmachakra_2d() {
    union() {
        // Anel externo
        difference() {
            circle(r = raio_relevo);
            circle(r = raio_relevo - largura_anel_relevo);
        }
        // Anel interno (hub)
        difference() {
            circle(r = raio_relevo * 0.35);
            circle(r = raio_relevo * 0.35 - largura_anel_interno);
        }
        // Raios com pontas arredondadas
        for (a = [0:45:315]) {
            rotate(a) {
                translate([0, raio_relevo * 0.35 / 2, 0])
                    square([largura_raio_relevo, raio_relevo * 0.65], center = true);
                translate([0, raio_relevo - largura_anel_relevo - raio_ponta_raio/2, 0])
                    circle(r = raio_ponta_raio);
            }
        }
        // Hub sólido
        circle(r = largura_anel_relevo * 1.4);
    }
}

// Caracol individual em 2D (espiral logarítmica)
module caracol_2d() {
    for (i = [0 : 40]) {
        angulo = i * 360 * voltas_caracol / 40;
        raio_espiral = tamanho_caracol * i / 40;
        rotate(angulo)
            translate([raio_espiral, 0])
                circle(r = largura_linha_caracol, $fn = 12);
    }
}

// Textura de caracóis distribuída na superfície da esfera
module textura_caracois() {
    for (h = [0 : num_caracois_horizontal - 1]) {
        angulo_h = h * 360 / num_caracois_horizontal;
        for (v = [1 : num_caracois_verticais]) {
            // Distribuir de 30° a 85° para evitar o dharmachakra no topo
            angulo_v = 30 + v * 55 / num_caracois_verticais;
            
            rotate([0, 0, angulo_h])
                rotate([angulo_v, 0, 0])
                    translate([0, 0, raio_esfera - profundidade_caracol])
                        rotate([0, 0, angulo_h * 20]) // Variação de rotação
                            linear_extrude(height = profundidade_caracol + 0.3)
                                caracol_2d();
        }
    }
}

// Meia esfera com canal em T e FUROS de encaixe (ambos os lados iguais)
module meia_conta_meru_com_furos() {
    difference() {
        // Base: meia esfera com canal
        difference() {
            // Meia esfera posicionada com face plana no z=0
            intersection() {
                sphere(r = raio_esfera);
                translate([0, 0, raio_esfera/2])
                    cube([diametro_esfera * 1.2, diametro_esfera * 1.2, raio_esfera], center = true);
            }
            
            // Canal em T na face plana (z=0, face que toca a mesa)
            canal_T_face_plana();
        }
        
        // Remover furos para os pinos
        furos_encaixe();

        // Relevo Dharmachakra no topo (baixo-relevo)
        translate([0, 0, raio_esfera - profundidade_relevo])
            linear_extrude(height = profundidade_relevo + 0.2)
                dharmachakra_2d();
        
        // Textura de caracóis distribuída na superfície
        textura_caracois();
    }
}

// Conector: 4 pinos soltos (sem plaquinha) para impressão conjunta
module conector_quatro_pinos() {
    // Distribui os 4 pinos em uma grade para imprimir separados
    desloc = diametro_pino * 3;
    idx = 0;
    for (x = [-1, 1])
        for (y = [-1, 1]) {
            translate([x * desloc, y * desloc, 0])
                cylinder(h = comprimento_pino_total,
                         r = diametro_pino / 2,
                         center = false);
            idx = idx + 1;
        }
}

// ========== RENDERIZAÇÃO ==========
// Duas metades com furos (faces planas para baixo na impressão)
translate([-diametro_esfera * 0.65, 0, 0])
    meia_conta_meru_com_furos();

translate([diametro_esfera * 0.65, 0, 0])
    meia_conta_meru_com_furos();

// Conjunto de 4 pinos soltos (impressão separada na mesma mesa)
translate([0, -diametro_esfera * 1.4, 0])
    conector_quatro_pinos();
