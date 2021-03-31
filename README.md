# Cafe Management Software - Prozo
This is a Cafeteria Management System built on Rails and supports multiple users and roles like admin, customer, and billing-clerk. The management system comes with a custom admin account for the owner/admin to access all the features for the system like reports, menu management tool and much more.

## Playground Credentials

Role           |  Email           | Password
-------------- | ---------------- | -------------
Admin/Owner    | admin@admin.com  | admin
Billing Clerk  | clerk@clerk.com  | clerk
Customer       | suzy@suzy.com    | suzy

___Deployed Link___ : [Prozo](https://prozo-cafe.herokuapp.com/ "Prozo")



![Homepage](/Screenshots/Homepage.bmp)

## Functionality And Features

### Register/Login Page
##### Customers
- Can Login and Register as a Customer
##### Clerk
- Can Login but cannot Register as a Clerk
##### Admin/Owner
- Can Login as Admin
- Can Register other **clerks and admins only**

![Register](/Screenshots/Register.bmp)

### Menu Page
##### Customers
- Can add various Menuitems to cart using the Add to cart Button and Increase/Decrease Tool
- Invoice is saved as an Online Order
##### Clerk
- Can add various Menuitems to cart using the Add to cart Button and Increase/Decrease Tool
- Invoice is saved an a Walk-in Order

![Menu](/Screenshots/Menu.bmp)

##### Admin/Owner
- Can add various Menuitems to cart using the Add to cart Button and Increase/Decrease Tool
- Invoice is saved an a Walk-in Order
- Can Add Category for the menu
- Can Add and Edit Menu Items
- Can Activate/Deactivate Categories
- Out of Stock Label appears when a menu item stock is empty

![Menu](/Screenshots/Edit.bmp)

### Invoices Page

![Homepage](/Screenshots/Orders.bmp)

### Report Page

Accessible to **Admin** Only

![Homepage](/Screenshots/Report1.bmp)

![Homepage](/Screenshots/Report2.bmp)

![Homepage](/Screenshots/Report3.bmp)
