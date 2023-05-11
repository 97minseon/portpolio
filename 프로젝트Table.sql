-- ���� :    ��ǰ / ȸ�� / ��ȸ�� / ���� / ���� / ���� / ��ٱ��� / ������

-------------------------------------------------------------------------------- ��ǰ (item)

-- ��ǰ(item) ��  ������ ����
create sequence seq_item;
-- ��ǰ ���̺� ����
create table item (
    itemid number(10) not null primary key,     -- ��ȣ
    category varchar(10) not null,              -- �з�
    name varchar(30) not null,                  -- ��ǰ �̸�
    price number(10) not null,                  -- ��ǰ ����
    description varchar(1000) not null,         -- ��ǰ ����
    update_date date default sysdate            -- ������
);

-- ��ǰ �̹��� �� ������ ����
create sequence seq_file_item;
-- ��ǰ �̹��� ���
create table tbl_file_item(
fid varchar(50) not null primary key,           -- ��ȣ
fileName varchar(50) not null,                  -- ���� �̸�
image char(1) default 'I',                      -- �̹��� ����
uuid varchar(50) not null,                      -- UUID
uploadPath varchar(50) not null                 -- ���� ���
);

-- drop item
drop sequence seq_item;
drop table item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;

-- Ŀ��
commit;

-- ��ȸ
select * from item;
select * from tbl_file_item;
commit;

-------------------------------------------------------------------------------- ȸ�� (member)

-- ȸ��(member) �� ������ ����
create SEQUENCE seq_members;
-- ȸ��(member) ���̺� ����
create table members(
    member_id number(10) not null primary key,
    name varchar2(50),
    ID VARCHAR2(50),
    PWD	VARCHAR2(50),
    PWD2	VARCHAR2(50),
    EMAIL	VARCHAR2(50),
    PNUM	VARCHAR2(50),
    HNUM	VARCHAR2(50),
    ADDRESS	VARCHAR2(50),
    DEADDRESS VARCHAR2(50)
);

-- Ŀ��
commit;

-- ��ȸ
select * from members;

drop sequence seq_members;
drop table members;
-------------------------------------------------------------------------------- ��ȸ�� (guest)

-- ��ȸ��(guest) �� ������ ����
create sequence seq_guest;
-- ��ȸ��(guest) �� ���̺� ����
create table guest(
    gid number not null primary key,
    name varchar2(20),
    pnum varchar2(30),
    pwd varchar2(30),
    address	VARCHAR2(50),
    deaddress VARCHAR2(50),
    itemid number,
    envoice_no varchar2(100) not null unique
);

-- Ŀ��
commit;

-- ��ȸ
select * from guest;
drop sequence seq_guest;
drop table guest;

-------------------------------------------------------------------------------- ���� (Qna)

-- ���� �� ������ ����
create sequence seq_Qna;
-- ���� ���̺� ����
create table Qna(
    id NUMBER CONSTRAINT Qna_id PRIMARY KEY,
    title  VARCHAR2(100) NOT NULL,
    content VARCHAR2(100) NOT NULL,
    writer VARCHAR2(100) NOT NULL,
    writedate DATE DEFAULT SYSDATE,
    readcnt NUMBER DEFAULT 0,
    root NUMBER,
    step NUMBER DEFAULT 0,
    indent NUMBER DEFAULT 0
);
insert into Qna (id, title, content, writer)
values (1,'�׽�Ʈ1','�ߵ���?','�����');
-- Ŀ��
commit;

-- ��ȸ
select * from Qna;

-------------------------------------------------------------------------------- ���� (buy)

-- ����(buy)�� ������ ����
create sequence seq_buy;
-- ����(buy) ���̺� ����
create table buy(
    bno number(10) not null primary key,  -- ������
    buy_no varchar2(100) not null unique,  --�ֹ���ȣ
    member_id varchar2(30) not null,  -- �ֹ��ھ��̵�
    cart_id varchar(30) not null,  -- �ֹ���ǰ
    buy varchar(20),  -- �ֹ�����
    buy_date date not null, -- �ֹ��� ��¥
    price number  -- �ֹ� �ݾ�
);

-- Ŀ��
commit;

-- ��ȸ
select * from buy;

drop table buy;
drop SEQUENCe seq_buy;

-------------------------------------------------------------------------------- ��ٱ��� (cart)

-- ��ٱ���(cart) �� ������ ����
create sequence seq_cart;
-- ��ٱ���(cart) ���̺� ����
create table cart (
    cart_id number(30) not null primary key,
    member_id number(30),
    item_id number(30),
    item_name varchar2(50),
    amount number(10),
    price number(10),
    item_img varchar2(100)
);

-- Ŀ��
commit;

-- ��ȸ
select * from cart;

-------------------------------------------------------------------------------- ��ٱ��� (cart)