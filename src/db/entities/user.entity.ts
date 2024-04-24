import { BaseEntity, Column, Entity, JoinColumn, ManyToMany, ManyToOne, OneToMany, OneToOne, PrimaryColumn, PrimaryGeneratedColumn } from 'typeorm';
import { ServiceEntity } from './service.entity';
import { VehicleEntity } from './vehicle.entity';
import { RolesEntity } from './role.entity';

@Entity({ name: 'users' })
export class UserEntity extends BaseEntity{

  @PrimaryGeneratedColumn({
    name: 'ID'
  })
  id: number;

  @Column({ name : 'EMAIL', type: 'varchar' })
  email: string;

  @Column({ name : 'NAME', type: 'varchar' })
  name: string;

  @Column({ name : 'SURNAME', type: 'varchar' })
  surName: string;

  @Column({ name : 'PHONE', type: 'varchar' })
  phone: number;

  @OneToOne(type => RolesEntity, role => role.userRole)
  @JoinColumn({ name : 'ROLE'})
  role: RolesEntity;

  @OneToMany(type => ServiceEntity, service => service.worker)
  worker : ServiceEntity;

  @ManyToMany(type => VehicleEntity, service => service.owner)
  ownerVehicle : ServiceEntity;

  static getUsersByPhone(phone : string ){
    return this.createQueryBuilder('users')
        .where('users.phone = :phone', {phone})
        .getMany();
}

static getUsersByRole(role: string) {
  return this.createQueryBuilder('users')
     .leftJoin('users.role', 'role')
    .where('role.name = :role', { role })
    .getMany();
}

static getUsersByEmail(email: string) {
  return this.createQueryBuilder('users')
    .where('users.email = :email', { email })
    .getOne();
}





}