import { createConnection, Connection } from "typeorm";
import { UserEntity } from "./entities/user.entity";
import { CatBrandVehicleEntity } from "./entities/cat-brand-vehicle.entity";
import { CatModelVehicleEntity } from "./entities/cat-model-vehicle.entity";
import { CatServicesEntity } from "./entities/cat-services.entity";
import { ServiceEntity } from "./entities/service.entity";
import { VehicleEntity } from "./entities/vehicle.entity";

let AppConnection: Connection;

export async function getConnectionSql() {
  if (!AppConnection) {
    try {
      AppConnection = await createConnection({
        type: "mysql",
        host: "161.97.132.44",
        port: 3306,
        username: "alveiro",
        password: "1205",
        database: "dbexcalibur",
        entities: [
                  UserEntity,
                  CatBrandVehicleEntity,
                  CatModelVehicleEntity,
                  CatServicesEntity,
                  ServiceEntity,
                  VehicleEntity],
        synchronize: false,
      });

      console.log("Conexión a MySQL establecida correctamente");
    } catch (error) {
      console.error("Error al conectar a MySQL:", error);
      throw error;
    }
  }
  return AppConnection;
}

