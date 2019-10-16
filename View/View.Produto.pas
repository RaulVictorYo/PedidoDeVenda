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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProdutoView: TProdutoView;

implementation

{$R *.dfm}


end.
