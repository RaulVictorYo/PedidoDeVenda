object DtmMain: TDtmMain
  OldCreateOrder = False
  Height = 307
  Width = 515
  object FDConnectionMain: TFDConnection
    Params.Strings = (
      'ConnectionDef=FDConnection')
    Left = 40
    Top = 24
  end
  object FDQueryProduto: TFDQuery
    Connection = FDConnectionMain
    Left = 152
    Top = 88
  end
end
