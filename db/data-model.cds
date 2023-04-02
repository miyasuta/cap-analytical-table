namespace my.bookshop;

entity Books {
  key ID : Integer @title: 'ID';
  title  : String @title: 'Title';
  category: String @title: 'Category';
  stock  : Integer @title: 'Stock';
}

entity BooksAggregate as projection on Books {
  ID,
  title,
  category,
  stock
}
