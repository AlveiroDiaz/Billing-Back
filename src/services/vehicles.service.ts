import { CatServicesEntity } from "../db/entities/cat-services.entity";
import { getConnectionSql } from "../db/connection";
import { ServiceEntity } from "../db/entities/service.entity";
import { VehicleEntity } from "../db/entities/vehicle.entity";

export class VehiclesService {
    


    static async getVehicleByPlaca(placa : string){
        console.log("Starting method getVehicleByPlaca")
        await getConnectionSql();
        try {
            const result = await  VehicleEntity.getVehicleByPlaca(placa);   
            console.log("Ending method getVehicleByPlaca")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
        
        
    }


}