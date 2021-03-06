
unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, StrUtils, Vcl.Imaging.pngimage;

type
  TFrmChaveamento = class(TForm)
    PnlChave: TPanel;
    ImgChave: TImage;
    lblCampeonato: TLabel;
    lblCompetidor1: TLabel;
    lblCompetidor2: TLabel;
    lblCompetidor3: TLabel;
    lblCompetidor4: TLabel;
    lblCompetidor8: TLabel;
    lblCompetidor7: TLabel;
    lblCompetidor6: TLabel;
    lblCompetidor5: TLabel;
    lblCompetidor16: TLabel;
    lblCompetidor15: TLabel;
    lblCompetidor14: TLabel;
    lblCompetidor13: TLabel;
    lblCompetidor12: TLabel;
    lblCompetidor11: TLabel;
    lblCompetidor10: TLabel;
    lblCompetidor9: TLabel;
    lblCompetidor17: TLabel;
    lblCompetidor18: TLabel;
    lblCompetidor19: TLabel;
    lblCompetidor20: TLabel;
    lblCompetidor21: TLabel;
    lblCompetidor22: TLabel;
    lblCompetidor24: TLabel;
    lblCompetidor23: TLabel;
    lblCompetidor25: TLabel;
    lblCompetidor26: TLabel;
    lblCompetidor27: TLabel;
    lblCompetidor28: TLabel;
    lblCompetidor29: TLabel;
    lblCompetidor30: TLabel;
    imgLogo: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure lblCompetidor1Click(Sender: TObject);
    procedure lblCompetidor1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblCompetidor1MouseLeave(Sender: TObject);
    procedure lblCompetidor3Click(Sender: TObject);
    procedure lblCompetidor5Click(Sender: TObject);
    procedure lblCompetidor7Click(Sender: TObject);
    procedure lblCompetidor9Click(Sender: TObject);
    procedure lblCompetidor11Click(Sender: TObject);
    procedure lblCompetidor13Click(Sender: TObject);
    procedure lblCompetidor15Click(Sender: TObject);
    procedure lblCompetidor17Click(Sender: TObject);
    procedure lblCompetidor19Click(Sender: TObject);
    procedure lblCompetidor21Click(Sender: TObject);
    procedure lblCompetidor23Click(Sender: TObject);
    procedure lblCompetidor25Click(Sender: TObject);
    procedure lblCompetidor27Click(Sender: TObject);
    procedure lblCompetidor29Click(Sender: TObject);
    procedure lblCampeonatoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
    procedure pTelaCheia(bTela: Boolean);
    procedure pLimpar();
    procedure pEmbaralhar(nQuant: Integer);
    procedure pChave1();
    procedure pChave2();
    procedure pChave3();
    function fChaveMudou(): Boolean;
    procedure pGerarProximaChave(nChave: Integer);
    procedure WMGetMinMaxInfo(var MSG: TMessage); message WM_GetMinMaxInfo;
  public
    { Public declarations }
  end;

var
  FrmChaveamento: TFrmChaveamento;
  bCheia: Boolean = False ;
  aConfig: Array of Variant;
  aCompetir: Array of String;
  A,B,C,D,E,F,G,H,I,J,K,L,M,N,O: String;
  ABCDEFGHIJKLMNO: String = '';
  ChaveGeral: String = '';
  cTecla: String;

implementation

{$R *.dfm}

uses Unit1;

procedure TFrmChaveamento.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   if (FrmChaveamento.Height > 640) then
   begin
      with imgLogo do
      begin
         Visible := true ;
         Left := 5;
         top:= 5;
      end;
   end
   else
   begin
      imgLogo.Visible := false;
   end;
end;

procedure TFrmChaveamento.FormDblClick(Sender: TObject);
begin
  pTelaCheia(Not bCheia);
end;

procedure TFrmChaveamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   { Teclas de A - Z }
   If (Key >= 65) And (Key <= 79) Then
      cTecla := UpperCase(Char(Key))

   { CTRL + Enter }
   Else if (Shift = [ssCtrl]) And (Key = 13) then
      lblCampeonatoClick(self)

   { ESC }
   Else if (key = VK_ESCAPE) And (FormStyle = fsStayOnTop) then
      pTelaCheia(Not bCheia)

end;

