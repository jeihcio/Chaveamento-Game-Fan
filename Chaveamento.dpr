program Chaveamento;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FrmMain},
  Unit3 in 'Unit3.pas' {FrmChaveamento2},
  Unit2 in 'Unit2.pas' {FrmChaveamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Game Fan Show';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmChaveamento2, FrmChaveamento2);
  Application.CreateForm(TFrmChaveamento, FrmChaveamento);
  Application.Run;
end.
