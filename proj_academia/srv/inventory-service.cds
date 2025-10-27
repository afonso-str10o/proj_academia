using eco from '../db/data-model';

service InventoryService {
    entity Products as projection on eco.Product;
    entity StockEntries as projection on eco.StockEntry;
    entity Suppliers as projection on eco.Supplier;
}