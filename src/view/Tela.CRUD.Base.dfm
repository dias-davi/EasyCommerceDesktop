object frmCRUD: TfrmCRUD
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CRUD'
  ClientHeight = 595
  ClientWidth = 977
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 595
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 353
    ExplicitHeight = 225
    object pnlGrid: TPanel
      Left = 1
      Top = 82
      Width = 975
      Height = 512
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 81
      ExplicitWidth = 622
      ExplicitHeight = 224
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 973
        Height = 510
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = -9
        ExplicitWidth = 320
        ExplicitHeight = 120
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 975
      Height = 81
      Align = alTop
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 0
      ExplicitWidth = 622
      DesignSize = (
        975
        81)
      object btnNovo: TButton
        Left = 20
        Top = 19
        Width = 69
        Height = 46
        Caption = 'Novo'
        TabOrder = 1
        StyleName = 'Windows'
        OnClick = btnNovoClick
      end
      object btnEditar: TButton
        Left = 105
        Top = 18
        Width = 64
        Height = 47
        Caption = 'Editar'
        TabOrder = 0
        StyleName = 'Windows'
        OnClick = btnEditarClick
      end
      object btnExcluir: TButton
        Left = 185
        Top = 19
        Width = 72
        Height = 46
        Caption = 'Excluir'
        TabOrder = 2
        StyleName = 'Windows'
        OnClick = btnExcluirClick
      end
      object btnSair: TButton
        Left = 881
        Top = 19
        Width = 72
        Height = 46
        Anchors = [akTop, akRight]
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        StyleName = 'Windows'
        OnClick = btnSairClick
        ExplicitLeft = 897
      end
    end
  end
end
