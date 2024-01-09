unit uClienteDAO;

interface

uses
  uClienteModel,
  FireDAC.Comp.Client,
  udmConexao,
  FireDAC.Stan.Param,
  Data.DB,
  FireDAC.DApt,
  System.Generics.Collections;

type
  TClienteDAO = class
 private
    FTransaction: TFDTransaction;
    FDQuery: TFDQuery;
    function IniciarTransacao: TFDTransaction;
    procedure IniciarQuery;
    procedure CommitTransacao;
    procedure RollbackTransacao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirCliente(Cliente: TCliente);
    function ObterClientePorID(IDCliente: Integer): TCliente;
    function ObterClientesPorNomeParcial(NomeParcial: string): TObjectList<TCliente>;
  end;

implementation

constructor TClienteDAO.Create;
begin
  FTransaction := IniciarTransacao;
  IniciarQuery;
end;

destructor TClienteDAO.Destroy;
begin
  FTransaction.Free;
  FDQuery.Free;
  inherited;
end;

procedure TClienteDAO.IniciarQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := dmConexao.FDConnection;
end;

function TClienteDAO.IniciarTransacao: TFDTransaction;
begin
  Result := TFDTransaction.Create(nil);
  Result.Connection := dmConexao.FDConnection;
  Result.StartTransaction;
end;

procedure TClienteDAO.CommitTransacao;
begin
  FTransaction.Commit;
end;

procedure TClienteDAO.RollbackTransacao;
begin
  FTransaction.Rollback;
end;

procedure TClienteDAO.InserirCliente(Cliente: TCliente);
begin
  FDQuery.Transaction := FTransaction;
  FDQuery.SQL.Text :=
    'INSERT INTO cliente (nome, cidade, uf) VALUES (:Nome, :Cidade, :UF)';
  FDQuery.ParamByName('Nome').AsString := Cliente.Nome;
  FDQuery.ParamByName('Cidade').AsString := Cliente.Cidade;
  FDQuery.ParamByName('UF').AsString := Cliente.UF;

  try
    FDQuery.ExecSQL;

    CommitTransacao;
  except
    RollbackTransacao;
    raise;
  end;
end;

function TClienteDAO.ObterClientePorID(IDCliente: Integer): TCliente;
begin
  Result := nil;
  FDQuery.SQL.Text :=
    'SELECT id_cliente, nome, cidade, uf FROM cliente WHERE id_cliente = :IDCliente';
  FDQuery.ParamByName('IDCliente').AsInteger := IDCliente;

  FDQuery.Open;

  if not FDQuery.IsEmpty then
  begin
    Result := TCliente.Create;
    Result.IDCliente := FDQuery.FieldByName('id_cliente').AsInteger;
    Result.Nome := FDQuery.FieldByName('nome').AsString;
    Result.Cidade := FDQuery.FieldByName('cidade').AsString;
    Result.UF := FDQuery.FieldByName('uf').AsString;
  end;
end;

function TClienteDAO.ObterClientesPorNomeParcial(NomeParcial: string): TObjectList<TCliente>;
var
  Cliente: TCliente;
begin
  Result := TObjectList<TCliente>.Create;

  FDQuery.SQL.Text :=
    'SELECT id_cliente, nome, cidade, uf FROM cliente WHERE nome LIKE :NomeParcial';
  FDQuery.ParamByName('NomeParcial').AsString := '%' + NomeParcial + '%';

  FDQuery.Open;
  while not FDQuery.Eof do
  begin
    Cliente := TCliente.Create;
    Cliente.IDCliente := FDQuery.FieldByName('id_cliente').AsInteger;
    Cliente.Nome := FDQuery.FieldByName('nome').AsString;
    Cliente.Cidade := FDQuery.FieldByName('cidade').AsString;
    Cliente.UF := FDQuery.FieldByName('uf').AsString;
    Result.Add(Cliente);

    FDQuery.Next;
  end;
end;

end.

