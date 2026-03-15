unit Tela.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmInicio = class(TForm)
    btnProdutos: TButton;
    btnVendas: TButton;
    pnlMid: TPanel;
    btnPDV: TButton;
    btnTeste: TButton;
    procedure btnTesteClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicio: TfrmInicio;

implementation

uses
  Tela.CRUD.Base, Tela.Produtos.Crud;

{$R *.dfm}

procedure TfrmInicio.btnProdutosClick(Sender: TObject);
begin
  frmProdutos.ShowModal;
end;

procedure TfrmInicio.btnTesteClick(Sender: TObject);
begin
  frmCRUD.show
end;

end.
