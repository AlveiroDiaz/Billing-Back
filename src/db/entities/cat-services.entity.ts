import { BaseEntity, Column, Entity, OneToMany, PrimaryColumn, } from 'typeorm';
import { ServiceEntity } from './service.entity';

@Entity({ name: 'cat_services'})
export class CatServicesEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'NAME', type: 'varchar' })
  name: string;

  @Column({ name : 'DESCRIPTION', type: 'varchar' })
  description: string;

  @Column({ name : 'PRICE', type: 'varchar' })
  price: string;

  @Column({ name : 'TYPE_VEHICLE'})
  typeVehicle: number;

  @OneToMany(type => ServiceEntity, service => service.service)
  service : ServiceEntity;

  static getCatServices(typeVehicle){
    return this.createQueryBuilder('catService')
        .where('catService.typeVehicle = :typeVehicle', { typeVehicle })
        .getMany();
  }

  

}