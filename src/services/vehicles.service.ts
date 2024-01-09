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

    static async createVehicle(placa : string, marca : string, modelo : string, color : string, ownerId : number, typeVehicle:number){
        console.log("Starting method createVehicle")
        await getConnectionSql();
        try {

            const vehicle : VehicleEntity = new VehicleEntity();
            vehicle.placa = placa;
            vehicle.color = color;
            vehicle.brand = marca;
            vehicle.model = modelo;
            vehicle.owner = ownerId;
            vehicle.typeVehicle = typeVehicle;

            const result = await  VehicleEntity.save(vehicle);   
            console.log("Ending method createVehicle")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
        
        
    }

    


}