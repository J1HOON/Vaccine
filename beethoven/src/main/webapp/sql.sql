create table tbl_jumin_202108(
	jumin varchar2(20) primary key,
	name varchar2(15),
	phone varchar2(15),
	address varchar2(50)
)

insert into tbl_jumin_202108 values('710101-1000001','���ֹ�','010-1111-1111','��⵵ ������ ������ ����1��');
insert into tbl_jumin_202108 values('720101-2000001','���ֹ�','010-1111-2222','��⵵ ������ ������ ����2��');
insert into tbl_jumin_202108 values('730101-1000001','���ֹ�','010-1111-3333','��⵵ ������ ������ ������');
insert into tbl_jumin_202108 values('740101-2000001','ȫ�ֹ�','010-1111-4444','��⵵ ������ ������ �꼺��');
insert into tbl_jumin_202108 values('750101-1000001','���ֹ�','010-1111-5555','��⵵ ������ �߿��� ������');
insert into tbl_jumin_202108 values('760101-2000001','���ֹ�','010-1111-6666','��⵵ ������ �߿��� �߾ӵ�');
insert into tbl_jumin_202108 values('770101-1000001','���ֹ�','010-1111-7777','��⵵ ������ �߿��� ������');
insert into tbl_jumin_202108 values('780101-2000001','���ֹ�','010-1111-8888','��⵵ ������ �߿��� �ϴ����');
insert into tbl_jumin_202108 values('790101-1000001','���ֹ�','010-1111-9999','��⵵ ������ �д籸 ��ž1��');
insert into tbl_jumin_202108 values('800101-2000001','���ֹ�','010-2222-1111','��⵵ ������ �д籸 ��ž2��');

drop table tbl_hosp_202108
create table tbl_hosp_202108 (
	hospcode char(4) primary key,
	hospname varchar2(40),
	hosptel varchar2(15),
	hospaddr varchar2(50)
)


insert into tbl_hosp_202108 values('H001','��_����','031-1111-2222','10');
insert into tbl_hosp_202108 values('H002','��_����','031-1111-3333','20');
insert into tbl_hosp_202108 values('H003','��_����','031-1111-4444','30');
insert into tbl_hosp_202108 values('H004','��_����','031-1111-5555','40');


create table tbl_vaccresv_202108 (
	resvno number(8) primary key,
	jumin varchar2(20),
	hospcode char(4),
	resvdate date,
	resvtime number(4),
	vcode char(4)
)


insert into tbl_vaccresv_202108 values(20210001,'710101-1000001', 'H001', '20210801' , '0930', 'V001');
insert into tbl_vaccresv_202108 values(20210002,'720101-2000001', 'H002', '20210801' , '1030', 'V002');
insert into tbl_vaccresv_202108 values(20210003,'730101-1000001', 'H003', '20210801' , '1130', 'V003');
insert into tbl_vaccresv_202108 values(20210004,'740101-2000001', 'H001', '20210801' , '1230', 'V001');
insert into tbl_vaccresv_202108 values(20210005,'750101-1000001', 'H001', '20210801' , '1330', 'V002');
insert into tbl_vaccresv_202108 values(20210006,'760101-2000001', 'H002', '20210801' , '1430', 'V003');
insert into tbl_vaccresv_202108 values(20210007,'770101-1000001', 'H003', '20210801' , '1530', 'V001');
insert into tbl_vaccresv_202108 values(20210008,'780101-2000001', 'H001', '20210801' , '1630', 'V002');
insert into tbl_vaccresv_202108 values(20210009,'790101-1000001', 'H001', '20210801' , '1730', 'V003');
insert into tbl_vaccresv_202108 values(20210010,'800101-2000001', 'H002', '20210801' , '1830', 'V001');




select * from tbl_vaccresv_202108


select h.HOSPADDR,                             
case h.HOSPADDR                                  
    when '10' then '����'                           
    when '20' then '����'                           
    when '30' then '�뱸'                           
    when '40' then '����'                           
    end as HOSPAREA,                                 
    count(v.HOSPCODE)                                
    from TBL_VACCRESV_202108 v FULL OUTER JOIN TBL_HOSP_202108 h    
    on h.HOSPCODE = v.HOSPCODE            
    group by HOSPADDR                                
    order by HOSPADDR                                