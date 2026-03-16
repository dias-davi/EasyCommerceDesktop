program EasyCommerceDesktop;

uses
  Vcl.Forms,
  FireDAC.DApt,
  Tela.Principal in '..\src\view\Tela.Principal.pas' {frmInicio},
  Tela.Produtos.Crud in '..\src\view\Tela.Produtos.Crud.pas' {frmProdutos},
  Tela.Produto.Form in '..\src\view\Tela.Produto.Form.pas' {frmProdutoForm},
  Tela.Vendas.Crud in '..\src\view\Tela.Vendas.Crud.pas' {frmVendas},
  Tela.Venda.Form in '..\src\view\Tela.Venda.Form.pas' {frmVendaForm},
  Tela.PDV in '..\src\view\Tela.PDV.pas' {frmPDV},
  DB.DataModule in '..\src\connection\DB.DataModule.pas' {dmDB: TDataModule},
  DB.Connection in '..\src\connection\DB.Connection.pas',
  Model.Produto in '..\src\model\Model.Produto.pas',
  Model.Venda in '..\src\model\Model.Venda.pas',
  Repository.Produto in '..\src\repository\Repository.Produto.pas',
  Repository.Venda in '..\src\repository\Repository.Venda.pas',
  Service.Produto in '..\src\service\Service.Produto.pas',
  Service.Venda in '..\src\service\Service.Venda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInicio, frmInicio);
  Application.Run;
end.
