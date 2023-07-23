import { Entity, PrimaryGeneratedColumn, Column, BaseEntity, OneToOne, JoinColumn } from "typeorm"
import { UserEntity } from "./user.entity";

@Entity({name:'Customers'})
export class CustomerEntity extends BaseEntity{
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column({ type: 'varchar', length: 20, collation: 'Modern_Spanish_CI_AS', nullable: false })
    documentNumber: string;
  
    @Column({ type: 'varchar', length: 200, collation: 'Modern_Spanish_CI_AS', nullable: false })
    name: string;
  
    @OneToOne(type => UserEntity, user=> user.id)
    @JoinColumn({name: 'OwnerId'})
    ownerId: number;
  
    @Column({ type: 'bigint', nullable: true })
    phone: number;
  
    @Column({ type: 'bigint', nullable: false })
    status: number;
  
    @Column({ type: 'varchar', length: 200, collation: 'Modern_Spanish_CI_AS', nullable: false })
    address: string;
  
    @Column({ type: 'int', nullable: false })
    departamentId: number;
  
    @Column({ type: 'int', nullable: false })
    cityId: number;
  
    @Column({ type: 'bit', nullable: false })
    hasCostCenters: boolean;
  
    @Column({ type: 'bit', nullable: false })
    hasProcessBilling: boolean;
  
    @Column({ type: 'bigint', nullable: false })
    creationUserId: number;
  
    @Column({ type: 'datetime', nullable: false })
    createDate: Date;
  
    @Column({ type: 'datetime', nullable: true })
    updateDate: Date;
  
    @Column({ type: 'datetime', nullable: true })
    deleteDate: Date;


    static getCustomers(){
        return this.createQueryBuilder('customers').
            leftJoinAndSelect('customers.ownerId', 'owner').
            getMany();
    }
}