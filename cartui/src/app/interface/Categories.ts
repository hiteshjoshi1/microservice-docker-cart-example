export interface PrimaryCategory {
        "categoryName": string,
        "categoryId": number

}

export  interface SecondaryCategory{        
                "secondaryCatId": number,
                "secondaryCatName": string,
                "tertiaryCategories": [{
                        "id": number,
                        "categoryName": string
                }]
        }  
 