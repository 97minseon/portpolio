-- ���� :    ȸ�� / ��ȸ�� / ��ǰ / ��ٱ��� / ���� / ���� / ��� / ���� / ���� 


-------------------------------------------------------------------------------- ȸ�� (member)

-- ȸ��(member) �� ������ ����
create SEQUENCE seq_members;
-- ȸ��(member) ���̺� ����
create table members(
    bno number(10) not null primary key,
    name varchar2(50),
    ID	VARCHAR2(50),
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


-------------------------------------------------------------------------------- ��ǰ (item)

-- ��ǰ(item) ��  ������ ����
create sequence seq_item;
-- ��ǰ ���̺� ����
create table item (
    itemid number(10) not null primary key,     -- ��ǰ ��ȣ (������ ���)
    category varchar(10) not null,              -- ��ǰ �з�
    name varchar(30) not null,                  -- ��ǰ �̸�
    price number(10) not null,                  -- ��ǰ ����
    description varchar(1000) not null,         -- ��ǰ ����
    update_date date default sysdate            -- ������
);

-- ��ǰ �̹��� �� ������ ����
create sequence seq_file_item;
-- ��ǰ �̹��� ���
create table tbl_file_item(
    fid varchar(50) not null primary key,       -- �̹��� ��ȣ (������ ���)
    fileName varchar(50) not null,              -- ���� �̸�
    image char(1) default 'I',                  -- �̹��� ����
    uuid varchar(50) not null,                  -- UUID
    uploadPath varchar(50) not null             -- ���� ���
);

-- drop item
drop sequence seq_item;
drop table item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;


-------------------------------------------------------------------------------- ��ٱ��� (cart)

-- ��ٱ���(cart) �� ������ ����
create sequence seq_cart;
-- ��ٱ���(cart) ���̺� ����
create table cart (
    cart_id number(30) not null primary key,    -- īƮ ��ȣ (������ ���)
    member_id number(30),                       -- ȸ�� ��ȣ
    item_id number(30),                         -- ��ǰ ��ȣ
    item_name varchar2(50),                     -- ��ǰ �̸�
    amount number(10),                          -- ��ǰ ����
    price number(10)                            -- �ջ� ����
);

-- drop
drop sequence seq_cart;
drop table cart;

-- Ŀ��
commit;

-- ��ȸ
select * from cart;


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


-------------------------------------------------------------------------------- ���� (pay)






-------------------------------------------------------------------------------- ��� (delivery)

-- ���(delivery)�� ������ ����
create sequence seq_delivery;
-- ���(delivery) ���̺� ����
create table delivery(
    dno number(10) not null primary key,        -- ���� ��ȣ
    delivery_no number not null,                -- �ֹ� ��ȣ (��ȸ ��ȣ�� ����)
    member_id varchar2(30) not null,            -- ȸ�� ��ȣ
    item varchar(30) not null,                  -- ��ǰ �̸�
    delivery varchar(20),                       -- �ֹ� ����
    delivery_date date not null,                -- �ֹ� ����
    price number                                -- ���� ����
);

-- Ŀ��
commit; 

-- ��ȸ
select * from delivery;


-------------------------------------------------------------------------------- ���� (inquiry)

-- ���� �� ������ ����
create sequence seq_inquiry;
-- ���� ���̺� ����
CREATE TABLE tbl_inquiry (
  qno NUMBER(10) NOT NULL PRIMARY KEY,          -- ��ȣ (������ ���)
  title VARCHAR2(100) NOT NULL,                 -- ����
  content VARCHAR2(100) NOT NULL,               -- ����
  wrtier VARCHAR2(100) NOT NULL,                -- �ۼ���
  register_date DATE NOT NULL,                  -- �����
  update_date DATE DEFAULT SYSDATE,             -- ������
  reply_cnt NUMBER(10)                          -- ��� ��
);

-- Ŀ��
commit;

-- ��ȸ
select * from tbl_inquiry;



-------------------------------------------------------------------------------- ���� (notice)

-- ������ ����
create sequence seq_notice;
-- ���̺� ����
create table notice(
    bno number(10) not null primary key,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

-- Ŀ��
commit;



