import { CatServicesEntity } from "../db/entities/cat-services.entity";
import { getConnectionSql } from "../db/connection";
import { ServiceEntity } from "../db/entities/service.entity";
import { VehicleEntity } from "../db/entities/vehicle.entity";
import { CatBrandVehicleEntity } from "../db/entities/cat-brand-vehicle.entity";
import { CatModelVehicleEntity } from "db/entities/cat-model-vehicle.entity";

export class CatalogsService {
    

    static async getAllBrands(){
        console.log("Starting method getAllBrands")
        await getConnectionSql();
        try {
            const result = await  CatBrandVehicleEntity.getAllBrands();   
            console.log("Ending method getAllBrands")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
    }

    static async getModelsByBrandId(brandId:number){
        console.log("Starting method getAllModels")
        const connection = await getConnectionSql();
        try {
            const result = await connection.query("CALL SpGetModelsByBrand(?)",[brandId]);
            return result[0]
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
    }

    
    
    


}