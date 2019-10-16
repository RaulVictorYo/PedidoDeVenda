unit DAO.Produto;

interface

uses
  DAO.Base, Model.Produto, FireDAC.Comp.Client, Model.Base;

type

  TProdutoDAO = class(TBaseDAO)

  procedure SetParameters(var FDQuery: TFDQuery; const AModel: TBaseModel); override;
  function InsertText : string; override;

  end;

implementation

uses
  System.SysUtils, Dtm.Main;

{ TProdutoDAO }


function TProdutoDAO.InsertText: string;
var
   SB: TStringBuilder;
begin
  try
    SB := TStringBuilder.Create;
    SB.Append('UPDATE OR INSERT INTO PRODUTO (');
    SB.Append('ID, DESCRICAO, CUSTO, VALORVENDA)');
    SB.Append('VALUES (');
    SB.Append(':ID, :DESCRICAO, :CUSTO, :VALORVENDA)');
    SB.Append('MATCHING (ID) RETURNING ID');
    Result := SB.ToString;
  finally
    FreeAndNil(SB);
  end;

end;

procedure TProdutoDAO.SetParameters(var FDQuery: TFDQuery;
  const AModel: TBaseModel);
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
