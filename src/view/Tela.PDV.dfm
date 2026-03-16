object frmPDV: TfrmPDV
  Left = 0
  Top = 0
  Caption = 'PDV - Ponto de Venda'
  ClientHeight = 560
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object pnlEsquerda: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 510
    Align = alLeft
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -6
    ExplicitTop = -6
    object lblCliente: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 21
      Caption = 'Cliente:'
    end
    object lblCEP: TLabel
      Left = 8
      Top = 75
      Width = 30
      Height = 21
      Caption = 'CEP:'
    end
    object lblEndereco: TLabel
      Left = 8
      Top = 145
      Width = 67
      Height = 21
      Caption = 'Endere'#231'o:'
    end
    object lblProduto: TLabel
      Left = 8
      Top = 214
      Width = 59
      Height = 21
      Caption = 'Produto:'
    end
    object lblQtd: TLabel
      Left = 199
      Top = 214
      Width = 84
      Height = 21
      Caption = 'Quantidade:'
    end
    object edtCliente: TEdit
      Left = 8
      Top = 35
      Width = 280
      Height = 29
      TabOrder = 0
    end
    object edtCEP: TEdit
      Left = 8
      Top = 102
      Width = 120
      Height = 29
      TabOrder = 1
    end
    object btnBuscarCEP: TButton
      Left = 134
      Top = 102
      Width = 90
      Height = 29
      Caption = 'Buscar CEP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnBuscarCEPClick
    end
    object edtEndereco: TEdit
      Left = 8
      Top = 172
      Width = 280
      Height = 29
      ReadOnly = True
      TabOrder = 3
    end
    object cbProduto: TComboBox
      Left = 8
      Top = 241
      Width = 185
      Height = 29
      Style = csDropDownList
      TabOrder = 4
    end
    object edtQtd: TEdit
      Left = 199
      Top = 241
      Width = 89
      Height = 29
      TabOrder = 5
      Text = '1'
    end
    object btnAdicionar: TButton
      Left = 8
      Top = 296
      Width = 280
      Height = 41
      Caption = 'Adicionar ao Carrinho'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnAdicionarClick
    end
  end
  object pnlDireita: TPanel
    Left = 305
    Top = 0
    Width = 555
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object sgCarrinho: TStringGrid
      Left = 0
      Top = 0
      Width = 555
      Height = 489
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 510
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 510
    Width = 860
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lblTotal: TLabel
      Left = 8
      Top = 14
      Width = 42
      Height = 21
      Caption = 'Total:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalValor: TLabel
      Left = 60
      Top = 14
      Width = 54
      Height = 21
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnFinalizar: TButton
      Left = 552
      Top = 6
      Width = 138
      Height = 34
      Caption = 'Finalizar Venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnFinalizarClick
    end
    object btnLimpar: TButton
      Left = 696
      Top = 6
      Width = 75
      Height = 34
      Caption = 'Limpar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLimparClick
    end
    object btnSair: TButton
      Left = 777
      Top = 6
      Width = 75
      Height = 34
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
end
