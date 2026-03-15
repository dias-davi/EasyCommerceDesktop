unit Tela.CRUD.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids;

type
  TfrmCRUD = class(TForm)
    pnlPrincipal: TPanel;
    pnlGrid: TPanel;
    StringGrid1: TStringGrid;
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;

    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private

  public

  end;

var
  frmCRUD: TfrmCRUD;

implementation

uses
  Tela.CadastrareEditar;

{$R *.dfm}

procedure TfrmCRUD.btnEditarClick(Sender: TObject);
begin
  frmCadastroEEdicao.ShowModal;
end;

procedure TfrmCRUD.btnNovoClick(Sender: TObject);
begin
  frmCadastroEEdicao.ShowModal;
end;

procedure TfrmCRUD.btnExcluirClick(Sender: TObject);
begin
  //
end;

procedure TfrmCRUD.btnSairClick(Sender: TObject);
begin
  frmCRUD.Close;
end;

end.
