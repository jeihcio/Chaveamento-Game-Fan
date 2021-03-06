unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, StrUtils, Vcl.Imaging.pngimage;

type
  TFrmChaveamento2 = class(TForm)
    PnlChave: TPanel;
    lblCampeonato: TLabel;
    ImgChave: TImage;
    lblCompetidor1: TLabel;
    lblCompetidor2: TLabel;
    lblCompetidor3: TLabel;
    lblCompetidor4: TLabel;
    lblCompetidor5: TLabel;
    lblCompetidor6: TLabel;
    lblCompetidor7: TLabel;
    lblCompetidor8: TLabel;
    lblCompetidor9: TLabel;
    lblCompetidor10: TLabel;
    lblCompetidor11: TLabel;
    lblCompetidor12: TLabel;
    lblCompetidor13: TLabel;
    lblCompetidor14: TLabel;
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
  FrmChaveamento2: TFrmChaveamento2;
  bCheia: Boolean = False ;
  aConfig: Array of Variant;
  aCompetir: Array of String;
  A,B,C,D,E,F,G: String;
  ABCDEFG: String = '';
  ChaveGeral: String = '';
  cTecla: String;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TFrmChaveamento2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin

   if (FrmChaveamento2.Height > 600) then
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

procedure TFrmChaveamento2.FormDblClick(Sender: TObject);
begin
  pTelaCheia(Not bCheia);
end;

procedure TFrmChaveamento2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   If (Key >= 65) And (Key <= 79) Then
      cTecla := UpperCase(Char(Key))
   Else if (Shift = [ssCtrl]) And (Key = 13) then
      lblCampeonatoClick(self)
   Else if (key = VK_ESCAPE) And (FormStyle = fsStayOnTop) then
      pTelaCheia(Not bCheia);   
                  
end;

