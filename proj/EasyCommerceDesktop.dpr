program EasyCommerceDesktop;

uses
  Vcl.Forms,
  Tela.Principal in '..\src\view\Tela.Principal.pas' {frmInicio},
  Tela.CRUD.Base in '..\src\view\Tela.CRUD.Base.pas' {frmCRUD},
  Tela.CadastrareEditar in '..\src\view\Tela.CadastrareEditar.pas' {frmCadastroEEdicao},
  Tela.Produtos.Crud in '..\src\view\Tela.Produtos.Crud.pas' {frmProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInicio, frmInicio);
  Application.CreateForm(TfrmCRUD, frmCRUD);
  Application.CreateForm(TfrmCadastroEEdicao, frmCadastroEEdicao);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.Run;
end.
