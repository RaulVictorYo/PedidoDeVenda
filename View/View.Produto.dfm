object ProdutoView: TProdutoView
  Left = 0
  Top = 0
  Caption = 'ProdutoView'
  ClientHeight = 325
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 61
    Top = 24
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbl1: TLabel
    Left = 32
    Top = 24
    Width = 23
    Height = 18
    Caption = 'ID:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object EdtDescricao: TLabeledEdit
    Left = 120
    Top = 88
    Width = 121
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o:'
    TabOrder = 0
  end
  object EdtCusto: TLabeledEdit
    Left = 120
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Custo:'
    TabOrder = 1
  end
  object EdtValorVenda: TLabeledEdit
    Left = 120
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor de Venda:'
    TabOrder = 2
  end
  object btnGravar: TButton
    Left = 88
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 209
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
  end
end
