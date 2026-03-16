object frmVendaForm: TfrmVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Nova Venda'
  ClientHeight = 611
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlCliente: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 684
    object lblCliente: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 21
      Caption = 'Cliente:'
    end
    object lblData: TLabel
      Left = 334
      Top = 8
      Width = 35
      Height = 21
      Caption = 'Data:'
    end
    object edtCliente: TEdit
      Left = 8
      Top = 35
      Width = 320
      Height = 29
      TabOrder = 0
    end
    object edtData: TEdit
      Left = 334
      Top = 35
      Width = 120
      Height = 29
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlProduto: TPanel
    Left = 0
    Top = 73
    Width = 701
    Height = 85
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 54
    ExplicitWidth = 684
    object lblProduto: TLabel
      Left = 8
      Top = 4
      Width = 59
      Height = 21
      Caption = 'Produto:'
    end
    object lblQtd: TLabel
      Left = 380
      Top = 4
      Width = 84
      Height = 21
      Caption = 'Quantidade:'
    end
    object cbProduto: TComboBox
      Left = 14
      Top = 31
      Width = 360
      Height = 29
      Style = csDropDownList
      TabOrder = 0
    end
    object edtQtd: TEdit
      Left = 380
      Top = 31
      Width = 74
      Height = 34
      TabOrder = 1
      Text = '1'
    end
    object btnAddItem: TButton
      Left = 464
      Top = 31
      Width = 105
      Height = 34
      Caption = '+ Adicionar'
      TabOrder = 2
      OnClick = btnAddItemClick
    end
    object btnRemItem: TButton
      Left = 575
      Top = 32
      Width = 105
      Height = 33
      Caption = '- Remover'
      TabOrder = 3
      OnClick = btnRemItemClick
    end
  end
  object sgItens: TStringGrid
    Left = 0
    Top = 158
    Width = 701
    Height = 320
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 164
  end
  object pnlTotal: TPanel
    Left = 0
    Top = 478
    Width = 701
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 684
    object lblTotal: TLabel
      Left = 8
      Top = 12
      Width = 35
      Height = 21
      Caption = 'Total:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTotalValor: TLabel
      Left = 60
      Top = 12
      Width = 53
      Height = 21
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 533
    Width = 701
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    ExplicitTop = 560
    object btnFinalizar: TButton
      Left = 479
      Top = 20
      Width = 90
      Height = 37
      Caption = 'Finalizar'
      Default = True
      TabOrder = 0
      OnClick = btnFinalizarClick
    end
    object btnCancelar: TButton
      Left = 590
      Top = 20
      Width = 90
      Height = 37
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
