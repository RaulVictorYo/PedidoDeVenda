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
  object EdtId: TLabeledEdit
    Left = 120
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 15
    EditLabel.Height = 13
    EditLabel.Caption = 'ID:'
    ReadOnly = True
    TabOrder = 1
  end
  object EdtCusto: TLabeledEdit
    Left = 120
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Custo:'
    TabOrder = 2
  end
  object EdtValorVenda: TLabeledEdit
    Left = 120
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor de Venda:'
    TabOrder = 3
  end
  object btnGravar: TButton
    Left = 88
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 209
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
  end
end
