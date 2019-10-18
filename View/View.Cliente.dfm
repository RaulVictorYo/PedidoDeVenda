object ClienteView: TClienteView
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 387
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtRazaoSocial: TLabeledEdit
    Left = 96
    Top = 32
    Width = 313
    Height = 21
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Raz'#227'o Social: '
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edtNomeFantasia: TLabeledEdit
    Left = 96
    Top = 59
    Width = 313
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Fantasia:'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object edtCNPJ: TLabeledEdit
    Left = 96
    Top = 86
    Width = 121
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ:'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object edtLogradouro: TLabeledEdit
    Left = 96
    Top = 113
    Width = 201
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Logradouro:'
    LabelPosition = lpLeft
    TabOrder = 3
  end
  object edtNumero: TLabeledEdit
    Left = 96
    Top = 137
    Width = 57
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'Numero:'
    LabelPosition = lpLeft
    TabOrder = 4
  end
  object edtBairro: TLabeledEdit
    Left = 96
    Top = 164
    Width = 201
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro:'
    LabelPosition = lpLeft
    TabOrder = 5
  end
  object edtCidade: TLabeledEdit
    Left = 96
    Top = 191
    Width = 201
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade:'
    LabelPosition = lpLeft
    TabOrder = 6
  end
  object edtUF: TLabeledEdit
    Left = 96
    Top = 218
    Width = 33
    Height = 21
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'UF:'
    LabelPosition = lpLeft
    TabOrder = 7
  end
  object edtCEP: TLabeledEdit
    Left = 96
    Top = 245
    Width = 81
    Height = 21
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'CEP:'
    LabelPosition = lpLeft
    TabOrder = 8
  end
  object edtEmail: TLabeledEdit
    Left = 96
    Top = 272
    Width = 201
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Email:'
    LabelPosition = lpLeft
    TabOrder = 9
  end
  object edtTelefone: TLabeledEdit
    Left = 96
    Top = 299
    Width = 201
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Telefone:'
    LabelPosition = lpLeft
    TabOrder = 10
  end
  object btnGravar: TButton
    Left = 96
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 11
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 222
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 12
    OnClick = btnCancelarClick
  end
end
