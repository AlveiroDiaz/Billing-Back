import { BaseEntity, Column, Entity, PrimaryColumn, } from 'typeorm';

@Entity({ name: 'cat_brand_vehicle' })
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