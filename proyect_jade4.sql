PGDMP     *    %            
    z            proyect_jade4    15.0    15.0 I    U           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            V           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            W           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            X           1262    16530    proyect_jade4    DATABASE     ?   CREATE DATABASE proyect_jade4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE proyect_jade4;
                postgres    false            ?            1255    16693 \   add_cliente(character varying, character varying, integer, date, integer, character varying) 	   PROCEDURE     ?  CREATE PROCEDURE public.add_cliente(IN p_nombre character varying, IN p_apellido character varying, IN p_cedula integer, IN p_fecha_nac date, IN p_celular integer, IN p_e_mail character varying)
    LANGUAGE plpgsql
    AS $$
begin

insert into cliente(nombre,apellido,cedula,fecha_nac,celular,e_mail) values (p_nombre,p_apellido,p_cedula,
																				p_fecha_nac,p_celular,p_e_mail);
end;
$$;
 ?   DROP PROCEDURE public.add_cliente(IN p_nombre character varying, IN p_apellido character varying, IN p_cedula integer, IN p_fecha_nac date, IN p_celular integer, IN p_e_mail character varying);
       public          postgres    false            ?            1255    16797    buscar_idxcedula(integer) 	   PROCEDURE     ?   CREATE PROCEDURE public.buscar_idxcedula(IN ci integer)
    LANGUAGE plpgsql
    AS $$
declare
	
begin

select *from cliente where cedula = ci;

