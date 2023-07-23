import { getConnectionSql } from "../db/connection"
import { CustomerEntity } from "../db/entities/customers.entity";

export class CustomerService {
    static async getCustomers(){
        console.log("Starting method getCustomers")
        await getConnectionSql();
        const result = await  CustomerEntity.getCustomers();
        console.log("Ending method getCustomers")
        return result
    }
}