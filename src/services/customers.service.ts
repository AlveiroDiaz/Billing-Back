import { getConnectionSql } from "../db/connection"


export class CustomerService {
    static async getCustomers(){
        console.log("Starting method getCustomers")
        await getConnectionSql();
        const result = null;
        console.log("Ending method getCustomers")
        return result
    }
}