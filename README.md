# OnlineSalesPortal
This is a online sales portal developed using J2EE and web2.0 technologies.It was built using the MVC architecture.The database used was MYSQL database.The project provides user to add products to wishlist  and also to cart.The user can check products based on categories.It provides features for admin to add products,remove products,set inventory,
get product list,users list and category list.
DeliCharge set default 0 ;
    alter table orders alter column quantity set default 1 ;
    select * from orders;
    ALTER TABLE orders
    DROP column deliCharge;
    ALTER TABLE orders
    DROP COLUMN quantity;
    alter table orders modify column orderPrice varchar(200);




    
