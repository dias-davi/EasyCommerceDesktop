unit Tela.Vendas.Crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Model.Venda, Service.Venda,
  System.Generics.Collections;

type
  TfrmVendas = class(TForm)
    pnlTop: TPanel;
    btnNova: TButton;
    btnVisualizar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    sgVendas: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovaClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FService: TVendaService;
    FVendas: TObjectList<TVenda>;
    procedure CarregarGrid;
    function GetIdSelecionado: Integer;
  public
  end;

var
  frmVendas: TfrmVendas;

implementation

uses
  Tela.Venda.Form, System.UITypes;

{$R *.dfm}

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  FService := TVendaService.Create;
  FVendas := nil;

  sgVendas.ColCount := 4;
  sgVendas.FixedRows := 1;
  sgVendas.Cells[0,0] := 'ID';
  sgVendas.Cells[1,0] := 'Data';
  sgVendas.Cells[2,0] := 'Cliente';
  sgVendas.Cells[3,0] := 'Total (R$)';
  sgVendas.ColWidths[0] := Trunc(sgVendas.Width * 0.2);
  sgVendas.ColWidths[1] := Trunc(sgVendas.Width * 0.2);
  sgVendas.ColWidths[2] := Trunc(sgVendas.Width * 0.4);
  sgVendas.ColWidths[3] := Trunc(sgVendas.Width * 0.2);
  sgVendas.Options := sgVendas.Options + [goRowSelect] - [goEditing];

  CarregarGrid;
end;

procedure TfrmVendas.FormDestroy(Sender: TObject);
begin
  FService.Free;
  FVendas.Free;
end;

procedure TfrmVendas.CarregarGrid;
var
  I: Integer;
begin
  FVendas.Free;
  FVendas := FService.ListarTodos;
  sgVendas.RowCount := FVendas.Count + 1;
  for I := 0 to FVendas.Count - 1 do
  begin
    sgVendas.Cells[0, I+1] := IntToStr(FVendas[I].Id);
    sgVendas.Cells[1, I+1] := FormatDateTime('dd/mm/yyyy hh:nn', FVendas[I].Data);
    sgVendas.Cells[2, I+1] := FVendas[I].Cliente;
    sgVendas.Cells[3, I+1] := CurrToStr(FVendas[I].Total);
  end;
end;

function TfrmVendas.GetIdSelecionado: Integer;
begin
  Result := 0;
  if sgVendas.Row > 0 then
    Result := StrToIntDef(sgVendas.Cells[0, sgVendas.Row], 0);
end;

procedure TfrmVendas.btnNovaClick(Sender: TObject);
var
  Frm: TfrmVendaForm;
begin
  Frm := TfrmVendaForm.Create(Self);
  try
    if Frm.ShowModal = mrOk then
      CarregarGrid;
  finally
    Frm.Free;
  end;
end;

procedure TfrmVendas.btnVisualizarClick(Sender: TObject);
var
  Frm: TfrmVendaForm;
  Id: Integer;
begin
  Id := GetIdSelecionado;
  if Id = 0 then
  begin
    ShowMessage('Selecione uma venda para visualizar.');
    Exit;
  end;
  Frm := TfrmVendaForm.Create(Self);
  try
    Frm.CarregarVenda(Id);
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

procedure TfrmVendas.btnExcluirClick(Sender: TObject);
var
  Id: Integer;
begin
  Id := GetIdSelecionado;
  if Id = 0 then
  begin
    ShowMessage('Selecione uma venda para excluir.');
    Exit;
  end;
  if MessageDlg('Confirma exclusão da venda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FService.Excluir(Id);
      CarregarGrid;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir: ' + E.Message);
    end;
  end;
end;

procedure TfrmVendas.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
