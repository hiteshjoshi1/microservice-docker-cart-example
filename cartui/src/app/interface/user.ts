import { Address } from "./address";

export interface User {
        id: number;
        customerName: string;
        customerAge: number;
        membershipId: number;
        customerPhoneNum: number;
        altPhoneNum: number;
        address: Address[];
    

}
