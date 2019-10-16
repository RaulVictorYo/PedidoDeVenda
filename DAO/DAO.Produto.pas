unit DAO.Produto;

interface

uses
  DAO.Base, Model.Produto, FireDAC.Comp.Client;

type

  TProdutoDAO = class(TBaseDAO)

  procedure SetParameters(var FDQuery: TFDQuery; const AModel: TProdutoModel);
  function Save(AModel: TProdutoModel): Integer;

  end;

implementation

uses
  System.SysUtils, Dtm.Main;

{ TProdutoDAO }

function TProdutoDAO.Save(AModel: TProdutoModel): Integer;
var
  FDQuery: TFDQuery;
  SB: TStringBuilder;
begin
  FDQuery := TFDQuery.Create(nil);
  SB := TStringBuilder.Create;
  try
    FDQuery.Connection := DtmMain.FDConnectionMain;
    SB.Append('UPDATE OR INSERT INTO PRODUTO (');
    SB.Append('ID, DESCRICAO, CUSTO, VALORVENDA)');
    SB.Append('VALUES (');
    SB.Append(':ID, :DESCRICAO, :CUSTO, :VALORVENDA)');
    FDQuery.Close;
    FDQuery.SQL.Text := SB.ToString;
    SetParameters(FDQuery, AModel);
    FDQuery.ExecSQL;
    Result := FDQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(FDQuery);
  end;
end;

procedure TProdutoDAO.SetParameters(var FDQuery: TFDQuery;
  const AModel: TProdutoModel);
begin

with FDQuery, TProdutoModel(AModel) do
  begin
    ParamByName('ID').AsInteger := Id;
    ParamByName('Descricao').AsString := Descricao;
    ParamByName('Custo').AsFloat := Custo;
    ParamByName('ValorVenda').AsFloat := ValorVenda;
  end;

end;

end.
