program PedidoDeVenda;

uses
  Vcl.Forms,
  View.Menu in 'View\View.Menu.pas' {Form1},
  View.ProdutoVis in 'View\View.ProdutoVis.pas' {ProdutoViewVis},
  Dtm.Main in 'DataModule\Dtm.Main.pas' {DtmMain: TDataModule},
  View.Produto in 'View\View.Produto.pas' {ProdutoView},
  Controller.ProdutoVis in 'Controller\Controller.ProdutoVis.pas',
  Util.Enum in 'Util\Util.Enum.pas',
  Controller.Menu in 'Controller\Controller.Menu.pas',
  Model.Produto in 'Model\Model.Produto.pas',
  Controller.Produto in 'Controller\Controller.Produto.pas',
  DAO.Produto in 'DAO\DAO.Produto.pas',
  DAO.Base in 'DAO\DAO.Base.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenuView, MenuView);
  Application.CreateForm(TDtmMain, DtmMain);
  Application.Run;
end.
