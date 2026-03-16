unit Repository.Produto;

interface

uses
  Model.Produto, DB.Connection, FireDAC.Comp.Client, FireDAC.Stan.Param,
  System.Generics.Collections, System.SysUtils, Data.DB;

type
  TProdutoRepository = class
  private
    FConn: TFDConnection;
  public
    constructor Create;
    procedure Inserir(Produto: TProduto);
    procedure Atualizar(Produto: TProduto);
    procedure Excluir(Id: Integer);
    function ListarTodos: TObjectList<TProduto>;
    function BuscarPorId(Id: Integer): TProduto;
  end;

implementation

constructor TProdutoRepository.Create;
begin
  FConn := GetConnection;
end;

procedure TProdutoRepository.Inserir(Produto: TProduto);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text :=
      'INSERT INTO produtos (nome, descricao, preco, estoque) ' +
      'VALUES (:nome, :descricao, :preco, :estoque) RETURNING id';
    lQuery.ParamByName('nome').AsString      := Produto.Nome;
    lQuery.ParamByName('descricao').AsString := Produto.Descricao;
    lQuery.ParamByName('preco').AsCurrency   := Produto.Preco;
    lQuery.ParamByName('estoque').AsInteger  := Produto.Estoque;

    lQuery.Open;

    Produto.Id := lQuery.Fields[0].AsInteger;
  finally
    lQuery.Free;
  end;
end;

procedure TProdutoRepository.Atualizar(Produto: TProduto);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;

    lQuery.SQL.Text :=
      'UPDATE produtos SET nome=:nome, descricao=:descricao, ' +
      'preco=:preco, estoque=:estoque WHERE id=:id';
    lQuery.ParamByName('nome').AsString := Produto.Nome;
    lQuery.ParamByName('descricao').AsString := Produto.Descricao;
    lQuery.ParamByName('preco').AsCurrency := Produto.Preco;
    lQuery.ParamByName('estoque').AsInteger := Produto.Estoque;
    lQuery.ParamByName('id').AsInteger := Produto.Id;

    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;
end;

procedure TProdutoRepository.Excluir(Id: Integer);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;

    lQuery.SQL.Text := 'DELETE FROM produtos WHERE id=:id';
    lQuery.ParamByName('id').AsInteger := Id;

    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;
end;

function TProdutoRepository.ListarTodos: TObjectList<TProduto>;
var
  lQuery: TFDQuery;
  lProduto: TProduto;
begin
  Result := TObjectList<TProduto>.Create(True);
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;

    lQuery.SQL.Text := 'SELECT id, nome, descricao, preco, estoque FROM produtos ORDER BY id';
    lQuery.Open;
    while not lQuery.Eof do
      begin
        lProduto := TProduto.Create;
        lProduto.Id := lQuery.FieldByName('id').AsInteger;
        lProduto.Nome := lQuery.FieldByName('nome').AsString;
        lProduto.Descricao := lQuery.FieldByName('descricao').AsString;
        lProduto.Preco := lQuery.FieldByName('preco').AsCurrency;
        lProduto.Estoque := lQuery.FieldByName('estoque').AsInteger;

        Result.Add(lProduto);

        lQuery.Next;
      end;
  finally
    lQuery.Free;
  end;
end;

function TProdutoRepository.BuscarPorId(Id: Integer): TProduto;
var
  lQuery: TFDQuery;
begin
  Result := nil;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text := 'SELECT id, nome, descricao, preco, estoque FROM produtos WHERE id=:id';
    lQuery.ParamByName('id').AsInteger := Id;
    lQuery.Open;
    if not lQuery.IsEmpty then
      begin
        Result := TProduto.Create;
        Result.Id := lQuery.FieldByName('id').AsInteger;
        Result.Nome := lQuery.FieldByName('nome').AsString;
        Result.Descricao := lQuery.FieldByName('descricao').AsString;
        Result.Preco := lQuery.FieldByName('preco').AsCurrency;
        Result.Estoque := lQuery.FieldByName('estoque').AsInteger;
      end;
  finally
    lQuery.Free;
  end;
end;

end.
