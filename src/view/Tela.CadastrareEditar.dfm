object frmCadastroEEdicao: TfrmCadastroEEdicao
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 363
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 363
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -328
    ExplicitTop = -193
    ExplicitWidth = 952
    ExplicitHeight = 634
    object pnlGrid: TPanel
      Left = 1
      Top = 1
      Width = 547
      Height = 280
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 82
      ExplicitWidth = 950
      ExplicitHeight = 551
    end
    object pnlTop: TPanel
      Left = 1
      Top = 281
      Width = 547
      Height = 81
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 1
      ExplicitWidth = 950
      DesignSize = (
        547
        81)
      object btnCancelar: TButton
        Left = 460
        Top = 19
        Width = 72
        Height = 46
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        TabOrder = 1
        StyleName = 'Windows'
      end
      object btnSalvar: TButton
        Left = 364
        Top = 19
        Width = 72
        Height = 46
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        TabOrder = 0
        StyleName = 'Windows'
      end
    end
  end
end
