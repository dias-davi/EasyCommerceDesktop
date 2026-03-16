unit Tela.Produtos.Crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Model.Produto, Service.Produto, System.Generics.Collections;

type
  TfrmProdutos = class(TForm)
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    sgProdutos: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);

  private
    FService: TProdutoService;
    FProdutos: TObjectList<TProduto>;
    procedure CarregarGrid;
    function GetIdSelecionado: Integer;

  public
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses
  Tela.Produto.Form, System.UITypes;

{$R *.dfm}

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  FService := TProdutoService.Create;
  FProdutos := nil;

  sgProdutos.ColCount := 5;
  sgProdutos.FixedRows := 1;
  sgProdutos.Cells[0,0] := 'ID';
  sgProdutos.Cells[1,0] := 'Nome';
  sgProdutos.Cells[2,0] := 'Descrição';
  sgProdutos.Cells[3,0] := 'Preço';
  sgProdutos.Cells[4,0] := 'Estoque';
  sgProdutos.ColWidths[0] := Trunc(sgProdutos.Width * 0.10);
  sgProdutos.ColWidths[1] := Trunc(sgProdutos.Width * 0.2);
  sgProdutos.ColWidths[2] := Trunc(sgProdutos.Width * 0.40);
  sgProdutos.ColWidths[3] := Trunc(sgProdutos.Width * 0.15);
  sgProdutos.ColWidths[4] := Trunc(sgProdutos.Width * 0.15);

  sgProdutos.Options := sgProdutos.Options + [goRowSelect] - [goEditing];

  CarregarGrid;
end;

procedure TfrmProdutos.FormDestroy(Sender: TObject);
begin
  FService.Free;
  FProdutos.Free;
end;

procedure TfrmProdutos.CarregarGrid;
var
  I: Integer;
begin
  FProdutos.Free;
  FProdutos := FService.ListarTodos;
  sgProdutos.RowCount := FProdutos.Count + 1;
  for I := 0 to FProdutos.Count - 1 do
  begin
    sgProdutos.Cells[0, I+1] := IntToStr(FProdutos[I].Id);
    sgProdutos.Cells[1, I+1] := FProdutos[I].Nome;
    sgProdutos.Cells[2, I+1] := FProdutos[I].Descricao;
    sgProdutos.Cells[3, I+1] := CurrToStr(FProdutos[I].Preco);
    sgProdutos.Cells[4, I+1] := IntToStr(FProdutos[I].Estoque);
  end;
end;

function TfrmProdutos.GetIdSelecionado: Integer;
begin
  Result := 0;
  if sgProdutos.Row > 0 then
    Result := StrToIntDef(sgProdutos.Cells[0, sgProdutos.Row], 0);
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
var
  Frm: TfrmProdutoForm;
begin
  Frm := TfrmProdutoForm.Create(Self);
  try
    if Frm.ShowModal = mrOk then
      CarregarGrid;
  finally
    Frm.Free;
  end;
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
var
  lForm: TfrmProdutoForm;
  lId: Integer;
begin
  lId := GetIdSelecionado;
  if lId = 0 then
  begin
    ShowMessage('Selecione um produto para editar.');
    Exit;
  end;
  lForm := TfrmProdutoForm.Create(Self);
  try
    lForm.CarregarProduto(lId);
    if lForm.ShowModal = mrOk then
      CarregarGrid;
  finally
    lForm.Free;
  end;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
var
  lId: Integer;
begin
  lId := GetIdSelecionado;
  if lId = 0 then
  begin
    ShowMessage('Selecione um produto para excluir.');
    Exit;
  end;
  if MessageDlg('Confirma exclusão do produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FService.Excluir(lId);
      CarregarGrid;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir: ' + E.Message);
    end;
  end;
end;

procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
