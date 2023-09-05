#--0). How many rows are in the products table
	#statement 1
	#SELECT * FROM products;
SELECT COUNT(*) FROM products;
	# statment 2
		#SELECT * FROM products
			# or SELECT * FROM products LIMIT 10; --> this limits to 10
		#ORDER BY list_price DESC
		#LIMIT 1;

# -- 1). Product name and Unit/Quantity
SELECT product_name as "Product Name", quantity_per_unit as "Unit/Quantity" from products;

# 2). Product ID and Name of Current Products
SELECT id as "Product ID", product_name as "Current Products" from products;

# 3). Product ID and Name of Discontinued Products
SELECT id as "Product ID", discontinued as "Discontinued Products" from products;

#4). Name and list price of most and least expensive product
SELECT product_name as "Product Name", min(list_price) as "Least Expensive Product" from products
WHERE (list_price) = (SELECT min(list_price) from products)
UNION 
	(SELECT product_name as "Product Name", max(list_price) as "Most Expensive Product" from products
		WHERE (list_price) = (SELECT max(list_price) from products));

# 5). Product ID, Name, and List Price Costing Less than $20
SELECT id as "Product ID", product_name as "Product Name", list_price as "List price less than $20"
	FROM northwind.products
	WHERE list_price <20.00
	ORDER BY list_price;
    
# 6). Product ID, Name, and List Price Costing between $15 and $20
SELECT id as "Product ID", product_name as "Product Name", list_price as "List price less than $20"
	FROM northwind.products
	WHERE list_price between 15.00 and 20.00
	ORDER BY list_price;



#7). Product ID, Name, and List Price costing above average list price
SELECT id as "Product ID", product_name as "Product Name", list_price as "List price Above Average"
	FROM northwind.products
	WHERE (list_price) > (SELECT AVG(list_price) from products);

# 8). Product Name and List Price of 10 most expensive products
SELECT id as "Product ID", product_name as "Product Name", list_price as "10 Most Expensive Products"
FROM northwind.products
Order by list_price DESC
 LIMIT 10;
    
# 9). Count of current and discountinued products
SELECT count(product_name) as "Current Products", count(discontinued) as "Discontinued Products" from products;	

# 10). Product Name, Units on order and units in stock where quantity in stock is less than quantity on-order
SELECT product_name as "Product Name", quantity_per_unit as "Unit/Quantity", minimum_reorder_quantity as "Units on Order"
	FROM northwind.products
	WHERE quantity_per_unit < minimum_reorder_quantity
	ORDER BY quantity_per_unit;
    
#EXTRA CREDIT
#11). Products with supplier company and address info
SELECT products.product_name, products.supplier_ids, suppliers.id, suppliers.company, suppliers.address
from products 
JOIN suppliers on products.supplier_ids = suppliers.id;

#12). Number of products per category with less than 5 units
Select category, count(product_name) from products
WHERE quantity_per_unit >5;

# 13).How many Products are less than $20
SELECT count(product_name) 
	FROM northwind.products
	WHERE list_price <20.00
	ORDER BY list_price;


