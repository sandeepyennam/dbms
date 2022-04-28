
// 1. Find out the number of documentaries with deleted scenes.

select count(c.category_id) as count_of 
from category c 
inner join film_category fc
 on c.category_id=fc.category_id 
 inner join film f on fc.film_id=f.film_id
 where f.special_features='Deleted Scenes'and c.name='Documentary';
 
 // 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.
 
 select count(fc.film_id) from film_category fc
 inner join category c on fc.category_id=c.category_id 
 inner join inventory i on fc.film_id=i.film_id 
 inner join store s on s.store_id=i.inventory_id
 inner join staff st on st.staff_id=s.manager_staff_id where c.name='Sci-Fi'
 and st.first_name='Jon' and st.last_name='Stephens';
 
 //3. Find out the total sales from Animation movies.
 
select sum(total_sales) as sum_of_sales,c.name from sales_by_film_category sf
inner join category c on c.name=sf.category 
inner join film_category fc on fc.category_id=c.category_id
inner join film f on f.film_id=fc.film_id where c.name='Animation';
 
 
 

 
 // 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.
 
 select count(*),ct.name from customer c
 inner join rental r on r.customer_id=c.customer_id 
 inner join inventory i on i.inventory_id=r.inventory_id
 inner join film_category fc on fc.film_id=i.film_id
 inner join category ct on ct.category_id=fc.category_id
 where c.first_name='PATRICIA' and c.last_name='JOHNSON'  group by ct.name order by count(*) desc limit 3;
 
// 5. Find out the number of R rated movies rented by “SUSAN WILSON”.
 
select count(c.customer_id) from customer c inner join rental r 
on r.customer_id=c.customer_id inner join inventory i
on i.inventory_id=r.inventory_id inner join film f
on f.film_id=i.film_id where f.rating='R' and c.first_name='SUSAN' and c.last_name='WILSON';
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 
 
 