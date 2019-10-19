unit View.PedidoDeVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TPedidoDeVendaView = class(TForm)
    edtCliente: TLabeledEdit;
    pnl1: TPanel;
    pnl2: TPanel;
    stgrdItens: TStringGrid;
    pnl3: TPanel;
    btnGravar: TButton;
    btnCancelar: TButton;
    lbl2: TLabel;
    lbl1: TLabel;
    lblItens: TLabel;
    lblValorTotal: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblID: TLabel;
    lbl5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stgrdItensDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    GroupColum : TStringList;
  end;

var
  PedidoDeVendaView: TPedidoDeVendaView;

implementation

{$R *.dfm}

procedure TPedidoDeVendaView.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    VK_RETURN:
    begin
      if Trim(edtCliente.Text) <> '' then

    end;



  end;
end;

procedure TPedidoDeVendaView.FormCreate(Sender: TObject);
begin
  GroupColum := TStringList.Create;

  GroupColum.Add('Produto');
  GroupColum.Add('Quantidade');
  GroupColum.Add('ValorUnitario');
  GroupColum.Add('ValorTotal');

end;

procedure TPedidoDeVendaView.FormShow(Sender: TObject);
begin

  stgrdItens.Cells[GroupColum.IndexOf('Produto'),0] := 'Produto';
  stgrdItens.Cells[GroupColum.IndexOf('Quantidade'),0] := 'Qtd.';
  stgrdItens.Cells[GroupColum.IndexOf('ValorUnitario'),0] := 'Vlr. Unit�rio';
  stgrdItens.Cells[GroupColum.IndexOf('ValorTotal'),0] := 'Vlr. Total';

end;

procedure TPedidoDeVendaView.stgrdItensDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ARow = 0 then
    stgrdItens.Canvas.Font.Style := [fsBold];
end;

end.
