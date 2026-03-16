unit Model.Produto;

interface

type
  TProduto = class
  private
    FId: Integer;
    FNome: string;
    FDescricao: string;
    FPreco: Currency;
    FEstoque: Integer;
    procedure SetNome(const Value: string);
    procedure SetPreco(const Value: Currency);
    procedure SetEstoque(const Value: Integer);
  public
    constructor Create;
    property Id: Integer read FId write FId;
    property Nome: string read FNome write SetNome;
    property Descricao: string read FDescricao write FDescricao;
    property Preco: Currency read FPreco write SetPreco;
    property Estoque: Integer read FEstoque write SetEstoque;
  end;

implementation

uses
  System.SysUtils;

constructor TProduto.Create;
begin
  FId := 0;
  FPreco := 0;
  FEstoque := 0;
end;

procedure TProduto.SetNome(const Value: string);
begin
  if Trim(Value) = '' then
    raise Exception.Create('Nome do produto não pode ser vazio.');
  FNome := Value;
end;

procedure TProduto.SetPreco(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Preço não pode ser negativo.');
  FPreco := Value;
end;

procedure TProduto.SetEstoque(const Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create('Estoque não pode ser negativo.');
  FEstoque := Value;
end;

end.
