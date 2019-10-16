unit View.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMenuView = class(TForm)
    Panel1: TPanel;
    btnPedidoDeVenda: TButton;
    btnProduto: TButton;
    btnCliente: TButton;
    procedure btnProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuView: TMenuView;

implementation

{$R *.dfm}

uses View.ProdutoVis;

procedure TMenuView.btnProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TProdutoViewVis, ProdutoViewVis);
  ProdutoViewVis.ShowModal;
end;

end.