procedure TFrmChaveamento.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cNumero: String;
begin

   cNumero := Char(Key);  

   {---------------------------------------------------------------------------}   

   if (cTecla ='A') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor1Click(lblCompetidor1)
         else if (cnumero = '2') then 
            lblCompetidor1Click(lblCompetidor2); 
                                     
      End;

   if (cTecla ='B') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor3Click(lblCompetidor3)
         else if (cnumero = '2') then 
            lblCompetidor3Click(lblCompetidor4); 
                                     
      End; 

   if (cTecla ='C') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor5Click(lblCompetidor5)
         else if (cnumero = '2') then 
            lblCompetidor5Click(lblCompetidor6); 
                                     
      End;   

   if (cTecla ='D') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor7Click(lblCompetidor7)
         else if (cnumero = '2') then 
            lblCompetidor7Click(lblCompetidor8); 
                                     
      End;   

   if (cTecla ='E') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor9Click(lblCompetidor9)
         else if (cnumero = '2') then 
            lblCompetidor9Click(lblCompetidor10); 
                                     
      End; 

   if (cTecla ='F') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor11Click(lblCompetidor11)
         else if (cnumero = '2') then 
            lblCompetidor11Click(lblCompetidor12); 
                                     
      End; 

   if (cTecla ='G') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor13Click(lblCompetidor13)
         else if (cnumero = '2') then 
            lblCompetidor13Click(lblCompetidor14); 
                                     
      End;  

   if (cTecla ='H') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor15Click(lblCompetidor15)
         else if (cnumero = '2') then 
            lblCompetidor15Click(lblCompetidor16); 
                                     
      End; 

   {---------------------------------------------------------------------------} 
   
   if (cTecla ='I') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor17Click(lblCompetidor17)
         else if (cnumero = '2') then 
            lblCompetidor17Click(lblCompetidor18); 
                                     
      End; 

   if (cTecla ='J') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor19Click(lblCompetidor19)
         else if (cnumero = '2') then 
            lblCompetidor19Click(lblCompetidor20); 
                                     
      End; 

   if (cTecla ='K') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor21Click(lblCompetidor21)
         else if (cnumero = '2') then 
            lblCompetidor21Click(lblCompetidor22); 
                                     
      End;   

   if (cTecla ='L') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor23Click(lblCompetidor23)
         else if (cnumero = '2') then 
            lblCompetidor23Click(lblCompetidor24); 
                                     
      End;  

   {---------------------------------------------------------------------------}  

   if (cTecla ='M') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor25Click(lblCompetidor25)
         else if (cnumero = '2') then 
            lblCompetidor25Click(lblCompetidor26); 
                                     
      End;  

   if (cTecla ='N') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor27Click(lblCompetidor27)
         else if (cnumero = '2') then 
            lblCompetidor27Click(lblCompetidor28); 
                                     
      End; 
      
   {---------------------------------------------------------------------------} 

   if (cTecla ='O') then
      Begin
      
         if (cnumero = '1') then 
            lblCompetidor29Click(lblCompetidor29)
         else if (cnumero = '2') then 
            lblCompetidor29Click(lblCompetidor30); 
                                     
      End;                                      

end;

procedure TFrmChaveamento.FormResize(Sender: TObject);
begin
   PnlChave.Left := (FrmChaveamento.Width  - PnlChave.Width ) DIV 2;
   PnlChave.Top  := (FrmChaveamento.Height - PnlChave.Height) DIV 2;
end;

procedure TFrmChaveamento.FormShow(Sender: TObject);
begin

   FrmChaveamento.Color := TColor(RGB(68, 68,68));
   PnlChave.Color       := FrmChaveamento.Color;
   
   SetLength(aConfig, 6);
   lblCampeonato.Caption := '    ' + FrmMain.TxtNomeCamp.Text;

end;

procedure TFrmChaveamento.lblCampeonatoClick(Sender: TObject);
begin
   if Trim(lblCompetidor17.Caption) = '' then
      begin
         pEmbaralhar(16);
         pChave1();
      end;
end;

procedure TFrmChaveamento.lblCompetidor11Click(Sender: TObject);
begin

   F := Trim((Sender As TLabel).Caption);

   lblCompetidor11.Font.Color := clWindow;
   lblCompetidor12.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor13Click(Sender: TObject);
begin

   G := Trim((Sender As TLabel).Caption);

   lblCompetidor13.Font.Color := clWindow;
   lblCompetidor14.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor15Click(Sender: TObject);
begin

   H := Trim((Sender As TLabel).Caption);

   lblCompetidor15.Font.Color := clWindow;
   lblCompetidor16.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow; 
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor17Click(Sender: TObject);
begin

   I := Trim((Sender As TLabel).Caption);

   lblCompetidor17.Font.Color := clWindow;
   lblCompetidor18.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(3);

end;

procedure TFrmChaveamento.lblCompetidor19Click(Sender: TObject);
begin

   J := Trim((Sender As TLabel).Caption);

   lblCompetidor19.Font.Color := clWindow;
   lblCompetidor20.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(3);

end;

procedure TFrmChaveamento.lblCompetidor1Click(Sender: TObject);
begin

   A := Trim((Sender As TLabel).Caption);

   lblCompetidor1.Font.Color := clWindow;
   lblCompetidor2.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor1MouseLeave(Sender: TObject);
