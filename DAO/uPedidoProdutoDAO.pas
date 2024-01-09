unit uPedidoProdutoDAO;

interface

uses
  uPedidoProdutoModel, FireDAC.Comp.Client, FireDAC.Stan.Param, udmConexao,
  System.SysUtils, Data.DB, System.Generics.Collections;

type
  TPedidoProdutoDAO = class
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
    function InserirPedidoProduto(PedidoProduto: TPedidoProduto): Boolean;
    function LocalizarProdutosPorPedido(IDPedido: Integer): TObjectList<TPedidoProduto>;
    function DeletarProdutosPorPedido(IDPedido: Integer): Boolean;
  end;

implementation

{ TPedidoProdutoDAO }

constructor TPedidoProdutoDAO.Create;
begin
  FTransaction := IniciarTransacao;
  IniciarQuery;
end;

destructor TPedidoProdutoDAO.Destroy;
begin
  FTransaction.Free;
  FDQuery.Free;
  inherited;
end;

procedure TPedidoProdutoDAO.IniciarQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := dmConexao.FDConnection;
end;

function TPedidoProdutoDAO.IniciarTransacao: TFDTransaction;
begin
  Result := TFDTransaction.Create(nil);
  Result.Connection := dmConexao.FDConnection;
  Result.StartTransaction;
end;

procedure TPedidoProdutoDAO.CommitTransacao;
begin
  FTransaction.Commit;
end;

procedure TPedidoProdutoDAO.RollbackTransacao;
begin
  FTransaction.Rollback;
end;

function TPedidoProdutoDAO.InserirPedidoProduto(PedidoProduto: TPedidoProduto): Boolean;
begin
  FDQuery.SQL.Text :=
    'INSERT INTO pedido_produtos (id_pedido, id_produto, quantidade, valor_unitario, valor_total) ' +
    'VALUES (:IDPedido, :IDProduto, :Quantidade, :ValorUnitario, :ValorTotal)';
  FDQuery.ParamByName('IDPedido').AsInteger := PedidoProduto.IDPedido;
  FDQuery.ParamByName('IDProduto').AsInteger := PedidoProduto.IDProduto;
  FDQuery.ParamByName('Quantidade').AsFloat := PedidoProduto.Quantidade;
  FDQuery.ParamByName('ValorUnitario').AsCurrency := PedidoProduto.ValorUnitario;
  FDQuery.ParamByName('ValorTotal').AsCurrency := PedidoProduto.ValorTotal;

  try
    FDQuery.ExecSQL;

    Result := True;
  except
    raise;
  end;
end;

function TPedidoProdutoDAO.LocalizarProdutosPorPedido(IDPedido: Integer): TObjectList<TPedidoProduto>;
var
  PedidoProduto: TPedidoProduto;
begin
  Result := TObjectList<TPedidoProduto>.Create(True);

  FDQuery.SQL.Text :=
    'SELECT pp.*, p.descricao FROM pedido_produtos pp ' +
    ' inner join produto p ' +
    ' on p.id_produto = pp.id_produto ' +
    'WHERE pp.id_pedido = :IDPedido';
  FDQuery.ParamByName('IDPedido').AsInteger := IDPedido;

  try
    FDQuery.Open;

    while not FDQuery.EOF do
    begin
      PedidoProduto := TPedidoProduto.Create;
      PedidoProduto.IDPedidoProdutos := FDQuery.FieldByName('id_pedido_produtos').AsInteger;
      PedidoProduto.IDPedido := FDQuery.FieldByName('id_pedido').AsInteger;
      PedidoProduto.IDProduto := FDQuery.FieldByName('id_produto').AsInteger;
      PedidoProduto.Quantidade := FDQuery.FieldByName('quantidade').AsFloat;
      PedidoProduto.ValorUnitario := FDQuery.FieldByName('valor_unitario').AsFloat;
      PedidoProduto.ValorTotal := FDQuery.FieldByName('valor_total').AsFloat;
      PedidoProduto.Descricao := FDQuery.FieldByName('descricao').AsString;
      Result.Add(PedidoProduto);

      FDQuery.Next;
    end;
  finally
    FDQuery.Close;
  end;
end;

function TPedidoProdutoDAO.DeletarProdutosPorPedido(IDPedido: Integer): Boolean;
begin
  FDQuery.SQL.Text := 'DELETE FROM Pedido_Produtos WHERE ID_Pedido = :IDPedido';
  FDQuery.ParamByName('IDPedido').AsInteger := IDPedido;
  FDQuery.ExecSQL;
  try
    FDQuery.ExecSQL;
    Result := True;
  except
    raise;
  end;
end;

end.

