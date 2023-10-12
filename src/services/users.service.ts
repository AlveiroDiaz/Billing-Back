import { getConnectionSql } from "../db/connection"
import { UserEntity } from "../db/entities/user.entity";

export class UsersService {
    
    static async getUsersByPhone(phone : string){
        console.log("Starting method getUsersByPhone")
        await getConnectionSql();
        const result = await UserEntity.getUsersByPhone(phone);
        console.log("Ending method getUsersByPhone")
        return result
    }

    static async getUsersByRole(role : string, page: number, perPage: number){
        console.log("Starting method getUsersByRole")
        await getConnectionSql();
        try {
            const result = await UserEntity.getUsersByRole(role,page,perPage);   
            console.log("Ending method getUsersByRole")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
        
        
    }


}