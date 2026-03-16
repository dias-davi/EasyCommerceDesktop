object dmDB: TdmDB
  Height = 200
  Width = 400
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 112
    Top = 80
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Server=localhost'
      'Port=5432'
      'Database=easycommerce'
      'User_Name=postgres'
      'Password=postgres')
    LoginPrompt = False
    Left = 216
    Top = 80
  end
end
