unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  frxClass, Data.DB, frxPreview, Datasnap.DBClient, frxDBSet, Vcl.Grids,
  Vcl.DBGrids, MidasLib ;

type
  TFrmMain = class(TForm)
    Label3: TLabel;
    lblTotal: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PnlGeral: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    MmCompetidores: TMemo;
    TxtNomeCamp: TEdit;
    PnlImprimir: TPanel;
    Label4: TLabel;
    Shape2: TShape;
    RadImprimir01: TRadioButton;
    RadImprimir02: TRadioButton;
    RadImprimir03: TRadioButton;
    RadImprimir04: TRadioButton;
    CdsMaster: TClientDataSet;
    CdsMasterCompetidor01: TStringField;
    CdsMasterCompetidor02: TStringField;
    CdsMasterFase: TStringField;
    CdsMasterCampeonato: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Label5: TLabel;
    CmbQtd: TComboBox;
    ChkEmbaralhar: TCheckBox;
    procedure MmCompetidoresKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadImprimir01Click(Sender: TObject);
    procedure MmCompetidoresChange(Sender: TObject);
  private
    { Private declarations }
    function  fValida():Boolean;
    function  fRegistrarCompetidor():Boolean ;
    Function  UpperNome(const Nome: String): String;
    procedure pArrumarNomes();
  public
    { Public declarations }
    function Inativo: Integer;
  end;

var
  FrmMain: TFrmMain;
  aCompetidor: Array of String;
  cNome: String;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin

   if fValida() then
      begin

         pArrumarNomes();
         fRegistrarCompetidor() ;

         case StrToInt(CmbQtd.Text) of

            16 : FrmChaveamento.ShowModal;
             8 : FrmChaveamento2.ShowModal;

         end;

         CmbQtd.Enabled := False ;
         BitBtn1.Caption := 'Abrir';
         BitBtn2.Visible := True;
         ChkEmbaralhar.Visible := False ;

      end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin

   if Not PnlImprimir.Visible then
      Begin

         If StrToInt(CmbQtd.Text) = 8 Then
            Begin

               RadImprimir02.Visible := False ;
               RadImprimir03.Top     := 39 ;
               RadImprimir04.Top     := 56 ;

               RadImprimir01.Tag     := 8 ;
               RadImprimir03.Tag     := 4 ;
               RadImprimir04.Tag     := 2 ;

            End;

         PnlImprimir.Visible := True;
         PnlGeral.Enabled := False;

      End
   Else
      Begin
         PnlImprimir.Visible := False;
         PnlGeral.Enabled := True;
      End;

   cNome := TxtNomeCamp.Text;

end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var cAux: String;
begin

   cAux := InputBox('Deseja Fechar?', 'DIGITE: SHOW','');

   if Trim(UpperCase(cAux)) <> 'SHOW' then
      Action:=CaNone
   else
      PnlImprimir.Visible := False;

end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  MmCompetidores.Clear;
  TxtNomeCamp.Text := '' ;
  lblTotal.Caption := '0';
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
   SetLength(aCompetidor, 16);
   ChkEmbaralhar.Left := 290;
   If TxtNomeCamp.CanFocus Then TxtNomeCamp.SetFocus;
end;

function TFrmMain.fRegistrarCompetidor: Boolean;
var nI, nII: Integer;
begin

   For nI:= 0 To MmCompetidores.Lines.Count - 1 Do
      aCompetidor[nI] := Trim(MmCompetidores.Lines[nI]);

   Result := True;

end;

function TFrmMain.fValida: Boolean;
var nI, nII: Integer;
begin

   result := False;

   if trim(TxtNomeCamp.Text) = '' then
      begin
         ShowMessage('Entre com o nome do campeonato!');
         TxtNomeCamp.SetFocus;
         exit;
      end;

   if MmCompetidores.Lines.Count <> StrToInt(CmbQtd.Text) then
      begin
         ShowMessage('Entre com ' + CmbQtd.Text + ' competidores');
         MmCompetidores.SetFocus;
         exit;
      end;

   for nI := 0 to MmCompetidores.Lines.Count - 1 do
      begin

         If Trim(MmCompetidores.Lines[nI]) = '' then
            begin
               ShowMessage('Nome de Competidor em Branco!');
               MmCompetidores.SetFocus;
               exit;
            end;            

      end;

   for nI := 0 to MmCompetidores.Lines.Count - 1 do
      begin

         For nII := 0 To MmCompetidores.Lines.Count - 1 do
            Begin

               if ( Uppercase(Trim(MmCompetidores.Lines[nI])) = UpperCase(Trim(MmCompetidores.Lines[nII])) ) And
                  ( nI <> nII ) then
                  Begin
                     ShowMessage('Nome Duplicado: ' + MmCompetidores.Lines[nI]);
                     MmCompetidores.SetFocus;
                     exit;
                  End;           
            
            End;
         
      end;

   result := True;

end;

function TFrmMain.Inativo: Integer;
var
   InpInfo: TLastInputInfo;
begin
   InpInfo.cbSize := SizeOf(TLastInputInfo) ;
   GetLastInputInfo(InpInfo) ;
   Result := (GetTickCount - InpInfo.dwTime); //DIV 1000;
end;

procedure TFrmMain.MmCompetidoresChange(Sender: TObject);
var nI, nTotal: Integer;
begin

   lblTotal.Caption := IntToStr(MmCompetidores.Lines.Count);
   nTotal := StrToInt(CmbQtd.Text);

   if MmCompetidores.Lines.Count > nTotal then
      for nI := nTotal to MmCompetidores.Lines.Count do
         MmCompetidores.Lines.Delete(nI);

end;

procedure TFrmMain.MmCompetidoresKeyPress(Sender: TObject; var Key: Char);
begin

   if Key = #13 then
      if MmCompetidores.Lines.Count >= StrToInt(CmbQtd.Text) then
         Key := #0 ;

