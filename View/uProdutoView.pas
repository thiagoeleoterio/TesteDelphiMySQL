unit uProdutoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.Generics.Collections,
  uProdutoModel,
  uProdutoController;

type
  TfrmProdutoView = class(TForm)
    pnlPesquisa: TPanel;
    pnlBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    EdtPesquisar: TLabeledEdit;
    grdProduto: TDBGrid;
    dssProduto: TDataSource;
    fdmProduto: TFDMemTable;
    lblLegenda: TLabel;
    fdmProdutoidProduto: TIntegerField;
    fdmProdutoDescricao: TStringField;
    fdmProdutoPrecoVenda: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure EdtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FProdutoEscolhido: Integer;
    procedure ObterClientes(const NomeParcial: String);
    procedure FecharFormulario(ProdutoEscolhido: Integer = -1);
  public
    { Public declarations }
    property ProdutoEscolhido: Integer read FProdutoEscolhido;
  end;

var
  frmProdutoView: TfrmProdutoView;

implementation

{$R *.dfm}

{ TfrmClienteView }

procedure TfrmProdutoView.btnCancelarClick(Sender: TObject);
begin
  FecharFormulario;
end;

procedure TfrmProdutoView.btnConfirmarClick(Sender: TObject);
begin
  if (fdmProduto.State = dsBrowse) and (fdmProduto.RecordCount > 0) then
    FecharFormulario(fdmProduto.FieldByName('IDProduto').AsInteger)
  else
    FecharFormulario;
end;

procedure TfrmProdutoView.EdtPesquisarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if fdmProduto.RecordCount = 1 then
      btnConfirmar.Click
    else
      grdProduto.SetFocus;
  end;
end;

procedure TfrmProdutoView.EdtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Length(EdtPesquisar.Text) > 1 then
    ObterClientes(EdtPesquisar.Text);
end;

procedure TfrmProdutoView.FormCreate(Sender: TObject);
begin
  fdmProduto.CreateDataSet;
end;

procedure TfrmProdutoView.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fdmProduto);
end;

procedure TfrmProdutoView.grdProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if fdmProduto.RecordCount > 0 then
      btnConfirmar.Click
  end;
end;

procedure TfrmProdutoView.ObterClientes(const NomeParcial: String);
var
  ProdutoController: TProdutoController;
  Produtos: TObjectList<TProduto>;
  Produto: TProduto;
begin
  ProdutoController := TProdutoController.Create;
  try
    Produtos := ProdutoController.ObterProdutosPorNomeParcial(NomeParcial);
    fdmProduto.EmptyDataSet;

    for Produto in Produtos do
    begin
      fdmProduto.Append;
      fdmProduto.FieldByName('IDProduto').AsInteger := Produto.IDProduto;
      fdmProduto.FieldByName('Descricao').AsString :=  Produto.Descricao;
      fdmProduto.FieldByName('PrecoVenda').AsFloat := Produto.PrecoVenda;
      fdmProduto.Post;
    end;
  finally
    FreeAndNil(ProdutoController);
  end;
end;

procedure TfrmProdutoView.FecharFormulario(ProdutoEscolhido: Integer);
begin
  FProdutoEscolhido := ProdutoEscolhido;
  Close;
end;

end.
