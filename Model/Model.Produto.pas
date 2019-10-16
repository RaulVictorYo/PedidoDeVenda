unit Model.Produto;

interface

type

TProdutoModel = Class
  private
    FValorVenda: Double;
    FDescricao: string;
    FID: integer;
    FCusto: Double;
    procedure SetCusto(const Value: Double);
    procedure SetDescricao(const Value: string);
    procedure SetID(const Value: integer);
    procedure SetValorVenda(const Value: Double);

  public
    property ID: integer read FID write SetID;
    property Descricao: string read FDescricao write SetDescricao;
    property Custo: Double read FCusto write SetCusto;
    property ValorVenda: Double read FValorVenda write SetValorVenda;

  End;

implementation

{ TProdutoModel }

procedure TProdutoModel.SetCusto(const Value: Double);
begin
  FCusto := Value;
end;

procedure TProdutoModel.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoModel.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TProdutoModel.SetValorVenda(const Value: Double);
begin
  FValorVenda := Value;
end;

end.
