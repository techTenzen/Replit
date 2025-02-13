PGDMP  9    /                }            neondb    16.6    16.5 !    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16389    neondb    DATABASE     n   CREATE DATABASE neondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE neondb;
                neondb_owner    false            &           0    0    DATABASE neondb    ACL     0   GRANT ALL ON DATABASE neondb TO neon_superuser;
                   neondb_owner    false    3365            �            1259    16473    discussions    TABLE     �   CREATE TABLE public.discussions (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    author_id integer NOT NULL,
    category text NOT NULL,
    upvotes integer DEFAULT 0 NOT NULL,
    created_at text NOT NULL
);
    DROP TABLE public.discussions;
       public         heap    neondb_owner    false            �            1259    16472    discussions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discussions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.discussions_id_seq;
       public          neondb_owner    false    216            '           0    0    discussions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.discussions_id_seq OWNED BY public.discussions.id;
          public          neondb_owner    false    215            �            1259    16483    projects    TABLE     �   CREATE TABLE public.projects (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    owner_id integer NOT NULL,
    skills jsonb,
    members jsonb,
    status text DEFAULT 'open'::text NOT NULL
);
    DROP TABLE public.projects;
       public         heap    neondb_owner    false            �            1259    16482    projects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          neondb_owner    false    218            (           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          neondb_owner    false    217            �            1259    16503    session    TABLE     �   CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.session;
       public         heap    neondb_owner    false            �            1259    16493    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    bio text,
    avatar text,
    skills jsonb,
    social jsonb
);
    DROP TABLE public.users;
       public         heap    neondb_owner    false            �            1259    16492    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          neondb_owner    false    220            )           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          neondb_owner    false    219            z           2604    16476    discussions id    DEFAULT     p   ALTER TABLE ONLY public.discussions ALTER COLUMN id SET DEFAULT nextval('public.discussions_id_seq'::regclass);
 =   ALTER TABLE public.discussions ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    216    215    216            |           2604    16486    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    218    217    218            ~           2604    16496    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    219    220    220                      0    16473    discussions 
   TABLE DATA           c   COPY public.discussions (id, title, content, author_id, category, upvotes, created_at) FROM stdin;
    public          neondb_owner    false    216   #                 0    16483    projects 
   TABLE DATA           ]   COPY public.projects (id, title, description, owner_id, skills, members, status) FROM stdin;
    public          neondb_owner    false    218   l#                 0    16503    session 
   TABLE DATA           4   COPY public.session (sid, sess, expire) FROM stdin;
    public          neondb_owner    false    221   �#                 0    16493    users 
   TABLE DATA           T   COPY public.users (id, username, password, bio, avatar, skills, social) FROM stdin;
    public          neondb_owner    false    220   �$       *           0    0    discussions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.discussions_id_seq', 1, true);
          public          neondb_owner    false    215            +           0    0    projects_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.projects_id_seq', 1, true);
          public          neondb_owner    false    217            ,           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          neondb_owner    false    219            �           2606    16481    discussions discussions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.discussions DROP CONSTRAINT discussions_pkey;
       public            neondb_owner    false    216            �           2606    16491    projects projects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            neondb_owner    false    218            �           2606    16509    session session_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 >   ALTER TABLE ONLY public.session DROP CONSTRAINT session_pkey;
       public            neondb_owner    false    221            �           2606    16500    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            neondb_owner    false    220            �           2606    16502    users users_username_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_unique;
       public            neondb_owner    false    220            �           1259    16510    IDX_session_expire    INDEX     J   CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);
 (   DROP INDEX public."IDX_session_expire";
       public            neondb_owner    false    221                       826    16392     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     {   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;
          public          cloud_admin    false                       826    16391    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;
          public          cloud_admin    false               ?   x�3���!C���$�ԲԜ���ԼNN##S]#]C�CC+C#+#3=K�(�=... �9�         /   x�3������������4�V�����U��6���/H������ �"
�         �   x���OO�0 �3��g�m����P�f!ƄlP�J]���d�]w01޹��/�XM��S�;\F�WlZ��z��z�yr8�Np��^r�NPY�2S󬋊��tJ�!�*ix�[��բTȬq|��
����4�6v8s7���QL�)"��C�`jj{K^�z':�z{i�p�N�ϋT��s��.̂` ���6��|���O�M��w�]�<i���ܮ��\4d� �os��         �  x�UU�n#7|�F ���l��d !�l�X��C�E ��$ude˒ײ���Fdb0ɪ��K^L6��ɂg���褄l\l�RkD@ �	�L��s���[k��� ���[u��a�✮w&�K�p�L���J���RC�hl�}���t�� ;=�X�%��u��؂��=&�Q��,��P
B>�#GT�V0Zr0)�쀭񥢠D��)�ł�br�KK�$�CN�=4�+5Ȧrfe�� ��(�R��>A�ճ��`.6����}�y:�Đ�y6��i�J)�(�\��j�s�Q�@D��r������T
�� �G G�r5�U1��g����Ϝ@8%$��$=��Z#&].M|��TH��N�[�}�|��\#X�%e�b���ʥV
���,�)�J��1�T��k ���0��]ʆjFB���)Z���D�x�����IՓ2��^U]9���;�q��ϫ��4�B��-X,"�Z�*�@�>{���a��P� Z��lp!ʅ���HV�UC�T�k��#��+rI���8F�`�ڄ�m}��`���U�tT�(B	m����r��Ǐ�ͦ?yx�|���?�+�d��Z����>%��yu�'�ho��m`w���p���Zc�����e�j�탫���:_.n��lg�qt���W��ߏ��/~��C�F+az��U�{Y���z�=|;�������ݓ�5M�w/�����w�Y�g��ϴ��o�������.��\���<���'oû���/����v�������r����~:�z���۫�e�������|���-��>ɭ�o^N�����p���ë����n�s���f���y�x��]�������ק�x�<������2m?]̯GG�Øn�������>���<���<��=�2 �^�6�O�P�o���z_����������N.���^�m��/����j`����tV�/G��~^Oz��~\<�y&��uO���K������4���Ms�U)�'Dm���A��a�mf_U�I�WA�Ŭ-��a�F�DY$Y�h����|	��9�U%V]��ּm4��{dxVD����H��]�����X���cҨ�.&[M�$�ր4���HbK.()&�T�W�k�f�h�Qȅ���n�z���jHo��؍���Q��^���h	(��C�'�[-�͕����A�xJ1�����������     