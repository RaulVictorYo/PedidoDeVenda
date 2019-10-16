unit DAO.Base;

interface

type

TBaseDAO = class
  function GetNewID: Integer;
end;

implementation

uses
  FireDAC.Comp.Client, System.SysUtils, Dtm.Main;

{ TBaseDAO }

function TBaseDAO.GetNewID: Integer;
var
  FDQuery: TFDQuery;
  SB: TStringBuilder;
begin
  try
    SB := TStringBuilder.Create;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := DtmMain.FDConnectionMain;
    SB.Append('SELECT GEN_ID(GEN_PRODUTO_ID, 1) FROM RDB$DATABASE; ');
    FDQuery.Close;
    FDQuery.SQL.Text := SB.ToString;
    FDQuery.Open();
    Result := FDQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(FDQuery);
    FreeAndNil(SB);
  end;
end;

end.
