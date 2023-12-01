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
        host: "db-lavadero.cam8il4sbzqz.us-east-1.rds.amazonaws.com",
        port: 3306,
        username: "admin",
        password: "Ad1010244059*",
        database: "db_lavadero",
        entities: [UserEntity,
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

