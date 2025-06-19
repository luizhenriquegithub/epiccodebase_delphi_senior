unit uTecnicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao;

type
  TFrmTecnicos = class(TFrmPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTecnicos: TFrmTecnicos;

implementation

{$R *.dfm}

uses uIndex;

procedure TFrmTecnicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmIndex.Tecnicos1.Checked := false;
  inherited;
end;

end.
