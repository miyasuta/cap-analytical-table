using CatalogService from './cat-service';

//aggregation annotations
// v4
annotate CatalogService.BooksAggregate with @(
  Aggregation.ApplySupported: {
    GroupableProperties: [
      ID,
      title,
      category
    ]
  },
  Aggregation.CustomAggregate #stock: 'Edm.Int32'
){
  stock @Analytics.Measure @Aggregation.default: #SUM
}

// v2
annotate CatalogService.BooksAggregate with @(
  sap.semantics: 'aggregate'
){
  ID @sap.aggregation.role: 'dimension';
  category @sap.aggregation.role: 'dimension';
  title @sap.aggregation.role: 'dimension';
  stock @sap.aggregation.role: 'measure';
};

// //unit of measure annotations
// // v4
// annotate CatalogService.BooksAggregate with {
//     stock @Measures.Unit: unit
// };

// // v2
// annotate CatalogService.BooksAggregate with {
//     stock @sap.unit: 'unit';
//     unit @sap.semantics : 'unit-of-measure'
// }

//ui annotations
annotate CatalogService.BooksAggregate with@(
    UI: {
          PresentationVariant: {
            Total: [
              stock
            ],
            Visualizations: [
              '@UI.LineItem'
            ]
          },
          SelectionFields  : [
              category,
              title
          ],
        LineItem: [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
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
        ],
    }
);

//ui annotations for grouping
// annotate CatalogService.BooksAggregate with@(
//         SelectionPresentationVariant  : {
//             $Type : 'UI.SelectionPresentationVariantType',
//             SelectionVariant : {
//                 $Type : 'UI.SelectionVariantType',
//                 SelectOptions: []                
//             },
//             PresentationVariant : {
//                 $Type : 'UI.PresentationVariantType',
//                 GroupBy: [
//                     'category'
//                 ]            ,
//                 Visualizations: [
//                     '@UI.LineItem'
//                 ]
//             }
//         },
// );