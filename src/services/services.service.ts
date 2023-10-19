import { CatServicesEntity } from "../db/entities/cat-services.entity";
import { getConnectionSql } from "../db/connection";
import { ServiceEntity } from "../db/entities/service.entity";

export class ServicesService {
    


    static async getCatServices(){
        console.log("Starting method getCatServices")
        await getConnectionSql();
        try {
            const result = await CatServicesEntity.getCatServices();   
            console.log("Ending method getCatServices")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
    }

    static async createService(userId: number, serviceId:number, status:string, vehicleId:number){
        console.log("Starting method createService");

        try {

        const service : ServiceEntity = new ServiceEntity;
        service.worker = userId;
        
        const currentDate = new Date();
        currentDate.setHours(currentDate.getHours() - currentDate.getTimezoneOffset() / 60);
        service.creationDate = currentDate;
        service.service = serviceId;
        service.status = status;
        service.vehicle = vehicleId;

        await getConnectionSql();
        const result = await ServiceEntity.save(service);   
        console.log("Ending method createService")
        return result
        
        } catch (error) {
            console.log(">>>>>>", error);
            
        }
    }



}