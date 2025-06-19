program sample_os;

uses
  Vcl.Forms,
  uIndex in 'principal\uIndex.pas' {FrmIndex},
  uPadrao in 'heranca\cadastro\uPadrao.pas' {FrmPadrao},
  uFunctions in 'funcoes\uFunctions.pas',
  uClientes in 'cadastros\uClientes.pas' {FrmClientes},
  uTecnicos in 'cadastros\uTecnicos.pas' {FrmTecnicos},
  uStatusOS in 'cadastros\uStatusOS.pas' {FrmStatusOS},
  uConsPadrao in 'heranca\consulta\uConsPadrao.pas' {FrmConsPadrao},
  uConsCliente in 'consultas\uConsCliente.pas' {FrmConsCliente},
  uDMMongo in 'datamodules\uDMMongo.pas' {DMMongo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmIndex, FrmIndex);
  Application.CreateForm(TDMMongo, DMMongo);
  Application.Run;
end.
