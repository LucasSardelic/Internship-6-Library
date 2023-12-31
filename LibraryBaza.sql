PGDMP  ,        
            {            Library    16.1    16.1 A    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16725    Library    DATABASE     �   CREATE DATABASE "Library" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Library";
                postgres    false            �            1255    16831    borrowbook(integer, integer) 	   PROCEDURE     �   CREATE PROCEDURE public.borrowbook(IN copiesid integer, IN usersid integer)
    LANGUAGE sql
    AS $$
insert into Borrowings(CopyId, UserId, DateOfBorrowing, DateOfReturning) values (CopiesId, UsersId, NOW(), NOW()+INTERVAL '20 days')
$$;
 K   DROP PROCEDURE public.borrowbook(IN copiesid integer, IN usersid integer);
       public          postgres    false            �            1259    16741    authors    TABLE     Z  CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    dateofbirth timestamp without time zone,
    gender character varying(10),
    countryid integer,
    dateofdeath timestamp without time zone,
    CONSTRAINT age CHECK ((dateofdeath > dateofbirth))
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    16740    authors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.authors_id_seq;
       public          postgres    false    218            9           0    0    authors_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;
          public          postgres    false    217            �            1259    16816 
   bookauthor    TABLE     �   CREATE TABLE public.bookauthor (
    bookid integer NOT NULL,
    authorid integer NOT NULL,
    authorshiptype character varying(10)
);
    DROP TABLE public.bookauthor;
       public         heap    postgres    false            �            1259    16753    books    TABLE     �   CREATE TABLE public.books (
    id integer NOT NULL,
    type character varying(20),
    dateofpublishing timestamp without time zone,
    name character varying(50) NOT NULL
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    16752    books_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public          postgres    false    220            :           0    0    books_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;
          public          postgres    false    219            �            1259    16800 
   borrowings    TABLE       CREATE TABLE public.borrowings (
    id integer NOT NULL,
    copyid integer,
    userid integer,
    dateofborrowing timestamp without time zone,
    dateofreturning timestamp without time zone,
    CONSTRAINT posudenaknjiga CHECK ((dateofreturning > dateofborrowing))
);
    DROP TABLE public.borrowings;
       public         heap    postgres    false            �            1259    16799    borrowings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.borrowings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.borrowings_id_seq;
       public          postgres    false    228            ;           0    0    borrowings_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.borrowings_id_seq OWNED BY public.borrowings.id;
          public          postgres    false    227            �            1259    16776    copies    TABLE     c   CREATE TABLE public.copies (
    id integer NOT NULL,
    libraryid integer,
    bookid integer
);
    DROP TABLE public.copies;
       public         heap    postgres    false            �            1259    16775    copies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.copies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.copies_id_seq;
       public          postgres    false    224            <           0    0    copies_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.copies_id_seq OWNED BY public.copies.id;
          public          postgres    false    223            �            1259    16734 	   countries    TABLE     �   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    population integer,
    averagepay double precision
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16733    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    216            =           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    215            �            1259    16767 	   libraries    TABLE     �   CREATE TABLE public.libraries (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    librarian character varying(50) NOT NULL,
    openingtime character varying(5),
    closingtime character varying(5)
);
    DROP TABLE public.libraries;
       public         heap    postgres    false            �            1259    16766    libraries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.libraries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.libraries_id_seq;
       public          postgres    false    222            >           0    0    libraries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.libraries_id_seq OWNED BY public.libraries.id;
          public          postgres    false    221            �            1259    16793    users    TABLE     `   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16792    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    226            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    225            t           2604    16744 
   authors id    DEFAULT     h   ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);
 9   ALTER TABLE public.authors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            u           2604    16756    books id    DEFAULT     d   ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            y           2604    16803    borrowings id    DEFAULT     n   ALTER TABLE ONLY public.borrowings ALTER COLUMN id SET DEFAULT nextval('public.borrowings_id_seq'::regclass);
 <   ALTER TABLE public.borrowings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            w           2604    16779 	   copies id    DEFAULT     f   ALTER TABLE ONLY public.copies ALTER COLUMN id SET DEFAULT nextval('public.copies_id_seq'::regclass);
 8   ALTER TABLE public.copies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            s           2604    16737    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            v           2604    16770    libraries id    DEFAULT     l   ALTER TABLE ONLY public.libraries ALTER COLUMN id SET DEFAULT nextval('public.libraries_id_seq'::regclass);
 ;   ALTER TABLE public.libraries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            x           2604    16796    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            '          0    16741    authors 
   TABLE DATA           b   COPY public.authors (id, name, lastname, dateofbirth, gender, countryid, dateofdeath) FROM stdin;
    public          postgres    false    218   �H       2          0    16816 
   bookauthor 
   TABLE DATA           F   COPY public.bookauthor (bookid, authorid, authorshiptype) FROM stdin;
    public          postgres    false    229   �R       )          0    16753    books 
   TABLE DATA           A   COPY public.books (id, type, dateofpublishing, name) FROM stdin;
    public          postgres    false    220   �T       1          0    16800 
   borrowings 
   TABLE DATA           Z   COPY public.borrowings (id, copyid, userid, dateofborrowing, dateofreturning) FROM stdin;
    public          postgres    false    228   1]       -          0    16776    copies 
   TABLE DATA           7   COPY public.copies (id, libraryid, bookid) FROM stdin;
    public          postgres    false    224   �{       %          0    16734 	   countries 
   TABLE DATA           E   COPY public.countries (id, name, population, averagepay) FROM stdin;
    public          postgres    false    216   �       +          0    16767 	   libraries 
   TABLE DATA           R   COPY public.libraries (id, name, librarian, openingtime, closingtime) FROM stdin;
    public          postgres    false    222   &�       /          0    16793    users 
   TABLE DATA           )   COPY public.users (id, name) FROM stdin;
    public          postgres    false    226   ��       @           0    0    authors_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.authors_id_seq', 100, true);
          public          postgres    false    217            A           0    0    books_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.books_id_seq', 105, true);
          public          postgres    false    219            B           0    0    borrowings_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.borrowings_id_seq', 800, true);
          public          postgres    false    227            C           0    0    copies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.copies_id_seq', 1000, true);
          public          postgres    false    223            D           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 50, true);
          public          postgres    false    215            E           0    0    libraries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.libraries_id_seq', 76, true);
          public          postgres    false    221            F           0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 500, true);
          public          postgres    false    225                       2606    16746    authors authors_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    218            �           2606    16820    bookauthor bookauthor_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.bookauthor
    ADD CONSTRAINT bookauthor_pkey PRIMARY KEY (bookid, authorid);
 D   ALTER TABLE ONLY public.bookauthor DROP CONSTRAINT bookauthor_pkey;
       public            postgres    false    229    229            �           2606    16758    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    220            �           2606    16805    borrowings borrowings_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_pkey;
       public            postgres    false    228            �           2606    16781    copies copies_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.copies
    ADD CONSTRAINT copies_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.copies DROP CONSTRAINT copies_pkey;
       public            postgres    false    224            }           2606    16739    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    216            �           2606    16774    libraries libraries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.libraries DROP CONSTRAINT libraries_pkey;
       public            postgres    false    222            �           2606    16838    bookauthor uniqueba 
   CONSTRAINT     Z   ALTER TABLE ONLY public.bookauthor
    ADD CONSTRAINT uniqueba UNIQUE (bookid, authorid);
 =   ALTER TABLE ONLY public.bookauthor DROP CONSTRAINT uniqueba;
       public            postgres    false    229    229            �           2606    16798    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    226            �           2606    16747    authors authors_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id);
 H   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_countryid_fkey;
       public          postgres    false    216    4733    218            �           2606    16826 #   bookauthor bookauthor_authorid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookauthor
    ADD CONSTRAINT bookauthor_authorid_fkey FOREIGN KEY (authorid) REFERENCES public.authors(id);
 M   ALTER TABLE ONLY public.bookauthor DROP CONSTRAINT bookauthor_authorid_fkey;
       public          postgres    false    218    4735    229            �           2606    16821 !   bookauthor bookauthor_bookid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.bookauthor
    ADD CONSTRAINT bookauthor_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.books(id);
 K   ALTER TABLE ONLY public.bookauthor DROP CONSTRAINT bookauthor_bookid_fkey;
       public          postgres    false    229    220    4737            �           2606    16806 !   borrowings borrowings_copyid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_copyid_fkey FOREIGN KEY (copyid) REFERENCES public.copies(id);
 K   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_copyid_fkey;
       public          postgres    false    4741    224    228            �           2606    16811 !   borrowings borrowings_userid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_userid_fkey;
       public          postgres    false    226    4743    228            �           2606    16787    copies copies_bookid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.copies
    ADD CONSTRAINT copies_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.books(id);
 C   ALTER TABLE ONLY public.copies DROP CONSTRAINT copies_bookid_fkey;
       public          postgres    false    4737    224    220            �           2606    16782    copies copies_libraryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.copies
    ADD CONSTRAINT copies_libraryid_fkey FOREIGN KEY (libraryid) REFERENCES public.libraries(id);
 F   ALTER TABLE ONLY public.copies DROP CONSTRAINT copies_libraryid_fkey;
       public          postgres    false    222    4739    224            '   �	  x�}Y]o۸}���_��DI�-_M�M�I��-�Y,(9���w8�-�R�C�:��̙s�L(�i��T/�ga�AB����|͒ߒ�����~xU$#,��:��t��#R��<����+���~�V�*֔����z9H�E�ݱ��uR��t���Qt�d���c� BF��(wb WM/����o�t��˟���&��A��t�S��\u? �G1��㫍R��f�b������p��!̵G��\�K�-Ea����]�j�9Jr7ԭ�(D��d��])m�h5E(�����%j��GW�$]�j����Ȱ"Ay]w$Ϫ�umR!�E`"�+��N�Zф<�A�x�4�r�a��y�4u���AJ��=���G�5҅�@
����(��$ł���<�A���]��ž,V��L*�g��Mm-�N(C�"�y^���AY!
����d��NȽ4^�)ה_�&�|&<����z|Ucݪ~��`׀E�CqN�p�W���������Z��G*0�|6�)6������z��ц�%M���3�X����$J���3j � /�u"�,���E8�4 L2Jx��AñI�b	��c�A�YB�"7�0�F�~��3�� �/��BU��/R��K����9Z���x����j�T�@�2��>'�.�Ip�Ա���([���1R���d^Z
K�Ya�%d��kYR�:`�e�r�F�.����2iX��<�)`�!3[���F:��0j�Bp�{�����v�Hmq�l���FC~�7��NA>�}׸�t,�$���"R`%�����И�#J����Xк.�U��'٩�nh��f�4��_��_�k�Nh�� D:[� ����S^Hn�\�U�H����^��%_uW����~rQ˰K��OK��:kM���F{va���>s/CYX�0�W�����8�F�s=R,'��D�,z�����N��#&獦H��с�/b�Q��������b�!�yj��yR���~h�=�O_����#z�Z? 5i}�c�)� ��b�\Oږ��Δ���GV v#(�AO:2�n�=�a��$� �o��au�S&�W���J��� �t�^��[.���K)�
f����~n��8�/�gt��G2�E��B7<o�nz.<Od!rd"�TK��G������$��D]`�,��
��p'FW[�_��L��
iX��fтW��Av�E9�zr��h6�=��m6Gt����ti�q�,䑝��R�e${��ۧ�.�y�)"��@�j��\�^y~���� ]B!�*�����B�_�I<+�s�*�	@c��,�P�q�KbC3�c<��UN�����Lݞ��Śrbx?�����Sկ��O`A�6D��Z1;ɫ�*�)yoP�e@.����I��`;&�����݋c/�I�i'�8�0`��.Z#�v\�+�MH�{�3��d*TΑ�4�5�p�e�N�P�Fg���~+7�laF���4\��,�����P�F�j��ZKa?O^��J����`�W�O���ϯ�����V��+���kgB��H��y��D�suc�a[9�>�������Y�i-��yJb��z+��Z��:��pE�.�E�Z�A�l�ah@�J�%�d�rǋ�N���75�O\1�F��rQ����V��~�>iZ�Y#j%i:��-�GJ�8b���ʄo9��^7v!�����W�9}���]�0/a���0?�<8��|����(!L*�h|��y]����1�X��H@��(a��L�κt%q�!ݮ
J�������p��tA��B�W�
�y�|Z�W�H:|��1@Lv�"�w+aM�w��L5\���r�L�Rd`�AZ�w�ar�'8�|���6� �׽ѐ�8v���䒹F~���r�o@=�u'�?��5�C�It�*�H�,�AR��X�G��,�hI��=��Vx�ᗧ���&^(���l�� ���U\�����m�e�@���N5F��L�K�s,x��()^i��v�[XΚ��h��+z�.e$3%��{Pxԃ�o[��C��P�}6����%�Ѷ�W}��Z�X��Jߞ�\[f����F�/E�{𭩼���Krr�;��@mj=�y[�5e��&�nA�����=��鶓D-r��A3̨��ˎ�܉1���t�,aAFG��{e��gzBw<]LYa1�;��԰��)h��w�CY�\V� D�Ɩ<�tQ\�����
㣢��f����;w���Sɼ�,�� ��b���`��v/G_\��G�����R�U;'��������HP��%^FVU��b	V�۱�ǍVlǅ<2� ?�S�dK���_��؛,�F3>&V�\-lP�Z����J��n4�3�F�CU���k	����c��z����8�}��$���ؚ�9�/�H*X��������|h�l~�>�=!*����oo��$y�{�f�~�?X��`�������j���kgQ      2   �  x�UT�j�!���0�$&�w�M�c�6V��/ԓ;�x~�N����Ͽ�o�ߟAvA�8��x���$��Íz�ԡ	�����:��-4��I�R�"*��ۅ�H��$�BD	��Nyvo)l9�Q![D�-����Fviz{z�P����ٲsz�V������i�5鏁E�D��gt�?3��m7J:�.�6@6��ˌ�:�0xkI��i��`9.g�Q����u�F�Nb��E�W_����6�:��@�nk>.���.����\�{ke�G�9���G6t��{�q�j�A�-ʹ�ՙ1���\��{�@С�Q�u'�"v�ŠC?�^<��Ӵ��6`b(�okj���Q���L'�2ǲ��(>����Z����}/`-�qKV�������y��Z��      )   �  x�mX�R�}F_��r��L_���` N �u�΋p[q[��x�g^�<U������d�HU�T��m���:;�WfiŃ�*�(*GQ<�rE����;UW���$��ѕ�o��J����|��V��8��"E�(�� �F�C�v�V���M�#~��O��#V��c5��8>��Y�ņ�A~�(�FIFuzm�J�8:�Kݴ;�}N�%�����ʅ��߾CQ�TMk��1�y1��A��Z��Ǧ��k-��JZ�`͆��u��䠖�Vٗ�����ᛮY�8=hZ�-��#�ϐ���6����h:����*a�^�#����~T�7�Y}���i��_�J
~�B/ۍhX<	:�7���5���w���g����Z�����(���(!ϞYYίJk%Y\|o^�N�f�k{��%y��]���Ǔ�U�$���v��3Y+�Lװ$����j��k@�%�0�&"@������ӽ��c9_���t>-�jV\͗J�J���Q�#�$C��}��!睵�X
��aDX��ȒtĢ�@,I�僱H���d�8h���4.~���K���X25w�>���Rr���Z���ُ!�H���#��{�>���_t+-JZ��8,�_�>�t0�+�t�/�A
�@&:��ݕ�Vn�eII�<D������0;Y�Y;ZF��4�/Z���[��'Kc��e�rNH�d���gO��h��X��<bi2��D4������v%�(Nڍ�}��48=vӉ�$?�o�m������B����>iҼ�f+-K��/'�A�hkqo�;��4;�k�hN\Uɀ+��V
�i�~BC��W����`�XZu#��(%#��}h����`�A: ��'5�{��T-���� ��J�W�{�xѷqL���2$�P �λ1�d#m��I0��t��x ���A�s����b�>���xL�-�z)*(Ӆ�K�ղa�`�nkǣ���Y�\`�\	������<מ��ZE{{�����[.���?��󯂯Ū�M�x-��;����=Y�	�d=�ǝ��.�N�%�En2�o���W�o�aOVƝ)�|#G����h��j�l��*'Ä��n��(��<���Y��|�cߣI`�8)�����J��{�lU+j6I��O#�4����n�$���w�����\+(�p�o_�-�/7��I���An&��h�dB�F�������������N�|Zd-a��� �_1��u�V�b��@���Z�5mx��o 9"��){O�vܮ���~�p	�{)�Ǿ�����4��zi��>�
�OY4\?�Ҕ��v�s	9Å\��cc��9�,<��+��s~��dw,�0��^�	��J迠V`�P	u���,�V0�k���oz�
QA�Y6�%�\ڕ���Z`��2����%Me�l	N���ZM�K'�� �,�g�&��Nj���T����B,6��ѼY����vQx> K>o�;��`73Ϳ�{�8��^�i��g,�D87�V���G�l���t@h��׹ŃF2�ڕ�Z�]��n����Tz��lz%G����Z�Æ�G�>b9��|��i�ÑǕ�`e�K�k�e�N�{���|L�_��D��Nh�O^�,�i�o(
};Ƽ Z�������W
���"�Н5�X��g�S5'�8����h|^)>�@�!���R�h�:���CO� "
���v�az�W�^����V�"
���,�I鯎)$.!R��`E<4N����.�F����g,���t`=J{�{���Ұ"���QQI��_������
:zG�� �3e���=+B���������+��e~[H�m�wg\�|�/��:�S;��Ygh(+�u"�45��Q���s�PR�3��s������X��A�ic��iA��N�VL�{��`��U��<��$��vq�[�+c�XIw?�DC�mN2aMp�`e�rY�3
��Ӭ��K��BP�����A��z���g�2sc�y�<7��}��g�|���^i�{��?���������y�Lݠ�[�1�Q����fXY�0o9�3�&��;��G�.�`8���Q��n�>Md]���G$��QL�5��o����l��7���ǩ�8��Zn �~��ڸd�/��Ky�}A��/��^�3�X��^�oc�ZS�$      1      x��]Y�,����Z���y�<�Zz���@T�g`mv��&� ��K�O�>�������ǹ����߼��������S�~��$~�����O��O������~�>�~b�������I������~_>��}[�������{��k�����e��=�i�?���z��5�O��>>����ϰ~��'���E|����O�����=w�������9 �-���`������5x�� ��Q`� �!R�\�3���S�R��'�O��.y�hܥk�ҧ�%�9e��mB�����I������S���I?�p-mݾ����D�]�ܥ�`��CX'�2�!\p�R�.��5�h��E�]r���/Q�듄h�,�<�Q��h��n�O(�J�����P��E)�Im��}�:^��I�K}l�-�i� ⵧ׵��F%Me���ﱆ�R�.A���ޥ�߻�h\'�����9(=�k�;�ʒV���<���C��ם���e܇���,�@�-ܗx+��w��˲�u������������c[Y�&���9Dm~@��ܖ�&���?CO�!N�e�� 3W���9�X)��vԢZ����?_�wiۊ>@�g*c�ָ��>���Ad)��f�5̃SjD�:�ZP��@;}ݞH�
;���M{�7χ���Ϗ��~(G�����h�rf�v~����^ְ-�re��*k�0�x�ש]���-�O+��Ҹ=y-��(�Eֶ�k��_���C�J�w9�׀�ֶ*�gC��'}�O��P4��t^ҪD�k�٭mU����&�.�{r���}��$��p�u+�<c!|��6�P�}HN	���\k��x�j��zist/Q���SVg���rN�vڑ^J�/'���������5�	��]�ϵ����h\+����4��3�?ɴ���b2��{�]�J�q������.>�ѝn��C��ۉmE������pإ̫\vZ:�8 �' vZ�4�RKfP��C���0p����������*7�C3���]R^e3߻,�@}���ͫ��%�	�'u7���ve�P�v��`�:�.�0\鴄OM�I~z$74�đx�4��	�,u��P>�P�2�K��o�u, -��4�l�z�"u�i�M��p����p���Wq������%�.% ����.u	�H�!�F$;=p���W���˖�ЉF��Qi�d�r��:�D�D,�7�;���1��h��A��#+� �K������*v
���0��]�0"����n���j�U���n)Q6M����ҮqE�|�(�|z;P8�qw��-��L�]*ؤ��[����
�{;���PО����m�#Y��n�����r�Kb�:��9�S]mQ��4��xшD��H�Cy�I/����P�IPa*ǵ~�:����lQ����Q���e��U*X D�Zv�*$���/�1�B�%��0/����p�G�n]��<0n}8�Ҕ��lM�G�V{!ZHr��5�A{e�-b��iD��Zs<�U���%��u�W8b`�q���9��ضW���e��!�{��~�/rŁ�x�_>��x1L�	���u��dq. 3猋Aj�.���ݭ�R���7�O����d��I�Z��Ag;��I�����>�hI�W�هS��v���"�-lq���\ｗ����v?��]�e�:��Ԑ��^���D�� ���x�F(��Wὺm�}�~��}p#�ԗUk`�9.{�:�(����S̤ŷ�ߦ��	k_�v���e̵+i'�Y�D�,d���N`kUJ�FTK.��	�N�s�0�P��V���,L�ϼ:B0��p�W�B�W8|�G��.ݮ�W��n5&.�IŃ�U����/Y.<�jq6�8jyK#nn�E��G#� =n=hl��������O�%���+��Ի�.i�ܱ��JEw4�[�P7A�G���$X#��-f�P1�wQ[bX��>5�f��pw�ݟ��N&h�b1b�>�|���T�9�!ok��Dګ>�S�_%��w�� %����;�7�0Deq�;؃y�G	���G�C����H���ݶ� R$t;��|��H02����{詌X�rb��<�����6d�,.���{�u����C��c\R��G'Wh���ĝ1.,��̼ yƙnz�L����{��y$a{��B�"��e���R�������'�+���k8�F����)�
ޒ�q�p��R2q���s�������`��e?4���O�uEʓ!2�7��ݑ3勡ΐ�QQ*�o�J��]�D?Sh�P1Ɯ��^^����H����F��#�w��ȈW�́��4\��'��)�NsX��|��"2"%% O0�p�Ev7V��� ��>N�k�:X�\�X���PL����-�����`d":.�Q^���}���JF���9,K� /9`}a�� �"f�h*XN����xm԰��30�'�%����a
�p�j�C4xt�SJ�#3�����8q8��N�OI��ȝ�4�:�-;C
_���d	�X��*���˃3薔��0�?�G�|uԢ�V������X���D�rER���̏�X�٨0u��0��'LF�a�r �,j�!�|*�q���'�"�y��[}�|�#����)]Br�-\��<Ny�g�d���-�*$ϼ��yXR"�(y e��W�LY5��b���r�tb�eC<�N��d�p��֢�.�ʈ+���r�B�U���v�.`^�\��4G3)��Jyw��0dEkBIN^�+p�-o�䦷5���í��(��U��" j+&��j�s͠r۴r��Q�:�{e)�ثb�����E��U�\���Q����2�_�l���t�+ַi�f��g.d���잃�|����E�;աY���OԮ�ˀ[�_i9�ֶy�+<a�&��σ
VZ3��]��i�V� �m���>��G(J%��{�싚S��>�pXp�ąn�GZ�<�Y���V<���^m�cp��� TĲa2}�W�K��h�068a �r��2V����;�Ktv��tf,
�|8$���8p��t��l58��y ��2X��� I�h�#q��L5��%)���c{]����
�JYg9`���v����� ��w�Lx���o�fE^��������ʽU���"W�������KƄF�q9" �3�B<�"3���ÅS��1��˧>e����*r�$[�#�1G�|�����ƿ�*fU��+�paYN形��!"�r,�i�(LV������:D�1X��+�@Nb%F��O���?�J�B�ê� 6x�����k��>o���I��"T����@��r/�;�O�9F;�8���|�����h&I⨗l�Ky�8���dGӍ�f�+�%1���IE�dχԶŲ�:煚!���d�LLv�跫(�|�+�;'7p8`e�x�	&�^�����U3��^E�,�v[�!Z�A�����;��^�Uw��&�n����o�ǽz2<"P������k�*=�[1��s,�Ql��|8�V����P�nl�>u��u���Q'f+z�B�B"k0i��Tfew� E_�h�,,���Ri���g��l�ኝy�āSg�)0�N�� 5�8^q� �|̱��b���;e�h�� W6Ca����H�Y*����
Sy}��<h���!��I����ԙcy���$^7y���e��>
�C�+Z��X s�P�k�>��W�ZG#�C16�S-V��h��b5`Y(���h3bd�U��4\�f?��G,�կ9�Ο��dnd���c����EzN�L+���:p9c��׷9��#m����*�b���t���=�A�xb�&�ya2�y���g�
��)J�|�U��Xa���s�͐�>���ѓ�3>��q�?��*����Z�����O��GmjNL��v	�JUx�	�R2���Y�I:�ۓ3~{YY�S�.9s|��g�m[�����D�'9��%����~f��Q D  *���a�Q&ˊ�ef�v�\��]}��cI 튇�h�?0�>�8�b�zR�!�;G�E��:�XvY��T]���q�Cf��({����#�J�zw����@U��^�L'��Qڃ�3�lF
��@����)X=�gTh�լK��2S�+�ꝣ�����3XiԥBK�l~{-u��O��tV$�/Q�9�U0��-5��)Z"5��9�ݍ����*��ܫI.d�1��S�hn%�;X)��K��m�=�f�� �3�0�+UW�YΙn��~�&*4�%Ro[��N|�uN��\���K+�g��jfҰ~Pŵ��49�/��NCYU�k��i�5z�+*���*˥�p@��/���o��U&�X���kh+��#SUt����i��{�|o@��b��աj+e�*F�֘��֮=�Ct�f{�%��Lz7[|�V"Exy�y��cO?�BEUݿi�\������61ۙ�y�(�(��ܩ1�BR���l�FȪ_�k�I��
�}ҨK�d�T��*R䥰WfG��Bn��6N�U�:��i�f���+-�O�wi�)+�K��ʒ����9HZ�%f����0�n�45Tʾ8Ԛ��Q��4�u���!o�8� �ʒ)�<�Z�bz�^��Z�y���v<�j�����FM]��,i��w�U;	,c���:nC����Q�4#'b�3ŎF�j�2q����Ǩ���s�+�L@�*+*��,�#l�l�A�l�0L{'2��Y;�
�ǡn"�J#����E[�^����d���޷֟��n D�6n�?��s;�=�V4���C��4:���t;u���^e�Σ�=����G�ا"����W��~�i�n�s�82v�uX�0� {���Y1gvۡ�7;k:�Z��nv֐#B�Bը��QXSy��E�3;�:Z��5��Ev9��n�_�?��+����-8�_��*-���sY\��:������8؀��s��l?��@-/�٩�k��ý��9��~ՠO���4�k�:-i�h+�L��t�:go�=.\Tb�(%����^��=��d(o^��<V����)��TMpR7ݞ�� �����|j��h;�y��TZOp�K(�Rvi��겜��9�xI-J_eǇ��B?Pv��c��!_�#׫鈅V-����7��7
�	�\�3�KTW������zB6Cy�dq������W��g��/Q�9}�q��g������:dH_�ف�����P�v����E���<K�p���sšG�$�>����T��I�-oͪ̚%+�M���ES�4*W�y�H�Џ��S�d�n]1�d'���a�+�W�f.�ݻ�ظt�gY�=���9P���2%n��"�KN�R�-���t@Rs6�y�����e{kGVӈY��b4�c
�5�}���4bT�Z�C��<�R����o/0$�i�3/���p�g�u���aQ�9y ��Ձ/*%�F��U]�s)d�+T�KJ�n�I�վ����;(���^�77�j�7��ڙ���W��μ��NVT�W�ЩV_EE4���Į*J�Pv���
9�C��\���5[u���e�,�^���3���������U	�\d ��D�Q�4�:�%W�11��f5�腟|�f���U�l7��=��9����#��C�Bn�g|jٵ���H���"7�*��&��;~��<f8~�)*��3 �!�
�э*�zd��w�[���F�^/�u��B�AU���U�}���:��k����Fu�ϡ���3��|��P޵I����	��-�ީ�W�B�gy~q�CƤ�o>C���/n6���@���ɓ�8���gt߼nԩ��8�Q��ݩ�[q�Ae���u����/��i��cio��C.�Q�"xx��L�`髼%���֖�{�l���-@��2�'z�@�u����� ��aa���u*�yN|��W�+�:��QJ|#;�X/lq���YjV1�6p���>�S�1_8�o85c}%p?�Ssֲ���lrw�ݱ`gH��A_e�%xRUN��[�������2z����Y<����E�̃�yZh�ɪ�hi8Ȍʪ_���Pg�X��Q4"B��!�H�W�i3M�����e��f���#���*��3�m�0�,���9N�s��P{}�'�d�K�uO�j�v�x2��ڒ�9TT�4����>t�(���)���&������9��*i������38��w�ߎ�c"�A��>�	Z���{��U��3�4��pa���]��f���g[V�:���9��@>�|�1������n��6����^U�ҦE3s E.u��]r�L�~��n�p��>_0��[�|��*���Li��ʴ�&6�S�u�Z�Hl;�8T�%��^ދM%��Q_Kx`�2qe����J>�U��s��,N��Q	����2K���,e�q哂̳"\���:���Ts|n� �Ym��R->Oo�|���y
�~!�LQ��#@fi�ԟa��u�Y��y��[�j��L�����E3�ʛ=%�-�j����;��)~U3S }XN�`�f-�0�jL��ao����,�I��s�>��4 c�P�Pڎ���}U#��z��yK�u�8T�g�\Ǣ+�����J7��Q}�hs���%��:&.�;({.�^�y��Yzdϻ��9�J"�Q}��Pը���O�0�}�J�������F�ʀWb7
GT�(*���D�Vv=~�cc@�������$�bu��pSu�,��Y�]}ό��\�q �vI�4�R�I��p�y̺T�.����#��1t����^y{��L��Vo%��O_!w�ƹTy�s����T�h�"��#��u>��v�,�/'ȱZ�������ްW�;p��g�0� U��:��	O5*���wP23Qv�q ��]�^k�&��uO{��eY�Y��g��@2�h�V�}O�~Ӈ�uj��o]*��!��ILo>5ǜu(�@=gw7:�Ʈp8�2�|�_�S�+�c�����!ڮѸ��m'��������G���A�E�[;�	��9�X�KMow���:�au�[��PDo���G��_� M�,�
_uz��'cg�ӛ�5͚ثCֲ�D�;k$���8Y�Cn�^W�����^iw͇�ڥߧ&;s�?�\a\�< ٿ�*;�"(�_��hQ���}r�7�w�r$īߣ��)�܄����l(�[�e� �#?�Wv��8��.k�hw������n6�=Ǘ96�SfˡŎ�^\G�p:�Ⱥ;<��u,*V�u��-�-u"ڏ�4��~�rU2u���/om���_����p�[R�5<� gxQG�ӧ�w�T���[�Z��
ˠ��3�ǡ�^�t��4��Ǝ�;��"�����U�ہ#,W��[��9�,�V�^�E9�G5{���I�V ��6
e�v�ܢy2䅷����/�f�px�O�]��=�zw�]���7�φ4~S��B_e�:�*-J�;���s�>^d�Z%�����m���>e�Y�̼��d:��>\E���H#<���s���|��c����<���X����n�(�;�^�}�s�r���:��T�Y�:X�~��{%]ҭuR֋��PJ��{��3�E�~4gP��S������������      -      x�=�Y�,9D�+�J�؆�����q��-=݇���5~w��x����\��E�r>�����;��ߙ����[�W��_�����]��g���������>c�BK�3�o��x�)~3�ڿ8��8��~{>�������������u?����e����V��g.N�|fh3>ssi��E�t9����-�|��Y��;m�9�hM��|��^�[�����9�\���j�gi���I_Q���s�.n�	�]H.�E�����F���h���ŝ���%�EJ6��Dy�� �W�<�M`Pđt��x6ku�/%�>� ]b_q�/��F>��n��#�M>�_R��'��h7S��|S�[Кt|��\lDg���9�+c?�!�>����x��Ƞ��ף�ڥ/
�9�|�{�'D$��Uo�J,&z�>���o>9�G�O�|���g>��*ı=y�jiQ"L����$��a� �V�4dTZ�>�S� (�ƺ���Ƞ��N=��^�RUB��0��ٲ�w�+��]|Ho`T2��n����{=|K@|�G |�Z+<bPy"�!D^&�
�Yk���D@!�¤8���#�P�����K\�2�@F�؆��a��b��l����1{itXW����������^M��2�p����͂èm�u���@T�k�_&j�:�H�����HT�2*Z��3�`'9�M�Ѵ�D�/9m�*5��DQƬ�m<�X�4(�	��c�7p"['�*F��ve�����T��
����c�������9�9Cg�߰I	-��1��%�Bo�[<7�Y�p&��1>Qƀ�* ����N=z�v�%풠ʨ�<�Y��T�����
�Yd��-D�t#A������P�Q�Kd�Q&>\�(���JA�ruݳ�V�Õ|� �aC��WJ�e b9B���\�y�6�,�fS(����/~NV!���\��祦P��GB��L�\ד+�H�t�9�O�s`���y�ܲ���K�S0�Z;���pH��37�$^�0��� �bX�����Fs1��|�r&!��B�pn0�:�8�W��Oa[B��~�K�~�zW� }Z�g��@�i.{\[��mfS�Ӽb�/��шl�ꛆd�S;�8���h��@}��a��TÇ,2�۱cu	F���i;N��:�o����AjAR�	�-��?$�Z> �铈S����n�%V@��!���4)G�i���;�Xjc��8 ��h%�+��	V���l�֯m��?��:W��@��6�P:{�D;SN�t�-'~A:'@º��\b�΀Z���1��֛��Ñn�ݻ���N6,�GYe�UPi����u񏥖����҈YF�%I<_�2u"���L�Q<%.a	�dE���S]����KH�d֯A�P�^��b�mV��xS錑yeG�]F�)UGB&��i�`�3T�y��m�Q��>b2/�K1 �7���s�)��t��%EV�섵�tny����j`.cq�D8����h����Y�k���ŝ��Q�٬e�i?�;��|�d�s�"U/����۬�/�udQ8N�-c�)��� ��׮��-��+a׮�r���C��>�
������Zi�mh���V�7�I��:�#�m/'۵�B���j�a��c�L�j�u�4�}N[-�qI�.ab���h�1.,�L��T�h�"�9⺭q��p̠��1�DG[4x]�\��/�Y� ��ꈎ~IЯ˧tT�YiO�)����Vv�e�� yY5��!	���r}ȹ��$��0n��dw@�`�:e�uha��@%�r��������U"#�oM��g�
���AҾ\ý�O�A<�.��C��k)9�ucti�|�����%~Vl��������~�)�UT�r�K����6���r�=��c��io��%�SQv��]=���J'�J�c�
U�"���s�X6^Y]�&�mHv�)�6�L��C�tڮ����<V��Ǎs!_��"�f%��[�d��2�{+X�JO"\�s.���!�/���_� ���W�Ɨ�k��"0�����{��Ćm�t��٤�ԉ��TtS��T�;.��qw�u�>�g�J�ٙ ��R+��&>��~ �E��L�ZVH�NP��⺶縎�����$�Ǘ#�/˅`~�L�����A�1:qW��|� ���I�_��ε5��n| �t� [��.[�\�_�iߥ��k3���p�ey�ꚟ�.��1a���E�_{_����9]��>_��U��o��?Q��ƨ��䛋���'W�/��;�j����ѽ'E�M����h�r��=�,+$l�.�S�n��DQ�Fb��>K|ҝ���L��tR|s���ӝ��.V�f����6h-�n��}�F�Խ����s;z�n�.E�e/7K���7���Z'?rQ;�T���f���&qttP�#qw�����Y���;r�y���� 2u�~�`���|�ގ��>�
�n��aK�T�$�������ܽK�]y�n�3|F�@k΍��G�QS0�o{��Wq����IכP�[Bྯ��o�E4jw��*�~j�n�)�����.��͎K`ۄ��'��;��.i��~$�D?Q��b���;ݗU���9/���$�%�S0�t��,��J�]��6ٝ2�Co���E70í?(���r��Vl�eYZ�h���C��D�@���:�P��he�_��En�X蘞/=�=�|����������m9Ù/B;�RTׅZ<�]o&�n=�u�e�M�Am�a�(�:�%��iaapg�=&�˭n-����Lg�*��u�*�G"�����$x���rgYZJ�N�����:	��"؝����tl��>�q�C�Ώ%j@��JT�
��� N��Eb�-	W;2���^�X�'��!�ll�G�u�PW�y��Z���0�����ft��jD�n����N��r��%�����B�tm
g~5���.�w�M��t��7W<�y�>'k�/�<��y�~yQx9�u4�y�x�*jvچ�e�s��m9x-��s$}$�s3=��.��򜖾F�ὠ�:)��<����'�R/i�Q�h�
ޯ�y��j�m~=�S�� �2B����B!�sZ0���]Ou�������_���[B�}vU'ݯ�~E�+����`��3��}]�Vt_���~�Kl�v'1w��`3�3�e��5����b��VA�����=�_���t*븀��_�ϐ�n?��^��.*�F���b���į��r��W��H����\��D��P"v:��0܅λ����R�#\7hQ��]z����Y��6PD�5"��JtX�M�E_Dǂu'7\��������]^����R�G��5y�5�ջ�z�����n���n��Ά!8Q���?x���c�Ev�.�����k�O�ݗ�}B�%dߓ_�p�[�
Bׯ6��{�;�� ��+���^�����|�{����f����%��r|5��<r}9����\oZ�<��`NW�p�M��<?į1�K�h������[β9���@xw�v��˨+��ͨw�u���d��m�Q�
�Z'�e�npF��@�����5Hx$|m��C�.wMs�U*��ï`���ْ��Ý��nc��/�:��77X�)v�T���/8�~������T9;��x����Oa<�N?W'+�7~)0du���n�	���⡻��\��_�y,���D�[���`���I
7�a�HM�b!��Wvl����r���{�;�~V��V��p��{`n�El�]A6�#��_nwK�r;�>P�{���$���(��^Q�O ��UGw��<N�.�ܽ���Dh�b=��טֱ���*�'[��[��O_N��}I�ܭ�.���/FR^[/+����~�b��j�s<��ׂ�����g����g?���le0�-'�E��;󵕦��=��ѵ���Kn�����{���6���' :�\N{�-���n�Q�X~���
n,{Z|.�:�F�:��:sPp*zs��.٥��F���=\Om�5\�J�5\'0mû�:��m��/�	Lw����5�S*b~Z o  Q�ӳ_�\<��ɲ�Rn8���X��"�D���ʬj9�ji��j�!#N��Z%��N`k�A���nr��p��ߏ0�ٔVU��6\|�{U̿��¯!
]�HQ����5~.�*lT��n�l��խ�Y.KH#�����_��cT���c[�Z�z��w�J������
��*r���@�=��S��q��#:s����ئ?�l�3�GJկ�*��G#?R���NH/?"Y�P�u�z?�ɫV����NH=��uF��0�|���pW�Bw�;�?A��03"�WNmKwKw�B:!E0݃�G��,�=K��sگV�H�vo.�A���1�N߱�������R:R� 5���n�B���<��[��      %     x�MTMo�6=��"9G�M�m�mN�ȶ�V��.�U���i]�9,� 5�>��.^��f��3�ha1j��I��4���*Kt&�5�HJ���?�<�V�:y��-���2L�HZ%
U�]�ӗ���G��p̜%R����a��n��}\6>�U�����R��a���w5�5}>,�u7�Q !��Mrk�]�O3
��T�^r��L��i� n�ь�&W�F�{�*�[f\(}�v��ā*L
Ol�\o�9���yd@;]��ݴ>kk�;5�jt����}|�Y�iia�TKB����ds��Z�f�_̻�� )h���d������������ۥ��]q���R��$L��~7lZ�Tv	��r�IXw�e�C�+u�DA��ḍ�K��P�����a�������[��#�@��D)����!\.�˴G��U(
���?]q�ᗹ%���8�/�9��؆�K��㲂T�l�f�o�B_�u�[��o�i�I�~�6���D�ov�m�`�ւ80�3�Br�x�g�ѧ��4<oY�.���G�9�_72�쒴���qY.���Bt{����j��l�}ٍ��L�tAʲY¿�B��R���k$+�aE��Tkt��y3�>,�yy0�轐I�"���Cg�p��wS�}�>�(T�Au�뚰��O�	O�y�H�6��5@���[l�k����L�^Aʷy ��O���M�mޒ��'�(�x��&boC�D���ݮ��@ܲ�5y����J��0Z�+���! 7      +   �  x�UU�r�6��<�^�m>$�c�����tz��u�XHTI��wi��s�̘�j�;�~E�H���f"KכR��.q~\o`'-��ԯ=y�c󮽹����I��$����fP4��'H�Ɲ��5A�w���J��P_�/}�T��� �~�ʼW��;H�x�"�<dR�e�g���P��7dC�=��D,�O��X�2���-���
�@}6�����?�2y���ՠ�Rr���c����!mNhOң�T��yӞB���,��A����Ҽ��#�kr�r��ּ���0�����x���ZԡzT�#+k�`%��:nj�&�B�#Ľ�T���(�T+f2�<O�jġ��H{y��sc���^��,U�Mh;��R~�5�����j��#��wF�)�hk�G�`Ko�7�5㩃�e�B����[��&�8��Ҳ��Yl�HCaNd�X�t���?s�bE�H�ۧ	�wg`jqT^��I��TyɅ��$�y
�����Q��^�h����C���o`x�^�5Z�C3(��b��^��F�5Z|m���̡��Ċ�%z++�NlEa:��
�GX�,��&���;u&/R�zU[z�OPR�YdB�e���p������m�B*�X�����[�\æR,:��\ר�L�h~���M�ݻ��	��Ů�Y�#�eL���<K�{��:�v�V�c���!�صE�g�Fe?I��g�m>���Z��kC�#kG�^{`:�C������s�w�f��)o:�`�(�q`XXVqܻ�>�G��!q�Xh]�A����	�r��WW-�5��Dm*FV�.�E����()��g����u��H�6݋8*(�e��W���#y-�6T�,ݘ�Rd0��鍾HǪ+�b�޷](y�8IgcVFٲ��*]$G/&�X�oҞM`�,�8_���Ce1r��)ئ�\�q���	��-��r��H]5���ag�����%��u�����3j���U��CV��GT'c��g���������YH���1��=ijQ�C�0Rq�~�(M�-������_�R�n�	?2��E��w/�[ª����=�� J�2_�G��T��:e��⧋����G��c�����se�����[
ʘO���h���Y�_I�<�[C�7�S(�4��龜�Ԏ��g,X�EĤ�[͂�d,4�z'��U��~����8��      /      x�M�KW븶����p�Z�b�<���ؼ6�PŨ���"Qűrd�~���̮s;U��-K�1�\K��gw8���T+�Ti�<8��ll�ڴHnmU���P�Φerg�߳˭�k����Mϓ{���:{\�]��qra�ʻ&�5���}�N�yh�͖�����t�̛�v������Y��1�emڭMGg�?��Яw�h�<�ʶ�3��}��<y�վo��u���IGE�M��F��s��xÊWu��&F�ɣ[omm�k_�����8�ܺCv�j���&�6�Nٓ���є�,��s�C��t4K~4�ڵ�g���,�1ً�,~�l�|�\5~��'sJ�<�4�v��~�ksL�"��9e/޵�ol��Ƀo���j�;�l,����ق-�4'o&T٥!.|t����eg�Ϳn���k9u>Mnlp�]ve*�<K�}8e��ݦ�Y�{h����m��Ϧ�o;6��^8��J��=�V'�ݺͶ��&-�d�Swٳoc�ҢL�N�-d��8��y�07?���ٽ=�Ц�8z�g�����$���eC��W�j'����)HFT�7K���!]��/S�&-�$�ǫ����7�%8_ێD�ֵ{'Y���h�Dn��!a�"Y���=���rZ�tiY&��g�lĆ�V<O�������q-��)#+{j�r������m�p��������K�AQ�ʌ�"����|P.gɋY�\��=�ܤ�dK�a�e�)���}��+�:=/����p��$�U/�q��#�JJ����vmz>f����殩x�$����Em����4�$Hmwb��`�+���ϒ�`��_i7�d���W��#8)c5��O�8O��%@[@��NN���S�-�>4����|wk�d����y���5T9L������~��]��2z<�=�}��w.x,SY�%9}-<ϒ9[��:'�OΈ�JG{�v����>�rV�λ�$O�IX�a>���x'�L�L����D 򥝀�6��s�f�c�8k�N :�n�����	��T1��,�)τN�gg��t2K��e��7���%�����u�NGɛS�/ ?�:͓����a�N��uk 1Bݿ���2��ޯ�Ǿ	��b?|b��.�6�z�&�H�+a㩳t�)�,݇�!��[<��7���"^��u�����l4$1�7&t�t�'O��҇�������t���Y�<ʫ����)��'ܔ�V(��`�`- ~��& A�n�`:�w��o� g�f �8�œ9�3�v��iZ>����:LöOٟ�nx8Ly򇩅EMFU�Fo�|Ů"8��4�2!W�d�q^�� ��S��=���\��:�/ΐ-��M ��E��_�Ǧ�d���6�0�fɳ�R��o�||�"�Ze�*��۲$|��@W��Á��?��|$�"y���w��(��ɣ��H�|��3��<�c�9>�x��x6�u�5�ƿN�,l�1Nq{ ����*��Hy�*�!�3"L�3�m�=�` ��^�"�@/|ȵn��Va�+|�=���W�*�֨Fo]��}��a�'��]���2��'�W����
�]�B���vX_Pm7b�KO�pF��d��������g	��d�����X�j!���U���1O�-1���qӐ�e��{n���T)uX����,*�-�l�<�mp���y�@��v���
p��p��h���/e�'��kZ�����IE�PŶru�.��0�T;p��Q:� )��qm���)(�t�DF�h	7�TReO��d@m�g�`�6��]e#L9g�G����ÏC-sF �(��K���jU>���1��gG�弶�����zpfi��}+܃n1��xo>ltf��5m���P�{�96VGz6��Hr�s���+��?��G�iYE�e����h�Dj�y2V|"ک�+��G%��'��a4p�n=�A߂dV6oc�B�����dd�m������ñM��X�y"���=(���X#���h�@�;{h��υ|$�	1Ş�����,�>�J���,��oA��D�N�D��R���I��g��x)�p��%V����Fa���e=�d�G���T%F�4:O�ꢪ�v� ��;���a~���è�p��v���`�w�Ρ��U)�x����p�J�H��p�$���Aގ�|{ �/�P��s2íQ��
z}"�҄�`���Ʃ q#���N�y8Ye
$�h�ReNqc�d�%=�6�B>�2���*[�u�i&|ʷk����M����f�x�~{ZIz��׫=��J_���T.�q��Z�/�	I�C�/D�i�i �?N�S6G���q��p��JQ�aY4@��&�;��a���r�s�-�R���R^G5G�웠�����!ȵd�ܞD�ψ��N�lh,ּk7������S<�C��,���b[������)c����sX�Q�@_y>	7�soV��0<�ߚ�Ni�C��Jm͏�a0�5v��y��I���Չ_�'�/�5b��K3K4���R��7Rr8?�X������^r3�f��=�u���@1 ߒ��Q�T+�M�/��s�M���@��7�m＾����W!ۿP����`�OL� :�=M�:]����|6�X"ϥ\�!Þ�����Dݫ��>,dW��թ������S��<�^{S4�0d��o�k�ބj_l3���>�a�Gs�>�M�C�%����m����&-!�:�ʈ���Z���SX&`݌����������B��|#�xy�ô��AO�92�TJ�рe�'kO��bZsT��{�;�I��G����j}���/,�F��r��c[�.O�G�f�ަ�zJ=���g�����p�Wu9<�k~G#�i���Ex:8V�������?Ѱ_���R��ઞ��GY�g�_5f����>kz�����\��
����D�~=2}6t2�^o��#�*�Y��j��k{��Y ^ao��	�����*��]H湝���q�qԘ;5����R�06�9$��o}��B�,]I��f�W;�C�׼�BF�6v�rs�V���]PH.��O�������@�J��	�C�3�[�8NT��6�M���S���|x���ߣlM���7�_{ �}QH�|r����?�_�0ds�
�ے�8c�gO���z�m@�W�l.\�!��?��Z��5��ƶR�"���Z�cW(���|t�Q)	ӾJ�e�4�f��0�k��ͅ$��Dc��ֶN�"̴�X���>�Ɋk�_�X6��*x�f V|���f�����cS�ø?�rb�9z>wa'�����`���m8�z�V�����@ʗjDм9���Db�j�`�@#|�' \��/Ge�(pN3�I/�R�Vb��r��j�ɞ��	��B��ӳ���% ў0COGI���4K��mp��>(�Zp$HC�zqLNOi�=-�P���J�BDG[KgL+�4.��Sw��h�'���o7�Cg�o�����*�8��+`ܨ8i��&�U(W�*T���T�����A��~���\�<a�V�ơ��`T��&����%Â8�c�
Ǆz]�T@���;� }�D;�5�r���g��~/9��>rM��c�����Q��4��{~Q�Q^#�<�`<3nN�o�W@�q�qv�+"�����V�r���\��j��`%ߍ�|��.
��h���J���OB�:C>/�fMF�q��T�b��
��i�uAS��}ːڠz��4@%����ÁĲ'2}��4y=�}���N���^h���Qe6,��5]�ȅc@�W���@QJ��T�����(5Қ��S�a���̠k��^04��K?|���Ѹ@sy��½ꄢ�TS*k M��ŕ`[����*��j?��:+%0���TJ��/7�nN��*��ı�IB��n54��$���lN�w�)�B�qT�i����%/B׾������5y�iiH4W6��,��{�0'ADZ@�ϔ;1UFH�p��FO��[~���T���ּ�1-�QŢ�T�`2�&�}�!ƺ� �  �_���F��b�a��4S��ϓ䍮�4Q�įR��4�J~�������Dd�`�֟���(�'=�PTO������+{���׹tz��}Y��^ZQbԏ�T���/�*N�܇�]�Ɗ"X{������^��e폤r��eo���E�+h�j5��`��D���^��*�y?\}��҈A2��m�]����=��>�gC�Vծ�q#��`Ź�l:���L� �%�	�U��{���N�#� ��WB�7��p�q��v1;�����)V1S��k
�t�Ö��ơ"q�W�5L�����)�������S˱���(����6o�����)E�,��?��R����i	�Α02�P흡qo3�>>*!���ᖭTG+�9j��A�J9\���8M)�ب��4�O������F����#|\x�m��9;}���������}���z��}�Ε�����4�j��F��CЕh��N���z���[��NW��N�ΓG�n�����V�]���V�J�Y	�.LM״�i�)�����a�%��
i�@oW*�f]���Q|�˷\"A��f-u����h~�C�}E[³���W��\w]�&�D�qf�G��:�#Kx�.�IC�~q�Ec#izlB�O}d�G�e>�I�����P��QH��y�I,�E�������n �1�A���o\���pk�E�0|����-�b����Q�Za�חP+��HZ�� ��t�!N9�(�4/6����~Y��IѿC�0t	�>��Z�I}2�ZI�R��K�i��y`��)G�d��<R�žh�\o�j�J�5^0G=�.OC?�#;;h�r}ٺ�R��:�AN�"�P
�q~����A�CE�aIВZ��x�V���Ul\59�y�}6���������W�ic*�c)��cCȩ�3v.%4�&w���~Ϗl�ob��0��+��Ӆ�>>�B����s�L���0ȼ@�H�����6DN|�L⨼�b�^��:�W��,c��&�#î�� A1�˸ѱjD]��ӡ��7�5���X\�?���}%�X����c/�T��x�)ѵ�J<�(
�Vd,m�듳�Mcb�)H�ô��%$�t)��W�V7�^�|�9e�Nߟh�J�li�[x	��#��HE���j����D7<�Vrʞ�ļ�nI,��^U�@fդ멙.$E����SA� %�b�ç���������\���)*��pj�)����������⤊y7��$�f��]H�Q�_k�7R61AaֿL;F��8/�	�@'#��Y��Q#(�LK]��Ot�Ա㵙z�>N�o�	�!�<f�=�*x�7�_B�w���F�%�J$:�=��l�N��7��m]��;6�?�a�����ŽL4�]>��
�L�o�@%�G�]
�3�F4���Mm���"{ .������4M���u     