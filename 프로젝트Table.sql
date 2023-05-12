
-- ���� :    ȸ�� / ��ȸ�� / ��ǰ / ��ٱ��� / ���� / ���� / ��� / ���� / ���� 


-------------------------------------------------------------------------------- ȸ�� (user)

-- ȸ��(user) �� ������ ����
create sequence seq_user;
-- ȸ��(user) ���̺� ����
create table tbl_user (
    user_id     varchar2(50) not null primary key,      -- ���̵�
    user_name   varchar2(50) not null,                  -- �̸�
    pwd	        varchar2(50) not null,                  -- ��й�ȣ
    email	    varchar2(50) not null,                  -- �̸���
    phone	    varchar2(50) not null,                  -- ����ó
    post_code   varchar2(30),                           -- �����ȣ (����)
    addr        varchar2(50),                           -- �ּ� (����)
    addr2       varchar2(50),                           -- ���ּ� (����)
    auth        char(1) default 'm'                     -- ����
);

-- Ŀ��
commit;

-- ��ȸ
select * from tbl_user;

-- drop
drop sequence seq_user;
drop table tbl_user;


-------------------------------------------------------------------------------- ��ǰ (item)

-- ��ǰ(item) ��  ������ ����
create sequence seq_item;
-- ��ǰ ���̺� ����
create table tbl_item (
    item_id     number(10) not null primary key,        -- ��ǰ ��ȣ (������ ���)
    category    varchar2(10) not null,                  -- ��ǰ �з�
    item_name   varchar2(30) not null,                  -- ��ǰ �̸�
    item_price  number(10) not null,                    -- ��ǰ ����
    description varchar2(1000) not null,                -- ��ǰ ����
    update_date date default sysdate                    -- ������
);

-- ��ǰ �̹��� �� ������ ����
create sequence seq_file_item;
-- ��ǰ �̹��� ���
create table tbl_file_item(
    fid         varchar2(50) not null primary key,      -- �̹��� ��ȣ (������ ���)
    fileName    varchar2(50) not null,                  -- ���� �̸�
    image       char(1) default 'I',                    -- �̹��� ����
    uuid        varchar2(50) not null,                  -- UUID
    uploadPath  varchar2(50) not null                   -- ���� ���
);

-- Ŀ��
commit;

-- ��ȸ
select * from tbl_item;
select * from tbl_file_item;

-- drop item
drop sequence seq_item;
drop table tbl_item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;


-------------------------------------------------------------------------------- ��ٱ��� (cart)

-- ��ٱ���(cart) �� ������ ����
create sequence seq_cart;
-- ��ٱ���(cart) ���̺� ����
create table tbl_cart (
    cart_id     number(30) not null primary key,    -- īƮ ��ȣ (������ ���)
    user_id     number(30),                         -- ȸ�� ��ȣ
    item_id     number(30),                         -- ��ǰ ��ȣ
    item_name   varchar2(50),                       -- ��ǰ �̸�
    amount      number(10),                         -- ��ǰ ����
    cart_price  number(10)                          -- �ջ� ����
);

-- drop
drop sequence seq_cart;
drop table cart;

-- Ŀ��
commit;

-- ��ȸ
select * from cart;


-------------------------------------------------------------------------------- ���� (buy)

-- ȸ������(user_buy) �� ������ ����
create sequence seq_user_buy;
-- ȸ������(user_buy) ���̺� ����
create table tbl_user_buy (
    bno         number(10) not null primary key,        -- ������
    buy_no      varchar2(100) not null unique,          --�ֹ���ȣ
    user_id     varchar2(30) not null,                  -- �ֹ��ھ��̵�
    buyer_name  varchar2(30) not null,                  -- ��۹��� �̸�
    phone       varchar2(30) not null,                  -- ����ó
    post_code   varchar2(10) not null,                  -- �����ȣ
    addr        varchar2(100) not null,                 -- �ּ�    
    addr2       varchar2(100) not null,                 -- �ּ�(��)
    buy_status  varchar2(20),                           -- �ֹ�����
    buy_date    date default sysdate                    -- �ֹ��� ��¥
);

-- ��ȸ������(guest_buy)�� ������ ����
create sequence seq_guest_buy;
-- ��ȸ������(guest_buy) ���̺� ����
create table tbl_guest_buy (
    gno         number(10) not null primary key,  -- ������
    buy_no      varchar2(100) not null unique,  --�ֹ���ȣ
    pwd         varchar2(30),  -- ��ȸ�� ��й�ȣ
    buyer_name  varchar2(30) not null,   -- ��۹��� �̸�
    post_code   varchar2(10),     -- �����ȣ
    addr        varchar2(100),         -- �ּ�    
    addr2       varchar2(100),        -- �ּ�(��)
    buy_status  varchar2(20),  -- �ֹ�����
    buy_date    date default sysdate -- �ֹ��� ��¥
);

drop sequence seq_user_buy;
drop table tbl_user_buy;

drop sequence seq_guest_buy;
drop table tbl_guest_buy;

select * from tbl_user_buy;
select * from tbl_guest_buy;

create sequence seq_buy_list;
create table tbl_buy_list (
    blist_no number(10) not null primary key,   -- �ֹ���� ��ȣ
    buy_no varchar2(100) unique,                -- ��ȸ ��ȣ
    item_id number(10),                         -- ��ǰ ��ȣ
    item_name varchar2(50),                     -- ��ǰ �̸�
    amount number(10),                          -- ����
    buy_price number(10),                       -- ����
    delivery_cost number(10)                    -- ��ۺ�
);

-- Ŀ��
commit;

-- ��ȸ
select * from buy;

drop table buy;
drop SEQUENCe seq_buy;


-------------------------------------------------------------------------------- ���� (pay)






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
