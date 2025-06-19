inherited FrmStatusOS: TFrmStatusOS
  Caption = 'Status da OS'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 9
    Top = 17
    Width = 599
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    DataSource = DMMongo.DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = '_id'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 250
        Visible = True
      end>
  end
end
