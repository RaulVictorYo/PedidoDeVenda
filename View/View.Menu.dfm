object MenuView: TMenuView
  Left = 0
  Top = 0
  Caption = 'MenuView'
  ClientHeight = 317
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 73
    Align = alTop
    TabOrder = 0
    object btnPedidoDeVenda: TButton
      Left = 151
      Top = 1
      Width = 106
      Height = 71
      Align = alLeft
      Caption = 'Pedido de Venda'
      TabOrder = 0
    end
    object btnProduto: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 71
      Align = alLeft
      Caption = 'Produto'
      TabOrder = 1
      ExplicitLeft = 168
      ExplicitTop = 40
      ExplicitHeight = 25
    end
    object btnCliente: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 71
      Align = alLeft
      Caption = 'Cliente'
      TabOrder = 2
      OnClick = btnClienteClick
      ExplicitLeft = -5
    end
  end
end
