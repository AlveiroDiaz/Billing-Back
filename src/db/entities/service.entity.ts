import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, PrimaryColumn, } from 'typeorm';
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
  @JoinColumn({ name: 'WORKER_ID' })
  worker: number;

  @ManyToOne(type => CatServicesEntity, catServices => catServices.service)
  @JoinColumn({ name: 'SERVICE' })
  service: number;

  @Column({ name : 'CREATION_DATE', type: 'date' })
  creationDate: Date;

  @Column({ name : 'STATUS', type: 'varchar' })
  status: string;

  @ManyToOne(type => VehicleEntity, vehicle => vehicle.service)
  @JoinColumn({ name : 'VEHICLE' })
  vehicle: number;

    

  

}