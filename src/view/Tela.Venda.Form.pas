unit Tela.Venda.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Model.Venda, Model.Produto,
  Service.Venda, Service.Produto, System.Generics.Collections;

type
  TfrmVendaForm = class(TForm)
    pnlCliente: TPanel;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lblData: TLabel;
    edtData: TEdit;
    pnlProduto: TPanel;
    lblProduto: TLabel;
    cbProduto: TComboBox;
    lblQtd: TLabel;
    edtQtd: TEdit;
    btnAddItem: TButton;
    btnRemItem: TButton;
    sgItens: TStringGrid;
    pnlTotal: TPanel;
    lblTotal: TLabel;
    lblTotalValor: TLabel;
    pnlBotoes: TPanel;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure btnRemItemClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FVendaService: TVendaService;
    FProdutoService: TProdutoService;
    FVenda: TVenda;
    FProdutos: TObjectList<TProduto>;
    FSomenteLeitura: Boolean;
    procedure CarregarProdutosCombo;
    procedure AtualizarGridItens;
    procedure AtualizarTotal;
  public
    procedure CarregarVenda(Id: Integer);
  end;

implementation

{$R *.dfm}

procedure TfrmVendaForm.FormCreate(Sender: TObject);
begin
  FVendaService   := TVendaService.Create;
  FProdutoService := TProdutoService.Create;
  FVenda          := TVenda.Create;
  FProdutos       := nil;
  FSomenteLeitura := False;

  edtData.Text := FormatDateTime('dd/mm/yyyy', Now);
  edtQtd.Text  := '1';

  sgItens.ColCount  := 5;
  sgItens.FixedRows := 1;
  sgItens.Cells[0,0] := 'ID Prod.';
  sgItens.Cells[1,0] := 'Produto';
  sgItens.Cells[2,0] := 'Qtd';
  sgItens.Cells[3,0] := 'Preço Unit.';
  sgItens.Cells[4,0] := 'Subtotal';
  sgItens.ColWidths[0] := Trunc(sgItens.Width * 0.1);
  sgItens.ColWidths[1] := Trunc(sgItens.Width * 0.2);
  sgItens.ColWidths[2] := Trunc(sgItens.Width * 0.40);
  sgItens.ColWidths[3] := Trunc(sgItens.Width * 0.15);
  sgItens.ColWidths[4] := Trunc(sgItens.Width * 0.15);
  sgItens.Options := sgItens.Options + [goRowSelect] - [goEditing];

  CarregarProdutosCombo;
end;

procedure TfrmVendaForm.FormDestroy(Sender: TObject);
begin
  FVendaService.Free;
  FProdutoService.Free;
  FVenda.Free;
  FProdutos.Free;
end;

procedure TfrmVendaForm.CarregarProdutosCombo;
var
  P: TProduto;
begin
  FProdutos.Free;
  FProdutos := FProdutoService.ListarTodos;
  cbProduto.Items.Clear;
  for P in FProdutos do
    cbProduto.Items.AddObject(P.Nome + ' (R$ ' + CurrToStr(P.Preco) + ')', P);
  if cbProduto.Items.Count > 0 then
    cbProduto.ItemIndex := 0;
end;

procedure TfrmVendaForm.AtualizarGridItens;
var
  I: Integer;
  Item: TItemVenda;
begin
  sgItens.RowCount := FVenda.Itens.Count + 1;
  for I := 0 to FVenda.Itens.Count - 1 do
  begin
    Item := FVenda.Itens[I];
    sgItens.Cells[0, I+1] := IntToStr(Item.ProdutoId);
    sgItens.Cells[1, I+1] := Item.ProdutoNome;
    sgItens.Cells[2, I+1] := IntToStr(Item.Quantidade);
    sgItens.Cells[3, I+1] := CurrToStr(Item.PrecoUnitario);
    sgItens.Cells[4, I+1] := CurrToStr(Item.Subtotal);
  end;
  AtualizarTotal;
end;

procedure TfrmVendaForm.AtualizarTotal;
begin
  lblTotalValor.Caption := 'R$ ' + CurrToStr(FVenda.Total);
end;

procedure TfrmVendaForm.CarregarVenda(Id: Integer);
var
  V: TVenda;
begin
  V := FVendaService.BuscarComItens(Id);
  if not Assigned(V) then Exit;
  FVenda.Free;
  FVenda := V;
  FSomenteLeitura := True;

  edtCliente.Text     := FVenda.Cliente;
  edtData.Text        := FormatDateTime('dd/mm/yyyy hh:nn', FVenda.Data);
  edtCliente.ReadOnly := True;
  edtData.ReadOnly    := True;
  cbProduto.Enabled   := False;
  edtQtd.Enabled      := False;
  btnAddItem.Enabled  := False;
  btnRemItem.Enabled  := False;
  btnFinalizar.Enabled := False;

  AtualizarGridItens;
end;

procedure TfrmVendaForm.btnAddItemClick(Sender: TObject);
var
  Item: TItemVenda;
  Prod: TProduto;
  Qtd: Integer;
begin
  if cbProduto.ItemIndex < 0 then
  begin
    ShowMessage('Selecione um produto.');
    Exit;
  end;
  Qtd := StrToIntDef(edtQtd.Text, 0);
  if Qtd <= 0 then
  begin
    ShowMessage('Informe uma quantidade válida.');
    Exit;
  end;
  Prod := TProduto(cbProduto.Items.Objects[cbProduto.ItemIndex]);
  Item := TItemVenda.Create;
  Item.ProdutoId     := Prod.Id;
  Item.ProdutoNome   := Prod.Nome;
  Item.Quantidade    := Qtd;
  Item.PrecoUnitario := Prod.Preco;
  FVenda.AdicionarItem(Item);
  AtualizarGridItens;
end;

procedure TfrmVendaForm.btnRemItemClick(Sender: TObject);
var
  Row: Integer;
begin
  Row := sgItens.Row - 1;
  if (Row >= 0) and (Row < FVenda.Itens.Count) then
  begin
    FVenda.RemoverItem(Row);
    AtualizarGridItens;
  end;
end;

procedure TfrmVendaForm.btnFinalizarClick(Sender: TObject);
begin
  try
    FVenda.Cliente := edtCliente.Text;
    FVenda.Data    := Now;
    FVendaService.Finalizar(FVenda);
    ShowMessage('Venda finalizada com sucesso!');
    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmVendaForm.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
