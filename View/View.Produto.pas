unit View.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TProdutoView = class(TForm)
    EdtDescricao: TLabeledEdit;
    EdtCusto: TLabeledEdit;
    EdtValorVenda: TLabeledEdit;
    btnGravar: TButton;
    btnCancelar: TButton;
    lblID: TLabel;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function ValidarCampos:Boolean;

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
  if ValidarCampos then
  begin
    ProdutoController.Gravar;
    Close;
  end;
end;

procedure TProdutoView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ProdutoController);
end;

procedure TProdutoView.FormCreate(Sender: TObject);
begin
  ProdutoController := TProdutoController.Create;
end;

function TProdutoView.ValidarCampos: Boolean;
begin
  Result := True;
  if Trim(EdtDescricao.Text) = '' then
  begin
    Result := False;
    Application.MessageBox('Não é possivel gravar Produto sem Descrição','Erro');
    Exit
  end;
  if Trim(EdtValorVenda.Text) = '' then
  begin
    Result := False;
    Application.MessageBox('Não é possivel gravar Produto sem Valor de Venda','Erro');
    Exit
  end;


end;

end.