end;

procedure TFrmMain.pArrumarNomes;
var I: Integer;
begin
   for I := 0 to MmCompetidores.Lines.Count -1 do
      MmCompetidores.Lines[i] := UpperNome(MmCompetidores.Lines[i]);
end;

procedure TFrmMain.RadImprimir01Click(Sender: TObject);

   procedure pGeral();
   var nI: Integer;
   begin

      for nI := 1 to 16 do
         begin

            If Odd(nI) Then
               Begin
                  CdsMaster.Append;
                  CdsMasterFase.AsString := 'Geral';
                  CdsMasterCampeonato.AsString := TxtNomeCamp.Text;
                  CdsMasterCompetidor01.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption;
               End
            Else
               Begin
                  CdsMaster.Edit;
                  CdsMasterCompetidor02.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption;
               End;

         end;

   end;

   procedure pOitavas();
   var nI, nIni, nFim: Integer;
   begin

      if StrToInt(CmbQtd.Text) = 16 then
         Begin
            nIni := 17 ;
            nFim := 24 ;
         End
      else
         Begin
            nIni := 1;
            nFim := 8
         End;

      for nI := nIni to nFim do
         begin

            If Odd(nI) Then
               Begin
                  CdsMaster.Append;

                  if StrToInt(CmbQtd.Text) = 16 Then
                     CdsMasterFase.AsString := 'Quartas'
                  Else
                     CdsMasterFase.AsString := 'Geral';

                  CdsMasterCampeonato.AsString := TxtNomeCamp.Text;

                  if StrToInt(CmbQtd.Text) = 16 then
                     CdsMasterCompetidor01.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption
                  else
                     CdsMasterCompetidor01.AsString := (FrmChaveamento2.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption

               End
            Else
               Begin
                  CdsMaster.Edit;
                  if StrToInt(CmbQtd.Text) = 16 then
                     CdsMasterCompetidor02.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption
                  else
                     CdsMasterCompetidor02.AsString := (FrmChaveamento2.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption;

               End;

         end;

   end;

   procedure pQuartas();
   var nI, nIni, nFim: Integer;
   begin

      if StrToInt(CmbQtd.Text) = 16 then
         Begin
            nIni := 25 ;
            nFim := 28 ;
         End
      else
         Begin
            nIni := 9;
            nFim := 12;
         End;

      for nI := nIni to nFim do
         begin

            If Odd(nI) Then
               Begin
                  CdsMaster.Append;
                  CdsMasterFase.AsString := 'Semifinal';
                  CdsMasterCampeonato.AsString := TxtNomeCamp.Text;

                  if StrToInt(CmbQtd.Text) = 16 then
                     CdsMasterCompetidor01.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption
                  else
                     CdsMasterCompetidor01.AsString := (FrmChaveamento2.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption

               End
            Else
               Begin
                  CdsMaster.Edit;
                  if StrToInt(CmbQtd.Text) = 16 then
                     CdsMasterCompetidor02.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption
                  else
                     CdsMasterCompetidor02.AsString := (FrmChaveamento2.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption;
               End;

         end;

   end;

   procedure pFinal();
   var nI, nIni, nFim: Integer;
   begin

      if StrToInt(CmbQtd.Text) = 16 then
         Begin
            nIni := 29 ;
            nFim := 30 ;
         End
      else
         Begin
            nIni := 13;
            nFim := 14;
         End;


      for nI := nIni to nFim do
         begin

            If Odd(nI) Then
               Begin
                  CdsMaster.Append;
                  CdsMasterFase.AsString := 'Final';
                  CdsMasterCampeonato.AsString := TxtNomeCamp.Text;

                  if StrToInt(CmbQtd.Text) = 16 then
                     CdsMasterCompetidor01.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption
                  Else
                     CdsMasterCompetidor01.AsString := (FrmChaveamento2.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption

               End
            Else
               Begin
                  CdsMaster.Edit;

                  if StrToInt(CmbQtd.Text) = 16 then
                     CdsMasterCompetidor02.AsString := (FrmChaveamento.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption
                  Else
                     CdsMasterCompetidor02.AsString := (FrmChaveamento2.FindComponent('lblCompetidor' + IntToStr(nI)) as TLabel).Caption

               End;

         end;
   end;

begin

   CdsMaster.Close ;
   CdsMaster.CreateDataSet ;

   case (Sender As TRadioButton).Tag Of

     16: pGeral();
      8: pOitavas();
      4: pQuartas();
      2: pFinal();

   end;

   (Sender as TRadioButton).Checked := False;
   frxReport1.ShowReport();
   PnlImprimir.Visible := False ;

end;

function TFrmMain.UpperNome(const Nome: String): String;
var
  x : Integer;
  lista : Array[0..4] of String[03];

  function NaoAchaPreposicao(Palavra : String): Boolean;
  var
    x : Integer;
  begin
    Result := True;
    for x := 0 to 4 do
      if Trim(Palavra) = lista[x] then
    Result := False;
  end;

begin
  Result := Nome;

  lista[0] := 'das'; lista[1] := 'dos' ;
  lista[2] := 'de'; lista[3] := 'do' ;
  lista[4] := 'da';

  Result := UpCase(Result[1]) + Copy(Result, 2, Length(Result));

  for x := 2 to Length(Nome) do
  begin
    if Nome[x] = #32 then
      if Copy(Nome,x+1,1) <> 'e' then
        if NaoAchaPreposicao(Copy(Nome,x+1,3)) then
          Result := Copy(Result, 1, x) +
          UpCase(Result[x+1]) +
          Copy(Result, x+2, Length(Result));
  end;
end;

end.
