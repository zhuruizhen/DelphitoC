unit VsAndDelphi;

interface

{$IF CompilerVersion < 23}
  ->   Requiires Delphi XE2 or later
{$IFEND}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    lblFirstValue: TLabel;
    edFirstValue: TEdit;
    lblSecondValue: TLabel;
    edSecondValue: TEdit;
    btAddValues: TButton;
    GroupBox2: TGroupBox;
    lblCaption: TLabel;
    lblMessage: TLabel;
    edCaption: TEdit;
    edMessage: TEdit;
    btShowMessage: TButton;
    lblDispStrings: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    lblPubIntVar: TLabel;
    edPublicIntVal: TEdit;
    btGeetCVars: TButton;
    btGetString: TButton;
    lblPublicStrVar: TLabel;
    edPublicStrVal: TEdit;
    procedure btAddValuesClick(Sender: TObject);
    procedure btShowMessageClick(Sender: TObject);
    procedure btGeetCVarsClick(Sender: TObject);
    procedure btGetStringClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
type
bigarray = array[0..127] of char;

{$IFDEF CPUX86}
{$L CtoDelphi32.obj}
   function _addNumbers(value1 : integer; value2: integer):integer;cdecl;external;
   function _wcscpy_s(S1:PChar; count: size_t; S2: PChar): Integer; cdecl; external 'msvcrt.dll' name 'wcscpy_s';
   function _wcscat_s(S1:PChar; count: size_t; S2: PChar): Integer; external 'msvcrt.dll' name 'wcscat_s';
   procedure _cShowGetMessage(incaption: string; intext:string; size : integer; var retVal: bigArray);cdecl;external;
   function _MessageBoxW2(theHwnd:HWND; lpText : PWideCHAR; lpCaption : PWideCHAR; uType:UINT):integer; cdecl;
   procedure  _publicCInteger;external;
   procedure _publicCArray;external;
// Public variable to be accessed from C
   var
      _myDelphiPublicIntVariable : integer;
      _myDelphiPublicStrVariable : string;
{$ELSE}
  {$IFDEF CPUX64}
{$L CtoDelphi64.obj}
  function addNumbers(value1 : integer; value2: integer):integer;external;
  procedure cShowGetMessage(incaption:string; intext:string; size : integer; var retVal: bigArray);external;
  function wcscpy_s(S1:PChar; count: size_t; S2: PChar): Integer; external 'msvcrt.dll' name 'wcscpy_s';
  function wcscat_s(S1:PChar; count: size_t; S2: PChar): Integer; external 'msvcrt.dll' name 'wcscat_s';
  procedure  publicCInteger;external;
  procedure publicCArray;external;
// Public variable to be accessed from C
  var
      myDelphiPublicIntVariable : integer;
      myDelphiPublicStrVariable : string;
 {$ENDIF}
{$ENDIF}

implementation

{$R *.dfm}

procedure TForm2.btGeetCVarsClick(Sender: TObject);
var
   myCInt : integer;
begin
{$IFDEF CPUX86}
    myCInt := integer((@_publicCInteger)^);
    showMessage(inttostr(myCInt));
{$ELSE}
  {$IFDEF CPUX64}
    myCInt := integer((@publicCInteger)^);
    showMessage(inttostr(myCInt));
 {$ENDIF}
{$ENDIF}
end;

procedure TForm2.btGetStringClick(Sender: TObject);
var
  myCArray : pchar;
begin
{$IFDEF CPUX86}
     myCArray := pchar((@_publicCArray)^);
     showMessage(myCArray);
{$ELSE}
  {$IFDEF CPUX64}
     myCArray := pchar((@publicCArray)^);
     showMessage(myCArray);
 {$ENDIF}
{$ENDIF}
end;

procedure TForm2.btAddValuesClick(Sender: TObject);
var
  retValue : integer;
  value1, value2 : integer;
begin
    value1 := strToInt(edFirstValue.Text);
    value2 := strToInt(edSecondValue.Text);
{$IFDEF CPUX86}
    _myDelphiPublicIntVariable := strToInt(edPublicIntVal.Text);
    retValue := _addNumbers(value1, value2);
{$ELSE}
  {$IFDEF CPUX64}
    myDelphiPublicIntVariable := strToInt(edPublicIntVal.Text);
    retValue := addNumbers(value1, value2);
  {$ENDIF}
{$ENDIF}
    showMessage('Sum is '+inttoStr(retValue));
end;

procedure TForm2.btShowMessageClick(Sender: TObject);
var
  retVal : bigArray;
  arrayLength : integer;
begin
      arrayLength := length(retVal);
{$IFDEF CPUX86}
      _myDelphiPublicStrVariable := edPublicStrVal.Text;
      _cShowGetMessage(edCaption.Text, edMessage.Text, arrayLength, retVal);
{$ELSE}
  {$IFDEF CPUX64}
      myDelphiPublicStrVariable := edPublicStrVal.Text;
      cShowGetMessage(edCaption.Text, edMessage.Text, arrayLength, retVal);
  {$ENDIF}
{$ENDIF}
      showMessage(retVal);
end;

function _MessageBoxW2(theHwnd:HWND; lpText : PWideCHAR; lpCaption : PWideCHAR; uType:UINT):integer; cdecl;
begin
  result := MessageBoxW(theHwnd, lpText, lpCaption, uType);
end;

end.


