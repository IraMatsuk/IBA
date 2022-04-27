USE shopdb;

select * from users;
select * from user_role;
select * from user_state;

insert into users (user_id, first_name, last_name, login, password, email, phone, user_role, user_state) 
values  (1, 'Ирина', 'Мацук', 'Ogonek', 'Ogonek2111', 'g3726866@gmail.com', 333726866, 2, 1);

insert into user_role (role_id, role_name) values (1, 'client');
insert into user_role (role_id, role_name) values (2, 'admin');
insert into user_role (role_id, role_name) values (3, 'guest');

insert into user_state (state_id, state_name) values (1, 'new');
insert into user_state (state_id, state_name) values (2, 'active');
insert into user_state (state_id, state_name) values (3, 'blocked');
insert into user_state (state_id, state_name) values (4, 'unblocked');

select first_name, last_name, login, password, user_role, role_name
from users as u
left join user_role as r
on u.user_role = r.role_id;


SELECT users.user_id, first_name, last_name, login, password, email, phone,
discount_id, state_name, role_name FROM users
JOIN user_state ON user_state.state_id = users.state_id
JOIN user_role ON user_role.role_id = users.role_id
WHERE login = 'Ogonek' AND password = 'Ogonek2111';

SELECT user_id, first_name, last_name, login, password, email, phone,
discount_id, state_name, role_name 
FROM users AS u
JOIN user_state AS s
ON u.user_state = s.state_id
JOIN user_role AS r
ON u.user_role = r.role_id
WHERE email = 'g3726866@gmail.com';

delete from users where user_id = 8; 
