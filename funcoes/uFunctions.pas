unit uFunctions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls ;

procedure MsgErro(Text: String);
procedure MsgInfo(Text: String);


implementation

procedure MsgErro(Text: String);
begin
  Application.MessageBox(Pchar(Text),'Erro',mb_OK + mb_iconHand);
end;

procedure MsgInfo(Text: String);
begin
  Application.MessageBox(Pchar(Text),'Informação',mb_OK + mb_iconinformation);
end;

procedure CreateMyForm(Sender: TObject);
begin
   {
   Screen.Cursor := crSQLWait;
   LockWindowUpdate(Handle);
   if FrmPadrao = nil then
      begin
       Application.CreateForm(TFrmPadrao,FrmPadrao);
   end
   else
   begin
     ActiveControl := nil;
     FrmPadrao.BringToFront;
   end;
   LockWindowUpdate(0);
   Screen.Cursor := crDefault;
   }
end;

end.
