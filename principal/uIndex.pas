unit uIndex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin ;

type
  TFrmIndex = class(TForm)
    MainIndex: TMainMenu;
    Arquivo1: TMenuItem;
    Fecharaplicao1: TMenuItem;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Tecnicos1: TMenuItem;
    OrdemdeSevio1: TMenuItem;
    N2: TMenuItem;
    StatusdaOS1: TMenuItem;
    AberuradeOS1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure Fecharaplicao1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Tecnicos1Click(Sender: TObject);
    procedure StatusdaOS1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIndex: TFrmIndex;

implementation

{$R *.dfm}

uses uClientes, uTecnicos, uStatusOS, uConsCliente;


procedure TFrmIndex.Clientes1Click(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   LockWindowUpdate(Handle);
   if Clientes1.Checked = false then
      begin
       Clientes1.Checked := true;
       Application.CreateForm(TFrmConsCliente,FrmConsCliente);
   end
   else
   begin
     ActiveControl := nil;
     FrmConsCliente.BringToFront;
   end;
   LockWindowUpdate(0);
   Screen.Cursor := crDefault;
end;

procedure TFrmIndex.Tecnicos1Click(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   LockWindowUpdate(Handle);
   if Tecnicos1.Checked = false then
      begin
       Tecnicos1.Checked := true;
       Application.CreateForm(TFrmTecnicos,FrmTecnicos);
   end
   else
   begin
     ActiveControl := nil;
     FrmTecnicos.BringToFront;
   end;
   LockWindowUpdate(0);
   Screen.Cursor := crDefault;
end;

procedure TFrmIndex.ToolButton3Click(Sender: TObject);
begin
  Fecharaplicao1Click(Sender);
end;

procedure TFrmIndex.StatusdaOS1Click(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   LockWindowUpdate(Handle);
   if StatusdaOS1.Checked = false then
      begin
       StatusdaOS1.Checked := True;
       Application.CreateForm(TFrmStatusOS,FrmStatusOS);
   end
   else
   begin
     ActiveControl := nil;
     FrmStatusOS.BringToFront;
   end;
   LockWindowUpdate(0);
   Screen.Cursor := crDefault;
end;

procedure TFrmIndex.Fecharaplicao1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
