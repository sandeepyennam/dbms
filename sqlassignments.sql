//1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

select title,c.name as jonor,rating from film f inner join film_category fc on f.film_id=fc.film_id inner join category c on fc.category_id=c.category_id where c.name = 'Comedy' and f.rating='PG-13' ;

//2. Find out the top 3 rented horror movies.

select  count(*) as count_of_rentals,ff.title as top3_horror from rental r inner join inventory i on i.inventory_id=r.inventory_id inner join film ff on ff.film_id=i.film_id inner join  film_category f on ff.film_id=f.film_id inner join category c on f.category_id=c.category_id where c.name='Horror' group by ff.title having count(*) >25 order by count(*)  desc ;

//3. Find out the list of customers from India who have rented sports movies.

select cs.first_name,cs.last_name,cn.country as country from customer cs inner join address a on a.address_id=cs.address_id inner join city c on c.city_id=a.city_id inner join country cn on cn.country_id=c.country_id where cs.customer_id in(select c.customer_id from customer c inner join rental r on r.customer_id=c.customer_id inner join inventory i on i.inventory_id=r.inventory_id inner join film_category fc on fc.film_id=i.film_id inner join category cc on cc.category_id=fc.category_id where cc.name='Sports' ) and cn.country='India'; 

//4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

select cs.first_name,cs.last_name,cn.country as country from customer cs inner join address a on a.address_id=cs.address_id inner join city c on c.city_id=a.city_id inner join country cn on cn.country_id=c.country_id where cs.customer_id in(select c.customer_id from customer c inner join rental r on r.customer_id=c.customer_id inner join inventory i on i.inventory_id=r.inventory_id inner join film_actor f on i.film_id=f.film_id inner join actor a on a.actor_id=f.actor_id where a.first_name='NICK' and a.last_name='WAHLBERG') and cn.country='Canada';


//5. Find out the number of movies in which “SEAN WILLIAMS” acted.

select count(title) as list_of_movies_by_sean,a.first_name,a.last_name from film f inner join film_actor fc on f.film_id=fc.film_id inner join actor a on fc.actor_id=a.actor_id where a.first_name='SEAN' and a.last_name='WILLIAMS' ;


