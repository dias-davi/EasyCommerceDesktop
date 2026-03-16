-- EasyCommerce - Schema PostgreSQL 17
-- Execute no banco: easycommerce

CREATE TABLE IF NOT EXISTS produtos (
    id        SERIAL PRIMARY KEY,
    nome      VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco     NUMERIC(10,2) NOT NULL DEFAULT 0,
    estoque   INTEGER NOT NULL DEFAULT 0,
    criado_em TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS vendas (
    id          SERIAL PRIMARY KEY,
    data_venda  TIMESTAMP NOT NULL DEFAULT NOW(),
    cliente     VARCHAR(150) NOT NULL,
    total       NUMERIC(10,2) NOT NULL DEFAULT 0,
    criado_em   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS itens_venda (
    id             SERIAL PRIMARY KEY,
    venda_id       INTEGER NOT NULL REFERENCES vendas(id) ON DELETE CASCADE,
    produto_id     INTEGER NOT NULL REFERENCES produtos(id),
    quantidade     INTEGER NOT NULL DEFAULT 1,
    preco_unitario NUMERIC(10,2) NOT NULL
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_itens_venda_venda_id   ON itens_venda(venda_id);
CREATE INDEX IF NOT EXISTS idx_itens_venda_produto_id ON itens_venda(produto_id);

-- Dados de exemplo
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
  ('Café 500g',       'Café torrado e moído',    15.90, 100),
  ('Açúcar 1kg',      'Açúcar refinado',          4.50, 200),
  ('Leite Integral',  'Leite UHT 1L',             5.20,  80),
  ('Pão de Forma',    'Pão de forma tradicional', 8.90,  50);
