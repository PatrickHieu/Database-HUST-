--users
CREATE TABLE IF NOT EXISTS public.users
(
    user_id serial,
    email character varying COLLATE pg_catalog."default" UNIQUE,
    password character varying COLLATE pg_catalog."default",
    role character(6) COLLATE pg_catalog."default",
    full_name character varying COLLATE pg_catalog."default",
    birthday date,
    avatar character varying COLLATE pg_catalog."default",
    phone_number character(10) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    identity character(12) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    createdat date DEFAULT CURRENT_DATE,
    CONSTRAINT prikey PRIMARY KEY (user_id)
);

--products
CREATE TABLE IF NOT EXISTS public.products
(
    product_id serial,
    user_id integer,
    product_name character varying COLLATE pg_catalog."default",
    slug character varying COLLATE pg_catalog."default",
    price integer,
    img character varying COLLATE pg_catalog."default",
    category_id integer,
    in_stock integer check (in_stock > 0),
    sold integer default 0,
    brand character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    createdat date DEFAULT CURRENT_DATE,
    is_deleted boolean DEFAULT false,
    updatedat date DEFAULT CURRENT_DATE,
    checked boolean DEFAULT false,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);

--payments
CREATE TABLE IF NOT EXISTS public.paymentinfo(
    payment_id serial,
    user_id integer,
    method_id integer,
    card_id character(16) COLLATE pg_catalog."default",
    cvv character(4) COLLATE pg_catalog."default",
    CONSTRAINT payments_pkey PRIMARY KEY (payment_id)
);

--paymentmethod
CREATE TABLE IF NOT EXISTS public.paymentmethod
(
    method_id serial,
    methodname character varying COLLATE pg_catalog."default",
    CONSTRAINT paymentmethod_pkey PRIMARY KEY (method_id)
);
-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id serial,
    user_id integer,
    message character varying COLLATE pg_catalog."default",
    createdat date DEFAULT CURRENT_DATE,
    recipients_name character varying COLLATE pg_catalog."default",
    contact_number character(10) COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    ward character varying COLLATE pg_catalog."default",
    label character(4) COLLATE pg_catalog."default",
    specific_address character varying COLLATE pg_catalog."default" NOT NULL,
    method_id integer,
    card_id character(16) COLLATE pg_catalog."default",
    cvv character(4) COLLATE pg_catalog."default",
    status character varying COLLATE pg_catalog."default",
    netamount integer DEFAULT 0,
    shiptotal integer,
    totalamount integer,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT address_label_check CHECK (label = ANY (ARRAY['home'::bpchar, 'work'::bpchar]))
);

--orderlines
CREATE TABLE IF NOT EXISTS public.orderlines
(
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    CONSTRAINT orderlinespk PRIMARY KEY (order_id, product_id)
);

--comments
CREATE TABLE IF NOT EXISTS public.comments
(
    product_id integer,
    user_id integer,
    rate integer,
    body character varying COLLATE pg_catalog."default",
    createat date,
    CONSTRAINT comments_pkey PRIMARY KEY (product_id, user_id)
);

--categories
CREATE TABLE IF NOT EXISTS public.categories
(
    category_id serial,
    title character varying COLLATE pg_catalog."default",
    slug character varying COLLATE pg_catalog."default",
    CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);

--cart
CREATE TABLE IF NOT EXISTS public.cart
(
    user_id integer,
    product_id integer,
    quantity integer NOT NULL,
	CONSTRAINT cart_pk PRIMARY KEY (user_id, product_id)
);

--addresses
CREATE TABLE IF NOT EXISTS public.addresses
(
    address_id serial,
    user_id integer,
    full_name character varying COLLATE pg_catalog."default",
    contact_number character(10) COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    district character varying COLLATE pg_catalog."default",
    ward character varying COLLATE pg_catalog."default",
    label character(4) COLLATE pg_catalog."default",
    specific_address character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT address_pkey PRIMARY KEY (address_id),
	CONSTRAINT address_label_check CHECK (label = ANY (ARRAY['home'::bpchar, 'work'::bpchar]))
);


--products
Alter table products
Add CONSTRAINT cate_fk FOREIGN KEY (category_id)
        REFERENCES public.categories (category_id)
        ON DELETE SET NULL,
add CONSTRAINT product_fk_user FOREIGN KEY (user_id) REFERENCES public.users (user_id);

--payments
alter table paymentinfo
add CONSTRAINT method_fk FOREIGN KEY (method_id) REFERENCES public.paymentmethod (method_id),
add CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users (user_id);
		
--orders
alter table orders
add CONSTRAINT orders_buyer_id_fkey FOREIGN KEY (user_id) REFERENCES public.users (user_id),
add constraint order_pmmt_fk  FOREIGN KEY (method_id) REFERENCES public.paymentmethod (method_id);
		
