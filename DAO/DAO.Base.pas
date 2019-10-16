unit DAO.Base;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Dtm.Main, Singleton.Connection,
  Model.Base;

type

TBaseDAO = class
  public
  function GetNewID: Integer;
  procedure SetParameters(var FDQuery: TFDQuery; const AModel: TBaseModel); virtual; abstract;
  function Insert(AModel: TBaseModel): Integer; virtual;
  function InsertText : string; virtual; abstract;
end;

implementation



{ TBaseDAO }

function TBaseDAO.GetNewID: Integer;
var
  FDQuery: TFDQuery;
  SB: TStringBuilder;
begin
  try
    SB := TStringBuilder.Create;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := TConnectionSingleton.GetInstance.Connection;
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

function TBaseDAO.Insert(AModel: TBaseModel): Integer;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := TConnectionSingleton.GetInstance.Connection;
    FDQuery.Close;
    FDQuery.SQL.Text := InsertText;
    SetParameters(FDQuery, AModel);
    FDQuery.Open;
    Result := FDQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(FDQuery);
  end;

end;


end.
