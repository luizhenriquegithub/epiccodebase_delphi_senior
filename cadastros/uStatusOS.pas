unit uStatusOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmStatusOS = class(TFrmPadrao)
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusOS: TFrmStatusOS;

implementation

{$R *.dfm}

uses uIndex, uDMMongo;

procedure TFrmStatusOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmIndex.StatusdaOS1.Checked := false;
  inherited;
end;

end.
