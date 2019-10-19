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
    procedure btnClienteClick(Sender: TObject);
    procedure btnPedidoDeVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuView: TMenuView;

implementation

{$R *.dfm}

uses View.ProdutoVis, View.ClienteVis, View.PedidoDeVendaVis;

procedure TMenuView.btnClienteClick(Sender: TObject);
begin
  Application.CreateForm(TClienteVisView, ClienteVisView);
  ClienteVisView.ShowModal;
end;

procedure TMenuView.btnPedidoDeVendaClick(Sender: TObject);
begin
  Application.CreateForm(TPedidoDeVendaVisView, PedidoDeVendaVisView);
  PedidoDeVendaVisView.ShowModal;
end;

procedure TMenuView.btnProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TProdutoViewVis, ProdutoViewVis);
  ProdutoViewVis.ShowModal;
end;

end.