begin
   Screen.Cursor := crDefault ;
end;

procedure TFrmChaveamento.lblCompetidor1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Screen.Cursor := crHandPoint ;
end;

procedure TFrmChaveamento.lblCompetidor21Click(Sender: TObject);
begin

   K := Trim((Sender As TLabel).Caption);

   lblCompetidor21.Font.Color := clWindow;
   lblCompetidor22.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(3);

end;

procedure TFrmChaveamento.lblCompetidor23Click(Sender: TObject);
begin

   L := Trim((Sender As TLabel).Caption);

   lblCompetidor23.Font.Color := clWindow;
   lblCompetidor24.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(3);

end;

procedure TFrmChaveamento.lblCompetidor25Click(Sender: TObject);
begin

   M := Trim((Sender As TLabel).Caption);

   lblCompetidor25.Font.Color := clWindow;
   lblCompetidor26.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow; 
   pGerarProximaChave(4);

end;

procedure TFrmChaveamento.lblCompetidor27Click(Sender: TObject);
begin

   N := Trim((Sender As TLabel).Caption);

   lblCompetidor27.Font.Color := clWindow;
   lblCompetidor28.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(4);

end;

procedure TFrmChaveamento.lblCompetidor29Click(Sender: TObject);
begin

   O := Trim((Sender As TLabel).Caption);

   lblCompetidor29.Font.Color := clWindow;
   lblCompetidor30.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(5);

end;

procedure TFrmChaveamento.lblCompetidor3Click(Sender: TObject);
begin

    B := Trim((Sender As TLabel).Caption);

   lblCompetidor3.Font.Color := clWindow;
   lblCompetidor4.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor5Click(Sender: TObject);
begin

   C := Trim((Sender As TLabel).Caption);

   lblCompetidor5.Font.Color := clWindow;
   lblCompetidor6.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow; 
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor7Click(Sender: TObject);
begin

   D := Trim((Sender As TLabel).Caption);

   lblCompetidor7.Font.Color := clWindow;
   lblCompetidor8.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.lblCompetidor9Click(Sender: TObject);
begin

   E := Trim((Sender As TLabel).Caption);

   lblCompetidor9.Font.Color := clWindow;
   lblCompetidor10.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento.pChave1;
begin
   lblCompetidor1.Caption  := aCompetir[0];
   lblCompetidor2.Caption  := aCompetir[1];
   lblCompetidor3.Caption  := aCompetir[2];
   lblCompetidor4.Caption  := aCompetir[3];
   lblCompetidor5.Caption  := aCompetir[4];
   lblCompetidor6.Caption  := aCompetir[5];
   lblCompetidor7.Caption  := aCompetir[6];
   lblCompetidor8.Caption  := aCompetir[7];
   lblCompetidor9.Caption  := aCompetir[8];
   lblCompetidor10.Caption := aCompetir[9];
   lblCompetidor11.Caption := aCompetir[10];
   lblCompetidor12.Caption := aCompetir[11];
   lblCompetidor13.Caption := aCompetir[12];
   lblCompetidor14.Caption := aCompetir[13];
   lblCompetidor15.Caption := aCompetir[14];
   lblCompetidor16.Caption := aCompetir[15];
end;

procedure TFrmChaveamento.pChave2;
begin
   lblCompetidor17.Caption := aCompetir[0];
   lblCompetidor18.Caption := aCompetir[1];
   lblCompetidor19.Caption := aCompetir[2];
   lblCompetidor20.Caption := aCompetir[3];
   lblCompetidor21.Caption := aCompetir[4];
   lblCompetidor22.Caption := aCompetir[5];
   lblCompetidor23.Caption := aCompetir[6];
   lblCompetidor24.Caption := aCompetir[7];
end;

procedure TFrmChaveamento.pChave3;
begin
   lblCompetidor25.Caption := aCompetir[0];
   lblCompetidor26.Caption := aCompetir[1];
   lblCompetidor27.Caption := aCompetir[2];
   lblCompetidor28.Caption := aCompetir[3];
end;

function TFrmChaveamento.fChaveMudou():Boolean;
begin

   result := false ;
   ChaveGeral := A + B + C + D + E + F + G + H +
                 I + J + K + L + M + N + O ;

   If ABCDEFGHIJKLMNO <> ChaveGeral Then
      begin
         ABCDEFGHIJKLMNO := ChaveGeral;
         result := True;
      end;

end;

procedure TFrmChaveamento.pEmbaralhar(nQuant: Integer);
var nGerou, nCount: Integer;
    cAux: String;
