unit uDMMongo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MongoDB, FireDAC.Phys.MongoDBDef,
  System.Rtti, System.JSON.Types, System.JSON.Readers, System.JSON.BSON,
  System.JSON.Builders, FireDAC.Phys.MongoDBWrapper, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.MongoDBDataSet, FireDAC.Comp.UI;

type
  TDMMongo = class(TDataModule)
    FDConnection: TFDConnection;
    DataSource: TDataSource;
    FDMongoQuery: TFDMongoQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMongo: TDMMongo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMMongo }

procedure TDMMongo.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Open();
  FDMongoQuery.Open;
end;

procedure TDMMongo.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.Close;
  FDMongoQuery.Close;
end;

end.
