--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace herbmall
datafile 'C:\oraclexe\mydata\herbmall.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user herb
identified by herb123
default tablespace herbmall;

--����� ���Ѻο�
grant connect,resource to herb;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to herb;
