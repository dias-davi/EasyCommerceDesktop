unit Tela.PDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Model.Venda, Model.Produto,
  Service.Venda, Service.Produto, System.Generics.Collections,
  System.Net.HttpClient, System.JSON;

type
  TfrmPDV = class(TForm)
    pnlEsquerda: TPanel;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lblCEP: TLabel;
    edtCEP: TEdit;
    btnBuscarCEP: TButton;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    lblProduto: TLabel;
    cbProduto: TComboBox;
    lblQtd: TLabel;
    edtQtd: TEdit;
    btnAdicionar: TButton;
    pnlDireita: TPanel;
    sgCarrinho: TStringGrid;
    pnlRodape: TPanel;
    lblTotal: TLabel;
    lblTotalValor: TLabel;
    btnFinalizar: TButton;
    btnLimpar: TButton;
    btnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnBuscarCEPClick(Sender: TObject);

  private
    FVendaService: TVendaService;
    FProdutoService: TProdutoService;
    FVenda: TVenda;
    FProdutos: TObjectList<TProduto>;
    procedure CarregarProdutos;
    procedure AtualizarCarrinho;
    procedure NovaVenda;

  public

  end;

var
  frmPDV: TfrmPDV;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TfrmPDV.FormCreate(Sender: TObject);
begin
  FVendaService   := TVendaService.Create;
  FProdutoService := TProdutoService.Create;
  FProdutos       := nil;

  sgCarrinho.ColCount  := 4;
  sgCarrinho.FixedRows := 1;
  sgCarrinho.Cells[0,0] := 'Produto';
  sgCarrinho.Cells[1,0] := 'Quantidade';
  sgCarrinho.Cells[2,0] := 'Preço';
  sgCarrinho.Cells[3,0] := 'Subtotal';
  sgCarrinho.ColWidths[0] := Trunc(pnlDireita.Width * 0.45);
  sgCarrinho.ColWidths[1] := Trunc(pnlDireita.Width * 0.2);
  sgCarrinho.ColWidths[2] := Trunc(pnlDireita.Width * 0.15);
  sgCarrinho.ColWidths[3] := Trunc(pnlDireita.Width * 0.2);
  sgCarrinho.Options := sgCarrinho.Options + [goRowSelect] - [goEditing];

  CarregarProdutos;
  NovaVenda;
end;

procedure TfrmPDV.FormDestroy(Sender: TObject);
begin
  FVendaService.Free;
  FProdutoService.Free;
  FProdutos.Free;
  FVenda.Free;
end;

procedure TfrmPDV.NovaVenda;
begin
  FVenda.Free;
  FVenda := TVenda.Create;
  edtCliente.Text  := '';
  edtCEP.Text      := '';
  edtEndereco.Text := '';
  edtQtd.Text      := '1';
  AtualizarCarrinho;
end;

procedure TfrmPDV.CarregarProdutos;
var
  lProduto: TProduto;
begin
  FProdutos.Free;
  FProdutos := FProdutoService.ListarTodos;
  cbProduto.Items.Clear;
  for lProduto in FProdutos do
    cbProduto.Items.AddObject(lProduto.Nome + ' - R$ ' + CurrToStr(lProduto.Preco), lProduto);
  if cbProduto.Items.Count > 0 then
    cbProduto.ItemIndex := 0;
end;

procedure TfrmPDV.AtualizarCarrinho;
var
  I: Integer;
  lItem: TItemVenda;
begin
  sgCarrinho.RowCount := FVenda.Itens.Count + 1;
  for I := 0 to FVenda.Itens.Count - 1 do
  begin
    lItem := FVenda.Itens[I];
    sgCarrinho.Cells[0, I+1] := lItem.ProdutoNome;
    sgCarrinho.Cells[1, I+1] := IntToStr(lItem.Quantidade);
    sgCarrinho.Cells[2, I+1] := CurrToStr(lItem.PrecoUnitario);
    sgCarrinho.Cells[3, I+1] := CurrToStr(lItem.Subtotal);
  end;
  lblTotalValor.Caption := 'R$ ' + CurrToStr(FVenda.Total);
end;

procedure TfrmPDV.btnBuscarCEPClick(Sender: TObject);
var
  lHttp: THTTPClient;
  lResponse: IHTTPResponse;
  lJSON: TJSONObject;
  lCEP: string;
begin
  lCEP := StringReplace(edtCEP.Text, '-', '', [rfReplaceAll]);
  lCEP := Trim(lCEP);
  if Length(lCEP) <> 8 then
  begin
    ShowMessage('CEP inválido. Informe 8 dígitos.');
    Exit;
  end;
  lHttp := THTTPClient.Create;
  try
    try
      lResponse := lHttp.Get('https://viacep.com.br/ws/' + lCEP + '/json/');
      if lResponse.StatusCode = 200 then
      begin
        lJSON := TJSONObject.ParseJSONValue(lResponse.ContentAsString) as TJSONObject;
        try
          if lJSON.GetValue('erro') <> nil then
            ShowMessage('CEP não encontrado.')
          else
            edtEndereco.Text :=
              lJSON.GetValue('logradouro').Value + ', ' +
              lJSON.GetValue('bairro').Value + ' - ' +
              lJSON.GetValue('localidade').Value + '/' +
              lJSON.GetValue('uf').Value;
        finally
          lJSON.Free;
        end;
      end
      else
        ShowMessage('Erro ao consultar CEP: ' + IntToStr(lResponse.StatusCode));
    except
      on E: Exception do
        ShowMessage('Falha na consulta do CEP: ' + E.Message);
    end;
  finally
    lHttp.Free;
  end;
end;

procedure TfrmPDV.btnAdicionarClick(Sender: TObject);
var
  lItem: TItemVenda;
  lProduto: TProduto;
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

  lProduto := TProduto(cbProduto.Items.Objects[cbProduto.ItemIndex]);
  lItem := TItemVenda.Create;
  lItem.ProdutoId     := lProduto.Id;
  lItem.ProdutoNome   := lProduto.Nome;
  lItem.Quantidade    := Qtd;
  lItem.PrecoUnitario := lProduto.Preco;
  FVenda.AdicionarItem(lItem);
  AtualizarCarrinho;
end;

procedure TfrmPDV.btnFinalizarClick(Sender: TObject);
begin
  try
    FVenda.Cliente := edtCliente.Text;
    FVendaService.Finalizar(FVenda);
    ShowMessage('Venda finalizada! Total: R$ ' + FVenda.Total.ToString);
    NovaVenda;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmPDV.btnLimparClick(Sender: TObject);
begin
  if MessageDlg('Limpar carrinho atual?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    NovaVenda;
end;

procedure TfrmPDV.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
