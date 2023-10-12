import { BaseEntity, Column, Entity, ManyToOne, PrimaryColumn, } from 'typeorm';
import { CatServicesEntity } from './cat-services.entity';
import { UserEntity } from './user.entity';
import { VehicleEntity } from './vehicle.entity';

@Entity({ name: 'SERVICES', schema: 'dbexcalibur.dbo' })
export class ServiceEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @ManyToOne(type => UserEntity, user => user.worker)
  @Column({ name : 'WORKER_ID', type: 'bigint' })
  worker: number;

  @ManyToOne(type => CatServicesEntity, catServices => catServices.service)
  @Column({ name : 'SERVICE', type: 'bigint' })
  service: string;

  @Column({ name : 'CREATION_DATE', type: 'date' })
  creationDate: string;

  @Column({ name : 'STATUS', type: 'varchar' })
  status: string;

  @ManyToOne(type => VehicleEntity, vehicle => vehicle.service)
  @Column({ name : 'VEHICLE', type: 'bigint' })
  vehicle: number;

  static getUsersByPhone(phone : string ){
    return this.createQueryBuilder('users').
        where('users.phone = :phone', {phone})
        .getMany();
}

}