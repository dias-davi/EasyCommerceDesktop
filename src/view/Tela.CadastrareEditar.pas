unit Tela.CadastrareEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCadastroEEdicao = class(TForm)
    pnlPrincipal: TPanel;
    pnlGrid: TPanel;
    pnlTop: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEEdicao: TfrmCadastroEEdicao;

implementation

{$R *.dfm}

end.
