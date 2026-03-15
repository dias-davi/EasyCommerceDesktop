unit Tela.Produtos.Crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tela.CRUD.Base;

type
  TfrmProdutos = class(TfrmCRUD)
    procedure btnSairClick(Sender: TObject);

  private

  public

  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

{ TfrmProdutos }

procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
  inherited;
  frmProdutos.Close;
end;

end.