--orderlines	
alter table orderlines
add CONSTRAINT orderlines_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders (order_id),
add CONSTRAINT orderlines_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (product_id);


--comments
alter table comments
ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users (user_id),
ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES products(product_id);
	
--cart
alter table cart
add CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (product_id), 
add CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users (user_id); 



alter table addresses
ADD CONSTRAINT user_fl FOREIGN KEY (user_id) REFERENCES public.users (user_id);


----index
CREATE INDEX ON products(price);
CREATE INDEX ON products(product_name);
CREATE INDEX ON products(createdAt);
CREATE INDEX ON products(category_id);
CREATE INDEX ON orders(user_id)
CREATE INDEX ON users(email);

---trigger

--1. check order product
	CREATE OR REPLACE FUNCTION check_orderline() RETURNS TRIGGER AS $$
	DECLARE
		buyer_id INT;
		seller_id INT;
		pname varchar;
		instock int;
	BEGIN
		SELECT user_id INTO buyer_id
			FROM orders
			WHERE order_id = NEW.order_id;
		SELECT user_id, product_name, in_stock INTO seller_id, pname, instock
			FROM products
			WHERE product_id = NEW.product_id;
		IF buyer_id = seller_id 
			THEN RAISE EXCEPTION 'Không thể đặt sản phẩm của chính mình: % ,id %', pname, NEW.product_id;
		ELSIF NEW.quantity > instock THEN RAISE EXCEPTION 'sản phẩm %:% không còn đủ hàng', pname, NEW.product_id;
		END IF;
		RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;

	CREATE OR REPLACE TRIGGER check_order
	BEFORE INSERT ON orderlines
	FOR EACH ROW
	EXECUTE FUNCTION check_orderline();
--------------------------------------------
--------------------------------------------



--2. update sold, instock
	CREATE OR REPLACE FUNCTION update_product_sold_instock()
		RETURNS trigger
		LANGUAGE 'plpgsql'
		COST 100
		VOLATILE NOT LEAKPROOF
	AS $BODY$
	BEGIN
	  UPDATE products
	  SET sold = sold + NEW.quantity,
		  in_stock = in_stock - NEW.quantity
	  WHERE product_id = NEW.product_id;
	  RETURN NEW;
	END;
	$BODY$;

	CREATE OR REPLACE TRIGGER update_sold_instock
	AFTER INSERT ON orderlines
	FOR EACH ROW
	EXECUTE FUNCTION update_product_sold_instock();
---------------------------------------------------
---------------------------------------------------



--3. update netamount
	CREATE OR REPLACE FUNCTION update_netamount()
		RETURNS trigger
		LANGUAGE 'plpgsql'
		COST 100
		VOLATILE NOT LEAKPROOF
	AS $BODY$
	BEGIN
		UPDATE orders
		SET netamount = netamount + (NEW.quantity * (SELECT price FROM products WHERE product_id = NEW.product_id))
		WHERE order_id = NEW.order_id;
		RETURN NEW;
	END;
	$BODY$;

	CREATE OR REPLACE TRIGGER trigger_update_netamount_after_insert
		AFTER INSERT ON orderlines
		FOR EACH ROW
		EXECUTE FUNCTION update_netamount();
-------------------------------------------------
-------------------------------------------------



--4. update total amount
	CREATE OR REPLACE FUNCTION update_totalamount()
		RETURNS trigger
		LANGUAGE 'plpgsql'
		COST 100
		VOLATILE NOT LEAKPROOF
	AS $BODY$
	BEGIN
		update orders
		set totalamount = NEW.netamount + shiptotal
		Where order_id = NEW.order_id;
		RETURN NEW;
	END;
	$BODY$;

	CREATE OR REPLACE TRIGGER trigger_update_totalamount_after_update_netamount
		AFTER UPDATE OF netamount ON orders
		FOR EACH ROW
		EXECUTE FUNCTION update_totalamount();
-------------------------------------------------
-------------------------------------------------



--5. update product_rate
	CREATE OR REPLACE FUNCTION update_product_rate()
		RETURNS trigger
		LANGUAGE 'plpgsql'
		COST 100
		VOLATILE NOT LEAKPROOF
	AS $BODY$
	DECLARE
		total_ratings INT;
		total_sum_ratings INT;
	BEGIN
		SELECT COUNT(*), SUM(rate)
		INTO total_ratings, total_sum_ratings
		FROM comments
		WHERE product_id = NEW.product_id;
	  UPDATE products
	  SET rate = ROUND((total_sum_ratings+ NEW.rate)/(total_ratings+1))
	  where product_id = NEW.product_id;
	  RETURN NEW;
	END;
	$BODY$;	
	
	CREATE OR REPLACE TRIGGER update_product_rating_after_insert
    AFTER INSERT OR UPDATE OF rate ON comments
    FOR EACH ROW
    EXECUTE FUNCTION update_product_rate();
--------------------------------------
--------------------------------------



