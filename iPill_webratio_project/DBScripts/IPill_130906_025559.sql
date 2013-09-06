-- GEN FK: User --> CentroReceptor
alter table `user`   add index fk_user_centroreceptor (), add constraint fk_user_centroreceptor foreign key () references `centroreceptor` ();


