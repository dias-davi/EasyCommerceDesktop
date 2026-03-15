object frmInicio: TfrmInicio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inicio'
  ClientHeight = 279
  ClientWidth = 570
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlMid: TPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 279
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 136
    ExplicitWidth = 409
    ExplicitHeight = 265
    object btnPDV: TButton
      Left = 20
      Top = 27
      Width = 159
      Height = 134
      Caption = 'PDV'
      TabOrder = 2
      StyleName = 'Windows'
    end
    object btnProdutos: TButton
      Left = 201
      Top = 26
      Width = 159
      Height = 136
      Caption = 'Produtos'
      TabOrder = 0
      StyleName = 'Windows'
      OnClick = btnProdutosClick
    end
    object btnVendas: TButton
      Left = 385
      Top = 26
      Width = 159
      Height = 136
      Caption = 'Vendas'
      TabOrder = 1
      StyleName = 'Windows'
    end
    object btnTeste: TButton
      Left = 469
      Top = 192
      Width = 75
      Height = 53
      Caption = 'Teste'
      TabOrder = 3
      StyleName = 'Windows'
      OnClick = btnTesteClick
    end
  end
end
