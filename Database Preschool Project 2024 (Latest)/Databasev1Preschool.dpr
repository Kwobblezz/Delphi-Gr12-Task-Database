program Databasev1Preschool;

uses
  Vcl.Forms,
  Unit6 in 'Unit6.pas' {Form6},
  StudentInformation in 'StudentInformation.pas' {Form1},
  DataModule in 'DataModule.pas' {DataModule2: TDataModule},
  StudentAttendance in 'StudentAttendance.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
