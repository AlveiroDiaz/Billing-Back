import { BaseEntity, Column, Entity, OneToMany, PrimaryColumn, } from 'typeorm';
import { ServiceEntity } from './service.entity';

@Entity({ name: 'CAT_BRAND_VEHICLE', schema: 'dbexcalibur.dbo' })
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

  @OneToMany(type => ServiceEntity, service => service.service)
  service : ServiceEntity;


}