unit Model.Produto;

interface

uses
  Model.Base;

type

TProdutoModel = Class(TBaseModel)
  private
    FValorVenda: Double;
    FDescricao: string;
    FCusto: Double;
    procedure SetCusto(const Value: Double);
    procedure SetDescricao(const Value: string);
    procedure SetValorVenda(const Value: Double);

  public
    constructor Create;
    destructor Destroy;
    property Descricao: string read FDescricao write SetDescricao;
    property Custo: Double read FCusto write SetCusto;
    property ValorVenda: Double read FValorVenda write SetValorVenda;

  End;

implementation

{ TProdutoModel }

constructor TProdutoModel.Create;
begin
  Table := 'Produto';
  Generator := 'GEN_PRODUTO_ID';
end;

destructor TProdutoModel.Destroy;
begin

end;

procedure TProdutoModel.SetCusto(const Value: Double);
begin
  FCusto := Value;
end;

procedure TProdutoModel.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoModel.SetValorVenda(const Value: Double);
begin
  FValorVenda := Value;
end;

end.
