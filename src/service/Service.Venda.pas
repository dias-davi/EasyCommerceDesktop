unit Service.Venda;

interface

uses
  Model.Venda, Repository.Venda,
  System.Generics.Collections, System.SysUtils;

type
  TVendaService = class
  private
    FRepository: TVendaRepository;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Finalizar(Venda: TVenda);
    procedure Excluir(Id: Integer);
    function ListarTodos: TObjectList<TVenda>;
    function BuscarComItens(Id: Integer): TVenda;
  end;

implementation

constructor TVendaService.Create;
begin
  FRepository := TVendaRepository.Create;
end;

destructor TVendaService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

procedure TVendaService.Finalizar(Venda: TVenda);
begin
  if Venda.Itens.Count = 0 then
    raise Exception.Create('A venda deve ter pelo menos um item.');
  if Trim(Venda.Cliente) = '' then
    //raise Exception.Create('Informe o nome do cliente.');
    Venda.Cliente:= 'Não Informado';
  FRepository.Inserir(Venda);
end;

procedure TVendaService.Excluir(Id: Integer);
begin
  FRepository.Excluir(Id);
end;

function TVendaService.ListarTodos: TObjectList<TVenda>;
begin
  Result := FRepository.ListarTodos;
end;

function TVendaService.BuscarComItens(Id: Integer): TVenda;
begin
  Result := FRepository.BuscarComItens(Id);
end;

end.
