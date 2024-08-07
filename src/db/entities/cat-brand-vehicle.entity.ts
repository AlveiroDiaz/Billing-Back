import { BaseEntity, Column, Entity, PrimaryColumn, } from 'typeorm';

@Entity({ name: 'CAT_BRAND_VEHICLE' })
export class CatBrandVehicleEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'NAME', type: 'varchar' })
  name: string;

  @Column({ name : 'SLUG', type: 'varchar' })
  slug: string;

  static getAllBrands() {
    return this.createQueryBuilder('brands')
      .getMany();
  }
  


}