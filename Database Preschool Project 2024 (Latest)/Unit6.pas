unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.jpeg, StudentInformation, DataModule,
  Vcl.Grids, Vcl.DBGrids, StudentAttendance;

type
  TForm6 = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    img2: TImage;
    img3: TImage;
    procedure img1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.img1Click(Sender: TObject);
begin

  img1.Picture.LoadFromFile('button_start1.png');
  tmr1.Enabled := True;
  Form6.Visible := false;
  Form1.visible := true;


end;

procedure TForm6.img2Click(Sender: TObject);
begin

  Form2.Visible := True;
  Form6.Visible := false;
end;

procedure TForm6.img3Click(Sender: TObject);
begin
  Form1.Visible := true;
  Form6.Visible := false;

end;

procedure TForm6.tmr1Timer(Sender: TObject);
begin
  img1.Picture.LoadFromFile('button_start2.png');

  tmr1.Enabled := false;
end;

end.
