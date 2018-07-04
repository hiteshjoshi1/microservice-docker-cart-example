export interface Product {
    id: number;
    productName: string;
    quantity: number;
    unitPrice: number;
    purchasePrice: number;
    taxRate: number;
    brandName: string;
    category: {
        id: number;
        categoryName: String;
        controlled: boolean;
        unitType: {
            id: number;
            unitName: string;
        }
    }
}
