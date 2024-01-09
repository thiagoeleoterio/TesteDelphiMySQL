unit uProdutoDAO;

interface

uses
  uProdutoModel, FireDAC.Comp.Client,
  FireDAC.Stan.Param, System.SysUtils,
  udmConexao, System.Generics.Collections,
  Data.DB;

type
  TProdutoDAO = class
  private
    FTransaction: TFDTransaction;
    FDQuery: TFDQuery;
    procedure IniciarQuery;
    function IniciarTransacao: TFDTransaction;
    procedure CommitTransacao;
    procedure RollbackTransacao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirProduto(Produto: TProduto);
    function LocalizarProdutoPorID(IDProduto: Integer): TProduto;
    function ObterProdutosPorNomeParcial(NomeParcial: string): TObjectList<TProduto>;
  end;

implementation

{ TProdutoDAO }

constructor TProdutoDAO.Create;
begin
  FTransaction := IniciarTransacao;
  IniciarQuery;
end;

destructor TProdutoDAO.Destroy;
begin
  FTransaction.Free;
  FDQuery.Free;
  inherited;
end;

procedure TProdutoDAO.IniciarQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection :=  dmConexao.FDConnection;
end;

function TProdutoDAO.IniciarTransacao: TFDTransaction;
begin
  Result := TFDTransaction.Create(nil);
  Result.Connection := dmConexao.FDConnection;
  Result.StartTransaction;
end;

procedure TProdutoDAO.CommitTransacao;
begin
  FTransaction.Commit;
end;

procedure TProdutoDAO.RollbackTransacao;
begin
  FTransaction.Rollback;
end;

procedure TProdutoDAO.InserirProduto(Produto: TProduto);
begin
  FDQuery.Transaction := FTransaction;

  FDQuery.SQL.Text :=
    'INSERT INTO produto (descricao, preco_venda) VALUES (:Descricao, :PrecoVenda)';
  FDQuery.ParamByName('Descricao').AsString := Produto.Descricao;
  FDQuery.ParamByName('PrecoVenda').AsCurrency := Produto.PrecoVenda;

  try
    FDQuery.ExecSQL;

    CommitTransacao;
  except
    RollbackTransacao;
    raise;
  end;
end;

function TProdutoDAO.LocalizarProdutoPorID(IDProduto: Integer): TProduto;
begin
  Result := nil;

  FDQuery.SQL.Text :=
    'SELECT id_produto, descricao, preco_venda FROM produto WHERE id_produto = :IDProduto';
  FDQuery.ParamByName('IDProduto').AsInteger := IDProduto;

  FDQuery.Open;

  if not FDQuery.IsEmpty then
  begin
    Result := TProduto.Create;
    Result.IDProduto := FDQuery.FieldByName('id_produto').AsInteger;
    Result.Descricao := FDQuery.FieldByName('descricao').AsString;
    Result.PrecoVenda := FDQuery.FieldByName('preco_venda').AsCurrency;
  end;
end;

function TProdutoDAO.ObterProdutosPorNomeParcial(NomeParcial: string): TObjectList<TProduto>;
var
  Produto: TProduto;
begin
  Result := TObjectList<TProduto>.Create;

  FDQuery.SQL.Text :=
    'SELECT id_produto, descricao, preco_venda FROM produto WHERE descricao LIKE :NomeParcial';
  FDQuery.ParamByName('NomeParcial').AsString := '%' + NomeParcial + '%';

  FDQuery.Open;
  while not FDQuery.Eof do
  begin
    Produto := TProduto.Create;
    Produto.IDProduto := FDQuery.FieldByName('id_produto').AsInteger;
    Produto.Descricao := FDQuery.FieldByName('descricao').AsString;
    Produto.PrecoVenda := FDQuery.FieldByName('preco_venda').AsCurrency;
    Result.Add(Produto);

    FDQuery.Next;
  end;
end;

end.

