-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255)
);


-- Medicamento [ent1]
create table `medicamento` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
);


-- CentroReceptor [ent2]
create table `centroreceptor` (
   `direccion`  varchar(255)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `group_oid`  integer not null,
  primary key (`group_oid`)
);
alter table `user_group`   add index fk_user_group_user (), add constraint fk_user_group_user foreign key () references `user` ();
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- CentroReceptor_Medicamento [rel1]
create table `centroreceptor_medicamento` (
   `medicamento_oid`  integer not null,
  primary key (`medicamento_oid`)
);
alter table `centroreceptor_medicamento`   add index fk_centroreceptor_medicament_2 (), add constraint fk_centroreceptor_medicament_2 foreign key () references `centroreceptor` ();
alter table `centroreceptor_medicamento`   add index fk_centroreceptor_medicamento (`medicamento_oid`), add constraint fk_centroreceptor_medicamento foreign key (`medicamento_oid`) references `medicamento` (`oid`);


-- GEN FK: User --> CentroReceptor
alter table `user`   add index fk_user_centroreceptor (), add constraint fk_user_centroreceptor foreign key () references `centroreceptor` ();


