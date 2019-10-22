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
  object lbl1: TLabel
    Left = 32
    Top = 8
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
  object lblID: TLabel
    Left = 61
    Top = 8
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
  object lbl2: TLabel
    Left = 61
    Top = 89
    Width = 29
    Height = 13
    Caption = 'CNPJ:'
  end
  object lbl3: TLabel
    Left = 67
    Top = 248
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lbl4: TLabel
    Left = 44
    Top = 302
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
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
  object edtLogradouro: TLabeledEdit
    Left = 96
    Top = 113
    Width = 201
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Logradouro:'
    LabelPosition = lpLeft
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
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
    TabOrder = 5
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
    TabOrder = 6
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
    TabOrder = 7
  end
  object btnGravar: TButton
    Left = 96
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 222
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object mskCnpj: TMaskEdit
    Left = 96
    Top = 86
    Width = 200
    Height = 21
    EditMask = '00.000.000/0000-00;0'
    MaxLength = 18
    TabOrder = 10
    Text = ''
  end
  object mskCep: TMaskEdit
    Left = 96
    Top = 245
    Width = 120
    Height = 21
    EditMask = '00000-000;0;_'
    MaxLength = 9
    TabOrder = 11
    Text = ''
  end
  object mskTelefone: TMaskEdit
    Left = 96
    Top = 299
    Width = 135
    Height = 21
    EditMask = '!\(99\)0000-0000;1;_'
    MaxLength = 13
    TabOrder = 12
    Text = '(  )    -    '
    OnKeyPress = mskTelefoneKeyPress
  end
end
