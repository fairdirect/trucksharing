CREATE TYPE category_type AS ENUM (
    'groceries',
    'drugstore'
);


ALTER TYPE public.category_type OWNER TO postgres;

--
-- Name: company_type; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE company_type AS ENUM (
    'AG',
    'e.G. (eingetragene Gesellschaft)',
    'e.K. (eingetragener Kaufmann)',
    'Einzelunternehmen',
    'GbR',
    'GmbH',
    'GmbH & Co. KG',
    'KG',
    'Ltd.',
    'Ltd. und Co. KG.',
    'OHG',
    'PartG.',
    'e.V.',
    'andere'
);


ALTER TYPE public.company_type OWNER TO postgres;

--
-- Name: epelia_adresses_gender; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_adresses_gender AS ENUM (
    'Herr',
    'Frau'
);


ALTER TYPE public.epelia_adresses_gender OWNER TO postgres;

--
-- Name: epelia_newsletters_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE epelia_newsletters_type AS ENUM (
    'text',
    'html',
    'both'
);


ALTER TYPE public.epelia_newsletters_type OWNER TO postgres;

--
-- Name: epelia_orders_status; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_orders_status AS ENUM (
    'in_process',
    'complete'
);


ALTER TYPE public.epelia_orders_status OWNER TO postgres;

--
-- Name: epelia_pictures_type; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_pictures_type AS ENUM (
    'product',
    'shoplogo'
);


ALTER TYPE public.epelia_pictures_type OWNER TO postgres;

--
-- Name: epelia_product_attributes_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE epelia_product_attributes_type AS ENUM (
    'additive',
    'allergen',
    'event',
    'flavor',
    'manipulation'
);


ALTER TYPE public.epelia_product_attributes_type OWNER TO postgres;

--
-- Name: epelia_product_ratings_status; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_product_ratings_status AS ENUM (
    'new',
    'accepted'
);


ALTER TYPE public.epelia_product_ratings_status OWNER TO postgres;

--
-- Name: epelia_shopping_carts_payment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE epelia_shopping_carts_payment_type AS ENUM (
    'prepayment',
    'directtransfer'
);


ALTER TYPE public.epelia_shopping_carts_payment_type OWNER TO postgres;

--
-- Name: epelia_shopping_carts_status; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_shopping_carts_status AS ENUM (
    'running',
    'ordered',
    'accepted'
);


ALTER TYPE public.epelia_shopping_carts_status OWNER TO postgres;

--
-- Name: epelia_shops_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE epelia_shops_status AS ENUM (
    'new',
    'activated'
);


ALTER TYPE public.epelia_shops_status OWNER TO postgres;

--
-- Name: epelia_shops_type; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_shops_type AS ENUM (
    'retailer',
    'manufacturer',
    'importer'
);


ALTER TYPE public.epelia_shops_type OWNER TO postgres;

--
-- Name: epelia_users_status; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_users_status AS ENUM (
    'new',
    'accepted'
);


ALTER TYPE public.epelia_users_status OWNER TO postgres;

--
-- Name: epelia_users_type; Type: TYPE; Schema: public; Owner: epelia
--

CREATE TYPE epelia_users_type AS ENUM (
    'customer',
    'shop'
);


ALTER TYPE public.epelia_users_type OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: epelia_addresses; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_addresses (
    id integer NOT NULL,
    gender text,
    company text,
    firstname text,
    name text,
    street text,
    house text,
    deleted boolean DEFAULT false NOT NULL,
    user_id integer,
    zip text NOT NULL,
    city text NOT NULL,
    country text DEFAULT 'DE'::text NOT NULL
);


ALTER TABLE public.epelia_addresses OWNER TO postgres;

--
-- Name: epelia_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_addresses_id_seq OWNER TO postgres;

--
-- Name: epelia_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_addresses_id_seq OWNED BY epelia_addresses.id;


--
-- Name: epelia_bank_accounts; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_bank_accounts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    account_nr text NOT NULL,
    account_holder text NOT NULL,
    bank_id text NOT NULL,
    bank_name text NOT NULL
);


ALTER TABLE public.epelia_bank_accounts OWNER TO postgres;

--
-- Name: epelia_bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_bank_accounts_id_seq OWNER TO postgres;

--
-- Name: epelia_bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_bank_accounts_id_seq OWNED BY epelia_bank_accounts.id;


