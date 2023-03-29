namespace my.bookshop;

entity Books {
  key ID : Integer @title: 'ID';
  title  : String @title: 'Title';
  category: String @title: 'Category';
  stock  : Integer @title: 'Stock';
  unit: String @title: 'Unit of Measure'
}

@Aggregation.CustomAggregate#stock : 'Edm.Decimal'
@Aggregation.ApplySupported: {
  GroupableProperties: [ID, title, category],
    Transformations: [
      'aggregate',
      'topcount',
      'bottomcount',
      'identity',
      'concat',
      'groupby',
      'filter',
      'expand',
      'top',
      'skip',
      'orderby',
      'search'
    ]
}
entity BooksAggregate as projection on Books {
  ID,
  title,
  category,
  @Analytics.Measure : true
  @Aggregation.default: #SUM
  stock,
  unit
}