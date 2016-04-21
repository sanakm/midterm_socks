#SOCK IT TO YOU - SOCKS AS A SERVICE
There are many simple truths to the world. Gravity pulls things down, waterproof shoes aren't, and socks go missing. Socks-as-a-service is there for the last one! Having a steady stream of socks delivered to your home. The designs vary, and are beautiful!


##OBJECTIVE: DIFFERENT SOCKS, EACH MONTH
At Socks-as-a-service, we're looking at creating a monthly service that allows users to subscribe to a *sock-bomb* (not actually a bomb) - a package with socks from the best companies across the country.


Socks :)

##DATABASE MODELLING
###Table: users
 * id
 * user_type
 * name
 * email
 * phone
 * password
 * account_type
 * paypal_email
 * service_id
 * size
 * address1
 * address2
 * city
 * postalcode

###TABLE: service
 * id
 * name
 * socks_per_month
 * cost
 * service_start
 * service_end

###TABLE: sizes
 * id
 * size_desc
 * min_size
 * max_size

###TABLE: orderid
 * date
 * subscription_id
 * user_id

###TABLE: comments/testimonials
 * id
 * text
 * type
 * user_id

