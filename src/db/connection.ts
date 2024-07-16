import { createConnection, Connection } from "typeorm";
import { UserEntity } from "./entities/user.entity";
import { CatBrandVehicleEntity } from "./entities/cat-brand-vehicle.entity";
import { CatModelVehicleEntity } from "./entities/cat-model-vehicle.entity";
import { CatServicesEntity } from "./entities/cat-services.entity";
import { ServiceEntity } from "./entities/service.entity";
import { VehicleEntity } from "./entities/vehicle.entity";
import { RolesEntity } from "./entities/role.entity";

let AppConnection: Connection;

export async function getConnectionSql() {
  if (!AppConnection) {
    try {
      AppConnection = await createConnection({
        type: "mysql",
        host: "excalibur-1.c5aqom8mcn2u.us-east-2.rds.amazonaws.com",
        port: 3306,
        username: "admin",
        password: "Q0='5wwCx:1)",
        database: "excalibur",
        entities: [UserEntity,
                  CatBrandVehicleEntity,
                  CatModelVehicleEntity,
                  CatServicesEntity,
                  ServiceEntity,
                  VehicleEntity,
                  RolesEntity],
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

