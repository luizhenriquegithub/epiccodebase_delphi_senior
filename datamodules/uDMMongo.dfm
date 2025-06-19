object DMMongo: TDMMongo
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 354
  Width = 572
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=cluster0.zz4o0gv.mongodb.net'
      'Database=sample_os'
      'User_Name=luizmpnet'
      'UseSRV=True'
      'Password=341xJdUZfj7yG94m'
      'DriverID=Mongo')
    Connected = True
    Left = 96
    Top = 48
  end
  object DataSource: TDataSource
    AutoEdit = False
    DataSet = FDMongoQuery
    Left = 96
    Top = 232
  end
  object FDMongoQuery: TFDMongoQuery
    Connection = FDConnection
    DatabaseName = 'sample_os'
    CollectionName = 'status'
    Left = 104
    Top = 136
  end
end
