unit uConsCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsPadrao, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmConsCliente = class(TFrmConsPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCliente: TFrmConsCliente;

implementation

{$R *.dfm}

uses uIndex, uClientes;

procedure TFrmConsCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmIndex.Clientes1.Checked := false;
  inherited;
end;

procedure TFrmConsCliente.TBCadastrarClick(Sender: TObject);
begin
  inherited;
  if FrmClientes = nil then
  begin
     Application.CreateForm(TFrmClientes,FrmClientes);
  end
  else begin
    FrmClientes.BringToFront;
  end;
end;

end.
