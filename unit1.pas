unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  IniFiles, BlowFish;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToggleBox1: TToggleBox;
    function EncryptString(aString:string):string;
    function DecryptString(aString:string):string;
    procedure FormActivate(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

var
  DatabaseName, HostName, UserName, Password:String;
  Form1: TForm1;

implementation

{$R *.frm}

{ TForm1 }

function TForm1.EncryptString(aString:string):string;
var
  Key:string;
  EncrytpStream:TBlowFishEncryptStream;
  StringStream:TStringStream;
  EncryptedString:string;
begin
  Key := '123D122154523235544fdsdfsdf55asdf41245';
  StringStream := TStringStream.Create('');
  EncrytpStream := TBlowFishEncryptStream.Create(Key,StringStream);
  EncrytpStream.WriteAnsiString(aString);
  EncrytpStream.Free;
  EncryptedString := StringStream.DataString;
  StringStream.Free;
  EncryptString := EncryptedString;
end;

function TForm1.DecryptString(aString:string):string;
var
  Key:string;
  DecrytpStream:TBlowFishDeCryptStream;
  StringStream:TStringStream;
  DecryptedString:string;
begin
  Key := '123D122154523235544fdsdfsdf55asdf41245';
  StringStream := TStringStream.Create(aString);
  DecrytpStream := TBlowFishDeCryptStream.Create(Key,StringStream);
  DecryptedString := DecrytpStream.ReadAnsiString;
  DecrytpStream.Free;
  StringStream.Free;
  DecryptString := DecryptedString;
end;

procedure TForm1.FormActivate(Sender: TObject);
const
  C_DB_SECTION = 'DB-INFO';
var
  INI: TINIFile;
begin
  INI := TINIFile.Create('Config.ini');
  try
    try
      DatabaseName  := INI.ReadString(C_DB_SECTION,'DatabaseName','');
      HostName      := INI.ReadString(C_DB_SECTION,'HostName','');
      UserName      := INI.ReadString(C_DB_SECTION,'UserName','');
      Password      := DecryptString(INI.ReadString(C_DB_SECTION,'Password',''));
      //
      Edit1.Caption := DatabaseName;
      Edit2.Caption := HostName;
      Edit3.Caption := UserName;
      Edit4.Caption := Password;
    except
      on E: Exception do
        ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
    end;
  finally
    INI.Free;
  end;
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
  const
    C_DB_SECTION = 'DB-INFO';
  var
    INI: TINIFile;
begin
    INI := TINIFile.Create('Config.ini');
    try
      INI.WriteString(C_DB_SECTION,'DatabaseName',Edit1.Caption);
      INI.WriteString(C_DB_SECTION,'HostName',Edit2.Caption);
      INI.WriteString(C_DB_SECTION,'UserName',Edit3.Caption);
      INI.WriteString(C_DB_SECTION,'Password',EncryptString(Edit4.Caption));
    finally
      INI.Free;
    end;
end;

end.

