using eco from '../db/data-model';

service InventoryService {
    @odata.draft.enabled
    entity Products as projection on eco.Product;
    entity StockEntries as projection on eco.StockEntry
    actions {
        @(
            cds.odata.bindingparameter.name: '_it',
            Common.SideEffects : {TargetProperties: ['_it/*']}
        )
        action lowStock()
    }
    ;


    entity Suppliers as projection on eco.Supplier;
}