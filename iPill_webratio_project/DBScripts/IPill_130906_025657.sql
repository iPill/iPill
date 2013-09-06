-- GEN FK: CentroReceptor --> User
alter table `centroreceptor`   add index fk_centroreceptor_user (), add constraint fk_centroreceptor_user foreign key () references `user` ();


