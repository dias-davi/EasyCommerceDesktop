unit DB.Connection;

interface

uses
  FireDAC.Comp.Client,
  DB.DataModule;

function GetConnection: TFDConnection;

implementation

function GetConnection: TFDConnection;
begin
  if not Assigned(dmDB) then
    dmDB := TdmDB.Create(nil);

  if not dmDB.FDConnection.Connected then
    dmDB.FDConnection.Open();

  Result := dmDB.FDConnection;
end;

end.
