unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,
  IniFiles, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL;

type
  TDMConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    function LerConfiguracoesINI: TStrings;
    procedure Conectar;
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  try
    Conectar;
  except
    on E: Exception do
    begin
      raise Exception.Create('Falha na conex�o! ' + E.Message);
    end;
  end;
end;

procedure TDMConexao.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.Connected := False;
end;

function TDMConexao.LerConfiguracoesINI: TStrings;
var
  ArquivoINI: TIniFile;
  CaminhoINI: string;
begin
  Result := TStringList.Create;
  try
    CaminhoINI := ExtractFilePath(ParamStr(0)) + 'config.ini';

    if FileExists(CaminhoINI) then
    begin
      ArquivoINI := TIniFile.Create(CaminhoINI);
      try
        Result.Values['Server'] := ArquivoINI.ReadString('MySQL', 'Server', '');
        Result.Values['Database'] := ArquivoINI.ReadString('MySQL', 'Database', '');
        Result.Values['User_Name'] := ArquivoINI.ReadString('MySQL', 'User_Name', '');
        Result.Values['Password'] := ArquivoINI.ReadString('MySQL', 'Password', '');
        Result.Values['Port'] := ArquivoINI.ReadString('MySQL', 'Port', '3306');
        Result.Values['LibMySQLPath'] := ArquivoINI.ReadString('MySQL', 'LibMySQLPath', '');
      finally
        ArquivoINI.Free;
      end;
    end
    else
    begin
      raise Exception.Create('Arquivo de configura��o INI n�o encontrado.');
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

procedure TDMConexao.Conectar;
var
  Configuracoes: TStrings;
begin
  Configuracoes := LerConfiguracoesINI;
  try
    FDPhysMySQLDriverLink.VendorLib := Configuracoes.Values['LibMySQLPath'];
    FDConnection.Params.Clear;
    FDConnection.Params.Add('DriverID=MySQL');
    FDConnection.Params.Add('Server=' + Configuracoes.Values['Server']);
    FDConnection.Params.Add('Database=' + Configuracoes.Values['Database']);
    FDConnection.Params.Add('User_Name=' + Configuracoes.Values['User_Name']);
    FDConnection.Params.Add('Password=' + Configuracoes.Values['Password']);
    FDConnection.Params.Add('Port=' + Configuracoes.Values['Port']);
    FDConnection.Connected := True;
  finally
    FreeAndNil(Configuracoes);
  end;
end;

end.