end; $$;
 7   DROP PROCEDURE public.buscar_idxcedula(IN ci integer);
       public          postgres    false            ?            1259    16703    cliente    TABLE     A  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    cedula integer NOT NULL,
    fecha_nac timestamp without time zone NOT NULL,
    e_mail character varying(30) NOT NULL,
    num_tel character varying(11) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            ?            1259    16702    cliente_id_cliente_seq    SEQUENCE     ?   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    221            Y           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    220            ?            1259    25087    empleado    TABLE     ?   CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    cedula integer NOT NULL,
    fecha_reg timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            ?            1259    25086    empleado_id_empleado_seq    SEQUENCE     ?   CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.empleado_id_empleado_seq;
       public          postgres    false    229            Z           0    0    empleado_id_empleado_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;
          public          postgres    false    228            ?            1259    16635    estatus_pago    TABLE     x   CREATE TABLE public.estatus_pago (
    id_estatus_pago integer NOT NULL,
    estatus_pago character varying NOT NULL
);
     DROP TABLE public.estatus_pago;
       public         heap    postgres    false            ?            1259    16634     estatus_pago_id_estatus_pago_seq    SEQUENCE     ?   CREATE SEQUENCE public.estatus_pago_id_estatus_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.estatus_pago_id_estatus_pago_seq;
       public          postgres    false    219            [           0    0     estatus_pago_id_estatus_pago_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.estatus_pago_id_estatus_pago_seq OWNED BY public.estatus_pago.id_estatus_pago;
          public          postgres    false    218            ?            1259    25078    pago_tarifa    TABLE     =  CREATE TABLE public.pago_tarifa (
    id_pago_tarifa integer NOT NULL,
    banco character varying NOT NULL,
    monto numeric(10,2) NOT NULL,
    referencia_pagm integer NOT NULL,
    fecha_pago timestamp without time zone NOT NULL,
    img bytea NOT NULL,
    id_ticket integer NOT NULL,
    id_empleado integer
);
    DROP TABLE public.pago_tarifa;
       public         heap    postgres    false            ?            1259    25077    pago_tarifa_id_pago_tarifa_seq    SEQUENCE     ?   CREATE SEQUENCE public.pago_tarifa_id_pago_tarifa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pago_tarifa_id_pago_tarifa_seq;
       public          postgres    false    227            \           0    0    pago_tarifa_id_pago_tarifa_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pago_tarifa_id_pago_tarifa_seq OWNED BY public.pago_tarifa.id_pago_tarifa;
          public          postgres    false    226            ?            1259    16598    roll    TABLE     `   CREATE TABLE public.roll (
    id_roll integer NOT NULL,
    tipo_roll character varying(20)
);
    DROP TABLE public.roll;
       public         heap    postgres    false            ?            1259    16597    roll_id_roll_seq    SEQUENCE     ?   CREATE SEQUENCE public.roll_id_roll_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roll_id_roll_seq;
       public          postgres    false    217            ]           0    0    roll_id_roll_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roll_id_roll_seq OWNED BY public.roll.id_roll;
          public          postgres    false    216            ?            1259    25036    ticket    TABLE       CREATE TABLE public.ticket (
    id_ticket integer NOT NULL,
    num_ticket integer NOT NULL,
    hora_ingreso timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    hora_salida timestamp without time zone,
    id_cliente integer NOT NULL,
    id_estatus_pago integer NOT NULL
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            ?            1259    25035    ticket_id_ticket_seq    SEQUENCE     ?   CREATE SEQUENCE public.ticket_id_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ticket_id_ticket_seq;
       public          postgres    false    225            ^           0    0    ticket_id_ticket_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ticket_id_ticket_seq OWNED BY public.ticket.id_ticket;
          public          postgres    false    224            ?            1259    25018    usuario    TABLE       CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    usuario character varying(15) NOT NULL,
    cedula integer,
    nombre character varying(20) NOT NULL,
    apellido character varying(20),
    e_mail character varying(40) NOT NULL,
    passwor character varying(129) NOT NULL,
    fecha_reg timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_roll integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            ?            1259    25017    usuario_id_usuario_seq    SEQUENCE     ?   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    223            _           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public          postgres    false    222            ?            1259    16541    vehiculo    TABLE       CREATE TABLE public.vehiculo (
    id_vehiculo integer NOT NULL,
    marca character varying(30) NOT NULL,
    modelo character varying(30) NOT NULL,
    color character varying(30) NOT NULL,
    placa character varying(30) NOT NULL,
    id_cliente integer NOT NULL
);
    DROP TABLE public.vehiculo;
       public         heap    postgres    false            ?            1259    16540    vehiculo_id_vehiculo_seq    SEQUENCE     ?   CREATE SEQUENCE public.vehiculo_id_vehiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.vehiculo_id_vehiculo_seq;
       public          postgres    false    215            `           0    0    vehiculo_id_vehiculo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.vehiculo_id_vehiculo_seq OWNED BY public.vehiculo.id_vehiculo;
          public          postgres    false    214            ?           2604    16706    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    221    220    221            ?           2604    25090    empleado id_empleado    DEFAULT     |   ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);
 C   ALTER TABLE public.empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    228    229    229            ?           2604    16638    estatus_pago id_estatus_pago    DEFAULT     ?   ALTER TABLE ONLY public.estatus_pago ALTER COLUMN id_estatus_pago SET DEFAULT nextval('public.estatus_pago_id_estatus_pago_seq'::regclass);
 K   ALTER TABLE public.estatus_pago ALTER COLUMN id_estatus_pago DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    25081    pago_tarifa id_pago_tarifa    DEFAULT     ?   ALTER TABLE ONLY public.pago_tarifa ALTER COLUMN id_pago_tarifa SET DEFAULT nextval('public.pago_tarifa_id_pago_tarifa_seq'::regclass);
 I   ALTER TABLE public.pago_tarifa ALTER COLUMN id_pago_tarifa DROP DEFAULT;
       public          postgres    false    226    227    227            ?           2604    16601    roll id_roll    DEFAULT     l   ALTER TABLE ONLY public.roll ALTER COLUMN id_roll SET DEFAULT nextval('public.roll_id_roll_seq'::regclass);
 ;   ALTER TABLE public.roll ALTER COLUMN id_roll DROP DEFAULT;
       public          postgres    false    217    216    217            ?           2604    25039    ticket id_ticket    DEFAULT     t   ALTER TABLE ONLY public.ticket ALTER COLUMN id_ticket SET DEFAULT nextval('public.ticket_id_ticket_seq'::regclass);
 ?   ALTER TABLE public.ticket ALTER COLUMN id_ticket DROP DEFAULT;
       public          postgres    false    225    224    225            ?           2604    25021    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    223    222    223            ?           2604    16544    vehiculo id_vehiculo    DEFAULT     |   ALTER TABLE ONLY public.vehiculo ALTER COLUMN id_vehiculo SET DEFAULT nextval('public.vehiculo_id_vehiculo_seq'::regclass);
 C   ALTER TABLE public.vehiculo ALTER COLUMN id_vehiculo DROP DEFAULT;
       public          postgres    false    214    215    215            J          0    16703    cliente 
   TABLE DATA           c   COPY public.cliente (id_cliente, nombre, apellido, cedula, fecha_nac, e_mail, num_tel) FROM stdin;
    public          postgres    false    221   kZ       R          0    25087    empleado 
   TABLE DATA           T   COPY public.empleado (id_empleado, nombre, apellido, cedula, fecha_reg) FROM stdin;
    public          postgres    false    229   4[       H          0    16635    estatus_pago 
   TABLE DATA           E   COPY public.estatus_pago (id_estatus_pago, estatus_pago) FROM stdin;
    public          postgres    false    219   ?[       P          0    25078    pago_tarifa 
   TABLE DATA           }   COPY public.pago_tarifa (id_pago_tarifa, banco, monto, referencia_pagm, fecha_pago, img, id_ticket, id_empleado) FROM stdin;
    public          postgres    false    227   \       F          0    16598    roll 
   TABLE DATA           2   COPY public.roll (id_roll, tipo_roll) FROM stdin;
    public          postgres    false    217   _\       N          0    25036    ticket 
   TABLE DATA           o   COPY public.ticket (id_ticket, num_ticket, hora_ingreso, hora_salida, id_cliente, id_estatus_pago) FROM stdin;
    public          postgres    false    225   ?\       L          0    25018    usuario 
   TABLE DATA           u   COPY public.usuario (id_usuario, usuario, cedula, nombre, apellido, e_mail, passwor, fecha_reg, id_roll) FROM stdin;
    public          postgres    false    223   ?]       D          0    16541    vehiculo 
   TABLE DATA           X   COPY public.vehiculo (id_vehiculo, marca, modelo, color, placa, id_cliente) FROM stdin;
    public          postgres    false    215   ?^       a           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 52, true);
          public          postgres    false    220            b           0    0    empleado_id_empleado_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 6, true);
          public          postgres    false    228            c           0    0     estatus_pago_id_estatus_pago_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.estatus_pago_id_estatus_pago_seq', 3, true);
          public          postgres    false    218            d           0    0    pago_tarifa_id_pago_tarifa_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.pago_tarifa_id_pago_tarifa_seq', 6, true);
          public          postgres    false    226            e           0    0    roll_id_roll_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roll_id_roll_seq', 2, true);
          public          postgres    false    216            f           0    0    ticket_id_ticket_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.ticket_id_ticket_seq', 19, true);
          public          postgres    false    224            g           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 14, true);
          public          postgres    false    222            h           0    0    vehiculo_id_vehiculo_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.vehiculo_id_vehiculo_seq', 20, true);
          public          postgres    false    214            ?           2606    16710    cliente cliente_cedula_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cedula_key UNIQUE (cedula);
 D   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_cedula_key;
       public            postgres    false    221            ?           2606    16708    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    221            ?           2606    25094    empleado empleado_cedula_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_cedula_key UNIQUE (cedula);
 F   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_cedula_key;
       public            postgres    false    229            ?           2606    25092    empleado empleado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    229            ?           2606    16642    estatus_pago estatus_pago_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.estatus_pago
    ADD CONSTRAINT estatus_pago_pkey PRIMARY KEY (id_estatus_pago);
 H   ALTER TABLE ONLY public.estatus_pago DROP CONSTRAINT estatus_pago_pkey;
       public            postgres    false    219            ?           2606    25085    pago_tarifa pago_tarifa_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pago_tarifa
    ADD CONSTRAINT pago_tarifa_pkey PRIMARY KEY (id_pago_tarifa);
 F   ALTER TABLE ONLY public.pago_tarifa DROP CONSTRAINT pago_tarifa_pkey;
       public            postgres    false    227            ?           2606    16603    roll roll_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.roll
    ADD CONSTRAINT roll_pkey PRIMARY KEY (id_roll);
 8   ALTER TABLE ONLY public.roll DROP CONSTRAINT roll_pkey;
       public            postgres    false    217            ?           2606    25044    ticket ticket_num_ticket_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_num_ticket_key UNIQUE (num_ticket);
 F   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_num_ticket_key;
       public            postgres    false    225            ?           2606    25042    ticket ticket_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id_ticket);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    225            ?           2606    25026    usuario usuario_cedula_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cedula_key UNIQUE (cedula);
 D   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_cedula_key;
       public            postgres    false    223            ?           2606    25024    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    223            ?           2606    16546    vehiculo vehiculo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);
 @   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_pkey;
       public            postgres    false    215            ?           2606    16548    vehiculo vehiculo_placa_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_placa_key UNIQUE (placa);
 E   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_placa_key;
       public            postgres    false    215            ?           2606    25095 (   pago_tarifa pago_tarifa_id_empleado_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.pago_tarifa
    ADD CONSTRAINT pago_tarifa_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);
 R   ALTER TABLE ONLY public.pago_tarifa DROP CONSTRAINT pago_tarifa_id_empleado_fkey;
       public          postgres    false    229    227    3246            ?           2606    25101 &   pago_tarifa pago_tarifa_id_ticket_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.pago_tarifa
    ADD CONSTRAINT pago_tarifa_id_ticket_fkey FOREIGN KEY (id_ticket) REFERENCES public.ticket(id_ticket);
 P   ALTER TABLE ONLY public.pago_tarifa DROP CONSTRAINT pago_tarifa_id_ticket_fkey;
       public          postgres    false    3240    227    225            ?           2606    25050    ticket ticket_id_cliente_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_cliente_fkey;
       public          postgres    false    225    221    3232            ?           2606    25055 "   ticket ticket_id_estatus_pago_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_estatus_pago_fkey FOREIGN KEY (id_estatus_pago) REFERENCES public.estatus_pago(id_estatus_pago);
 L   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_estatus_pago_fkey;
       public          postgres    false    3228    219    225            ?           2606    25027    usuario usuario_id_roll_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_roll_fkey FOREIGN KEY (id_roll) REFERENCES public.roll(id_roll);
 F   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_roll_fkey;
       public          postgres    false    223    3226    217            ?           2606    16812 !   vehiculo vehiculo_id_cliente_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 K   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_id_cliente_fkey;
       public          postgres    false    215    3232    221            J   ?   x?uα
