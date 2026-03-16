object frmInicio: TfrmInicio
  Left = 0
  Top = 0
  Caption = 'EasyCommerce - PDV'
  ClientHeight = 296
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 25
  object pnlMid: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 296
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 689
    ExplicitHeight = 587
    object btnPDV: TButton
      Left = 32
      Top = 30
      Width = 113
      Height = 107
      Caption = 'Realizar Venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = btnPDVClick
    end
    object btnProdutos: TButton
      Left = 32
      Top = 158
      Width = 113
      Height = 107
      Caption = 'Meus Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btnProdutosClick
    end
    object btnVendas: TButton
      Left = 168
      Top = 30
      Width = 113
      Height = 107
      Caption = 'Consultar Vendas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnVendasClick
    end
    object btnSair: TButton
      Left = 168
      Top = 158
      Width = 113
      Height = 107
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      WordWrap = True
      OnClick = btnSairClick
    end
  end
end
