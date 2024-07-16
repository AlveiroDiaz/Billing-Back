import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, OneToMany, OneToOne, PrimaryColumn, } from 'typeorm';
import { ServiceEntity } from './service.entity';
import { UserEntity } from './user.entity';

@Entity({ name: 'VEHICLES' })
export class VehicleEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'PLACA', type: 'varchar' })
  placa: string;

  @ManyToOne(type => UserEntity, role => role.ownerVehicle)
  @JoinColumn({ name : 'OWNER_ID'})
  owner: number;

  @Column({ name : 'BRAND', type: 'varchar' })
  brand: string;

  @Column({ name : 'COLOR', type: 'varchar' })
  color: string;

  @Column({ name : 'MODEL', type: 'varchar' })
  model: string;

  @Column({ name : 'TYPE_VEHICLE' })
  typeVehicle: number;

  @OneToMany(type => ServiceEntity, service => service.vehicle)
  service : ServiceEntity;

  static getVehicleByPlaca(placa : string ){
    
    return this.createQueryBuilder('vehicle')
        .where('vehicle.placa = :placa', {placa})
        .getMany();
  }

}