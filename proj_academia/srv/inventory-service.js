const cds = require('@sap/cds');
const { SELECT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');

module.exports = cds.service.impl(async function () {
  const { Products, StockEntries } = this.entities; // obtém as entidades do serviço atual

  // Define o que acontece DEPOIS de criar uma StockEntry
  this.after('CREATE', 'StockEntries', async (entry, req) => {
    // 1️⃣ Vai buscar o produto associado a esta entrada
    const product = await SELECT.one.from(Products).where({ ID: entry.product_ID });
    if (!product) return; // se não existir, sai

    // 2️⃣ Calcula o novo stock
    let newStock = product.currentStock;
    if (entry.type === 'Entrada') newStock += entry.quantity;
    else if (entry.type === 'Saida') newStock -= entry.quantity;

    // 3️⃣ Atualiza o valor no produto
    await UPDATE(Products).set({ currentStock: newStock }).where({ ID: product.ID });

    // 4️⃣ Gera alerta se estiver abaixo do mínimo
    if (newStock < product.minStock) {
      const msg = req._.t('LowStockWarning', { name: product.name, stock: newStock });
      req.warn(msg);
    }
  });

  this.on('changeStock', async (req) => {
    const { amount } = req.data
    const { ID } = req.params[0]

    const product = await SELECT.one.from(Products).where({ ID: ID });
    if (!product) return req.error(404, 'Product ${ID} not found')
    
    const newStock = amount
    const stockEntry = await UPDATE(Products).set({currentStock : newStock}).where({ID})
    
    return stockEntry
  })
});
