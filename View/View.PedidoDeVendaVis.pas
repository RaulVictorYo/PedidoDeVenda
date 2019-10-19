unit View.PedidoDeVendaVis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Template, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TPedidoDeVendaVisView = class(TTemplateVisView)
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedidoDeVendaVisView: TPedidoDeVendaVisView;

implementation

uses
  View.PedidoDeVenda;

{$R *.dfm}

procedure TPedidoDeVendaVisView.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TPedidoDeVendaView, PedidoDeVendaView);
  PedidoDeVendaView.ShowModal;
end;

end.
