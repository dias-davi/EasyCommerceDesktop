unit Service.Produto;

interface

uses
  Model.Produto, Repository.Produto,
  System.Generics.Collections, System.SysUtils;

type
  TProdutoService = class
  private
    FRepository: TProdutoRepository;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Salvar(Produto: TProduto);
    procedure Excluir(Id: Integer);
    function ListarTodos: TObjectList<TProduto>;
    function BuscarPorId(Id: Integer): TProduto;
  end;

implementation

constructor TProdutoService.Create;
begin
  FRepository := TProdutoRepository.Create;
end;

destructor TProdutoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

procedure TProdutoService.Salvar(Produto: TProduto);
begin
  if Trim(Produto.Nome) = '' then
    raise Exception.Create('Nome do produto é obrigatório.');
  if Produto.Preco <= 0 then
    raise Exception.Create('Preço deve ser maior que zero.');

  if Produto.Id = 0 then
    FRepository.Inserir(Produto)
  else
    FRepository.Atualizar(Produto);
end;

procedure TProdutoService.Excluir(Id: Integer);
begin
  FRepository.Excluir(Id);
end;

function TProdutoService.ListarTodos: TObjectList<TProduto>;
begin
  Result := FRepository.ListarTodos;
end;

function TProdutoService.BuscarPorId(Id: Integer): TProduto;
begin
  Result := FRepository.BuscarPorId(Id);
end;

end.
