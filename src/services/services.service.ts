import { CatServicesEntity } from "../db/entities/cat-services.entity";
import { getConnectionSql } from "../db/connection";
import { ServiceEntity } from "../db/entities/service.entity";
import { obtenerDiasDeLaSemanaEntreFechas, obtenerClaveParaFecha } from "../utils/dates.util"



export class ServicesService {

    static async getCatServices() {
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

    static async getServices() {
        console.log("Starting method getServices")
        const connection = await getConnectionSql();
        try {
            const result = await connection.query("CALL SpGetActiveServices");
            console.log("Ending method getServices",result)
            return result[0];
        } catch (error) {
            console.log(">>>>>>", error);

        }
    }

    static async createService(userId: number, serviceId: number, status: string, vehicleId: number) {
        console.log("Starting method createService");

        try {

            const service: ServiceEntity = new ServiceEntity;
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

    static async modificateStatusService(serviceid: number, status: string) {
        console.log("Starting method createService");
        try {
            await getConnectionSql();
            const service = await ServiceEntity.getServiceById(serviceid);
            service.status = status;
            const result = await ServiceEntity.save(service);
            console.log("Ending method createService")
            return result
        } catch (error) {
            console.log(">>>>>>", error);
        }
    }

    static async getServiceByDate(startDate: String, endDate :String, workerId: number){

        const connection = await getConnectionSql();
    
        console.log(">>>>>>", startDate, "fsdfsdf", endDate);
        

        const result = await connection.query("CALL SpGetTotalServicesByCreationDate(?,?,?)",[startDate,endDate,workerId]);

        console.log("<<<<<", result);
        
        const objetoConFechas = await obtenerDiasDeLaSemanaEntreFechas(startDate, endDate);

        console.log(">>>>> objeto",objetoConFechas);
        
      
        try {
  
          for (const resultado of result[0]) {
            console.log(">>>>> rows", resultado);
            const fecha = resultado.CREATION_DATE.toISOString().substr(0, 10);
            console.log("<<<<< date", fecha);
          
            const clave = await obtenerClaveParaFecha(fecha);
            console.log("<<<<< clave", clave);
          
            if (objetoConFechas.hasOwnProperty(clave)) {
              objetoConFechas[clave] += resultado.totalPrecio;
            }
          } 
          
          console.log(">>>>>>>>>", objetoConFechas);
          return objetoConFechas;
        } catch (error) {
          console.error('Error al obtener catálogo de servicios:', error);
          //res.status(500).json({ error: 'Error interno del servidor' });
        }
    }



}