?0??????r?\?ĩ??????5h?i??A?^??(????????r??.\??d???v?zLv?8???ڧ~R?Ț5??b??=?F`%G?H[SxW??;?t?G??uxU?(M???e9?K?????$????4{ƒ?$????????Y??Ҵ?ݦ9kl????M??!???[O?R7??O?      R   x   x???1?0F??9E/?????i????%:T??
K9=E???{B޷?r???????5Q$"?f֌S,#???W??|^???d
?????׹???P?z??Sum?&??]??:???|$?      H   7   x?3???WK-?L?LNL??2?D?s?????%g&* ?9?g?)?\1z\\\ 8g\      P   L   x?3?LJ?K-N??44?30?442615?4202?50?54Q00?#Θ?
c3cSN??.l????3?4?????? ?,$      F       x?3?LL????2?L?-?IML??????? W??      N   ?   x?m??m1?5SEx??ǀ?H??:?D?4vF??:?+@	???^???lFrIT?K?ޟ?N??t?=-?'{wI??Z2??:׋b????䧌??^??_?????	gg???,\?q?M? ?[D???C?????[N????c???J????!Y?Y#??&??"7??????Ĭ??A8??=?9?=? ???)1øM?Ȑ?8,?????ú?qڜ0?y?????u}??|M      L   ?   x?͑;NAD??S?^?ozf6??!??????ln?b8?Ӫ?????~??c6d???/?Ͻ-'??ޏ??z>Bq? )??f?27u?? -)Z5oɔr??T???F??U)AS???r?6?Z??R?Cw?YB?RK?1??bkMH??vv,^?xݸ%?rڐL?Ḯ?[T?!???C,@?U??&?;?l0O?ʈ???/??????R?`?xS??????????x?0?1?R?{?m??/??      D   _   x?5?1@@???a$?v?N??LKȎ?n/
?{?Ъ?hf=lUE?I??q:q?l?e?\Y? i<?
S?=q?ül׍?N????/??%=?     