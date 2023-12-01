import { BaseEntity, Column, Entity, ManyToOne, OneToMany, OneToOne, PrimaryColumn, } from 'typeorm';
import { ServiceEntity } from './service.entity';
import { UserEntity } from './user.entity';

@Entity({ name: 'VEHICLE', schema: 'dbexcalibur.dbo' })
export class VehicleEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'PLACA', type: 'varchar' })
  placa: string;

  
  @Column({ name : 'OWNER_ID', type: 'bigint' })
  owner: number;

  @Column({ name : 'BRAND', type: 'varchar' })
  brand: string;

  @Column({ name : 'COLOR', type: 'varchar' })
  color: string;

  @Column({ name : 'MODELO', type: 'varchar' })
  model: string;

  @OneToMany(type => ServiceEntity, service => service.vehicle)
  service : ServiceEntity;

  static getVehicleByPlaca(placa : string ){
    
    return this.createQueryBuilder('vehicle')
        .where('vehicle.placa = :placa', {placa})
        .getMany();
  }

}