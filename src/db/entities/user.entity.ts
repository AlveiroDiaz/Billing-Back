import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity({ name: 'Users', schema: 'Billing.dbo' })
export class UserEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 200, collation: 'Modern_Spanish_CI_AS' })
  email: string;

  @Column({ length: 300, collation: 'Modern_Spanish_CI_AS' })
  password: string;

  @Column({ length: 300, collation: 'Modern_Spanish_CI_AS' })
  firstName: string;

  @Column({ length: 300, collation: 'Modern_Spanish_CI_AS' })
  lastName: string;

  @Column({ type: 'bigint', nullable: true })
  phone: number;

  @Column({ type: 'int', nullable: true })
  configurationId: number;

  @Column({ type: 'bigint' })
  status: number;

  @Column({ type: 'datetime' })
  createDate: Date;

  @Column({ type: 'datetime', nullable: true })
  updateDate: Date;

  @Column({ type: 'datetime', nullable: true })
  deleteDate: Date;
}