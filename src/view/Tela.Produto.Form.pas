unit Tela.Produto.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Model.Produto, Service.Produto;

type
  TfrmProdutoForm = class(TForm)
    pnlPrincipal: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    lblPreco: TLabel;
    edtPreco: TEdit;
    lblEstoque: TLabel;
    edtEstoque: TEdit;
    pnlBotoes: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);

  private
    FService: TProdutoService;
    FProduto: TProduto;

  public
    procedure CarregarProduto(Id: Integer);
  end;

implementation

{$R *.dfm}

procedure TfrmProdutoForm.FormCreate(Sender: TObject);
begin
  FService := TProdutoService.Create;
  FProduto := TProduto.Create;
  edtPreco.Text   := '0,00';
  edtEstoque.Text := '0';
end;

procedure TfrmProdutoForm.FormDestroy(Sender: TObject);
begin
  FService.Free;
  FProduto.Free;
end;

procedure TfrmProdutoForm.CarregarProduto(Id: Integer);
var
  lProduto : TProduto;
begin
  lProduto := FService.BuscarPorId(Id);
  if Assigned(lProduto) then
  begin
    FProduto.Free;
    FProduto := lProduto;
    edtNome.Text     := FProduto.Nome;
    edtDescricao.Text := FProduto.Descricao;
    edtPreco.Text    := CurrToStr(FProduto.Preco);
    edtEstoque.Text  := IntToStr(FProduto.Estoque);
  end;
end;

procedure TfrmProdutoForm.edtPrecoExit(Sender: TObject);
var
  lValor: Currency;
begin
  try
    lValor := StrToCurr(edtPreco.Text);
    edtPreco.Text := CurrToStr(lValor);
  except
    edtPreco.Text := '0,00';
    edtPreco.SetFocus;
  end;
end;

procedure TfrmProdutoForm.btnSalvarClick(Sender: TObject);
begin
  try
    FProduto.Nome     := edtNome.Text;
    FProduto.Descricao := edtDescricao.Text;
    FProduto.Preco    := StrToCurr(edtPreco.Text);
    FProduto.Estoque  := StrToIntDef(edtEstoque.Text, 0);

    FService.Salvar(FProduto);

    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmProdutoForm.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
