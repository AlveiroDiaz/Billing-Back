import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, PrimaryColumn,getManager } from 'typeorm';
import { CatServicesEntity } from './cat-services.entity';
import { UserEntity } from './user.entity';
import { VehicleEntity } from './vehicle.entity';

@Entity({ name: 'services' })
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

  static getServiceById(serviceId : number ){
    return this.createQueryBuilder('service')
        .where('service.id = :serviceId', {serviceId})
        .getOne();
  }

  

}