import { getConnectionSql } from "../db/connection"
import { UserEntity } from "../db/entities/user.entity";

export class UsersService {

    static async createUser( name : string, surName : string,phone: number, role: string, email ?: string){
        console.log("Starting method createUser")
        await getConnectionSql();
        try {
            
            const user : UserEntity = new UserEntity();
            user.name  = name;
            user.surName = surName;
            user.phone = phone;
            user.role = role;
            user.email = email;

            const result = await UserEntity.save(user);
            console.log("Ending method createUser")
            return result;
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
        
    }
    
    static async getUsersByPhone(phone : string){
        console.log("Starting method getUsersByPhone")
        await getConnectionSql();
        const result = await UserEntity.getUsersByPhone(phone);
        console.log("Ending method getUsersByPhone")
        return result
    }

    static async getUsersByRole(role : string){
        console.log("Starting method getUsersByRole")
        await getConnectionSql();
        try {
            const result = await UserEntity.getUsersByRole(role);   
            console.log("Ending method getUsersByRole")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
        
    }

    static async getUsersByRoleHint(role : string, page : number,pageSize: number){
        console.log("Starting method getUsersByRoleHint")
        const connection = await getConnectionSql();
        try {
            const result = await connection.query("CALL SpGetUserVehicles(?,?,?)",[role,page,pageSize]);
            console.log("Ending method getUsersByRoleHint")
            return result[0];
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
        
    }


    


}