unit Controller.ProdutoVis;

interface

uses Util.Enum, View.Produto;

type

  TControllerVisProduto = class

  constructor Create;
  destructor Destroy;
  procedure ShowView (AStatus : TAction; AModal: Boolean );

  end;

implementation

uses
  Vcl.Forms;



{ TControllerVisProduto }

constructor TControllerVisProduto.Create;
begin

end;

destructor TControllerVisProduto.Destroy;
begin
end;

procedure TControllerVisProduto.ShowView(AStatus: TAction; AModal: Boolean);
begin

  case AStatus of
    stInsert:
            begin
              Application.CreateForm(TProdutoView, ProdutoView);
              if AModal then
                ProdutoView.ShowModal
              else
                ProdutoView.Show;
            end;
    stUpdate: ;
    stDelete: ;
    stShow: ;
  end;

end;

end.
