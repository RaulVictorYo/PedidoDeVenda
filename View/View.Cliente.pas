unit View.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TClienteView = class(TForm)
    edtRazaoSocial: TLabeledEdit;
    edtNomeFantasia: TLabeledEdit;
    edtCNPJ: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtUF: TLabeledEdit;
    edtCEP: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    btnGravar: TButton;
    btnCancelar: TButton;
    lbl1: TLabel;
    lblID: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  ClienteView: TClienteView;


implementation

uses
  Controller.Cliente;


var
    ClienteController : TClienteController;

{$R *.dfm}

procedure TClienteView.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TClienteView.btnGravarClick(Sender: TObject);
begin
  ClienteController.Gravar;
  Close;
end;

procedure TClienteView.FormCreate(Sender: TObject);
begin
  ClienteController := TClienteController.Create;
end;

end.
