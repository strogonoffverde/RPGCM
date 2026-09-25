CREATE DATABASE IF NOT EXISTS rpgcm CHARACTER SET utf8mb4;
USE rpgcm;

CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  indice_api VARCHAR(50) NOT NULL UNIQUE,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE classe (
  id INT AUTO_INCREMENT PRIMARY KEY,
  indice_api VARCHAR(50) NOT NULL UNIQUE,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE personagem (
  id INT AUTO_INCREMENT PRIMARY KEY,
 usuario_id INT NOT NULL,
  raca_id INT NOT NULL,
  classe_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  nivel INT DEFAULT 1,
  xp INT DEFAULT 0,
  antecedente VARCHAR(100),
  alinhamento VARCHAR(50),
  descricao TEXT,
  forca INT NOT NULL,
  destreza INT NOT NULL,
  constituicao INT NOT NULL,
  inteligencia INT NOT NULL,
  sabedoria INT NOT NULL,
  carisma INT NOT NULL,
  hp_max INT NOT NULL,
  hp_atual INT NOT NULL,
  classe_armadura INT NOT NULL,
  bonus_ataque INT DEFAULT 0,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
  FOREIGN KEY (raca_id) REFERENCES raca(id),
  FOREIGN KEY (classe_id) REFERENCES classe(id)
);

CREATE TABLE item (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  tipo VARCHAR(50),
  descricao TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE inventario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  personagem_id INT NOT NULL,
  item_id INT NOT NULL,
  quantidade INT DEFAULT 1,
  equipado BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (personagem_id) REFERENCES personagem(id) ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE
);


CREATE TABLE habilidade (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  tipo VARCHAR(50),
  descricao TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE personagem_habilidade (
  personagem_id INT NOT NULL,
  habilidade_id INT NOT NULL,
  PRIMARY KEY (personagem_id, habilidade_id),
  FOREIGN KEY (personagem_id) REFERENCES personagem(id) ON DELETE CASCADE,
  FOREIGN KEY (habilidade_id) REFERENCES habilidade(id) ON DELETE CASCADE
);