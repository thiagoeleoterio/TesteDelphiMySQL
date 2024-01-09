unit uPedidoProdutoController;

interface

uses
  uPedidoProdutoModel, uPedidoProdutoDAO, System.SysUtils, System.Generics.Collections;

type
  TPedidoProdutoController = class
  private
    FPedidoProdutoDAO: TPedidoProdutoDAO;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirPedidoProduto(PedidoProduto: TPedidoProduto);
    function LocalizarProdutosPorPedido(IDPedido: Integer): TObjectList<TPedidoProduto>;
  end;

implementation

{ TPedidoProdutoController }

constructor TPedidoProdutoController.Create;
begin
  FPedidoProdutoDAO := TPedidoProdutoDAO.Create;
end;

destructor TPedidoProdutoController.Destroy;
begin
  FPedidoProdutoDAO.Free;
  inherited;
end;

procedure TPedidoProdutoController.InserirPedidoProduto(PedidoProduto: TPedidoProduto);
begin
  FPedidoProdutoDAO.InserirPedidoProduto(PedidoProduto);
end;

function TPedidoProdutoController.LocalizarProdutosPorPedido(IDPedido: Integer): TObjectList<TPedidoProduto>;
begin
  Result := FPedidoProdutoDAO.LocalizarProdutosPorPedido(IDPedido);
end;

end.