begin

   Screen.Cursor := crHourGlass;

   nGerou := 0 ;
   nCount := 0 ;
   SetLength(aCompetir, 0);
   SetLength(aCompetir, nQuant);
   While nGerou < nQuant Do
      Begin

         if FrmMain.ChkEmbaralhar.Checked then
            cAux := aCompetidor[Random(nQuant)]
         else
            cAux := aCompetidor[nCount];

         If AnsiIndexStr(cAux, aCompetir) = - 1 Then
            Begin
               aCompetir[nGerou] := cAux;
               nGerou := nGerou + 1;
            End;

         nCount := nCount + 1;

      End;

   Screen.Cursor := crDefault;
end;

procedure TFrmChaveamento.pGerarProximaChave(nChave: Integer);

   procedure Quartas();
   begin

      If (Trim(A) = '') Or (Trim(B) = '') Or (Trim(C) = '') Or (Trim(D) = '') Or
         (Trim(E) = '') Or (Trim(F) = '') Or (Trim(G) = '') Or (Trim(H) = '') Then
         Exit();

      SetLength(aCompetir, 8);
      aCompetidor[0] := A ; aCompetidor[1] := B ; aCompetidor[2] := C ;
      aCompetidor[3] := D ; aCompetidor[4] := E ; aCompetidor[5] := F ;
      aCompetidor[6] := G ; aCompetidor[7] := H ;

      pEmbaralhar(8);
      pChave2();

   end;

   procedure SemiFinal();
   begin

       If (Trim(I) = '') Or (Trim(J) = '') Or
          (Trim(K) = '') Or (Trim(L) = '') Then
         Exit();

       SetLength(aCompetir, 4);
       aCompetidor[0] := I ; aCompetidor[1] := J ;
       aCompetidor[2] := K ; aCompetidor[3] := L ;

       pEmbaralhar(4);
       pChave3();

   end;

   procedure Fim();
   begin

       If (Trim(M) = '') Or (Trim(N) = '') Then
         Exit();

       lblCompetidor29.Caption := M;
       lblCompetidor30.Caption := N;

   end;

begin

   If Not fChaveMudou() then  Exit();
           
   Case nChave of

      2: Quartas();
      3: SemiFinal();
      4: Fim();

   End;
  cTecla := '' ;   

end;

procedure TFrmChaveamento.pLimpar;
begin
   lblCampeonato.Caption   := '';
   lblCompetidor1.Caption  := ''; lblCompetidor2.Caption  := ''; lblCompetidor3.Caption  := '';
   lblCompetidor4.Caption  := ''; lblCompetidor5.Caption  := ''; lblCompetidor6.Caption  := '';
   lblCompetidor7.Caption  := ''; lblCompetidor8.Caption  := ''; lblCompetidor9.Caption  := '';
   lblCompetidor10.Caption := ''; lblCompetidor11.Caption := ''; lblCompetidor12.Caption := '';
   lblCompetidor13.Caption := ''; lblCompetidor14.Caption := ''; lblCompetidor15.Caption := '';
   lblCompetidor16.Caption := ''; lblCompetidor17.Caption := ''; lblCompetidor18.Caption := '';
   lblCompetidor19.Caption := ''; lblCompetidor20.Caption := ''; lblCompetidor21.Caption := '';
   lblCompetidor22.Caption := ''; lblCompetidor23.Caption := ''; lblCompetidor24.Caption := '';
   lblCompetidor25.Caption := ''; lblCompetidor26.Caption := ''; lblCompetidor27.Caption := '';
   lblCompetidor28.Caption := ''; lblCompetidor29.Caption := ''; lblCompetidor30.Caption := '';
end;

procedure TFrmChaveamento.pTelaCheia(bTela: Boolean);
begin

   If bTela Then
      Begin

         With FrmChaveamento Do
            Begin
               aConfig[0] := BorderStyle;
               aConfig[1] := FormStyle;
               aConfig[2] := Left;
               aConfig[3] := Top;
               aConfig[4] := Height;
               aConfig[5] := Width;
            End;

         With FrmChaveamento Do
            Begin
               BorderStyle := bsNone;
               FormStyle := fsStayOnTop;
               Left := 0;
               Top  := 0;
               Height := Screen.Height;
               Width := Screen.Width;
            End;

         bCheia := True ;

      End
   Else
      Begin

         With FrmChaveamento Do
            Begin
               BorderStyle := aConfig[0];
               FormStyle   := aConfig[1];
               Left        := aConfig[2];
               Top         := aConfig[3];
               Height      := aConfig[4];
               Width       := aConfig[5];
            End;

         bCheia := False ;

      End;

end;

procedure TFrmChaveamento.WMGetMinMaxInfo(var MSG: TMessage);
begin

   inherited;
   with PMinMaxInfo(MSG.lparam)^ do
      begin
         ptMinTRackSize.X := 1081;
         ptMinTRackSize.Y := 527;
      end;

end;

end.
