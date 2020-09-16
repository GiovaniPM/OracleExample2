unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, IniFiles;

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
    procedure FormActivate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.FormActivate(Sender: TObject);
const
  C_DB_SECTION = 'DB-INFO';
var
  INI: TINIFile;
begin
  INI := TINIFile.Create('DB.ini');
  try
    Edit1.Caption := INI.ReadString(C_DB_SECTION,'DatabaseName','');
    Edit2.Caption := INI.ReadString(C_DB_SECTION,'HostName','');
    Edit3.Caption := INI.ReadString(C_DB_SECTION,'UserName','');
    Edit4.Caption := INI.ReadString(C_DB_SECTION,'Password','');
  finally
    INI.Free;
  end;
end;

end.

