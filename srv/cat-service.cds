using my.bookshop as my from '../db/data-model';

service CatalogService {
    @readonly entity Books as projection on my.Books;
    @readonly entity BooksAggregate as projection on my.BooksAggregate;
}

annotate CatalogService.BooksAggregate with@(
    UI: {
        SelectionFields  : [
            category,
            title
        ],
        LineItem: [
            {
                $Type : 'UI.DataField',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
        ]
    }
){
    stock @Measures.Unit: unit
};