--
-- Name: epelia_countries; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_countries (
    id text NOT NULL,
    name text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public.epelia_countries OWNER TO postgres;

--
-- Name: epelia_emails; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_emails (
    name text NOT NULL,
    subject text NOT NULL,
    content text NOT NULL,
    vars text
);


ALTER TABLE public.epelia_emails OWNER TO postgres;

--
-- Name: epelia_invoices; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_invoices (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    invoice_amount numeric(6,2) NOT NULL,
    file text,
    month integer NOT NULL,
    year integer NOT NULL,
    payout numeric(6,2) NOT NULL,
    last_sent date,
    last_sent_email text
);


ALTER TABLE public.epelia_invoices OWNER TO postgres;

--
-- Name: epelia_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_invoices_id_seq OWNER TO postgres;

--
-- Name: epelia_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_invoices_id_seq OWNED BY epelia_invoices.id;


--
-- Name: epelia_newsletters; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_newsletters (
    id integer NOT NULL,
    content text NOT NULL,
    created date DEFAULT now(),
    deleted boolean DEFAULT false,
    subject text NOT NULL,
    type text DEFAULT 'text' NOT NULL
);


ALTER TABLE public.epelia_newsletters OWNER TO postgres;

--
-- Name: epelia_newsletters_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_newsletters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_newsletters_id_seq OWNER TO postgres;

--
-- Name: epelia_newsletters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_newsletters_id_seq OWNED BY epelia_newsletters.id;


--
-- Name: epelia_newsletters_log; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_newsletters_log (
    id integer NOT NULL,
    newsletter_id integer NOT NULL,
    address text NOT NULL,
    success boolean DEFAULT false NOT NULL,
    sent_date date DEFAULT now()
);


ALTER TABLE public.epelia_newsletters_log OWNER TO postgres;

--
-- Name: epelia_newsletters_log_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_newsletters_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_newsletters_log_id_seq OWNER TO postgres;

--
-- Name: epelia_newsletters_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_newsletters_log_id_seq OWNED BY epelia_newsletters_log.id;


--
-- Name: epelia_order_number_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_order_number_seq
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_order_number_seq OWNER TO postgres;

--
-- Name: epelia_orders; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    shop_id integer NOT NULL,
    delivery_addr_id integer,
    billing_addr_id integer,
    status text DEFAULT 'in_process' NOT NULL,
    created date DEFAULT now() NOT NULL,
    shipping numeric(4,2) DEFAULT 0.00 NOT NULL,
    send_date date,
    order_number text NOT NULL
);


ALTER TABLE public.epelia_orders OWNER TO postgres;

--
-- Name: epelia_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_orders_id_seq OWNER TO postgres;

--
-- Name: epelia_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_orders_id_seq OWNED BY epelia_orders.id;


--
-- Name: epelia_pictures; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_pictures (
    id integer NOT NULL,
    filename text NOT NULL
);


ALTER TABLE public.epelia_pictures OWNER TO postgres;

--
-- Name: epelia_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_pictures_id_seq OWNER TO postgres;

--
-- Name: epelia_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_pictures_id_seq OWNED BY epelia_pictures.id;


