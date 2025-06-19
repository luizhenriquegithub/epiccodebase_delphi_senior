unit uConsPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, Variants, Buttons,
  ComCtrls, ToolWin, DBClient, ImgList, Menus, DBCtrls,ComObj, System.ImageList;

type
  TFrmConsPadrao = class(TForm)
    dsConsulta: TDataSource;
    Panel3: TPanel;
    edConsulta: TEdit;
    PopSair: TPopupMenu;
    Sair: TMenuItem;
    ImageList2: TImageList;
    CdsConsulta: TClientDataSet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ComboCompo: TComboBox;
    dbgConsulta: TDBGrid;
    PopRelatorio: TPopupMenu;
    Imprimir: TMenuItem;
    ToolButton2: TToolButton;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    TBImprimir: TToolButton;
    ToolButton8: TToolButton;
    TBSair: TToolButton;
    StatusBar1: TStatusBar;
    TBExcel: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PopExportar: TPopupMenu;
    ExportarExcel1: TMenuItem;
    btnProcurar: TButton;
    lblFiltro: TLabel;
    TBCadastrar: TToolButton;
    ToolButton6: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SairClick(Sender: TObject);
    procedure TBSairClick(Sender: TObject);
    procedure ComboCompoCloseUp(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure dbgConsultaTitleClick(Column: TColumn);
    procedure TBExcelClick(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure edConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboCompoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     function  Pesquisa(Tabela,Campo,strEdit : String) :String ;
     procedure ExportaExcel(Consulta: TClientDataSet);
     procedure TrataPanelPesquisa;
  end;


var
   FrmConsPadrao   :TFrmConsPadrao;
   Result          :boolean;
   Msql            :String;
   Tag             :Integer;

implementation


{$R *.DFM}

procedure TFrmConsPadrao.FormShow(Sender: TObject);
begin
   EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
   ComboCompo.SetFocus;
end;

procedure TFrmConsPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFrmConsPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
        VK_ESCAPE:
        Begin
        if (Not (CdsConsulta.IsEmpty) and (Panel3.Enabled = False)) Or
           ((CdsConsulta.IsEmpty)     and (Panel3.Enabled = False)) Then
           Begin
           CdsConsulta.Close;
           Panel3.Enabled   := True;
           edConsulta.Color := clWindow;
           edConsulta.Text  := EmptyStr;
           ComboCompo.Color := clWindow;
           ComboCompo.SetFocus;
        End
        else
           Close;
           
        End;
   end;

end;

procedure TFrmConsPadrao.edConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
        VK_DOWN:
        begin
           dbgConsulta.SetFocus;
           dbgConsulta.Options := dbgConsulta.Options + [dgAlwaysShowSelection];
        end;

        VK_UP: edConsulta.SetFocus;

        VK_RETURN : TrataPanelPesquisa;
    end;

end;

procedure TFrmConsPadrao.SairClick(Sender: TObject);
begin
    close;
end;

procedure TFrmConsPadrao.TBSairClick(Sender: TObject);
begin
    SairClick(Sender);
end;

function TFrmConsPadrao.Pesquisa(Tabela, Campo,strEdit: String): String;
begin
   {
   Case ComboCompo.ItemIndex of
        0:
        begin
        Msql := EmptyStr;
        if strEdit = EmptyStr Then 
           Msql := Format('SELECT * FROM %s WHERE CODEMP = %d and %s like ''%s''',[Tabela,CODLOJA,Campo,(strEdit+ '%')])
        else
           Msql := Format('SELECT * FROM %s WHERE CODEMP = %d and %s = %d',[Tabela,CODLOJA,Campo,StrToInt(strEdit)]);
        end;

        1:
        begin
        Msql := EmptyStr;
        if strEdit = EmptyStr Then 
           Msql := Format('SELECT * FROM %s WHERE CODEMP = %d and %s like ''%s''',[Tabela,CODLOJA,Campo,(strEdit+ '%')])
        else
           Msql := Format('SELECT * FROM %s WHERE CODEMP = %d and %s like ''%s''',[Tabela,CODLOJA,Campo,strEdit+'%']);
        end;
   end;

   with CdsConsulta do
   begin
     close;
     CommandText := Msql;
     Open;

     if CdsConsulta.RecordCount = 0 then
        begin
        Mensagem(Format('Informação.!'+#13+'Nemhum registro encontrato com [ %s ]',[edConsulta.Text]));
     end;

     dbgConsulta.SetFocus;
     StatusBar1.Panels[0].Text := Format(' Total de registros encontrados %d ',[CdsConsulta.RecordCount]);
   end;
   }
end;

procedure TFrmConsPadrao.ComboCompoCloseUp(Sender: TObject);
begin
  case ComboCompo.ItemIndex of
      0:
      begin
         edConsulta.Enabled := True;
         edConsulta.Color   := clWindow;
         edConsulta.SetFocus;
      end;

      1:
      begin
         edConsulta.Enabled := True;
         edConsulta.Color   := clWindow;
         edConsulta.SetFocus;
      end;
  end;
end;

procedure TFrmConsPadrao.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
    TBImprimir.Enabled            := CdsConsulta.RecordCount > 0 ;
    TBExcel.Enabled               := CdsConsulta.RecordCount > 0 ;
    PopRelatorio.Items[0].Enabled := CdsConsulta.RecordCount > 0 ;
    PopExportar.Items[0].Enabled  := CdsConsulta.RecordCount > 0 ;
end;

procedure TFrmConsPadrao.ExportaExcel(Consulta: TClientDataSet);
var
  coluna, linha: integer;
  excel: variant;
  valor: string;
begin
  try
    excel := CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
    Consulta.First;
  try
    for linha := 0 to Consulta.RecordCount-1 do
    begin
      for coluna := 1 to Consulta.FieldCount do
      begin
        valor := Consulta.Fields[coluna-1].AsString;
        excel.cells [linha+3,coluna]:= valor;
      end;
    Consulta.Next;
    end;

    for coluna:= 1 to Consulta.FieldCount do
    begin
       valor:= Consulta.Fields[coluna-1].DisplayLabel;
       excel.cells[1,coluna]:= valor;

    end;

      excel.columns.AutoFit;
      excel.visible:=true;
   except
      Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
      'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
   end;
end;

procedure TFrmConsPadrao.dbgConsultaTitleClick(Column: TColumn);
begin
    CdsConsulta.IndexFieldNames := Column.FieldName;
end;

procedure TFrmConsPadrao.TBExcelClick(Sender: TObject);
begin
  ExportaExcel(CdsConsulta);
end;

procedure TFrmConsPadrao.ExportarExcel1Click(Sender: TObject);
begin
  ExportaExcel(CdsConsulta);
end;

procedure TFrmConsPadrao.edConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ComboCompo.ItemIndex of
       0: if not (Key in ['0'..'9',#13,#8]) then key := #0;
       1: if not (Key in ['A'..'Z','a'..'z' ,#13,#8]) then key := #0;
  end;
end;

procedure TFrmConsPadrao.ComboCompoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
       VK_DOWN   : SendMessage(ComboCompo.Handle,CB_SHOWDROPDOWN,2,0);
       VK_RETURN : ComboCompoCloseUp(Sender);
  end;
end;

procedure TFrmConsPadrao.TrataPanelPesquisa;
begin
   ComboCompo.Color := clMenu;
   edConsulta.Color := clMenu;
   Panel3.Enabled   := False; 
end;

end.
