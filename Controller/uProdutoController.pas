unit uProdutoController;

interface

uses
  uProdutoDAO, uProdutoModel, System.Generics.Collections;

type
  TProdutoController = class
  private
    FProdutoDAO: TProdutoDAO;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirProduto(Produto: TProduto);
    function LocalizarProdutoPorID(IDProduto: Integer): TProduto;
    function ObterProdutosPorNomeParcial(NomeParcial: string): TObjectList<TProduto>;
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create;
begin
  FProdutoDAO := TProdutoDAO.Create;
end;

destructor TProdutoController.Destroy;
begin
  FProdutoDAO.Free;
  inherited;
end;

procedure TProdutoController.InserirProduto(Produto: TProduto);
begin
  FProdutoDAO.InserirProduto(Produto);
end;

function TProdutoController.LocalizarProdutoPorID(IDProduto: Integer): TProduto;
begin
  Result := FProdutoDAO.LocalizarProdutoPorID(IDProduto);
end;

function TProdutoController.ObterProdutosPorNomeParcial(NomeParcial: string): TObjectList<TProduto>;
begin
  Result := FProdutoDAO.ObterProdutosPorNomeParcial(NomeParcial);
end;

end.

