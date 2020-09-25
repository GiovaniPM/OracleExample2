---
# Use this template for posts to the internal Docs blog.

title: Oracle Example 2
description: Access Oracle using CodeTyphon IDE
author: Giovani Perotto Mesquita
ms.date: 9/25/2020
ms.custom: public-doc
---

# Oracle access using CodeTyphon

## Summary
How to management ini files, with encryption process.

## Architecture used on this example
- IDE [CodeTyphon 7.20](https://www.pilotlogic.com/sitejoom/index.php/downloads.html?task=download.send&id=123&catid=14&m=0);

## The example
### Design
![Unit1.frm](https://raw.githubusercontent.com/GiovaniPM/OracleExample2/master/Unit1.PNG)
### Code
- File tree
```
.
├── lib
│   └── x86_64-win64
│       ├── project2.compiled
│       ├── project2.o
│       ├── project2.obj
│       ├── project2.res
│       ├── unit1.frm
│       ├── unit1.o
│       └── unit1.ppu
├── Config.ini
├── project2.ctpr
├── project2.ctps
├── project2.exe
├── project2.ico
├── project2.ppr
├── project2.res
├── readme.md
├── unit1.frm
└── unit1.pas
```
- Unit1.pas
``` Pascal
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  IniFiles, BlowFish, LCLType;

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
  DatabaseName, HostName, UserName, Password, PassQuest:String;
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
  C_FILE_NAME = 'Config.ini';
var
  INI: TINIFile;
begin
  Edit1.Caption := '';
  Edit2.Caption := '';
  Edit3.Caption := '';
  Edit4.Caption := '';
  If FileExists(C_FILE_NAME) Then
  begin
    INI := TINIFile.Create(C_FILE_NAME);
    try
      try
        DatabaseName  := INI.ReadString(C_DB_SECTION,'DatabaseName','');
        HostName      := INI.ReadString(C_DB_SECTION,'HostName','');
        UserName      := INI.ReadString(C_DB_SECTION,'UserName','');
        If InputQuery('Old Password', 'Type the current password for the user ' + UserName, TRUE, PassQuest) then
        begin
          if EncryptString(PassQuest) = INI.ReadString(C_DB_SECTION,'Password','') then
            Password      := DecryptString(INI.ReadString(C_DB_SECTION,'Password',''))
          else begin
            Application.MessageBox('Password not match!', 'Error', MB_ICONERROR);
            Form1.Close;
          end;
        end
        else
          Form1.Close;
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
  end
  else
  begin
    Application.MessageBox('File ' + C_FILE_NAME + ' not found!', 'Information', MB_ICONINFORMATION);
    ToggleBox1.Caption := 'Create';
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
      Form1.Close;
    finally
      INI.Free;
    end;
end;

end.
```
- Unit1.frm
``` Pascal
object Form1: TForm1
  Left = 315
  Height = 162
  Top = 156
  Width = 234
  Caption = 'Configura acesso ao DB'
  ClientHeight = 162
  ClientWidth = 234
  OnActivate = FormActivate
  LCLVersion = '7.2'
  object Label1: TLabel
    Left = 8
    Height = 15
    Top = 16
    Width = 80
    Caption = 'DatabaseName'
    ParentColor = False
  end
  object Edit1: TEdit
    Left = 118
    Height = 23
    Top = 8
    Width = 112
    TabOrder = 0
    Text = 'Edit1'
  end
  object Label2: TLabel
    Left = 8
    Height = 15
    Top = 40
    Width = 57
    Caption = 'HostName'
    ParentColor = False
  end
  object Label3: TLabel
    Left = 8
    Height = 15
    Top = 64
    Width = 55
    Caption = 'UserName'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 8
    Height = 15
    Top = 88
    Width = 50
    Caption = 'Password'
    ParentColor = False
  end
  object Edit2: TEdit
    Left = 118
    Height = 23
    Top = 32
    Width = 112
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 118
    Height = 23
    Top = 56
    Width = 112
    TabOrder = 2
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 118
    Height = 23
    Top = 80
    Width = 112
    TabOrder = 3
    Text = 'Edit4'
  end
  object ToggleBox1: TToggleBox
    Left = 152
    Height = 25
    Top = 120
    Width = 75
    Caption = 'Update'
    OnChange = ToggleBox1Change
    TabOrder = 4
  end
end
```

> [!IMPORTANT]
> The database scheme not present in this GitHub.