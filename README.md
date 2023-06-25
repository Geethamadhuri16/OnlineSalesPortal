# OnlineSalesPortal
This is a online sales portal developed using J2EE and web2.0 technologies.It was built using the MVC architecture.The database used was MYSQL database.The project provides user to add products to wishlist  and also to cart.The user can check products based on categories.It provides features for admin to add products,remove products,set inventory,
get product list,users list and category list.
The below are the sql commands which you can run in mysql workbench to build database.





//mysql commands
create database OnlineSales;
use OnlineSales;
 CREATE TABLE TheUser (
    userId varchar(200) not null,
    username varchar(30),
    mobilenumber varchar(10),
    UserPassword varchar(20),
    address varchar(100),
    email varchar(50),
    cartId varchar(200),
    primary Key(userId)
    );
    alter TABLE theuser
ADD FOREIGN KEY (cartid) REFERENCES cart(cartID);
select * from theUser;
ALTER TABLE theuser DROP FOREIGN KEY theuser_ibfk_1;
  
    
    
    create table category(
    categoryId varchar(200) not null,
    category_desc varchar(200),
    primary key(categoryId)
    );
    alter table category add column category_name varchar(200);
    select * from category;
    
    
    
    create table product(
    productId varchar(200) not null,
    categoryId varchar(200) not null ,
    productName varchar(50),
    Thedescription varchar(200),
    price int(100),
    inventory varchar(200),
    primary key(productId),
    foreign key(categoryId) references category(categoryId)
    );
    alter table product add column img varchar(200);
    select * from product;
    ALTER TABLE product
MODIFY COLUMN price varchar(200);



    
    CREATE TABLE TheAdmin (
    userId varchar(200) not null,
    adminname varchar(30),
     email varchar(50),
     AdminPassword varchar(20),
     Foreign Key(userId) references TheUser(userId)
     
    );
     alter table theadmin add column adminId varchar(200);
     alter table theadmin add primary key(adminId);
     select * from theadmin;
    
    create table orders(
    orderId varchar(200),
    userId varchar(200),
    productId varchar(200),
    orderStatus varchar(50)  default "placed",
    orderPrice int(200),
    orderDate varchar(50),
    quantity int,
    deliCharge int,
    primary key(orderId,userId,productId),
    foreign Key(userId) references TheUser(userId),
    foreign key(productId) references product(productId)
    );
     alter table orders alter column DeliCharge set default 0 ;
  alter table orders alter column quantity set default 1 ;
    select * from orders;
    ALTER TABLE orders
  DROP column deliCharge;
  ALTER TABLE orders
DROP COLUMN quantity;
alter table orders modify column orderPrice varchar(200);


//till here


After running this in your sql workbench,make changes in "DBManager class accordingly".
To run this project you need apache tomcat server and mysql connector.

    
