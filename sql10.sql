delimiter $$
create procedure hello()
begin
  case
     when curtime() between '06:00:00' and '11:59:59'
     then select 'Доброе утро';
     when curtime() between '12:00:00' and '17:59:59'
     then select 'Добрый день';
     when curtime() between '18:00:00' and '23:59:59'
     then select 'Добрый вечер';
     else
     select 'Доброй ночи';
end case;
end $$
delimiter ;

CALL hello();

delimiter //
create function fib(n int)
returns varchar(255)
deterministic
begin
     declare n0 int default 0;
     declare n1 int default 1;
     declare n2 int default 0;
     declare res varchar(255) default '0 1';
     
     if	n=1 then 
          return n0;
     elseif n=2 then 
        return concat(n0,' ',n1);
      else
		while n>2 do
         set n2=n1+n0;
         set n0=n1;
         set n1=n2;
         set n=n-1;
         set res = concat(res,' ',n2);
        end while;
	return res;
    end if;
end //
delimiter ;

select fib(5);

CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);

INSERT INTO bankaccounts VALUES("ACC2", 1000);
-- Изменим баланс на аккаунтах
START TRANSACTION;
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2';
COMMIT;

select * from bankaccounts;

delimiter $$
create procedure repeat_proc()
begin
  declare n int default 5;
  declare res varchar(50) default '';
  
  repeat
      set res=concat(res,' ',n);
      set n=n-1;
      until n<1
   end repeat;
   select res;
end $$
delimiter ;

call repeat_proc();