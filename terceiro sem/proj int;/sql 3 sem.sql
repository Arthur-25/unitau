-- Tabela para armazenar informações sobre as ONGs
CREATE TABLE ONGS (
    ong_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Tabela para armazenar informações sobre os doadores
CREATE TABLE DOADORES (
    doador_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Tabela para armazenar as categorias dos itens doados
CREATE TABLE CATEGORIAS (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

-- Tabela para armazenar informações sobre os itens doados (estoque)
CREATE TABLE ITENS (
    item_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    categoria_id INTEGER REFERENCES CATEGORIAS(categoria_id),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    quantidade INTEGER NOT NULL DEFAULT 0,
    unidade VARCHAR(20)
);

-- Tabela para registrar as entradas de itens no estoque (doações recebidas)
CREATE TABLE ENTRADAS_ESTOQUE (
    entrada_id SERIAL PRIMARY KEY,
    item_id INTEGER REFERENCES ITENS(item_id) NOT NULL,
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantidade INTEGER NOT NULL,
    doador_id INTEGER REFERENCES DOADORES(doador_id),
    ong_id INTEGER REFERENCES ONGS(ong_id) NOT NULL,
    observacoes TEXT
);

-- Tabela para registrar as saídas de itens do estoque (doações realizadas)
CREATE TABLE SAIDAS_ESTOQUE (
    saida_id SERIAL PRIMARY KEY,
    item_id INTEGER REFERENCES ITENS(item_id) NOT NULL,
    data_saida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantidade INTEGER NOT NULL,
    beneficiario VARCHAR(255), -- Pode ser o nome de uma pessoa ou instituição
    ong_id INTEGER REFERENCES ONGS(ong_id) NOT NULL,
    observacoes TEXT
);

-- Tabela para registrar doações financeiras
CREATE TABLE DOACOES_FINANCEIRAS (
    doacao_id SERIAL PRIMARY KEY,
    doador_id INTEGER REFERENCES DOADORES(doador_id),
    ong_id INTEGER REFERENCES ONGS(ong_id) NOT NULL,
    data_doacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(50),
    observacoes TEXT
);