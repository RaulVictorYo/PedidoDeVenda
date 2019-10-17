unit View.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TProdutoView = class(TForm)
    EdtDescricao: TLabeledEdit;
    EdtId: TLabeledEdit;
    EdtCusto: TLabeledEdit;
    EdtValorVenda: TLabeledEdit;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  ProdutoView: TProdutoView;


implementation

uses
  Controller.Produto;

var
  ProdutoController : TProdutoController;


{$R *.dfm}


procedure TProdutoView.btnGravarClick(Sender: TObject);
begin
  ProdutoController.Gravar;
  Close;
end;

procedure TProdutoView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ProdutoController);
end;

procedure TProdutoView.FormCreate(Sender: TObject);
begin
  ProdutoController := TProdutoController.Create;
end;

end.
