unit Repository.Venda;

interface

uses
  Model.Venda, DB.Connection, FireDAC.Comp.Client, System.Generics.Collections,
  System.SysUtils, FireDAC.stan.Param, Data.DB, System.UITypes;

type
  TVendaRepository = class
  private
    FConn: TFDConnection;
    procedure SalvarItens(Venda: TVenda);
  public
    constructor Create;
    procedure Inserir(Venda: TVenda);
    procedure Excluir(Id: Integer);
    function ListarTodos: TObjectList<TVenda>;
    function BuscarComItens(Id: Integer): TVenda;
  end;

implementation

constructor TVendaRepository.Create;
begin
  FConn := GetConnection;
end;

procedure TVendaRepository.SalvarItens(Venda: TVenda);
var
  lQuery: TFDQuery;
  Item: TItemVenda;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text := 'DELETE FROM itens_venda WHERE venda_id=:vid';
    lQuery.ParamByName('vid').AsInteger := Venda.Id;
    lQuery.ExecSQL;

    for Item in Venda.Itens do
    begin
      lQuery.SQL.Text :=
        'INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) ' +
        'VALUES (:vid, :pid, :qtd, :preco) RETURNING id';
      lQuery.ParamByName('vid').AsInteger   := Venda.Id;
      lQuery.ParamByName('pid').AsInteger   := Item.ProdutoId;
      lQuery.ParamByName('qtd').AsInteger   := Item.Quantidade;
      lQuery.ParamByName('preco').AsCurrency:= Item.PrecoUnitario;
      lQuery.Open;
      Item.Id := lQuery.Fields[0].AsInteger;
      lQuery.Close;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TVendaRepository.Inserir(Venda: TVenda);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text :=
      'INSERT INTO vendas (data_venda, cliente, total) ' +
      'VALUES (:data, :cliente, :total) RETURNING id';
    lQuery.ParamByName('data').AsDateTime   := Venda.Data;
    lQuery.ParamByName('cliente').AsString  := Venda.Cliente;
    lQuery.ParamByName('total').AsCurrency  := Venda.Total;
    lQuery.Open;
    Venda.Id := lQuery.Fields[0].AsInteger;

  finally
    lQuery.Free;
  end;
  SalvarItens(Venda);
end;

procedure TVendaRepository.Excluir(Id: Integer);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text := 'DELETE FROM itens_venda WHERE venda_id=:id';
    lQuery.ParamByName('id').AsInteger := Id;
    lQuery.ExecSQL;
    lQuery.SQL.Text := 'DELETE FROM vendas WHERE id=:id';
    lQuery.ParamByName('id').AsInteger := Id;
    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;
end;

function TVendaRepository.ListarTodos: TObjectList<TVenda>;
var
  lQuery: TFDQuery;
  lValor: TVenda;
begin
  Result := TObjectList<TVenda>.Create(True);
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text := 'SELECT id, data_venda, cliente, total FROM vendas ORDER BY data_venda DESC';
    lQuery.Open;
    while not lQuery.Eof do
    begin
      lValor := TVenda.Create;
      lValor.Id      := lQuery.FieldByName('id').AsInteger;
      lValor.Data    := lQuery.FieldByName('data_venda').AsDateTime;
      lValor.Cliente := lQuery.FieldByName('cliente').AsString;
      lValor.Total   := lQuery.FieldByName('total').AsCurrency;
      Result.Add(lValor);
      lQuery.Next;
    end;
  finally
    lQuery.Free;
  end;
end;

function TVendaRepository.BuscarComItens(Id: Integer): TVenda;
var
  lQuery: TFDQuery;
  lItem: TItemVenda;
begin
  Result := nil;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConn;
    lQuery.SQL.Text := 'SELECT id, data_venda, cliente FROM vendas WHERE id=:id';
    lQuery.ParamByName('id').AsInteger := Id;
    lQuery.Open;
    if lQuery.IsEmpty then Exit;
    Result := TVenda.Create;
    Result.Id      := lQuery.FieldByName('id').AsInteger;
    Result.Data    := lQuery.FieldByName('data_venda').AsDateTime;
    Result.Cliente := lQuery.FieldByName('cliente').AsString;
    lQuery.Close;
    lQuery.SQL.Text :=
      'SELECT iv.id, iv.produto_id, p.nome, iv.quantidade, iv.preco_unitario ' +
      'FROM itens_venda iv JOIN produtos p ON p.id = iv.produto_id ' +
      'WHERE iv.venda_id=:vid';
    lQuery.ParamByName('vid').AsInteger := Id;
    lQuery.Open;
    while not lQuery.Eof do
    begin
      lItem := TItemVenda.Create;
      lItem.Id            := lQuery.FieldByName('id').AsInteger;
      lItem.VendaId       := Id;
      lItem.ProdutoId     := lQuery.FieldByName('produto_id').AsInteger;
      lItem.ProdutoNome   := lQuery.FieldByName('nome').AsString;
      lItem.Quantidade    := lQuery.FieldByName('quantidade').AsInteger;
      lItem.PrecoUnitario := lQuery.FieldByName('preco_unitario').AsCurrency;
      Result.AdicionarItem(lItem);
      lQuery.Next;
    end;
  finally
    lQuery.Free;
  end;
end;

end.
