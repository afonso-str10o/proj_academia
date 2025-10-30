using InventoryService as service from '../../srv/inventory-service';
using from '../../srv/inventory-service-annotations';

annotate service.Products with @(
    UI.HeaderInfo : {
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'InventoryService.changeStock',
            Label : '{i18n>changeStock}',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Value : currentStock,
            Criticality : true,
        },
        {
            $Type : 'UI.DataField',
            Value : minStock,
        },
        {
            $Type : 'UI.DataField',
            Value : supplier.name,
        },
    ],
);

