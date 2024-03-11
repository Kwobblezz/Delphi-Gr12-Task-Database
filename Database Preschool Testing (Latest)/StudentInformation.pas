unit StudentInformation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, DataModule, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    qry1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
Unit6;

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Visible := false;
  Form6.Visible := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Qry1.Open;
    while not qry1.Eof do
    begin
      cbb1.Items.Add(qry1.FieldByName('FirstName').AsString);
      Qry1.Next;
    end;
  qry1.Close;

end;

end.
