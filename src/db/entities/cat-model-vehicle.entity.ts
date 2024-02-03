import { BaseEntity, Column, Entity, PrimaryColumn, } from 'typeorm';

@Entity({ name: 'cat_model_vehicle' })
export class CatModelVehicleEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'ID_MARCA', type: 'varchar' })
  brand: string;

  @Column({ name : 'NAME', type: 'varchar' })
  name: string;

  @Column({ name : 'SLUG', type: 'varchar' })
  slug: string;

  static getAllModels() {
    return this.createQueryBuilder('brands')
      .getMany();
  }

}