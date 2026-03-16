unit Tela.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, VCLTee.TeCanvas;

type
  TfrmInicio = class(TForm)
    pnlMid: TPanel;
    btnProdutos: TButton;
    btnVendas: TButton;
    btnPDV: TButton;
    btnSair: TButton;
    procedure btnProdutosClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnPDVClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private

  public

  end;

var
  frmInicio: TfrmInicio;

implementation

uses
  Tela.Produtos.Crud, Tela.Vendas.Crud, Tela.PDV;

{$R *.dfm}

procedure TfrmInicio.btnProdutosClick(Sender: TObject);
var
  Frm: TfrmProdutos;
begin
  Frm := TfrmProdutos.Create(Self);
  try
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

procedure TfrmInicio.btnVendasClick(Sender: TObject);
var
  Frm: TfrmVendas;
begin
  Frm := TfrmVendas.Create(Self);
  try
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

procedure TfrmInicio.btnPDVClick(Sender: TObject);
var
  Frm: TfrmPDV;
begin
  Frm := TfrmPDV.Create(Self);
  try
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

procedure TfrmInicio.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