procedure TFrmChaveamento2.FormKeyUp(Sender: TObject; var Key: Word;
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


end;

procedure TFrmChaveamento2.FormResize(Sender: TObject);
begin
   PnlChave.Left := (FrmChaveamento2.Width  - PnlChave.Width ) DIV 2;
   PnlChave.Top  := (FrmChaveamento2.Height - PnlChave.Height) DIV 2;
end;

procedure TFrmChaveamento2.FormShow(Sender: TObject);
begin

   FrmChaveamento2.Color := TColor(RGB(68, 68,68));
   PnlChave.Color        := FrmChaveamento2.Color;

   SetLength(aConfig, 6);
   lblCampeonato.Caption := '    ' + FrmMain.TxtNomeCamp.Text;

end;

procedure TFrmChaveamento2.lblCampeonatoClick(Sender: TObject);
begin
   if Trim(lblCompetidor9.Caption) = '' then
      begin
         pEmbaralhar(8);
         pChave1();
      end;
end;

procedure TFrmChaveamento2.lblCompetidor11Click(Sender: TObject);
begin

   F := Trim((Sender As TLabel).Caption);

   lblCompetidor11.Font.Color := clWindow;
   lblCompetidor12.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(3);

end;

procedure TFrmChaveamento2.lblCompetidor13Click(Sender: TObject);
begin

   G := Trim((Sender As TLabel).Caption);

   lblCompetidor13.Font.Color := clWindow;
   lblCompetidor14.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(4);

end;

procedure TFrmChaveamento2.lblCompetidor1Click(Sender: TObject);
begin

   A := Trim((Sender As TLabel).Caption);

   lblCompetidor1.Font.Color := clWindow;
   lblCompetidor2.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento2.lblCompetidor1MouseLeave(Sender: TObject);
begin
   Screen.Cursor := crDefault ;
end;

procedure TFrmChaveamento2.lblCompetidor1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Screen.Cursor := crHandPoint ;
end;

procedure TFrmChaveamento2.lblCompetidor3Click(Sender: TObject);
begin

    B := Trim((Sender As TLabel).Caption);

   lblCompetidor3.Font.Color := clWindow;
   lblCompetidor4.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento2.lblCompetidor5Click(Sender: TObject);
begin

   C := Trim((Sender As TLabel).Caption);

   lblCompetidor5.Font.Color := clWindow;
   lblCompetidor6.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow; 
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento2.lblCompetidor7Click(Sender: TObject);
begin

   D := Trim((Sender As TLabel).Caption);

   lblCompetidor7.Font.Color := clWindow;
   lblCompetidor8.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(2);

end;

procedure TFrmChaveamento2.lblCompetidor9Click(Sender: TObject);
begin

   E := Trim((Sender As TLabel).Caption);

   lblCompetidor9.Font.Color := clWindow;
   lblCompetidor10.Font.Color := clWindow;
   (Sender As TLabel).Font.Color := clYellow;
   pGerarProximaChave(3);

end;

procedure TFrmChaveamento2.pChave1;
begin
   lblCompetidor1.Caption  := aCompetir[0];
   lblCompetidor2.Caption  := aCompetir[1];
   lblCompetidor3.Caption  := aCompetir[2];
   lblCompetidor4.Caption  := aCompetir[3];
   lblCompetidor5.Caption  := aCompetir[4];
   lblCompetidor6.Caption  := aCompetir[5];
   lblCompetidor7.Caption  := aCompetir[6];
   lblCompetidor8.Caption  := aCompetir[7];
end;

procedure TFrmChaveamento2.pChave2;
begin
   lblCompetidor9.Caption  := aCompetir[0];
   lblCompetidor10.Caption := aCompetir[1];
   lblCompetidor11.Caption := aCompetir[2];
   lblCompetidor12.Caption := aCompetir[3];
end;

procedure TFrmChaveamento2.pChave3;
begin
   lblCompetidor13.Caption := aCompetir[0];
   lblCompetidor14.Caption := aCompetir[1];
end;

function TFrmChaveamento2.fChaveMudou():Boolean;
begin

   result := false ;
   ChaveGeral := A + B + C + D + E + F + G;

   If ABCDEFG <> ChaveGeral Then
      begin
         ABCDEFG := ChaveGeral;
         result := True;
      end;

end;

procedure TFrmChaveamento2.pEmbaralhar(nQuant: Integer);
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

procedure TFrmChaveamento2.pGerarProximaChave(nChave: Integer);

   procedure SemiFinal();
   begin

       If (Trim(A) = '') Or (Trim(B) = '') Or
          (Trim(C) = '') Or (Trim(D) = '') Then
          Exit();

       SetLength(aCompetir, 4);
       aCompetidor[0] := A ; aCompetidor[1] := B ;
       aCompetidor[2] := C ; aCompetidor[3] := D ;

       pEmbaralhar(4);
       pChave2();

   end;

   procedure Fim();
   begin

       If (Trim(E) = '') Or (Trim(F) = '') Then
          Exit();

       lblCompetidor13.Caption := E;
       lblCompetidor14.Caption := F;

   end;

begin

   If Not fChaveMudou() then  Exit();
           
   Case nChave of

      2: SemiFinal();
      3: Fim();

   End;
  cTecla := '' ;   

end;

procedure TFrmChaveamento2.pLimpar;
begin
   lblCampeonato.Caption   := '';
   lblCompetidor1.Caption  := ''; lblCompetidor2.Caption  := ''; lblCompetidor3.Caption  := '';
   lblCompetidor4.Caption  := ''; lblCompetidor5.Caption  := ''; lblCompetidor6.Caption  := '';
   lblCompetidor7.Caption  := ''; lblCompetidor8.Caption  := ''; lblCompetidor9.Caption  := '';
   lblCompetidor10.Caption := ''; lblCompetidor11.Caption := ''; lblCompetidor12.Caption := '';
   lblCompetidor13.Caption := ''; lblCompetidor14.Caption := ''; 
end;

procedure TFrmChaveamento2.pTelaCheia(bTela: Boolean);
begin

   If bTela Then
      Begin

         With FrmChaveamento2 Do
            Begin
               aConfig[0] := BorderStyle;
               aConfig[1] := FormStyle;
               aConfig[2] := Left;
               aConfig[3] := Top;
               aConfig[4] := Height;
               aConfig[5] := Width;
            End;

         With FrmChaveamento2 Do
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

         With FrmChaveamento2 Do
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

procedure TFrmChaveamento2.WMGetMinMaxInfo(var MSG: TMessage);
begin

   inherited;
   with PMinMaxInfo(MSG.lparam)^ do
      begin
         ptMinTRackSize.X := 1081;
         ptMinTRackSize.Y := 527;
      end;

end;

end.
