/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     03-Sep-17 7:49:18 PM                         */
/*==============================================================*/


drop table if exists CLAN;

drop table if exists GLUMAC;

drop table if exists KREDITNAKARTICA;

drop table if exists OSOBA;

drop table if exists POZORISNIKOMAD;

drop table if exists PREDSTAVA;

drop table if exists PRETPLATNIK;

drop table if exists PRODUCENT;

drop table if exists REZERVACIJA;

drop table if exists TRUPA;

/*==============================================================*/
/* Table: CLAN                                                  */
/*==============================================================*/
create table CLAN
(
   GLUMACID             int,
   TRUPAID              int,
   primary key (GLUMACID, TRUPAID)
);

/*==============================================================*/
/* Table: GLUMAC                                                */
/*==============================================================*/
create table GLUMAC
(
   GLUMACID             int not null,
   OSOBAID              int,
   primary key (GLUMACID)
);

/*==============================================================*/
/* Table: KREDITNAKARTICA                                       */
/*==============================================================*/
create table KREDITNAKARTICA
(
   BROJ                 int not null,
   PRETPLATNIKID        int not null,
   TIP                  text not null,
   DATUMVAZENJA         date not null,
   primary key (BROJ)
);

/*==============================================================*/
/* Table: OSOBA                                                 */
/*==============================================================*/
create table OSOBA
(
   OSOBAID              int not null,
   IME                  text not null,
   PREZIME              text not null,
   ADRESA               text not null,
   TELEFON              text not null,
   primary key (OSOBAID)
);

/*==============================================================*/
/* Table: POZORISNIKOMAD                                        */
/*==============================================================*/
create table POZORISNIKOMAD
(
   POZORISNIKOMADID     int not null,
   NAZIV                text not null,
   ZANR                 text not null,
   TRAJANJE             text not null,
   primary key (POZORISNIKOMADID),
   unique (NAZIV(30))
);

/*==============================================================*/
/* Table: PREDSTAVA                                             */
/*==============================================================*/
create table PREDSTAVA
(
   PREDSTAVAID          int not null,
   TRUPAID              int not null,
   POZORISNIKOMADID     int not null,
   PRODUCENTID          int not null,
   DATUMODRZAVANJA      datetime not null,
   BROJRASPOLOZIVIHMJESTA smallint not null,
   CIJENAULAZNICE       smallint not null,
   primary key (PREDSTAVAID),
   unique (POZORISNIKOMADID, DATUMODRZAVANJA)
);

/*==============================================================*/
/* Table: PRETPLATNIK                                           */
/*==============================================================*/
create table PRETPLATNIK
(
   PRETPLATNIKID        int not null,
   OSOBAID              int,
   primary key (PRETPLATNIKID)
);

/*==============================================================*/
/* Table: PRODUCENT                                             */
/*==============================================================*/
create table PRODUCENT
(
   PRODUCENTID          int not null,
   OSOBAID              int,
   primary key (PRODUCENTID)
);

/*==============================================================*/
/* Table: REZERVACIJA                                           */
/*==============================================================*/
create table REZERVACIJA
(
   REZERVACIJAID        int not null,
   PREDSTAVAID          int not null,
   PRETPLATNIKID        int not null,
   DATUMIZVRSENJAREZERVACIJE timestamp not null,
   BROJMJESTA           smallint not null,
   primary key (REZERVACIJAID)
);

/*==============================================================*/
/* Table: TRUPA                                                 */
/*==============================================================*/
create table TRUPA
(
   TRUPAID              int not null,
   NAZIV                text not null,
   GODINAPOSTOJANJA     int not null,
   primary key (TRUPAID)
);

alter table CLAN add constraint FK_CLAN foreign key (GLUMACID)
      references GLUMAC (GLUMACID) on delete restrict on update restrict;

alter table CLAN add constraint FK_SASTOJI foreign key (TRUPAID)
      references TRUPA (TRUPAID) on delete restrict on update restrict;

alter table GLUMAC add constraint FK_JE foreign key (OSOBAID)
      references OSOBA (OSOBAID) on delete restrict on update restrict;

alter table KREDITNAKARTICA add constraint FK_IMA foreign key (PRETPLATNIKID)
      references PRETPLATNIK (PRETPLATNIKID) on delete restrict on update restrict;

alter table PREDSTAVA add constraint FK_IZVODI foreign key (TRUPAID)
      references TRUPA (TRUPAID) on delete restrict on update restrict;

alter table PREDSTAVA add constraint FK_PREDSTAVLJA foreign key (POZORISNIKOMADID)
      references POZORISNIKOMAD (POZORISNIKOMADID) on delete restrict on update restrict;

alter table PREDSTAVA add constraint FK_REZIRA foreign key (PRODUCENTID)
      references PRODUCENT (PRODUCENTID) on delete restrict on update restrict;

alter table PRETPLATNIK add constraint FK_SADRZI foreign key (OSOBAID)
      references OSOBA (OSOBAID) on delete restrict on update restrict;

alter table PRODUCENT add constraint FK_JESTE foreign key (OSOBAID)
      references OSOBA (OSOBAID) on delete restrict on update restrict;

alter table REZERVACIJA add constraint FK_REZERVACIJA foreign key (PREDSTAVAID)
      references PREDSTAVA (PREDSTAVAID) on delete restrict on update restrict;

alter table REZERVACIJA add constraint FK_REZERVISE foreign key (PRETPLATNIKID)
      references PRETPLATNIK (PRETPLATNIKID) on delete restrict on update restrict;

