program PedidoDeVenda;

uses
  Vcl.Forms,
  View.Menu in 'View\View.Menu.pas' {Form1},
  View.ProdutoVis in 'View\View.ProdutoVis.pas' {ProdutoViewVis},
  View.Produto in 'View\View.Produto.pas' {ProdutoView},
  Controller.ProdutoVis in 'Controller\Controller.ProdutoVis.pas',
  Util.Enum in 'Util\Util.Enum.pas',
  Controller.Menu in 'Controller\Controller.Menu.pas',
  Model.Produto in 'Model\Model.Produto.pas',
  Controller.Produto in 'Controller\Controller.Produto.pas',
  DAO.Produto in 'DAO\DAO.Produto.pas',
  DAO.Base in 'DAO\DAO.Base.pas',
  Singleton.Connection in 'Singleton\Singleton.Connection.pas',
  Model.Base in 'Model\Model.Base.pas',
  Controller.Base in 'Controller\Controller.Base.pas',
  Template in 'Template\Template.pas' {Template},
  View.ClienteVis in 'View\View.ClienteVis.pas' {ClienteVisView},
  View.Cliente in 'View\View.Cliente.pas' {ClienteView},
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  DAO.Cliente in 'DAO\DAO.Cliente.pas',
  Model.Cliente in 'Model\Model.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenuView, MenuView);
  Application.CreateForm(TClienteVisView, ClienteVisView);
  Application.CreateForm(TClienteView, ClienteView);
  Application.Run;
end.
