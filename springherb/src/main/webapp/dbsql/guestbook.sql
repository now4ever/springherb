
CREATE TABLE guestbook ( 
no		    number		primary key,   --�� ��ȣ	
name		varchar2(20)    not null,    		--�ۼ��� �̸�
pwd			varchar2(20)    not null, 		--��й�ȣ
content		varchar2(4000)	null, 		--���� ����
regdate		date		default  sysdate 	--�ۼ�����
);

create sequence guestbook_seq
increment by 1
start with 1
nocache;

select * from guestbook;
