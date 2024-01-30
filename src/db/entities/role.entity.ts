import { BaseEntity, Column, Entity, ManyToMany, ManyToOne, OneToMany, OneToOne, PrimaryColumn, } from 'typeorm';
import { ServiceEntity } from './service.entity';
import { VehicleEntity } from './vehicle.entity';
import { UserEntity } from './user.entity';

@Entity({ name: 'ROLES' })
export class RolesEntity extends BaseEntity{

  @PrimaryColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'NAME', type: 'varchar' })
  name: string;

  @OneToMany(type => UserEntity, user => user.role)
  userRole : UserEntity;

  static getRoleById(roleId : number ){
    return this.createQueryBuilder('role')
        .where('role.id = :roleId', {roleId})
        .getOne();
  }



}