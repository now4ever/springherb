/*
exec deleteReboard(2, 0, 2);

*/
create or replace procedure deleteReboard --프로시저 이름 
(
--매개변수
    p_no    number,
    p_step  number,
    p_groupno   number
)
is
--변수선언부
    cnt number;
begin
--처리할 내용
    --원본글인 경우
    if p_step=0 then
        --답변글이 존재하는지 체크
        select count(*) into cnt from reboard
        where groupno=p_groupno;
        
        if cnt > 1 then  --답변글이 존재하면
            update reboard
            set delflag='Y'
            where no=p_no;
        else  --답변글이 없는 원본글
            delete from reboard where no=p_no;
        end if;
    else  --답변글인 경우
        delete from reboard where no=p_no;
    end if;
    
    commit;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, '글삭제 실패!');
        ROLLBACK;
end;