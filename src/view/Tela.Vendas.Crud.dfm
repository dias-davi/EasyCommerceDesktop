object frmVendas: TfrmVendas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Vendas'
  ClientHeight = 480
  ClientWidth = 640
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
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 89
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnNova: TButton
      Left = 10
      Top = 25
      Width = 111
      Height = 41
      Caption = 'Nova Venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovaClick
    end
    object btnVisualizar: TButton
      Left = 137
      Top = 25
      Width = 112
      Height = 41
      Caption = 'Visualizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnVisualizarClick
    end
    object btnExcluir: TButton
      Left = 264
      Top = 25
      Width = 113
      Height = 41
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      Left = 536
      Top = 25
      Width = 93
      Height = 41
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object sgVendas: TStringGrid
    Left = 0
    Top = 89
    Width = 640
    Height = 391
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 41
    ExplicitHeight = 439
  end
end