--
-- Name: epelia_product_attributes; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_attributes (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.epelia_product_attributes OWNER TO postgres;

--
-- Name: epelia_product_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_attributes_id_seq OWNER TO postgres;

--
-- Name: epelia_product_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_attributes_id_seq OWNED BY epelia_product_attributes.id;


--
-- Name: epelia_product_categories; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_categories (
    id integer NOT NULL,
    name text NOT NULL,
    product_group_id integer,
    description text
);


ALTER TABLE public.epelia_product_categories OWNER TO postgres;

--
-- Name: epelia_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_categories_id_seq OWNER TO postgres;

--
-- Name: epelia_product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_categories_id_seq OWNED BY epelia_product_categories.id;


--
-- Name: epelia_product_groups; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_groups (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    description text
);


ALTER TABLE public.epelia_product_groups OWNER TO postgres;

--
-- Name: epelia_product_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_groups_id_seq OWNER TO postgres;

--
-- Name: epelia_product_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_groups_id_seq OWNED BY epelia_product_groups.id;


--
-- Name: epelia_product_price_content_types; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_price_content_types (
    id integer NOT NULL,
    name text NOT NULL,
    deleted boolean DEFAULT false
);


ALTER TABLE public.epelia_product_price_content_types OWNER TO postgres;

--
-- Name: epelia_product_price_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_price_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_price_content_types_id_seq OWNER TO postgres;

--
-- Name: epelia_product_price_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_price_content_types_id_seq OWNED BY epelia_product_price_content_types.id;


--
-- Name: epelia_product_price_units; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_price_units (
    id integer NOT NULL,
    singular text NOT NULL,
    plural text NOT NULL
);


ALTER TABLE public.epelia_product_price_units OWNER TO postgres;

--
-- Name: epelia_product_price_units_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_price_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_price_units_id_seq OWNER TO postgres;

--
-- Name: epelia_product_price_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_price_units_id_seq OWNED BY epelia_product_price_units.id;


--
-- Name: epelia_product_prices; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_prices (
    id integer NOT NULL,
    product_id integer NOT NULL,
    value numeric(6,2) NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    is_wholesale boolean DEFAULT false,
    deleted boolean DEFAULT false,
    unit_type_id integer NOT NULL,
    content_type_id integer NOT NULL,
    contents integer NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.epelia_product_prices OWNER TO postgres;

--
-- Name: epelia_product_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_prices_id_seq OWNER TO postgres;

--
-- Name: epelia_product_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_prices_id_seq OWNED BY epelia_product_prices.id;


--
-- Name: epelia_product_ratings; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_product_ratings (
    id integer NOT NULL,
    product_id integer NOT NULL,
    user_id integer,
    comment text,
    rating numeric(2,1) NOT NULL,
    status text DEFAULT 'accepted',
    created date DEFAULT now()
);


ALTER TABLE public.epelia_product_ratings OWNER TO postgres;

--
-- Name: epelia_product_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_product_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_product_ratings_id_seq OWNER TO postgres;

--
-- Name: epelia_product_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_product_ratings_id_seq OWNED BY epelia_product_ratings.id;


--
-- Name: epelia_products; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name text NOT NULL,
    description text,
    num_views integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT false NOT NULL,
    stock integer,
    created date DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    category_id integer,
    ingredients text,
    traces text,
    is_bio boolean DEFAULT false,
    is_discount boolean DEFAULT false,
    tags text
);


ALTER TABLE public.epelia_products OWNER TO postgres;

--
-- Name: epelia_products_home_groups; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products_home_groups (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.epelia_products_home_groups OWNER TO postgres;

--
-- Name: epelia_products_home_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_products_home_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_products_home_groups_id_seq OWNER TO postgres;

--
-- Name: epelia_products_home_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_products_home_groups_id_seq OWNED BY epelia_products_home_groups.id;


--
-- Name: epelia_products_home_groups_products; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products_home_groups_products (
    group_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.epelia_products_home_groups_products OWNER TO postgres;

--
-- Name: epelia_products_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_products_id_seq OWNER TO postgres;

--
-- Name: epelia_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_products_id_seq OWNED BY epelia_products.id;


--
-- Name: epelia_products_orders; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products_orders (
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    value numeric(6,2) NOT NULL,
    unit_type text NOT NULL,
    content_type text NOT NULL,
    contents integer NOT NULL,
    price_quantity integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.epelia_products_orders OWNER TO postgres;

--
-- Name: epelia_products_pictures; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products_pictures (
    product_id integer NOT NULL,
    picture_id integer NOT NULL
);


ALTER TABLE public.epelia_products_pictures OWNER TO postgres;

--
-- Name: epelia_products_product_attributes; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products_product_attributes (
    product_id integer NOT NULL,
    product_attribute_id integer NOT NULL
);


ALTER TABLE public.epelia_products_product_attributes OWNER TO postgres;

--
-- Name: epelia_products_shopping_carts; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_products_shopping_carts (
    product_id integer NOT NULL,
    shopping_cart_id integer NOT NULL,
    product_price_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    added date DEFAULT now()
);


ALTER TABLE public.epelia_products_shopping_carts OWNER TO postgres;

--
-- Name: epelia_shipping_costs; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_shipping_costs (
    shop_id integer NOT NULL,
    country_id text NOT NULL,
    value numeric(4,2) NOT NULL,
    free_from numeric(6,2) DEFAULT NULL::numeric
);


ALTER TABLE public.epelia_shipping_costs OWNER TO postgres;

--
-- Name: epelia_shopping_carts; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_shopping_carts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    delivery_addr_id integer NOT NULL,
    billing_addr_id integer NOT NULL,
    status text DEFAULT 'running' NOT NULL,
    created date DEFAULT now(),
    ip text NOT NULL,
    payment_type text
);


ALTER TABLE public.epelia_shopping_carts OWNER TO postgres;

--
-- Name: epelia_shopping_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_shopping_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_shopping_carts_id_seq OWNER TO postgres;

--
-- Name: epelia_shopping_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_shopping_carts_id_seq OWNED BY epelia_shopping_carts.id;


--
-- Name: epelia_shops; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_shops (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    logo_id integer,
    provision numeric(6,2) DEFAULT 4 NOT NULL,
    taxnumber text,
    salestax_id text,
    status text DEFAULT 'new' NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    company text,
    street text,
    house text,
    zip text,
    city text,
    phone text,
    fax text,
    small_business boolean DEFAULT false,
    register_id text,
    register_court text,
    office text,
    representative text,
    eco_control_board text,
    eco_control_id text,
    bank_account_holder text,
    bank_account_number text,
    bank_id text,
    bank_name text,
    bank_swift text,
    bank_iban text,
    description text,
    history text,
    history_picture_id integer,
    philosophy text,
    procedure text,
    procedure_picture_id integer,
    additional text,
    company_type text,
    created date DEFAULT now() NOT NULL,
    country text DEFAULT 'DE'::text NOT NULL
);


ALTER TABLE public.epelia_shops OWNER TO postgres;

--
-- Name: epelia_shops_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_shops_id_seq OWNER TO postgres;

--
-- Name: epelia_shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_shops_id_seq OWNED BY epelia_shops.id;


--
-- Name: epelia_shops_pictures; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_shops_pictures (
    shop_id integer NOT NULL,
    picture_id integer NOT NULL
);


ALTER TABLE public.epelia_shops_pictures OWNER TO postgres;

--
-- Name: epelia_users; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE epelia_users (
    id integer NOT NULL,
    phpbb_id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    salt text NOT NULL,
    birthday date,
    type text DEFAULT 'customer' NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    is_wholesale boolean DEFAULT false NOT NULL,
    main_delivery_address_id integer,
    main_billing_address_id integer,
    last_delivery_address_id integer,
    last_billing_address_id integer,
    status text DEFAULT 'new' NOT NULL,
    registered date DEFAULT now(),
    last_login date DEFAULT now(),
    deleted boolean DEFAULT false NOT NULL,
    username text,
    newsletter boolean DEFAULT false,
    old_password_hash text,
    password_reset_token text
);


ALTER TABLE public.epelia_users OWNER TO postgres;

--
-- Name: epelia_users_id_seq; Type: SEQUENCE; Schema: public; Owner: epelia
--

CREATE SEQUENCE epelia_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epelia_users_id_seq OWNER TO postgres;

--
-- Name: epelia_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epelia
--

ALTER SEQUENCE epelia_users_id_seq OWNED BY epelia_users.id;


--
-- Name: geodb_locations; Type: TABLE; Schema: public; Owner: epelia; Tablespace:
--

CREATE TABLE geodb_locations (
    id integer NOT NULL,
    country text NOT NULL,
    plz text NOT NULL,
    name text NOT NULL,
    lat numeric NOT NULL,
    lon numeric NOT NULL
);


ALTER TABLE public.geodb_locations OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_addresses ALTER COLUMN id SET DEFAULT nextval('epelia_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_bank_accounts ALTER COLUMN id SET DEFAULT nextval('epelia_bank_accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_invoices ALTER COLUMN id SET DEFAULT nextval('epelia_invoices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_newsletters ALTER COLUMN id SET DEFAULT nextval('epelia_newsletters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_newsletters_log ALTER COLUMN id SET DEFAULT nextval('epelia_newsletters_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_orders ALTER COLUMN id SET DEFAULT nextval('epelia_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_pictures ALTER COLUMN id SET DEFAULT nextval('epelia_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_attributes ALTER COLUMN id SET DEFAULT nextval('epelia_product_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_categories ALTER COLUMN id SET DEFAULT nextval('epelia_product_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_groups ALTER COLUMN id SET DEFAULT nextval('epelia_product_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_price_content_types ALTER COLUMN id SET DEFAULT nextval('epelia_product_price_content_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_price_units ALTER COLUMN id SET DEFAULT nextval('epelia_product_price_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_prices ALTER COLUMN id SET DEFAULT nextval('epelia_product_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_ratings ALTER COLUMN id SET DEFAULT nextval('epelia_product_ratings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products ALTER COLUMN id SET DEFAULT nextval('epelia_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_home_groups ALTER COLUMN id SET DEFAULT nextval('epelia_products_home_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shopping_carts ALTER COLUMN id SET DEFAULT nextval('epelia_shopping_carts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops ALTER COLUMN id SET DEFAULT nextval('epelia_shops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_users ALTER COLUMN id SET DEFAULT nextval('epelia_users_id_seq'::regclass);


--
-- Name: epelia_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_addresses_id_seq', 13167, true);


--
-- Name: epelia_bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_bank_accounts_id_seq', 3948, true);

--
-- Name: epelia_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_invoices_id_seq', 12, true);


--
-- Name: epelia_newsletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_newsletters_id_seq', 2, true);


--
-- Name: epelia_newsletters_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_newsletters_log_id_seq', 8, true);


--
-- Name: epelia_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_order_number_seq', 10003, true);


--
-- Name: epelia_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_orders_id_seq', 56, true);


--
-- Name: epelia_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_pictures_id_seq', 16217, true);


--
-- Name: epelia_product_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_attributes_id_seq', 1603, true);


--
-- Name: epelia_product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_categories_id_seq', 9944, true);


--
-- Name: epelia_product_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_groups_id_seq', 1405, true);


--
-- Name: epelia_product_price_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_price_content_types_id_seq', 7, true);


--
-- Name: epelia_product_price_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_price_units_id_seq', 9, true);


--
-- Name: epelia_product_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_prices_id_seq', 17207, true);


--
-- Name: epelia_product_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_product_ratings_id_seq', 13, true);


--
-- Name: epelia_products_home_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_products_home_groups_id_seq', 1, true);


--
-- Name: epelia_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epelia
--

SELECT pg_catalog.setval('epelia_products_id_seq', 21103, true);


--
-- Name: epelia_adresses_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_addresses
    ADD CONSTRAINT epelia_adresses_pkey PRIMARY KEY (id);


--
-- Name: epelia_bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_bank_accounts
    ADD CONSTRAINT epelia_bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: epelia_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_countries
    ADD CONSTRAINT epelia_countries_pkey PRIMARY KEY (id);


--
-- Name: epelia_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_emails
    ADD CONSTRAINT epelia_emails_pkey PRIMARY KEY (name);


--
-- Name: epelia_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_invoices
    ADD CONSTRAINT epelia_invoices_pkey PRIMARY KEY (id);


--
-- Name: epelia_newsletters_log_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_newsletters_log
    ADD CONSTRAINT epelia_newsletters_log_pkey PRIMARY KEY (id);


--
-- Name: epelia_newsletters_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_newsletters
    ADD CONSTRAINT epelia_newsletters_pkey PRIMARY KEY (id);


--
-- Name: epelia_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_orders
    ADD CONSTRAINT epelia_orders_order_number_key UNIQUE (order_number);


--
-- Name: epelia_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_orders
    ADD CONSTRAINT epelia_orders_pkey PRIMARY KEY (id);


--
-- Name: epelia_pictures_filename_key; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_pictures
    ADD CONSTRAINT epelia_pictures_filename_key UNIQUE (filename);


--
-- Name: epelia_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_pictures
    ADD CONSTRAINT epelia_pictures_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_attributes
    ADD CONSTRAINT epelia_product_attributes_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_categories
    ADD CONSTRAINT epelia_product_categories_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_groups
    ADD CONSTRAINT epelia_product_groups_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_price_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_price_content_types
    ADD CONSTRAINT epelia_product_price_content_types_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_price_units_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_price_units
    ADD CONSTRAINT epelia_product_price_units_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_prices
    ADD CONSTRAINT epelia_product_prices_pkey PRIMARY KEY (id);


--
-- Name: epelia_product_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_product_ratings
    ADD CONSTRAINT epelia_product_ratings_pkey PRIMARY KEY (id);


--
-- Name: epelia_products_home_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_products_home_groups
    ADD CONSTRAINT epelia_products_home_groups_pkey PRIMARY KEY (id);


--
-- Name: epelia_products_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_products
    ADD CONSTRAINT epelia_products_pkey PRIMARY KEY (id);


--
-- Name: epelia_shipping_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_shipping_costs
    ADD CONSTRAINT epelia_shipping_costs_pkey PRIMARY KEY (shop_id, country_id);


--
-- Name: epelia_shopping_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_shopping_carts
    ADD CONSTRAINT epelia_shopping_carts_pkey PRIMARY KEY (id);


--
-- Name: epelia_shops_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_pkey PRIMARY KEY (id);


--
-- Name: epelia_shops_taxident_key; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_taxident_key UNIQUE (salestax_id);


--
-- Name: epelia_shops_url_key; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_url_key UNIQUE (url);


--
-- Name: epelia_users_email_key; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_email_key UNIQUE (email);


--
-- Name: epelia_users_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_pkey PRIMARY KEY (id);


--
-- Name: epelia_users_username_key; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_username_key UNIQUE (username);


--
-- Name: geodb_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: epelia; Tablespace:
--

ALTER TABLE ONLY geodb_locations
    ADD CONSTRAINT geodb_locations_pkey PRIMARY KEY (id);


--
-- Name: epelia_products_name_description_ingredients_tags_idx; Type: INDEX; Schema: public; Owner: epelia; Tablespace:
--

CREATE INDEX epelia_products_name_description_ingredients_tags_idx ON epelia_products USING btree (name, description, ingredients, tags);


--
-- Name: geodb_locations_lat_idx; Type: INDEX; Schema: public; Owner: epelia; Tablespace:
--

CREATE INDEX geodb_locations_lat_idx ON geodb_locations USING btree (lat);


--
-- Name: geodb_locations_lon_idx; Type: INDEX; Schema: public; Owner: epelia; Tablespace:
--

CREATE INDEX geodb_locations_lon_idx ON geodb_locations USING btree (lon);


--
-- Name: geodb_locations_plz_country_idx; Type: INDEX; Schema: public; Owner: epelia; Tablespace:
--

CREATE INDEX geodb_locations_plz_country_idx ON geodb_locations USING btree (plz, country);


--
-- Name: epelia_addresses_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_addresses
    ADD CONSTRAINT epelia_addresses_country_fkey FOREIGN KEY (country) REFERENCES epelia_countries(id);


--
-- Name: epelia_adresses_related_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_addresses
    ADD CONSTRAINT epelia_adresses_related_to_fkey FOREIGN KEY (user_id) REFERENCES epelia_users(id);


--
-- Name: epelia_bank_accounts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_bank_accounts
    ADD CONSTRAINT epelia_bank_accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES epelia_users(id) ON DELETE CASCADE;


--
-- Name: epelia_invoices_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_invoices
    ADD CONSTRAINT epelia_invoices_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES epelia_shops(id) ON DELETE SET NULL;


--
-- Name: epelia_newsletters_log_newsletter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_newsletters_log
    ADD CONSTRAINT epelia_newsletters_log_newsletter_id_fkey FOREIGN KEY (newsletter_id) REFERENCES epelia_newsletters(id);


--
-- Name: epelia_orders_billing_addr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_orders
    ADD CONSTRAINT epelia_orders_billing_addr_fkey FOREIGN KEY (billing_addr_id) REFERENCES epelia_addresses(id) ON DELETE SET NULL;


--
-- Name: epelia_orders_delivery_addr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_orders
    ADD CONSTRAINT epelia_orders_delivery_addr_fkey FOREIGN KEY (delivery_addr_id) REFERENCES epelia_addresses(id) ON DELETE SET NULL;


--
-- Name: epelia_orders_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_orders
    ADD CONSTRAINT epelia_orders_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES epelia_shops(id);


--
-- Name: epelia_orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_orders
    ADD CONSTRAINT epelia_orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES epelia_users(id);


--
-- Name: epelia_product_categories_product_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_categories
    ADD CONSTRAINT epelia_product_categories_product_group_id_fkey FOREIGN KEY (product_group_id) REFERENCES epelia_product_groups(id) ON UPDATE SET NULL;


--
-- Name: epelia_product_prices_content_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_prices
    ADD CONSTRAINT epelia_product_prices_content_type_fkey FOREIGN KEY (content_type_id) REFERENCES epelia_product_price_content_types(id) ON DELETE CASCADE;


--
-- Name: epelia_product_prices_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_prices
    ADD CONSTRAINT epelia_product_prices_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id);


--
-- Name: epelia_product_prices_unit_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_prices
    ADD CONSTRAINT epelia_product_prices_unit_type_fkey FOREIGN KEY (unit_type_id) REFERENCES epelia_product_price_units(id) ON DELETE CASCADE;


--
-- Name: epelia_product_ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_ratings
    ADD CONSTRAINT epelia_product_ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id) ON DELETE CASCADE;


--
-- Name: epelia_product_ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_product_ratings
    ADD CONSTRAINT epelia_product_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES epelia_users(id) ON DELETE SET NULL;


--
-- Name: epelia_product_shopping_cart_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_shopping_carts
    ADD CONSTRAINT epelia_product_shopping_cart_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id);


--
-- Name: epelia_product_shopping_cart_product_price_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_shopping_carts
    ADD CONSTRAINT epelia_product_shopping_cart_product_price_id_fkey FOREIGN KEY (product_price_id) REFERENCES epelia_product_prices(id);


--
-- Name: epelia_product_shopping_cart_shopping_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_shopping_carts
    ADD CONSTRAINT epelia_product_shopping_cart_shopping_cart_id_fkey FOREIGN KEY (shopping_cart_id) REFERENCES epelia_shopping_carts(id) ON DELETE CASCADE;


--
-- Name: epelia_products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products
    ADD CONSTRAINT epelia_products_category_id_fkey FOREIGN KEY (category_id) REFERENCES epelia_product_categories(id) ON DELETE SET NULL;


--
-- Name: epelia_products_home_groups_products_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_home_groups_products
    ADD CONSTRAINT epelia_products_home_groups_products_group_id_fkey FOREIGN KEY (group_id) REFERENCES epelia_products_home_groups(id) ON DELETE CASCADE;


--
-- Name: epelia_products_home_groups_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_home_groups_products
    ADD CONSTRAINT epelia_products_home_groups_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id) ON DELETE CASCADE;


--
-- Name: epelia_products_orders_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_orders
    ADD CONSTRAINT epelia_products_orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES epelia_orders(id) ON DELETE CASCADE;


--
-- Name: epelia_products_orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_orders
    ADD CONSTRAINT epelia_products_orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id);


--
-- Name: epelia_products_pictures_picture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_pictures
    ADD CONSTRAINT epelia_products_pictures_picture_id_fkey FOREIGN KEY (picture_id) REFERENCES epelia_pictures(id) ON DELETE CASCADE;


--
-- Name: epelia_products_pictures_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_pictures
    ADD CONSTRAINT epelia_products_pictures_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id) ON DELETE CASCADE;


--
-- Name: epelia_products_product_attributes_product_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_product_attributes
    ADD CONSTRAINT epelia_products_product_attributes_product_attribute_id_fkey FOREIGN KEY (product_attribute_id) REFERENCES epelia_product_attributes(id);


--
-- Name: epelia_products_product_attributes_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_products_product_attributes
    ADD CONSTRAINT epelia_products_product_attributes_product_id_fkey FOREIGN KEY (product_id) REFERENCES epelia_products(id);


--
-- Name: epelia_shipping_costs_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shipping_costs
    ADD CONSTRAINT epelia_shipping_costs_country_id_fkey FOREIGN KEY (country_id) REFERENCES epelia_countries(id);


--
-- Name: epelia_shipping_costs_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shipping_costs
    ADD CONSTRAINT epelia_shipping_costs_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES epelia_shops(id) ON DELETE CASCADE;


--
-- Name: epelia_shopping_carts_billing_addr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shopping_carts
    ADD CONSTRAINT epelia_shopping_carts_billing_addr_fkey FOREIGN KEY (billing_addr_id) REFERENCES epelia_addresses(id);


--
-- Name: epelia_shopping_carts_delivery_addr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shopping_carts
    ADD CONSTRAINT epelia_shopping_carts_delivery_addr_fkey FOREIGN KEY (delivery_addr_id) REFERENCES epelia_addresses(id);


--
-- Name: epelia_shopping_carts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shopping_carts
    ADD CONSTRAINT epelia_shopping_carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES epelia_users(id);


--
-- Name: epelia_shops_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_country_fkey FOREIGN KEY (country) REFERENCES epelia_countries(id);


--
-- Name: epelia_shops_history_picture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_history_picture_fkey FOREIGN KEY (history_picture_id) REFERENCES epelia_pictures(id) ON DELETE SET NULL;


--
-- Name: epelia_shops_logo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_logo_id_fkey FOREIGN KEY (logo_id) REFERENCES epelia_pictures(id) ON DELETE SET NULL;


--
-- Name: epelia_shops_pictures_picture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops_pictures
    ADD CONSTRAINT epelia_shops_pictures_picture_id_fkey FOREIGN KEY (picture_id) REFERENCES epelia_pictures(id) ON DELETE CASCADE;


--
-- Name: epelia_shops_pictures_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops_pictures
    ADD CONSTRAINT epelia_shops_pictures_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES epelia_shops(id) ON DELETE CASCADE;


--
-- Name: epelia_shops_procedure_picture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_procedure_picture_fkey FOREIGN KEY (procedure_picture_id) REFERENCES epelia_pictures(id) ON DELETE SET NULL;


--
-- Name: epelia_shops_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_shops
    ADD CONSTRAINT epelia_shops_user_id_fkey FOREIGN KEY (user_id) REFERENCES epelia_users(id);


--
-- Name: epelia_users_last_billing_adress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_last_billing_adress_fkey FOREIGN KEY (last_billing_address_id) REFERENCES epelia_addresses(id);


--
-- Name: epelia_users_last_delivery_adress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_last_delivery_adress_fkey FOREIGN KEY (last_delivery_address_id) REFERENCES epelia_addresses(id);


--
-- Name: epelia_users_main_billing_adress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_main_billing_adress_fkey FOREIGN KEY (main_billing_address_id) REFERENCES epelia_addresses(id);


--
-- Name: epelia_users_main_delivery_adress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epelia
--

ALTER TABLE ONLY epelia_users
    ADD CONSTRAINT epelia_users_main_delivery_adress_fkey FOREIGN KEY (main_delivery_address_id) REFERENCES epelia_addresses(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: epelia_newsletters; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_newsletters FROM PUBLIC;
REVOKE ALL ON TABLE epelia_newsletters FROM postgres;
GRANT ALL ON TABLE epelia_newsletters TO postgres;
GRANT ALL ON TABLE epelia_newsletters TO postgres;


--
-- Name: epelia_newsletters_id_seq; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON SEQUENCE epelia_newsletters_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE epelia_newsletters_id_seq FROM postgres;
GRANT ALL ON SEQUENCE epelia_newsletters_id_seq TO postgres;
GRANT ALL ON SEQUENCE epelia_newsletters_id_seq TO postgres;


--
-- Name: epelia_newsletters_log; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_newsletters_log FROM PUBLIC;
REVOKE ALL ON TABLE epelia_newsletters_log FROM postgres;
GRANT ALL ON TABLE epelia_newsletters_log TO postgres;
GRANT ALL ON TABLE epelia_newsletters_log TO postgres;


--
-- Name: epelia_newsletters_log_id_seq; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON SEQUENCE epelia_newsletters_log_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE epelia_newsletters_log_id_seq FROM postgres;
GRANT ALL ON SEQUENCE epelia_newsletters_log_id_seq TO postgres;
GRANT ALL ON SEQUENCE epelia_newsletters_log_id_seq TO postgres;


--
-- Name: epelia_pictures; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_pictures FROM PUBLIC;
REVOKE ALL ON TABLE epelia_pictures FROM postgres;
GRANT ALL ON TABLE epelia_pictures TO postgres;


--
-- Name: epelia_product_groups; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_product_groups FROM PUBLIC;
REVOKE ALL ON TABLE epelia_product_groups FROM postgres;
GRANT ALL ON TABLE epelia_product_groups TO postgres;
GRANT ALL ON TABLE epelia_product_groups TO postgres;


--
-- Name: epelia_product_groups_id_seq; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON SEQUENCE epelia_product_groups_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE epelia_product_groups_id_seq FROM postgres;
GRANT ALL ON SEQUENCE epelia_product_groups_id_seq TO postgres;
GRANT ALL ON SEQUENCE epelia_product_groups_id_seq TO postgres;


--
-- Name: epelia_product_price_content_types; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_product_price_content_types FROM PUBLIC;
REVOKE ALL ON TABLE epelia_product_price_content_types FROM postgres;
GRANT ALL ON TABLE epelia_product_price_content_types TO postgres;
GRANT ALL ON TABLE epelia_product_price_content_types TO postgres;


--
-- Name: epelia_product_price_content_types_id_seq; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON SEQUENCE epelia_product_price_content_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE epelia_product_price_content_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE epelia_product_price_content_types_id_seq TO postgres;
GRANT ALL ON SEQUENCE epelia_product_price_content_types_id_seq TO postgres;


--
-- Name: epelia_product_price_units; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_product_price_units FROM PUBLIC;
REVOKE ALL ON TABLE epelia_product_price_units FROM postgres;
GRANT ALL ON TABLE epelia_product_price_units TO postgres;
GRANT ALL ON TABLE epelia_product_price_units TO postgres;


--
-- Name: epelia_product_price_units_id_seq; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON SEQUENCE epelia_product_price_units_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE epelia_product_price_units_id_seq FROM postgres;
GRANT ALL ON SEQUENCE epelia_product_price_units_id_seq TO postgres;
GRANT ALL ON SEQUENCE epelia_product_price_units_id_seq TO postgres;


--
-- Name: epelia_products_pictures; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_products_pictures FROM PUBLIC;
REVOKE ALL ON TABLE epelia_products_pictures FROM postgres;
GRANT ALL ON TABLE epelia_products_pictures TO postgres;
GRANT ALL ON TABLE epelia_products_pictures TO postgres;


--
-- Name: epelia_shops_pictures; Type: ACL; Schema: public; Owner: epelia
--

REVOKE ALL ON TABLE epelia_shops_pictures FROM PUBLIC;
REVOKE ALL ON TABLE epelia_shops_pictures FROM postgres;
GRANT ALL ON TABLE epelia_shops_pictures TO postgres;
GRANT ALL ON TABLE epelia_shops_pictures TO postgres;


--
-- PostgreSQL database dump complete
--

