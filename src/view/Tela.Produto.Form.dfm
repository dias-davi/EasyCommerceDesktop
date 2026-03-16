object frmProdutoForm: TfrmProdutoForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Produto'
  ClientHeight = 313
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 217
    object lblNome: TLabel
      Left = 12
      Top = 12
      Width = 46
      Height = 21
      Caption = 'Nome:'
    end
    object lblDescricao: TLabel
      Left = 12
      Top = 72
      Width = 70
      Height = 21
      Caption = 'Descri'#231#227'o:'
    end
    object lblPreco: TLabel
      Left = 12
      Top = 131
      Width = 42
      Height = 21
      Caption = 'Pre'#231'o:'
    end
    object lblEstoque: TLabel
      Left = 213
      Top = 131
      Width = 58
      Height = 21
      Caption = 'Estoque:'
    end
    object edtNome: TEdit
      Left = 12
      Top = 37
      Width = 336
      Height = 29
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 12
      Top = 96
      Width = 336
      Height = 29
      TabOrder = 1
    end
    object edtPreco: TEdit
      Left = 12
      Top = 158
      Width = 120
      Height = 29
      TabOrder = 2
      Text = '0,00'
      OnExit = edtPrecoExit
    end
    object edtEstoque: TEdit
      Left = 213
      Top = 158
      Width = 80
      Height = 29
      TabOrder = 3
      Text = '0'
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 248
    Width = 360
    Height = 65
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnSalvar: TButton
      Left = 196
      Top = 6
      Width = 75
      Height = 43
      Cancel = True
      Caption = 'Salvar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 277
      Top = 8
      Width = 75
      Height = 41
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
