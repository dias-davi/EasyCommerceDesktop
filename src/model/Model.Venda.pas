unit Model.Venda;

interface

uses
  System.Generics.Collections, System.SysUtils;

type
  TItemVenda = class
  private
    FId: Integer;
    FVendaId: Integer;
    FProdutoId: Integer;
    FProdutoNome: string;
    FQuantidade: Integer;
    FPrecoUnitario: Currency;
    procedure SetQuantidade(const Value: Integer);
    procedure SetPrecoUnitario(const Value: Currency);
  public
    constructor Create;
    function Subtotal: Currency;
    property Id: Integer read FId write FId;
    property VendaId: Integer read FVendaId write FVendaId;
    property ProdutoId: Integer read FProdutoId write FProdutoId;
    property ProdutoNome: string read FProdutoNome write FProdutoNome;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
    property PrecoUnitario: Currency read FPrecoUnitario write SetPrecoUnitario;
  end;

  TVenda = class
  private
    FId: Integer;
    FData: TDateTime;
    FCliente: string;
    FTotal: Currency;
    FItens: TObjectList<TItemVenda>;
    function GetTotal: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarItem(Item: TItemVenda);
    procedure RemoverItem(Index: Integer);
    property Id: Integer read FId write FId;
    property Data: TDateTime read FData write FData;
    property Cliente: string read FCliente write FCliente;
    property Total: Currency read GetTotal write FTotal;
    property Itens: TObjectList<TItemVenda> read FItens;
  end;

implementation

{ TItemVenda }

constructor TItemVenda.Create;
begin
  FQuantidade := 1;
  FPrecoUnitario := 0;
end;

procedure TItemVenda.SetQuantidade(const Value: Integer);
begin
  if Value <= 0 then
    raise Exception.Create('Quantidade deve ser maior que zero.');
  FQuantidade := Value;
end;

procedure TItemVenda.SetPrecoUnitario(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Preço unitário não pode ser negativo.');
  FPrecoUnitario := Value;
end;

function TItemVenda.Subtotal: Currency;
begin
  Result := FQuantidade * FPrecoUnitario;
end;

{ TVenda }

constructor TVenda.Create;
begin
  FData := Now;
  FItens := TObjectList<TItemVenda>.Create(True);
end;

destructor TVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

procedure TVenda.AdicionarItem(Item: TItemVenda);
begin
  FItens.Add(Item);
end;

procedure TVenda.RemoverItem(Index: Integer);
begin
  FItens.Delete(Index);
end;

function TVenda.GetTotal: Currency;
var
  lItem: TItemVenda;
begin
  if FItens.Count > 0 then
  begin
    Result := 0;
    for lItem in FItens do
      Result := Result + lItem.Subtotal;
  end
  else
    Result := FTotal;
end;

end.
