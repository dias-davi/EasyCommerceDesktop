unit DB.DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.VCLUI.Wait, Data.DB;

type
  TdmDB = class(TDataModule)
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection: TFDConnection;
  private

  public

  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
