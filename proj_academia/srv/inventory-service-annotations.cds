using {InventoryService} from './inventory-service';

annotate InventoryService.Products with @(UI: {
    LineItem: [
        {
            Value: name
        },
        {
            Value: category
        },
        {
            Value: currentStock,
            Criticality: {$edmJson: {$If: [
            //when equals 1
            {$Eq: [
                {$Path: 'currentStock'},
                {$Path: 'minStock'}
            ]},
            //put red
            1,
            0
        ]}}
        },
        {
            Value: minStock
        }
    ],
    SelectionFields: [
        category
    ]
});

annotate InventoryService.Products with @(UI: {
    Facets  : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Product}',
        Target: '@UI.FieldGroup#Product'
    }],

    FieldGroup #Product : {Data: [
        {Value: name},
        {Value: category},
        {Value: currentStock},
        {Value: minStock},
        
    ]},
});