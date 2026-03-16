-- EasyCommerce - Schema PostgreSQL 17

CREATE DATABASE easycommerce
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

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
  ('Arroz 1kg', 'Arroz branco tipo 1', 6.90, 120),
  ('Feijão Carioca 1kg', 'Feijão carioca tipo 1', 7.50, 110),
  ('Macarrão Espaguete', 'Macarrão de trigo 500g', 4.20, 150),
  ('Molho de Tomate', 'Molho pronto tradicional 340g', 3.80, 140),
  ('Óleo de Soja 900ml', 'Óleo vegetal refinado', 7.90, 90),
  ('Sal 1kg', 'Sal refinado iodado', 2.20, 200),
  ('Farinha de Trigo 1kg', 'Farinha especial para panificação', 5.60, 100),
  ('Farinha de Mandioca', 'Farinha de mandioca torrada 500g', 4.70, 90),
  ('Fubá 1kg', 'Fubá mimoso', 3.90, 120),
  ('Milho Verde Lata', 'Milho verde em conserva', 4.10, 80),
  ('Ervilha Lata', 'Ervilha em conserva', 4.20, 80),
  ('Atum Lata', 'Atum sólido em óleo', 8.90, 70),
  ('Sardinha Lata', 'Sardinha ao molho de tomate', 6.20, 90),
  ('Biscoito Cream Cracker', 'Biscoito salgado 200g', 3.40, 130),
  ('Biscoito Recheado Chocolate', 'Biscoito recheado 130g', 2.80, 150),
  ('Achocolatado 400g', 'Achocolatado em pó', 6.50, 95),
  ('Chocolate Barra', 'Chocolate ao leite 90g', 5.90, 100),
  ('Bala Sortida 200g', 'Bala mastigável sabores variados', 4.60, 110),
  ('Pirulito', 'Pirulito sabores variados', 0.80, 300),
  ('Chiclete', 'Goma de mascar sabores variados', 0.50, 350),
  ('Refrigerante Cola 2L', 'Refrigerante sabor cola', 9.90, 80),
  ('Refrigerante Guaraná 2L', 'Refrigerante sabor guaraná', 8.90, 80),
  ('Refrigerante Laranja 2L', 'Refrigerante sabor laranja', 8.50, 70),
  ('Água Mineral 500ml', 'Água mineral sem gás', 2.50, 200),
  ('Água Mineral 1.5L', 'Água mineral sem gás', 3.90, 150),
  ('Suco Caixa 1L', 'Suco pronto diversos sabores', 6.70, 90),
  ('Suco Caixa 200ml', 'Suco pronto individual', 2.20, 140),
  ('Cerveja Lata', 'Cerveja lager 350ml', 4.50, 120),
  ('Cerveja Long Neck', 'Cerveja long neck 355ml', 5.90, 100),
  ('Energético Lata', 'Bebida energética 250ml', 7.90, 80),
  ('Detergente 500ml', 'Detergente líquido neutro', 2.70, 160),
  ('Sabão em Pó 1kg', 'Sabão em pó para roupas', 9.50, 90),
  ('Amaciante 2L', 'Amaciante concentrado', 12.90, 70),
  ('Água Sanitária 1L', 'Alvejante clorado', 3.60, 130),
  ('Desinfetante 1L', 'Desinfetante perfumado', 5.80, 110),
  ('Esponja de Louça', 'Esponja dupla face', 1.90, 200),
  ('Papel Higiênico 4un', 'Papel higiênico folha dupla', 6.90, 100),
  ('Papel Toalha', 'Rolo de papel toalha', 5.20, 90),
  ('Saco de Lixo 50L', 'Pacote com 10 unidades', 7.40, 85),
  ('Saco de Lixo 100L', 'Pacote com 10 unidades', 9.60, 70),
  ('Sabonete', 'Sabonete perfumado 90g', 2.50, 180),
  ('Shampoo 350ml', 'Shampoo hidratante', 11.90, 70),
  ('Condicionador 350ml', 'Condicionador hidratante', 12.50, 70),
  ('Creme Dental', 'Creme dental com flúor', 4.90, 140),
  ('Escova de Dente', 'Escova dental macia', 5.30, 120),
  ('Fio Dental', 'Fio dental 50m', 6.10, 80),
  ('Desodorante Spray', 'Desodorante antitranspirante', 13.90, 60),
  ('Desodorante Roll-on', 'Desodorante roll-on', 9.80, 70),
  ('Aparelho de Barbear', 'Aparelho descartável', 6.50, 90),
  ('Espuma de Barbear', 'Espuma para barbear 200ml', 14.90, 60),
  ('Margarina 500g', 'Margarina cremosa com sal', 6.40, 90),
  ('Manteiga 200g', 'Manteiga com sal', 8.90, 70),
  ('Queijo Mussarela 200g', 'Queijo fatiado', 9.90, 60),
  ('Presunto 200g', 'Presunto fatiado', 8.50, 60),
  ('Iogurte 170g', 'Iogurte sabores variados', 2.90, 120),
  ('Iogurte 1L', 'Iogurte natural', 7.50, 80),
  ('Leite Condensado', 'Leite condensado lata', 6.80, 85),
  ('Creme de Leite', 'Creme de leite caixa', 4.40, 100),
  ('Gelatina', 'Gelatina sabores variados', 1.90, 150),
  ('Pudim em Pó', 'Mistura para pudim', 3.20, 120),
  ('Batata Palha', 'Batata palha crocante 140g', 8.90, 70),
  ('Amendoim Torrado', 'Amendoim torrado salgado', 5.90, 80),
  ('Amendoim Japonês', 'Amendoim japonês crocante', 6.70, 75),
  ('Pipoca Milho 500g', 'Milho para pipoca', 4.30, 100),
  ('Batata Chips', 'Batata frita chips 120g', 7.90, 90),
  ('Barra de Cereal', 'Barra de cereal sabores variados', 2.50, 140),
  ('Granola 500g', 'Granola tradicional', 12.90, 60),
  ('Aveia 250g', 'Aveia em flocos', 4.80, 90),
  ('Mel 300g', 'Mel puro de abelha', 15.90, 40),
  ('Doce de Leite 400g', 'Doce de leite cremoso', 9.90, 70),
  ('Tomate 1kg', 'Tomate fresco', 6.20, 100),
  ('Cebola 1kg', 'Cebola branca', 5.80, 100),
  ('Batata 1kg', 'Batata inglesa', 6.50, 100),
  ('Cenoura 1kg', 'Cenoura fresca', 5.20, 100),
  ('Alho 200g', 'Alho nacional', 7.40, 80),
  ('Alface', 'Alface americana', 3.20, 60),
  ('Repolho', 'Repolho verde', 4.10, 60),
  ('Banana 1kg', 'Banana prata', 5.90, 90),
  ('Maçã 1kg', 'Maçã gala', 8.50, 90),
  ('Laranja 1kg', 'Laranja pera', 4.80, 100),
  ('Pera 1kg', 'Pera argentina', 10.90, 60),
  ('Uva 500g', 'Uva sem sementes', 9.90, 70),
  ('Abacaxi', 'Abacaxi pérola', 6.90, 60),
  ('Melancia kg', 'Melancia fresca', 2.90, 120),
  ('Mamão kg', 'Mamão formosa', 4.90, 90),
  ('Manga kg', 'Manga palmer', 5.40, 80),
  ('Limão kg', 'Limão tahiti', 4.30, 80),
  ('Maracujá kg', 'Maracujá azedo', 7.50, 60),
  ('Coco Unidade', 'Coco seco', 4.90, 70),
  ('Abacate kg', 'Abacate manteiga', 6.20, 70);