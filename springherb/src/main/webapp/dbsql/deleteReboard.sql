/*
exec deleteReboard(2, 0, 2);

*/
create or replace procedure deleteReboard --���ν��� �̸� 
(
--�Ű�����
    p_no    number,
    p_step  number,
    p_groupno   number
)
is
--���������
    cnt number;
begin
--ó���� ����
    --�������� ���
    if p_step=0 then
        --�亯���� �����ϴ��� üũ
        select count(*) into cnt from reboard
        where groupno=p_groupno;
        
        if cnt > 1 then  --�亯���� �����ϸ�
            update reboard
            set delflag='Y'
            where no=p_no;
        else  --�亯���� ���� ������
            delete from reboard where no=p_no;
        end if;
    else  --�亯���� ���
        delete from reboard where no=p_no;
    end if;
    
    commit;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, '�ۻ��� ����!');
        ROLLBACK;
end;