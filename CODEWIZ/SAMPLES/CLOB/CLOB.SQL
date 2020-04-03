DROP TABLE mybook;
CREATE TABLE mybook (chapterno number, chapters CLOB);

INSERT INTO mybook VALUES (1, 'Chapter One: a1a1a1a1a1a1a1a1a1a1a1');
INSERT INTO mybook VALUES (2, 'Chapter Two: b2b2b2b2b2b2b2');
INSERT INTO mybook VALUES (3, 'Chapter Three: c3c3c3c3');


create or replace package mybookpkg as
 PROCEDURE getchapter(chapno in NUMBER, chap out CLOB);
end mybookpkg;
/

create or replace package body mybookpkg as

PROCEDURE getchapter(chapno in NUMBER, chap out CLOB) is
BEGIN 
      SELECT chapters into chap from mybook where chapterno = chapno for update;
END;

end mybookpkg;
/ 