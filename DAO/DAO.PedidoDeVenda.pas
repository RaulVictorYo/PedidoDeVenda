unit DAO.PedidoDeVenda;

interface

uses
  DAO.Base, FireDAC.Comp.Client, Model.Base, Data.DB, Model.PedidoDeVenda;

type

  TPedidoDeVendaDAO = class(TBaseDAO)
    public
    constructor Create; overload;
    destructor Destroy; overload;
    procedure SetParameters(var FDQuery: TFDQuery; const AModel: TBaseModel); override;
    procedure SetParametersItens(var FDQuery: TFDQuery; const AModel: TPedidoDeVendaModel);
    function InsertText : string; override;
    function AtualizaGrid(AID: Integer): string; override;
    function FindText(AID: Integer) : string; override;
    function SetModelByDataSet(DataSet: TDataSet) : TBaseModel; override;
    function Search(AText: string): string; override;
    procedure GravarItens(AModel : TPedidoDeVendaModel);

  end;

implementation

uses
  System.SysUtils, Singleton.Connection, Model.Cliente,
  Vcl.Forms;

{ TPedidoDeVendaDAO }


function TPedidoDeVendaDAO.AtualizaGrid(AID: Integer): string;
var
  SB: TStringBuilder;
begin
  try
    SB := TStringBuilder.Create;
    SB.Append('SELECT * FROM PedidoDeVenda WHERE ID = '+ IntToStr(AID));
    Result := SB.ToString;
  finally
    FreeAndNil(SB);
  end;
end;


constructor TPedidoDeVendaDAO.Create;
begin
  Model := TClienteModel.Create;
end;

destructor TPedidoDeVendaDAO.Destroy;
begin

end;

function TPedidoDeVendaDAO.FindText(AID: Integer): string;
var
  SB: TStringBuilder;
begin
  try
    SB := TStringBuilder.Create;
    SB.Append('SELECT * FROM PedidoDeVenda WHERE ID = '+ IntToStr(AID));
    Result := SB.ToString;
  finally
    FreeAndNil(SB);
  end;
end;

procedure TPedidoDeVendaDAO.GravarItens;
var
  FDQuery: TFDQuery;
  SB: TStringBuilder;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    try
      SB := TStringBuilder.Create;
      SB.Append('UPDATE OR INSERT INTO PedidoDeVendaItens (');
      SB.Append('ID, IDPEDIDO, IDProduto, NomeProduto, CustoUnitario, ValorUnitario, ValorTotal, Quantidade)');
      SB.Append('VALUES (');
      SB.Append(':ID, :IDPEDIDO, :IDProduto, :NomeProduto, :CustoUnitario, :ValorUnitario, :ValorTotal, :Quantidade)');
      SB.Append('MATCHING (ID) RETURNING ID');
      FDQuery.Connection := TConnectionSingleton.GetInstance.Connection;
      FDQuery.Close;
      FDQuery.SQL.Text := SB.ToString;
      SetParameters(FDQuery, AModel);
      FDQuery.Open;
    except on E: Exception do
      Application.MessageBox('Ocoreu um Erro durante o Processo de Gravação!','Erro');
    end;
  finally
    FreeAndNil(FDQuery);
  end;

end;

function TPedidoDeVendaDAO.InsertText: string;
var
   SB: TStringBuilder;
begin
  try
    SB := TStringBuilder.Create;
    SB.Append('UPDATE OR INSERT INTO PedidoDeVenda (');
    SB.Append('ID, IDCLIENTE, NOMECLIENTE)');
    SB.Append('VALUES (');
    SB.Append(':ID, :IDCLIENTE, :NOMECLIENTE)');
    SB.Append('MATCHING (ID) RETURNING ID');
    Result := SB.ToString;
  finally
    FreeAndNil(SB);
  end;

end;

function TPedidoDeVendaDAO.Search(AText: string): string;
var
   SB: TStringBuilder;
   Value: integer;
begin
  try
    SB := TStringBuilder.Create;
    SB.Append('SELECT * FROM PedidoDeVenda WHERE 1=1');
    if TryStrToInt(AText,Value) then
      SB.Append('AND ID =' + AText)
    else
    begin
      SB.Append('AND RAZAOSOCIAL LIKE ''%');
      SB.Append(AText +'%''');
    end;

    Result := SB.ToString;
  finally
    FreeAndNil(SB);
  end;
end;

function TPedidoDeVendaDAO.SetModelByDataSet(DataSet: TDataSet) : TBaseModel;
var
  ModelUpdate: TPedidoDeVendaModel;
begin
  ModelUpdate := TPedidoDeVendaModel.Create;
  with ModelUpdate , DataSet do
  begin
    Id := FieldByName('ID').AsInteger;
    IDCliente := FieldByName('IDCliente').AsString;
    NomeCliente := FieldByName('NomeCliente').AsString;

  end;
  Result := ModelUpdate;
end;

procedure TPedidoDeVendaDAO.SetParameters(var FDQuery: TFDQuery;
  const AModel: TBaseModel);
begin

  with FDQuery, TPedidoDeVendaModel(AModel) do
  begin
    if AModel.ID <> 0 then
      ParamByName('ID').AsInteger := AModel.ID
    else
      ParamByName('ID').AsInteger := GetNewID(AModel);

    ParamByName('IDCliente').AsString := IDCliente;
    ParamByName('NomeCliente').AsString := NomeCliente;

  end;

end;

procedure TPedidoDeVendaDAO.SetParametersItens(var FDQuery: TFDQuery;
  const AModel: TPedidoDeVendaModel);
var
  I : Integer;
begin
  for I := 0 to AModel.Itens.Count - 1 do
  begin

  with FDQuery, AModel do
  begin
    if AModel.ID <> 0 then
      ParamByName('ID').AsInteger := AModel.ID
    else
      ParamByName('ID').AsInteger := GetNewID(AModel);

    ParamByName('IDPEDIDO').AsString := ID;
    ParamByName('IDProduto').AsString := IDProduto;
    ParamByName('NomeProduto').AsString := NomeProduto;
    ParamByName('CustoUnitario').AsString := NomeCliente;
    ParamByName('ValorUnitario').AsString := IDCliente;
    ParamByName('ValorTotal').AsString := NomeCliente;
    ParamByName('Quantidade').AsString := NomeCliente;


  end;
  end;
end;

end.
