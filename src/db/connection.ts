import { DataSource } from "typeorm";
import { CustomerEntity } from "./entities/customers.entity";
import { UserEntity } from "./entities/user.entity";

const AppDataSource = new DataSource({
  type: "mssql",
  host: "localhost",
  port: 1433,
  username: "juanchito",
  password: "123",
  database: "Billing",
  entities: [CustomerEntity, UserEntity],
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
  synchronize: false,
});

export async function getConnectionSql() {
  if (!AppDataSource.isInitialized) {
    await AppDataSource.initialize()
      .then(() => {
        console.log("Se conecto!");
        return AppDataSource;
      })
      .catch((err) => {
        console.log(err);
      });
  } else {
    return AppDataSource;
  }
}
