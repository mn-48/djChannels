PGDMP                     
    y            socialsitedb    12.7     14.0 (Ubuntu 14.0-1.pgdg20.04+1) �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    84859    socialsitedb    DATABASE     a   CREATE DATABASE socialsitedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE socialsitedb;
                dbrdsubuntume12    false            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO dbrdsubuntume12;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   dbrdsubuntume12    false    3            �            1259    84950 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    dbrdsubuntume12    false            �            1259    84948    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          dbrdsubuntume12    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          dbrdsubuntume12    false    208            �            1259    84960    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    dbrdsubuntume12    false            �            1259    84958    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          dbrdsubuntume12    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          dbrdsubuntume12    false    210            �            1259    84942    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    dbrdsubuntume12    false            �            1259    84940    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          dbrdsubuntume12    false    207                        0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          dbrdsubuntume12    false    206            �            1259    84968 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    dbrdsubuntume12    false            �            1259    84978    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    dbrdsubuntume12    false            �            1259    84976    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          dbrdsubuntume12    false    215                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          dbrdsubuntume12    false    214            �            1259    84966    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          dbrdsubuntume12    false    213                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          dbrdsubuntume12    false    212            �            1259    84986    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    dbrdsubuntume12    false            �            1259    84984 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          dbrdsubuntume12    false    217                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          dbrdsubuntume12    false    216            s           1259    92502    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    dbrdsubuntume12    false            �           1259    139507    chat_groupmessage    TABLE     �   CREATE TABLE public.chat_groupmessage (
    id bigint NOT NULL,
    msg text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    group_id bigint,
    user_id integer
);
 %   DROP TABLE public.chat_groupmessage;
       public         heap    dbrdsubuntume12    false            �           1259    139505    chat_groupmessage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chat_groupmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.chat_groupmessage_id_seq;
       public          dbrdsubuntume12    false    501                       0    0    chat_groupmessage_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.chat_groupmessage_id_seq OWNED BY public.chat_groupmessage.id;
          public          dbrdsubuntume12    false    500            �           1259    139481    chat_groupname    TABLE     �   CREATE TABLE public.chat_groupname (
    id bigint NOT NULL,
    group_name character varying(40) NOT NULL,
    group_name_to_show character varying(40) NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 "   DROP TABLE public.chat_groupname;
       public         heap    dbrdsubuntume12    false            �           1259    139491    chat_groupname_admins    TABLE     �   CREATE TABLE public.chat_groupname_admins (
    id bigint NOT NULL,
    groupname_id bigint NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.chat_groupname_admins;
       public         heap    dbrdsubuntume12    false            �           1259    139489    chat_groupname_admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chat_groupname_admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.chat_groupname_admins_id_seq;
       public          dbrdsubuntume12    false    497                       0    0    chat_groupname_admins_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.chat_groupname_admins_id_seq OWNED BY public.chat_groupname_admins.id;
          public          dbrdsubuntume12    false    496            �           1259    139479    chat_groupname_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.chat_groupname_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.chat_groupname_id_seq;
       public          dbrdsubuntume12    false    495                       0    0    chat_groupname_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.chat_groupname_id_seq OWNED BY public.chat_groupname.id;
          public          dbrdsubuntume12    false    494            �           1259    139499    chat_groupname_participants    TABLE     �   CREATE TABLE public.chat_groupname_participants (
    id bigint NOT NULL,
    groupname_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.chat_groupname_participants;
       public         heap    dbrdsubuntume12    false            �           1259    139497 "   chat_groupname_participants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chat_groupname_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.chat_groupname_participants_id_seq;
       public          dbrdsubuntume12    false    499                       0    0 "   chat_groupname_participants_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.chat_groupname_participants_id_seq OWNED BY public.chat_groupname_participants.id;
          public          dbrdsubuntume12    false    498            �           1259    139206    chat_message    TABLE     �   CREATE TABLE public.chat_message (
    id bigint NOT NULL,
    msg text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    room_id bigint,
    user_id integer NOT NULL
);
     DROP TABLE public.chat_message;
       public         heap    dbrdsubuntume12    false            �           1259    139204    chat_message_id_seq    SEQUENCE     |   CREATE SEQUENCE public.chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.chat_message_id_seq;
       public          dbrdsubuntume12    false    491                       0    0    chat_message_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.chat_message_id_seq OWNED BY public.chat_message.id;
          public          dbrdsubuntume12    false    490            �           1259    139196    chat_privatechtroom    TABLE     �   CREATE TABLE public.chat_privatechtroom (
    id bigint NOT NULL,
    room_name character varying(220) NOT NULL,
    user1_id integer NOT NULL,
    user2_id integer NOT NULL
);
 '   DROP TABLE public.chat_privatechtroom;
       public         heap    dbrdsubuntume12    false            �           1259    139194    chat_privatechtroom_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chat_privatechtroom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.chat_privatechtroom_id_seq;
       public          dbrdsubuntume12    false    489            	           0    0    chat_privatechtroom_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.chat_privatechtroom_id_seq OWNED BY public.chat_privatechtroom.id;
          public          dbrdsubuntume12    false    488            �           1259    98573    chatapp_message    TABLE     �   CREATE TABLE public.chatapp_message (
    id bigint NOT NULL,
    msg text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    from_user_id integer NOT NULL,
    group_id bigint NOT NULL
);
 #   DROP TABLE public.chatapp_message;
       public         heap    dbrdsubuntume12    false            �           1259    98571    chatapp_message_id_seq    SEQUENCE        CREATE SEQUENCE public.chatapp_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.chatapp_message_id_seq;
       public          dbrdsubuntume12    false    403            
           0    0    chatapp_message_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.chatapp_message_id_seq OWNED BY public.chatapp_message.id;
          public          dbrdsubuntume12    false    402            �           1259    98555    chatapp_roomname    TABLE     �   CREATE TABLE public.chatapp_roomname (
    id bigint NOT NULL,
    room_name character varying(40) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    admin_id integer NOT NULL
);
 $   DROP TABLE public.chatapp_roomname;
       public         heap    dbrdsubuntume12    false            �           1259    98553    chatapp_roomname_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chatapp_roomname_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.chatapp_roomname_id_seq;
       public          dbrdsubuntume12    false    399                       0    0    chatapp_roomname_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.chatapp_roomname_id_seq OWNED BY public.chatapp_roomname.id;
          public          dbrdsubuntume12    false    398            �           1259    98565    chatapp_roomname_participants    TABLE     �   CREATE TABLE public.chatapp_roomname_participants (
    id bigint NOT NULL,
    roomname_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.chatapp_roomname_participants;
       public         heap    dbrdsubuntume12    false            �           1259    98563 $   chatapp_roomname_participants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chatapp_roomname_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.chatapp_roomname_participants_id_seq;
       public          dbrdsubuntume12    false    401                       0    0 $   chatapp_roomname_participants_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.chatapp_roomname_participants_id_seq OWNED BY public.chatapp_roomname_participants.id;
          public          dbrdsubuntume12    false    400            b           1259    92299    comment_postcomment    TABLE     J  CREATE TABLE public.comment_postcomment (
    id bigint NOT NULL,
    text text NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    is_active boolean NOT NULL,
    parent_id bigint,
    post_id bigint NOT NULL,
    user_id integer NOT NULL
);
 '   DROP TABLE public.comment_postcomment;
       public         heap    dbrdsubuntume12    false            d           1259    92310    comment_postcomment_angry    TABLE     �   CREATE TABLE public.comment_postcomment_angry (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.comment_postcomment_angry;
       public         heap    dbrdsubuntume12    false            c           1259    92308     comment_postcomment_angry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_angry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.comment_postcomment_angry_id_seq;
       public          dbrdsubuntume12    false    356                       0    0     comment_postcomment_angry_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.comment_postcomment_angry_id_seq OWNED BY public.comment_postcomment_angry.id;
          public          dbrdsubuntume12    false    355            f           1259    92318    comment_postcomment_care    TABLE     �   CREATE TABLE public.comment_postcomment_care (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.comment_postcomment_care;
       public         heap    dbrdsubuntume12    false            e           1259    92316    comment_postcomment_care_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_care_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.comment_postcomment_care_id_seq;
       public          dbrdsubuntume12    false    358                       0    0    comment_postcomment_care_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.comment_postcomment_care_id_seq OWNED BY public.comment_postcomment_care.id;
          public          dbrdsubuntume12    false    357            h           1259    92326    comment_postcomment_haha    TABLE     �   CREATE TABLE public.comment_postcomment_haha (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.comment_postcomment_haha;
       public         heap    dbrdsubuntume12    false            g           1259    92324    comment_postcomment_haha_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_haha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.comment_postcomment_haha_id_seq;
       public          dbrdsubuntume12    false    360                       0    0    comment_postcomment_haha_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.comment_postcomment_haha_id_seq OWNED BY public.comment_postcomment_haha.id;
          public          dbrdsubuntume12    false    359            a           1259    92297    comment_postcomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.comment_postcomment_id_seq;
       public          dbrdsubuntume12    false    354                       0    0    comment_postcomment_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.comment_postcomment_id_seq OWNED BY public.comment_postcomment.id;
          public          dbrdsubuntume12    false    353            j           1259    92334    comment_postcomment_likes    TABLE     �   CREATE TABLE public.comment_postcomment_likes (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.comment_postcomment_likes;
       public         heap    dbrdsubuntume12    false            i           1259    92332     comment_postcomment_likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.comment_postcomment_likes_id_seq;
       public          dbrdsubuntume12    false    362                       0    0     comment_postcomment_likes_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.comment_postcomment_likes_id_seq OWNED BY public.comment_postcomment_likes.id;
          public          dbrdsubuntume12    false    361            l           1259    92342    comment_postcomment_love    TABLE     �   CREATE TABLE public.comment_postcomment_love (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.comment_postcomment_love;
       public         heap    dbrdsubuntume12    false            k           1259    92340    comment_postcomment_love_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_love_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.comment_postcomment_love_id_seq;
       public          dbrdsubuntume12    false    364                       0    0    comment_postcomment_love_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.comment_postcomment_love_id_seq OWNED BY public.comment_postcomment_love.id;
          public          dbrdsubuntume12    false    363            n           1259    92350    comment_postcomment_sad    TABLE     �   CREATE TABLE public.comment_postcomment_sad (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.comment_postcomment_sad;
       public         heap    dbrdsubuntume12    false            m           1259    92348    comment_postcomment_sad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_sad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.comment_postcomment_sad_id_seq;
       public          dbrdsubuntume12    false    366                       0    0    comment_postcomment_sad_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.comment_postcomment_sad_id_seq OWNED BY public.comment_postcomment_sad.id;
          public          dbrdsubuntume12    false    365            p           1259    92358    comment_postcomment_senti    TABLE     �   CREATE TABLE public.comment_postcomment_senti (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.comment_postcomment_senti;
       public         heap    dbrdsubuntume12    false            o           1259    92356     comment_postcomment_senti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_senti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.comment_postcomment_senti_id_seq;
       public          dbrdsubuntume12    false    368                       0    0     comment_postcomment_senti_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.comment_postcomment_senti_id_seq OWNED BY public.comment_postcomment_senti.id;
          public          dbrdsubuntume12    false    367            r           1259    92366    comment_postcomment_wow    TABLE     �   CREATE TABLE public.comment_postcomment_wow (
    id bigint NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.comment_postcomment_wow;
       public         heap    dbrdsubuntume12    false            q           1259    92364    comment_postcomment_wow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcomment_wow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.comment_postcomment_wow_id_seq;
       public          dbrdsubuntume12    false    370                       0    0    comment_postcomment_wow_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.comment_postcomment_wow_id_seq OWNED BY public.comment_postcomment_wow.id;
          public          dbrdsubuntume12    false    369            �           1259    97899    comment_postcommenthistory    TABLE     �   CREATE TABLE public.comment_postcommenthistory (
    id bigint NOT NULL,
    text text NOT NULL,
    image character varying(100),
    updated_at timestamp with time zone NOT NULL,
    postcomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 .   DROP TABLE public.comment_postcommenthistory;
       public         heap    dbrdsubuntume12    false            �           1259    97897 !   comment_postcommenthistory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postcommenthistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.comment_postcommenthistory_id_seq;
       public          dbrdsubuntume12    false    395                       0    0 !   comment_postcommenthistory_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.comment_postcommenthistory_id_seq OWNED BY public.comment_postcommenthistory.id;
          public          dbrdsubuntume12    false    394            w           1259    97393    comment_postphotocomment    TABLE     P  CREATE TABLE public.comment_postphotocomment (
    id bigint NOT NULL,
    text text NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    is_active boolean NOT NULL,
    parent_id bigint,
    photo_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.comment_postphotocomment;
       public         heap    dbrdsubuntume12    false            y           1259    97404    comment_postphotocomment_angry    TABLE     �   CREATE TABLE public.comment_postphotocomment_angry (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 2   DROP TABLE public.comment_postphotocomment_angry;
       public         heap    dbrdsubuntume12    false            x           1259    97402 %   comment_postphotocomment_angry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_angry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.comment_postphotocomment_angry_id_seq;
       public          dbrdsubuntume12    false    377                       0    0 %   comment_postphotocomment_angry_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.comment_postphotocomment_angry_id_seq OWNED BY public.comment_postphotocomment_angry.id;
          public          dbrdsubuntume12    false    376            {           1259    97412    comment_postphotocomment_care    TABLE     �   CREATE TABLE public.comment_postphotocomment_care (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.comment_postphotocomment_care;
       public         heap    dbrdsubuntume12    false            z           1259    97410 $   comment_postphotocomment_care_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_care_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.comment_postphotocomment_care_id_seq;
       public          dbrdsubuntume12    false    379                       0    0 $   comment_postphotocomment_care_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.comment_postphotocomment_care_id_seq OWNED BY public.comment_postphotocomment_care.id;
          public          dbrdsubuntume12    false    378            }           1259    97420    comment_postphotocomment_haha    TABLE     �   CREATE TABLE public.comment_postphotocomment_haha (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.comment_postphotocomment_haha;
       public         heap    dbrdsubuntume12    false            |           1259    97418 $   comment_postphotocomment_haha_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_haha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.comment_postphotocomment_haha_id_seq;
       public          dbrdsubuntume12    false    381                       0    0 $   comment_postphotocomment_haha_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.comment_postphotocomment_haha_id_seq OWNED BY public.comment_postphotocomment_haha.id;
          public          dbrdsubuntume12    false    380            v           1259    97391    comment_postphotocomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.comment_postphotocomment_id_seq;
       public          dbrdsubuntume12    false    375                       0    0    comment_postphotocomment_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.comment_postphotocomment_id_seq OWNED BY public.comment_postphotocomment.id;
          public          dbrdsubuntume12    false    374                       1259    97428    comment_postphotocomment_likes    TABLE     �   CREATE TABLE public.comment_postphotocomment_likes (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 2   DROP TABLE public.comment_postphotocomment_likes;
       public         heap    dbrdsubuntume12    false            ~           1259    97426 %   comment_postphotocomment_likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.comment_postphotocomment_likes_id_seq;
       public          dbrdsubuntume12    false    383                       0    0 %   comment_postphotocomment_likes_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.comment_postphotocomment_likes_id_seq OWNED BY public.comment_postphotocomment_likes.id;
          public          dbrdsubuntume12    false    382            �           1259    97436    comment_postphotocomment_love    TABLE     �   CREATE TABLE public.comment_postphotocomment_love (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.comment_postphotocomment_love;
       public         heap    dbrdsubuntume12    false            �           1259    97434 $   comment_postphotocomment_love_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_love_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.comment_postphotocomment_love_id_seq;
       public          dbrdsubuntume12    false    385                       0    0 $   comment_postphotocomment_love_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.comment_postphotocomment_love_id_seq OWNED BY public.comment_postphotocomment_love.id;
          public          dbrdsubuntume12    false    384            �           1259    97444    comment_postphotocomment_sad    TABLE     �   CREATE TABLE public.comment_postphotocomment_sad (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 0   DROP TABLE public.comment_postphotocomment_sad;
       public         heap    dbrdsubuntume12    false            �           1259    97442 #   comment_postphotocomment_sad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_sad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.comment_postphotocomment_sad_id_seq;
       public          dbrdsubuntume12    false    387                       0    0 #   comment_postphotocomment_sad_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.comment_postphotocomment_sad_id_seq OWNED BY public.comment_postphotocomment_sad.id;
          public          dbrdsubuntume12    false    386            �           1259    97452    comment_postphotocomment_senti    TABLE     �   CREATE TABLE public.comment_postphotocomment_senti (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 2   DROP TABLE public.comment_postphotocomment_senti;
       public         heap    dbrdsubuntume12    false            �           1259    97450 %   comment_postphotocomment_senti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_senti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.comment_postphotocomment_senti_id_seq;
       public          dbrdsubuntume12    false    389                       0    0 %   comment_postphotocomment_senti_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.comment_postphotocomment_senti_id_seq OWNED BY public.comment_postphotocomment_senti.id;
          public          dbrdsubuntume12    false    388            �           1259    97460    comment_postphotocomment_wow    TABLE     �   CREATE TABLE public.comment_postphotocomment_wow (
    id bigint NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 0   DROP TABLE public.comment_postphotocomment_wow;
       public         heap    dbrdsubuntume12    false            �           1259    97458 #   comment_postphotocomment_wow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocomment_wow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.comment_postphotocomment_wow_id_seq;
       public          dbrdsubuntume12    false    391                       0    0 #   comment_postphotocomment_wow_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.comment_postphotocomment_wow_id_seq OWNED BY public.comment_postphotocomment_wow.id;
          public          dbrdsubuntume12    false    390            �           1259    97888    comment_postphotocommenthistory    TABLE       CREATE TABLE public.comment_postphotocommenthistory (
    id bigint NOT NULL,
    text text NOT NULL,
    image character varying(100),
    updated_at timestamp with time zone NOT NULL,
    postphotocomment_id bigint NOT NULL,
    user_id integer NOT NULL
);
 3   DROP TABLE public.comment_postphotocommenthistory;
       public         heap    dbrdsubuntume12    false            �           1259    97886 &   comment_postphotocommenthistory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_postphotocommenthistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.comment_postphotocommenthistory_id_seq;
       public          dbrdsubuntume12    false    393                        0    0 &   comment_postphotocommenthistory_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.comment_postphotocommenthistory_id_seq OWNED BY public.comment_postphotocommenthistory.id;
          public          dbrdsubuntume12    false    392            �            1259    85046    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    dbrdsubuntume12    false            �            1259    85044    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          dbrdsubuntume12    false    219            !           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          dbrdsubuntume12    false    218            �            1259    84932    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    dbrdsubuntume12    false            �            1259    84930    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          dbrdsubuntume12    false    205            "           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          dbrdsubuntume12    false    204            �            1259    84921    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    dbrdsubuntume12    false            �            1259    84919    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          dbrdsubuntume12    false    203            #           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          dbrdsubuntume12    false    202            �            1259    85077    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    dbrdsubuntume12    false            �           1259    100110    employer_applicants    TABLE     �  CREATE TABLE public.employer_applicants (
    id bigint NOT NULL,
    application_date timestamp with time zone NOT NULL,
    present_salary bigint NOT NULL,
    expected_salary bigint NOT NULL,
    working_experience integer NOT NULL,
    cover_letter text,
    cv character varying(100),
    resume character varying(100),
    nid_no character varying(100),
    passport_no character varying(100),
    driving_lisence_no character varying(100),
    shortlisted boolean NOT NULL,
    rejected boolean NOT NULL,
    feedback text,
    selected boolean NOT NULL,
    interviewed boolean NOT NULL,
    viewed boolean NOT NULL,
    job_id bigint NOT NULL,
    jobprofile_id bigint NOT NULL,
    interviewed_at timestamp with time zone,
    selected_at timestamp with time zone,
    shortlisted_at timestamp with time zone,
    CONSTRAINT employer_applicants_expected_salary_check CHECK ((expected_salary >= 0)),
    CONSTRAINT employer_applicants_present_salary_check CHECK ((present_salary >= 0))
);
 '   DROP TABLE public.employer_applicants;
       public         heap    dbrdsubuntume12    false            �           1259    100108    employer_applicants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employer_applicants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.employer_applicants_id_seq;
       public          dbrdsubuntume12    false    429            $           0    0    employer_applicants_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.employer_applicants_id_seq OWNED BY public.employer_applicants.id;
          public          dbrdsubuntume12    false    428            �            1259    85106    employer_employer    TABLE     9  CREATE TABLE public.employer_employer (
    id bigint NOT NULL,
    is_active boolean NOT NULL,
    company_name character varying(100),
    year_of_establishment character varying(100),
    company_size character varying(100),
    company_country character varying(100),
    company_district character varying(100),
    company_subdistrict character varying(100),
    company_address text,
    company_website character varying(200),
    company_email character varying(254),
    business_description text,
    trade_licence_no integer,
    rl_no integer,
    contact_person_email character varying(254),
    contact_person_name character varying(100),
    contact_person_phone character varying(100),
    contact_person_designation character varying(100),
    facility_for_person_with_disability boolean NOT NULL,
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    logo character varying(100),
    is_hidden boolean NOT NULL,
    industry_cat_id bigint,
    functional_cat_id bigint,
    industry_type_id bigint,
    is_published boolean NOT NULL
);
 %   DROP TABLE public.employer_employer;
       public         heap    dbrdsubuntume12    false            �            1259    85104    employer_employer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employer_employer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.employer_employer_id_seq;
       public          dbrdsubuntume12    false    222            %           0    0    employer_employer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.employer_employer_id_seq OWNED BY public.employer_employer.id;
          public          dbrdsubuntume12    false    221            �           1259    122145    employer_employer_moderators    TABLE     �   CREATE TABLE public.employer_employer_moderators (
    id bigint NOT NULL,
    employer_id bigint NOT NULL,
    user_id integer NOT NULL
);
 0   DROP TABLE public.employer_employer_moderators;
       public         heap    dbrdsubuntume12    false            �           1259    122143 #   employer_employer_moderators_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employer_employer_moderators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.employer_employer_moderators_id_seq;
       public          dbrdsubuntume12    false    469            &           0    0 #   employer_employer_moderators_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.employer_employer_moderators_id_seq OWNED BY public.employer_employer_moderators.id;
          public          dbrdsubuntume12    false    468            �           1259    130870 $   employer_employer_pending_moderators    TABLE     �   CREATE TABLE public.employer_employer_pending_moderators (
    id bigint NOT NULL,
    employer_id bigint NOT NULL,
    user_id integer NOT NULL
);
 8   DROP TABLE public.employer_employer_pending_moderators;
       public         heap    dbrdsubuntume12    false            �           1259    130868 +   employer_employer_pending_moderators_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employer_employer_pending_moderators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.employer_employer_pending_moderators_id_seq;
       public          dbrdsubuntume12    false    471            '           0    0 +   employer_employer_pending_moderators_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.employer_employer_pending_moderators_id_seq OWNED BY public.employer_employer_pending_moderators.id;
          public          dbrdsubuntume12    false    470            �            1259    85143    employer_jobpost    TABLE     �	  CREATE TABLE public.employer_jobpost (
    id bigint NOT NULL,
    job_title character varying(100),
    vacancies integer,
    employment_status character varying(100),
    deadline date,
    created_at timestamp with time zone,
    resume_receiveing_option character varying(100),
    special_instruction text,
    photograph_enclosed boolean,
    job_level character varying(100),
    job_context text,
    job_responsibilities text,
    workplace character varying(100),
    job_location_id bigint,
    min_salary integer,
    max_salary integer,
    per_policy character varying(100),
    show_salary boolean,
    is_compare boolean,
    show_alert boolean,
    additional_salary_info text,
    compensation_and_benefits text,
    lunch_facilities character varying(100),
    salary_review character varying(100),
    num_of_fastival_bonous integer,
    other text,
    degree_level character varying(100),
    degree_name character varying(100),
    major_in character varying(100),
    prefered_educational_institutions text,
    other_educational_qualifications text,
    training_or_trade_cources text,
    professional_certifications text,
    experience_required boolean,
    min_experience integer,
    max_experience integer,
    fresher_can_apply boolean,
    area_of_experience text,
    area_of_business text,
    skills text,
    additional_requirements text,
    gender character varying(100),
    min_age integer,
    max_age integer,
    person_with_disability_can_apply boolean,
    company_name_show boolean,
    company_address_show boolean,
    company_business_show boolean,
    which_industry_type_to_show character varying(100),
    is_age boolean,
    is_age_mendatory boolean,
    is_gender boolean,
    is_gender_mendatory boolean,
    is_total_year_experience boolean,
    is_experience_mendatory boolean,
    is_area_of_experience boolean,
    is_skills boolean,
    is_location boolean,
    is_location_mendatory boolean,
    is_salary_range boolean,
    is_area_of_business boolean,
    is_job_level boolean,
    employer_id bigint NOT NULL,
    functional_category_id bigint,
    special_skills_category_id bigint,
    "NID_no_required" boolean,
    cover_letter_required boolean,
    cv_required boolean,
    driving_lisence_no_required boolean,
    passport_required boolean,
    rusume_required boolean,
    is_active boolean NOT NULL,
    is_freezed boolean NOT NULL,
    industry_category_id bigint,
    is_featured boolean NOT NULL,
    is_published boolean NOT NULL,
    activation_time timestamp with time zone
);
 $   DROP TABLE public.employer_jobpost;
       public         heap    dbrdsubuntume12    false            �           1259    100148    employer_jobpost_applied    TABLE     �   CREATE TABLE public.employer_jobpost_applied (
    id bigint NOT NULL,
    jobpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.employer_jobpost_applied;
       public         heap    dbrdsubuntume12    false            �           1259    100146    employer_jobpost_applied_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employer_jobpost_applied_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.employer_jobpost_applied_id_seq;
       public          dbrdsubuntume12    false    431            (           0    0    employer_jobpost_applied_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.employer_jobpost_applied_id_seq OWNED BY public.employer_jobpost_applied.id;
          public          dbrdsubuntume12    false    430            �            1259    85141    employer_jobpost_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employer_jobpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.employer_jobpost_id_seq;
       public          dbrdsubuntume12    false    224            )           0    0    employer_jobpost_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.employer_jobpost_id_seq OWNED BY public.employer_jobpost.id;
          public          dbrdsubuntume12    false    223            �           1259    98637    follow_friends    TABLE     ~   CREATE TABLE public.follow_friends (
    id bigint NOT NULL,
    is_private boolean NOT NULL,
    user_id integer NOT NULL
);
 "   DROP TABLE public.follow_friends;
       public         heap    dbrdsubuntume12    false            �           1259    98647    follow_friends_follower    TABLE     �   CREATE TABLE public.follow_friends_follower (
    id bigint NOT NULL,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.follow_friends_follower;
       public         heap    dbrdsubuntume12    false            �           1259    98645    follow_friends_follower_id_seq    SEQUENCE     �   CREATE SEQUENCE public.follow_friends_follower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.follow_friends_follower_id_seq;
       public          dbrdsubuntume12    false    407            *           0    0    follow_friends_follower_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.follow_friends_follower_id_seq OWNED BY public.follow_friends_follower.id;
          public          dbrdsubuntume12    false    406            �           1259    98655    follow_friends_following    TABLE     �   CREATE TABLE public.follow_friends_following (
    id bigint NOT NULL,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.follow_friends_following;
       public         heap    dbrdsubuntume12    false            �           1259    98653    follow_friends_following_id_seq    SEQUENCE     �   CREATE SEQUENCE public.follow_friends_following_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.follow_friends_following_id_seq;
       public          dbrdsubuntume12    false    409            +           0    0    follow_friends_following_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.follow_friends_following_id_seq OWNED BY public.follow_friends_following.id;
          public          dbrdsubuntume12    false    408            �           1259    98635    follow_friends_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.follow_friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.follow_friends_id_seq;
       public          dbrdsubuntume12    false    405            ,           0    0    follow_friends_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.follow_friends_id_seq OWNED BY public.follow_friends.id;
          public          dbrdsubuntume12    false    404            �           1259    98663    follow_friends_to_be_follower    TABLE     �   CREATE TABLE public.follow_friends_to_be_follower (
    id bigint NOT NULL,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.follow_friends_to_be_follower;
       public         heap    dbrdsubuntume12    false            �           1259    98661 $   follow_friends_to_be_follower_id_seq    SEQUENCE     �   CREATE SEQUENCE public.follow_friends_to_be_follower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.follow_friends_to_be_follower_id_seq;
       public          dbrdsubuntume12    false    411            -           0    0 $   follow_friends_to_be_follower_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.follow_friends_to_be_follower_id_seq OWNED BY public.follow_friends_to_be_follower.id;
          public          dbrdsubuntume12    false    410            �           1259    98671    follow_friends_to_be_following    TABLE     �   CREATE TABLE public.follow_friends_to_be_following (
    id bigint NOT NULL,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 2   DROP TABLE public.follow_friends_to_be_following;
       public         heap    dbrdsubuntume12    false            �           1259    98669 %   follow_friends_to_be_following_id_seq    SEQUENCE     �   CREATE SEQUENCE public.follow_friends_to_be_following_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.follow_friends_to_be_following_id_seq;
       public          dbrdsubuntume12    false    413            .           0    0 %   follow_friends_to_be_following_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.follow_friends_to_be_following_id_seq OWNED BY public.follow_friends_to_be_following.id;
          public          dbrdsubuntume12    false    412            �           1259    99245    followfollowing_blockedby    TABLE     �   CREATE TABLE public.followfollowing_blockedby (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.followfollowing_blockedby;
       public         heap    dbrdsubuntume12    false            �           1259    99243     followfollowing_blockedby_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_blockedby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.followfollowing_blockedby_id_seq;
       public          dbrdsubuntume12    false    427            /           0    0     followfollowing_blockedby_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.followfollowing_blockedby_id_seq OWNED BY public.followfollowing_blockedby.id;
          public          dbrdsubuntume12    false    426            �           1259    99237    followfollowing_blocklist    TABLE     �   CREATE TABLE public.followfollowing_blocklist (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.followfollowing_blocklist;
       public         heap    dbrdsubuntume12    false            �           1259    99235     followfollowing_blocklist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_blocklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.followfollowing_blocklist_id_seq;
       public          dbrdsubuntume12    false    425            0           0    0     followfollowing_blocklist_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.followfollowing_blocklist_id_seq OWNED BY public.followfollowing_blocklist.id;
          public          dbrdsubuntume12    false    424            �           1259    98810    followfollowing_followers    TABLE     �   CREATE TABLE public.followfollowing_followers (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.followfollowing_followers;
       public         heap    dbrdsubuntume12    false            �           1259    98808     followfollowing_followers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.followfollowing_followers_id_seq;
       public          dbrdsubuntume12    false    415            1           0    0     followfollowing_followers_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.followfollowing_followers_id_seq OWNED BY public.followfollowing_followers.id;
          public          dbrdsubuntume12    false    414            �           1259    98818    followfollowing_followings    TABLE     �   CREATE TABLE public.followfollowing_followings (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 .   DROP TABLE public.followfollowing_followings;
       public         heap    dbrdsubuntume12    false            �           1259    98816 !   followfollowing_followings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_followings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.followfollowing_followings_id_seq;
       public          dbrdsubuntume12    false    417            2           0    0 !   followfollowing_followings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.followfollowing_followings_id_seq OWNED BY public.followfollowing_followings.id;
          public          dbrdsubuntume12    false    416            �           1259    98826    followfollowing_friends    TABLE     �   CREATE TABLE public.followfollowing_friends (
    id bigint NOT NULL,
    is_private boolean NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.followfollowing_friends;
       public         heap    dbrdsubuntume12    false            �           1259    98824    followfollowing_friends_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.followfollowing_friends_id_seq;
       public          dbrdsubuntume12    false    419            3           0    0    followfollowing_friends_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.followfollowing_friends_id_seq OWNED BY public.followfollowing_friends.id;
          public          dbrdsubuntume12    false    418            �           1259    98842    followfollowing_tobefollowers    TABLE     �   CREATE TABLE public.followfollowing_tobefollowers (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.followfollowing_tobefollowers;
       public         heap    dbrdsubuntume12    false            �           1259    98840 $   followfollowing_tobefollowers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_tobefollowers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.followfollowing_tobefollowers_id_seq;
       public          dbrdsubuntume12    false    423            4           0    0 $   followfollowing_tobefollowers_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.followfollowing_tobefollowers_id_seq OWNED BY public.followfollowing_tobefollowers.id;
          public          dbrdsubuntume12    false    422            �           1259    98834    followfollowing_tobefollowings    TABLE     �   CREATE TABLE public.followfollowing_tobefollowings (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    friends_id bigint NOT NULL,
    user_id integer NOT NULL
);
 2   DROP TABLE public.followfollowing_tobefollowings;
       public         heap    dbrdsubuntume12    false            �           1259    98832 %   followfollowing_tobefollowings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.followfollowing_tobefollowings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.followfollowing_tobefollowings_id_seq;
       public          dbrdsubuntume12    false    421            5           0    0 %   followfollowing_tobefollowings_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.followfollowing_tobefollowings_id_seq OWNED BY public.followfollowing_tobefollowings.id;
          public          dbrdsubuntume12    false    420            �            1259    85817    jobs_armyexperience    TABLE     �  CREATE TABLE public.jobs_armyexperience (
    id bigint NOT NULL,
    ba_no character varying(100),
    ranks character varying(100),
    types character varying(100),
    arms character varying(100),
    trade character varying(100),
    course character varying(100),
    date_of_commission date,
    date_of_retirement date,
    jobprofile_id bigint NOT NULL,
    ba_num integer
);
 '   DROP TABLE public.jobs_armyexperience;
       public         heap    dbrdsubuntume12    false            �            1259    85815    jobs_amryexperience_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_amryexperience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jobs_amryexperience_id_seq;
       public          dbrdsubuntume12    false    254            6           0    0    jobs_amryexperience_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jobs_amryexperience_id_seq OWNED BY public.jobs_armyexperience.id;
          public          dbrdsubuntume12    false    253            �           1259    112570    jobs_benefitlist    TABLE     �   CREATE TABLE public.jobs_benefitlist (
    id bigint NOT NULL,
    name character varying(100),
    created_at timestamp with time zone NOT NULL
);
 $   DROP TABLE public.jobs_benefitlist;
       public         heap    dbrdsubuntume12    false            �           1259    112568    jobs_benefitlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_benefitlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jobs_benefitlist_id_seq;
       public          dbrdsubuntume12    false    433            7           0    0    jobs_benefitlist_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.jobs_benefitlist_id_seq OWNED BY public.jobs_benefitlist.id;
          public          dbrdsubuntume12    false    432            �           1259    112578    jobs_businesslist    TABLE     �   CREATE TABLE public.jobs_businesslist (
    id bigint NOT NULL,
    name character varying(100),
    created_at timestamp with time zone NOT NULL
);
 %   DROP TABLE public.jobs_businesslist;
       public         heap    dbrdsubuntume12    false            �           1259    112576    jobs_businesslist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_businesslist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.jobs_businesslist_id_seq;
       public          dbrdsubuntume12    false    435            8           0    0    jobs_businesslist_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.jobs_businesslist_id_seq OWNED BY public.jobs_businesslist.id;
          public          dbrdsubuntume12    false    434            �           1259    118527 	   jobs_city    TABLE     �   CREATE TABLE public.jobs_city (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    state_id bigint NOT NULL
);
    DROP TABLE public.jobs_city;
       public         heap    dbrdsubuntume12    false            �           1259    118525    jobs_city_id_seq    SEQUENCE     y   CREATE SEQUENCE public.jobs_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jobs_city_id_seq;
       public          dbrdsubuntume12    false    467            9           0    0    jobs_city_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jobs_city_id_seq OWNED BY public.jobs_city.id;
          public          dbrdsubuntume12    false    466            �           1259    118503    jobs_continent    TABLE     i   CREATE TABLE public.jobs_continent (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);
 "   DROP TABLE public.jobs_continent;
       public         heap    dbrdsubuntume12    false            �           1259    118501    jobs_continent_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.jobs_continent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jobs_continent_id_seq;
       public          dbrdsubuntume12    false    461            :           0    0    jobs_continent_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.jobs_continent_id_seq OWNED BY public.jobs_continent.id;
          public          dbrdsubuntume12    false    460            �           1259    118511    jobs_country    TABLE     �   CREATE TABLE public.jobs_country (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    capital character varying(100),
    continent_id bigint NOT NULL
);
     DROP TABLE public.jobs_country;
       public         heap    dbrdsubuntume12    false            �           1259    118509    jobs_country_id_seq    SEQUENCE     |   CREATE SEQUENCE public.jobs_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jobs_country_id_seq;
       public          dbrdsubuntume12    false    463            ;           0    0    jobs_country_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jobs_country_id_seq OWNED BY public.jobs_country.id;
          public          dbrdsubuntume12    false    462            �           1259    116533    jobs_degreeorexam    TABLE     �   CREATE TABLE public.jobs_degreeorexam (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    edu_level_id bigint NOT NULL
);
 %   DROP TABLE public.jobs_degreeorexam;
       public         heap    dbrdsubuntume12    false            �           1259    116531    jobs_degreeorexam_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_degreeorexam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.jobs_degreeorexam_id_seq;
       public          dbrdsubuntume12    false    455            <           0    0    jobs_degreeorexam_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.jobs_degreeorexam_id_seq OWNED BY public.jobs_degreeorexam.id;
          public          dbrdsubuntume12    false    454            �            1259    85292    jobs_disability_information    TABLE     @  CREATE TABLE public.jobs_disability_information (
    id bigint NOT NULL,
    national_disability_id character varying(100),
    show_on_resume boolean NOT NULL,
    disability_to_see character varying(100),
    disability_to_hear character varying(100),
    disability_to_communicate character varying(100),
    disability_to_concentrade character varying(100),
    disability_to_remember character varying(100),
    "disability_to_sit_stand_walk_climbStairs" character varying(100),
    disability_to_taking_care character varying(100),
    jobprofile_id bigint NOT NULL
);
 /   DROP TABLE public.jobs_disability_information;
       public         heap    dbrdsubuntume12    false            �            1259    85290 "   jobs_disability_information_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_disability_information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.jobs_disability_information_id_seq;
       public          dbrdsubuntume12    false    242            =           0    0 "   jobs_disability_information_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.jobs_disability_information_id_seq OWNED BY public.jobs_disability_information.id;
          public          dbrdsubuntume12    false    241            �           1259    116541    jobs_educationlevel    TABLE     �   CREATE TABLE public.jobs_educationlevel (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 '   DROP TABLE public.jobs_educationlevel;
       public         heap    dbrdsubuntume12    false            �           1259    116539    jobs_educationlevel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_educationlevel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jobs_educationlevel_id_seq;
       public          dbrdsubuntume12    false    457            >           0    0    jobs_educationlevel_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jobs_educationlevel_id_seq OWNED BY public.jobs_educationlevel.id;
          public          dbrdsubuntume12    false    456            �            1259    85281    jobs_educationprofile    TABLE     �  CREATE TABLE public.jobs_educationprofile (
    id bigint NOT NULL,
    level_of_edu character varying(100),
    degree_or_exam character varying(100),
    major_in character varying(100),
    institude_name character varying(100),
    result character varying(100),
    cgpa double precision,
    scale integer,
    year_of_passing integer,
    duration character varying(100),
    achievement character varying(100),
    jobprofile_id bigint NOT NULL
);
 )   DROP TABLE public.jobs_educationprofile;
       public         heap    dbrdsubuntume12    false            �            1259    85279    jobs_educationprofile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_educationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.jobs_educationprofile_id_seq;
       public          dbrdsubuntume12    false    240            ?           0    0    jobs_educationprofile_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.jobs_educationprofile_id_seq OWNED BY public.jobs_educationprofile.id;
          public          dbrdsubuntume12    false    239            �            1259    85270    jobs_experience    TABLE     �  CREATE TABLE public.jobs_experience (
    id bigint NOT NULL,
    company_name character varying(100),
    company_business character varying(100),
    designation character varying(100),
    department character varying(100),
    "Area_of_experience" text,
    responsibilities text,
    company_location character varying(100),
    start_date date,
    end_date date,
    jobprofile_id bigint NOT NULL
);
 #   DROP TABLE public.jobs_experience;
       public         heap    dbrdsubuntume12    false            �            1259    85268    jobs_experience_id_seq    SEQUENCE        CREATE SEQUENCE public.jobs_experience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jobs_experience_id_seq;
       public          dbrdsubuntume12    false    238            @           0    0    jobs_experience_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.jobs_experience_id_seq OWNED BY public.jobs_experience.id;
          public          dbrdsubuntume12    false    237            �           1259    112586    jobs_experiencelist    TABLE     �   CREATE TABLE public.jobs_experiencelist (
    id bigint NOT NULL,
    name character varying(100),
    created_at timestamp with time zone NOT NULL
);
 '   DROP TABLE public.jobs_experiencelist;
       public         heap    dbrdsubuntume12    false            �           1259    112584    jobs_experiencelist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_experiencelist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jobs_experiencelist_id_seq;
       public          dbrdsubuntume12    false    437            A           0    0    jobs_experiencelist_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jobs_experiencelist_id_seq OWNED BY public.jobs_experiencelist.id;
          public          dbrdsubuntume12    false    436            �           1259    112594    jobs_functionaljobcategory    TABLE     �   CREATE TABLE public.jobs_functionaljobcategory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 .   DROP TABLE public.jobs_functionaljobcategory;
       public         heap    dbrdsubuntume12    false            �           1259    112592 !   jobs_functionaljobcategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_functionaljobcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.jobs_functionaljobcategory_id_seq;
       public          dbrdsubuntume12    false    439            B           0    0 !   jobs_functionaljobcategory_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.jobs_functionaljobcategory_id_seq OWNED BY public.jobs_functionaljobcategory.id;
          public          dbrdsubuntume12    false    438            �           1259    112602    jobs_industrycategory    TABLE     �   CREATE TABLE public.jobs_industrycategory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 )   DROP TABLE public.jobs_industrycategory;
       public         heap    dbrdsubuntume12    false            �           1259    112600    jobs_industrycategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_industrycategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.jobs_industrycategory_id_seq;
       public          dbrdsubuntume12    false    441            C           0    0    jobs_industrycategory_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.jobs_industrycategory_id_seq OWNED BY public.jobs_industrycategory.id;
          public          dbrdsubuntume12    false    440            �           1259    112610    jobs_instituionlist    TABLE     �   CREATE TABLE public.jobs_instituionlist (
    id bigint NOT NULL,
    name character varying(100),
    created_at timestamp with time zone NOT NULL
);
 '   DROP TABLE public.jobs_instituionlist;
       public         heap    dbrdsubuntume12    false            �           1259    112608    jobs_instituionlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_instituionlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jobs_instituionlist_id_seq;
       public          dbrdsubuntume12    false    443            D           0    0    jobs_instituionlist_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jobs_instituionlist_id_seq OWNED BY public.jobs_instituionlist.id;
          public          dbrdsubuntume12    false    442            �            1259    85177    jobs_jobprofile    TABLE       CREATE TABLE public.jobs_jobprofile (
    id bigint NOT NULL,
    nationality character varying(100),
    passport_no character varying(100),
    passport_issue_date date,
    emergency_contact_no character varying(100),
    alternative_email character varying(254),
    portfolio_link character varying(200),
    career_objective text,
    present_salary integer,
    expected_salary integer,
    looking_job_level character varying(100),
    available_for_job_type character varying(100),
    job_location_id bigint,
    country character varying(100),
    organizations character varying(100),
    career_summary text,
    special_qualifications text,
    keywords text,
    cv_photo character varying(100),
    cv_upload character varying(100),
    user_id integer NOT NULL,
    age integer
);
 #   DROP TABLE public.jobs_jobprofile;
       public         heap    dbrdsubuntume12    false            �            1259    85175    jobs_jobprofile_id_seq    SEQUENCE        CREATE SEQUENCE public.jobs_jobprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jobs_jobprofile_id_seq;
       public          dbrdsubuntume12    false    226            E           0    0    jobs_jobprofile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.jobs_jobprofile_id_seq OWNED BY public.jobs_jobprofile.id;
          public          dbrdsubuntume12    false    225            �           1259    112686    jobs_jobprofile_job_categories    TABLE     �   CREATE TABLE public.jobs_jobprofile_job_categories (
    id bigint NOT NULL,
    jobprofile_id bigint NOT NULL,
    functionaljobcategory_id bigint NOT NULL
);
 2   DROP TABLE public.jobs_jobprofile_job_categories;
       public         heap    dbrdsubuntume12    false            �           1259    112684 %   jobs_jobprofile_job_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_jobprofile_job_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.jobs_jobprofile_job_categories_id_seq;
       public          dbrdsubuntume12    false    451            F           0    0 %   jobs_jobprofile_job_categories_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.jobs_jobprofile_job_categories_id_seq OWNED BY public.jobs_jobprofile_job_categories.id;
          public          dbrdsubuntume12    false    450            �           1259    112694    jobs_jobprofile_special_skills    TABLE     �   CREATE TABLE public.jobs_jobprofile_special_skills (
    id bigint NOT NULL,
    jobprofile_id bigint NOT NULL,
    specialskillcategory_id bigint NOT NULL
);
 2   DROP TABLE public.jobs_jobprofile_special_skills;
       public         heap    dbrdsubuntume12    false            �           1259    112692 %   jobs_jobprofile_special_skills_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_jobprofile_special_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.jobs_jobprofile_special_skills_id_seq;
       public          dbrdsubuntume12    false    453            G           0    0 %   jobs_jobprofile_special_skills_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.jobs_jobprofile_special_skills_id_seq OWNED BY public.jobs_jobprofile_special_skills.id;
          public          dbrdsubuntume12    false    452            �           1259    116549    jobs_majorin    TABLE     �   CREATE TABLE public.jobs_majorin (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    degree_id bigint NOT NULL
);
     DROP TABLE public.jobs_majorin;
       public         heap    dbrdsubuntume12    false            �           1259    116547    jobs_majorin_id_seq    SEQUENCE     |   CREATE SEQUENCE public.jobs_majorin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jobs_majorin_id_seq;
       public          dbrdsubuntume12    false    459            H           0    0    jobs_majorin_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jobs_majorin_id_seq OWNED BY public.jobs_majorin.id;
          public          dbrdsubuntume12    false    458            �           1259    112626    jobs_organizationtype    TABLE     �   CREATE TABLE public.jobs_organizationtype (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 )   DROP TABLE public.jobs_organizationtype;
       public         heap    dbrdsubuntume12    false            �           1259    112624    jobs_organizationtype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_organizationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.jobs_organizationtype_id_seq;
       public          dbrdsubuntume12    false    445            I           0    0    jobs_organizationtype_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.jobs_organizationtype_id_seq OWNED BY public.jobs_organizationtype.id;
          public          dbrdsubuntume12    false    444            �            1259    85247    jobs_professional_certificate    TABLE       CREATE TABLE public.jobs_professional_certificate (
    id bigint NOT NULL,
    certification character varying(100),
    institute character varying(100),
    location character varying(100),
    start_date date,
    end_date date,
    jobprofile_id bigint NOT NULL
);
 1   DROP TABLE public.jobs_professional_certificate;
       public         heap    dbrdsubuntume12    false            �            1259    85245 $   jobs_professional_certificate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_professional_certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.jobs_professional_certificate_id_seq;
       public          dbrdsubuntume12    false    236            J           0    0 $   jobs_professional_certificate_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.jobs_professional_certificate_id_seq OWNED BY public.jobs_professional_certificate.id;
          public          dbrdsubuntume12    false    235            �            1259    85236    jobs_project_works    TABLE     .  CREATE TABLE public.jobs_project_works (
    id bigint NOT NULL,
    name character varying(100),
    description text,
    tools text,
    link character varying(200),
    contribution character varying(100),
    is_live character varying(100),
    learings text,
    jobprofile_id bigint NOT NULL
);
 &   DROP TABLE public.jobs_project_works;
       public         heap    dbrdsubuntume12    false            �            1259    85234    jobs_project_works_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_project_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.jobs_project_works_id_seq;
       public          dbrdsubuntume12    false    234            K           0    0    jobs_project_works_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.jobs_project_works_id_seq OWNED BY public.jobs_project_works.id;
          public          dbrdsubuntume12    false    233            �            1259    85225    jobs_reference    TABLE     �  CREATE TABLE public.jobs_reference (
    id bigint NOT NULL,
    name character varying(100),
    organization character varying(100),
    designation character varying(100),
    relation character varying(100),
    mobile character varying(100),
    phone_off character varying(100),
    phone_res character varying(100),
    address character varying(100),
    email character varying(254),
    jobprofile_id bigint NOT NULL
);
 "   DROP TABLE public.jobs_reference;
       public         heap    dbrdsubuntume12    false            �            1259    85223    jobs_reference_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.jobs_reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jobs_reference_id_seq;
       public          dbrdsubuntume12    false    232            L           0    0    jobs_reference_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.jobs_reference_id_seq OWNED BY public.jobs_reference.id;
          public          dbrdsubuntume12    false    231            �            1259    85217    jobs_skills    TABLE     �   CREATE TABLE public.jobs_skills (
    id bigint NOT NULL,
    skill_name character varying(100),
    learned_by character varying(100),
    jobprofile_id bigint NOT NULL
);
    DROP TABLE public.jobs_skills;
       public         heap    dbrdsubuntume12    false            �            1259    85215    jobs_skills_id_seq    SEQUENCE     {   CREATE SEQUENCE public.jobs_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.jobs_skills_id_seq;
       public          dbrdsubuntume12    false    230            M           0    0    jobs_skills_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.jobs_skills_id_seq OWNED BY public.jobs_skills.id;
          public          dbrdsubuntume12    false    229            �           1259    112634    jobs_skillslist    TABLE     �   CREATE TABLE public.jobs_skillslist (
    id bigint NOT NULL,
    name character varying(100),
    created_at timestamp with time zone NOT NULL
);
 #   DROP TABLE public.jobs_skillslist;
       public         heap    dbrdsubuntume12    false            �           1259    112632    jobs_skillslist_id_seq    SEQUENCE        CREATE SEQUENCE public.jobs_skillslist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jobs_skillslist_id_seq;
       public          dbrdsubuntume12    false    447            N           0    0    jobs_skillslist_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.jobs_skillslist_id_seq OWNED BY public.jobs_skillslist.id;
          public          dbrdsubuntume12    false    446            �           1259    112642    jobs_specialskillcategory    TABLE     �   CREATE TABLE public.jobs_specialskillcategory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 -   DROP TABLE public.jobs_specialskillcategory;
       public         heap    dbrdsubuntume12    false            �           1259    112640     jobs_specialskillcategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_specialskillcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.jobs_specialskillcategory_id_seq;
       public          dbrdsubuntume12    false    449            O           0    0     jobs_specialskillcategory_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.jobs_specialskillcategory_id_seq OWNED BY public.jobs_specialskillcategory.id;
          public          dbrdsubuntume12    false    448            �           1259    118519 
   jobs_state    TABLE     �   CREATE TABLE public.jobs_state (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    country_id bigint NOT NULL
);
    DROP TABLE public.jobs_state;
       public         heap    dbrdsubuntume12    false            �           1259    118517    jobs_state_id_seq    SEQUENCE     z   CREATE SEQUENCE public.jobs_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.jobs_state_id_seq;
       public          dbrdsubuntume12    false    465            P           0    0    jobs_state_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.jobs_state_id_seq OWNED BY public.jobs_state.id;
          public          dbrdsubuntume12    false    464            �            1259    85206    jobs_training    TABLE     M  CREATE TABLE public.jobs_training (
    id bigint NOT NULL,
    title character varying(100),
    country character varying(100),
    topic_covered character varying(100),
    training_year integer,
    institute character varying(100),
    duration integer,
    location character varying(100),
    jobprofile_id bigint NOT NULL
);
 !   DROP TABLE public.jobs_training;
       public         heap    dbrdsubuntume12    false            �            1259    85204    jobs_training_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jobs_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jobs_training_id_seq;
       public          dbrdsubuntume12    false    228            Q           0    0    jobs_training_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jobs_training_id_seq OWNED BY public.jobs_training.id;
          public          dbrdsubuntume12    false    227            �            1259    85395    metrimony_expectaion    TABLE     �  CREATE TABLE public.metrimony_expectaion (
    id bigint NOT NULL,
    min_age character varying(100),
    max_age character varying(100),
    min_height character varying(100),
    max_height character varying(100),
    marital_status character varying(100),
    residency_country character varying(100),
    religion character varying(100),
    complexion character varying(100),
    education text,
    profession text,
    drinking_havits boolean NOT NULL,
    smoking_habits boolean NOT NULL,
    diet character varying(100),
    user_id integer NOT NULL,
    monthly_income_max integer,
    mother_tongue character varying(100),
    physical_status character varying(100),
    monthly_income_min integer
);
 (   DROP TABLE public.metrimony_expectaion;
       public         heap    dbrdsubuntume12    false            �            1259    85393    metrimony_expectaion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_expectaion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.metrimony_expectaion_id_seq;
       public          dbrdsubuntume12    false    246            R           0    0    metrimony_expectaion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.metrimony_expectaion_id_seq OWNED BY public.metrimony_expectaion.id;
          public          dbrdsubuntume12    false    245            �           1259    139601    metrimony_matriblockedby    TABLE     �   CREATE TABLE public.metrimony_matriblockedby (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.metrimony_matriblockedby;
       public         heap    dbrdsubuntume12    false            �           1259    139599    metrimony_matriblockedby_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_matriblockedby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.metrimony_matriblockedby_id_seq;
       public          dbrdsubuntume12    false    505            S           0    0    metrimony_matriblockedby_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.metrimony_matriblockedby_id_seq OWNED BY public.metrimony_matriblockedby.id;
          public          dbrdsubuntume12    false    504            �           1259    139593    metrimony_matriblocklist    TABLE     �   CREATE TABLE public.metrimony_matriblocklist (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.metrimony_matriblocklist;
       public         heap    dbrdsubuntume12    false            �           1259    139591    metrimony_matriblocklist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_matriblocklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.metrimony_matriblocklist_id_seq;
       public          dbrdsubuntume12    false    503            T           0    0    metrimony_matriblocklist_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.metrimony_matriblocklist_id_seq OWNED BY public.metrimony_matriblocklist.id;
          public          dbrdsubuntume12    false    502            �            1259    85382    metrimony_personal_info    TABLE     E  CREATE TABLE public.metrimony_personal_info (
    id bigint NOT NULL,
    guardians_type character varying(100),
    sur_name character varying(100),
    age character varying(100),
    profile_photo character varying(100),
    mother_tongue character varying(100),
    diet character varying(100),
    do_u_smoke boolean NOT NULL,
    do_u_drink boolean NOT NULL,
    have_child boolean NOT NULL,
    district character varying(100),
    state character varying(100),
    residency_country character varying(100),
    birth_country character varying(100),
    grow_up_country character varying(100),
    present_address text,
    permanent_address text,
    work_location character varying(100),
    employed_by character varying(100),
    company character varying(100),
    salary integer,
    working_from character varying(100),
    no_of_boy_child_of_your_father integer,
    no_of_girl_child_of_your_father integer,
    family_type character varying(100),
    family_status character varying(100),
    eye_color character varying(100),
    hair_color character varying(100),
    hair_style character varying(100),
    complexion character varying(100),
    any_disability character varying(100),
    body_type character varying(100),
    interest text,
    music text,
    read_books text,
    tv_shows text,
    sports_shows text,
    sports text,
    fav_dress_style text,
    fav_color character varying(100),
    know_dancing character varying(100),
    know_singing character varying(100),
    user_id integer NOT NULL,
    guardians_phone character varying(17),
    phone character varying(17),
    birth_certificate character varying(100),
    nid_verified boolean NOT NULL,
    passport_no character varying(100),
    passport_verified boolean NOT NULL,
    education text,
    photo2 character varying(100),
    photo3 character varying(100)
);
 +   DROP TABLE public.metrimony_personal_info;
       public         heap    dbrdsubuntume12    false            �            1259    85380    metrimony_personal_info_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.metrimony_personal_info_id_seq;
       public          dbrdsubuntume12    false    244            U           0    0    metrimony_personal_info_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.metrimony_personal_info_id_seq OWNED BY public.metrimony_personal_info.id;
          public          dbrdsubuntume12    false    243            �           1259    135960 "   metrimony_personal_info_interested    TABLE     �   CREATE TABLE public.metrimony_personal_info_interested (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 6   DROP TABLE public.metrimony_personal_info_interested;
       public         heap    dbrdsubuntume12    false            �           1259    135968 %   metrimony_personal_info_interested_by    TABLE     �   CREATE TABLE public.metrimony_personal_info_interested_by (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 9   DROP TABLE public.metrimony_personal_info_interested_by;
       public         heap    dbrdsubuntume12    false            �           1259    135966 ,   metrimony_personal_info_interested_by_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_interested_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.metrimony_personal_info_interested_by_id_seq;
       public          dbrdsubuntume12    false    483            V           0    0 ,   metrimony_personal_info_interested_by_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.metrimony_personal_info_interested_by_id_seq OWNED BY public.metrimony_personal_info_interested_by.id;
          public          dbrdsubuntume12    false    482            �           1259    135958 )   metrimony_personal_info_interested_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_interested_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.metrimony_personal_info_interested_id_seq;
       public          dbrdsubuntume12    false    481            W           0    0 )   metrimony_personal_info_interested_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.metrimony_personal_info_interested_id_seq OWNED BY public.metrimony_personal_info_interested.id;
          public          dbrdsubuntume12    false    480            �           1259    135976 -   metrimony_personal_info_pending_interested_by    TABLE     �   CREATE TABLE public.metrimony_personal_info_pending_interested_by (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 A   DROP TABLE public.metrimony_personal_info_pending_interested_by;
       public         heap    dbrdsubuntume12    false            �           1259    135974 4   metrimony_personal_info_pending_interested_by_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_pending_interested_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.metrimony_personal_info_pending_interested_by_id_seq;
       public          dbrdsubuntume12    false    485            X           0    0 4   metrimony_personal_info_pending_interested_by_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.metrimony_personal_info_pending_interested_by_id_seq OWNED BY public.metrimony_personal_info_pending_interested_by.id;
          public          dbrdsubuntume12    false    484            �           1259    131703 %   metrimony_personal_info_privary_limit    TABLE     �   CREATE TABLE public.metrimony_personal_info_privary_limit (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 9   DROP TABLE public.metrimony_personal_info_privary_limit;
       public         heap    dbrdsubuntume12    false            �           1259    131701 ,   metrimony_personal_info_privary_limit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_privary_limit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.metrimony_personal_info_privary_limit_id_seq;
       public          dbrdsubuntume12    false    473            Y           0    0 ,   metrimony_personal_info_privary_limit_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.metrimony_personal_info_privary_limit_id_seq OWNED BY public.metrimony_personal_info_privary_limit.id;
          public          dbrdsubuntume12    false    472            �           1259    135984 #   metrimony_personal_info_shortlisted    TABLE     �   CREATE TABLE public.metrimony_personal_info_shortlisted (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 7   DROP TABLE public.metrimony_personal_info_shortlisted;
       public         heap    dbrdsubuntume12    false            �           1259    135982 *   metrimony_personal_info_shortlisted_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_shortlisted_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.metrimony_personal_info_shortlisted_id_seq;
       public          dbrdsubuntume12    false    487            Z           0    0 *   metrimony_personal_info_shortlisted_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.metrimony_personal_info_shortlisted_id_seq OWNED BY public.metrimony_personal_info_shortlisted.id;
          public          dbrdsubuntume12    false    486            �           1259    135938    metrimony_personal_info_viewed    TABLE     �   CREATE TABLE public.metrimony_personal_info_viewed (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 2   DROP TABLE public.metrimony_personal_info_viewed;
       public         heap    dbrdsubuntume12    false            �           1259    135916 !   metrimony_personal_info_viewed_by    TABLE     �   CREATE TABLE public.metrimony_personal_info_viewed_by (
    id bigint NOT NULL,
    personal_info_id bigint NOT NULL,
    user_id integer NOT NULL
);
 5   DROP TABLE public.metrimony_personal_info_viewed_by;
       public         heap    dbrdsubuntume12    false            �           1259    135914 (   metrimony_personal_info_viewed_by_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_viewed_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.metrimony_personal_info_viewed_by_id_seq;
       public          dbrdsubuntume12    false    477            [           0    0 (   metrimony_personal_info_viewed_by_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.metrimony_personal_info_viewed_by_id_seq OWNED BY public.metrimony_personal_info_viewed_by.id;
          public          dbrdsubuntume12    false    476            �           1259    135936 %   metrimony_personal_info_viewed_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_personal_info_viewed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.metrimony_personal_info_viewed_id_seq;
       public          dbrdsubuntume12    false    479            \           0    0 %   metrimony_personal_info_viewed_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.metrimony_personal_info_viewed_id_seq OWNED BY public.metrimony_personal_info_viewed.id;
          public          dbrdsubuntume12    false    478            �           1259    131711    metrimony_visaverification    TABLE     A  CREATE TABLE public.metrimony_visaverification (
    id bigint NOT NULL,
    visa_no character varying(100),
    visa_type character varying(100),
    visa_country character varying(100),
    expiry_date date,
    visa_image character varying(100),
    visa_varified boolean NOT NULL,
    matrimony_id bigint NOT NULL
);
 .   DROP TABLE public.metrimony_visaverification;
       public         heap    dbrdsubuntume12    false            �           1259    131709 !   metrimony_visaverification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrimony_visaverification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.metrimony_visaverification_id_seq;
       public          dbrdsubuntume12    false    475            ]           0    0 !   metrimony_visaverification_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.metrimony_visaverification_id_seq OWNED BY public.metrimony_visaverification.id;
          public          dbrdsubuntume12    false    474            �           1259    97961    notifications_notification    TABLE        CREATE TABLE public.notifications_notification (
    id bigint NOT NULL,
    text character varying(250) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    url character varying(200),
    from_user_id integer,
    to_user_id integer NOT NULL,
    is_read boolean NOT NULL
);
 .   DROP TABLE public.notifications_notification;
       public         heap    dbrdsubuntume12    false            �           1259    97959 !   notifications_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.notifications_notification_id_seq;
       public          dbrdsubuntume12    false    397            ^           0    0 !   notifications_notification_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications_notification.id;
          public          dbrdsubuntume12    false    396            u           1259    93782    posts_postcategory    TABLE     �   CREATE TABLE public.posts_postcategory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    urls character varying(100)
);
 &   DROP TABLE public.posts_postcategory;
       public         heap    dbrdsubuntume12    false            t           1259    93780    posts_postcategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_postcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.posts_postcategory_id_seq;
       public          dbrdsubuntume12    false    373            _           0    0    posts_postcategory_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.posts_postcategory_id_seq OWNED BY public.posts_postcategory.id;
          public          dbrdsubuntume12    false    372            �           1259    139648    reports_reports    TABLE     �  CREATE TABLE public.reports_reports (
    id bigint NOT NULL,
    report_text text NOT NULL,
    report_image character varying(100),
    type character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    consumer_to_id bigint,
    employer_to_id bigint,
    jobpost_to_id bigint,
    matri_pro_to_id bigint,
    user_id integer NOT NULL,
    is_active boolean NOT NULL
);
 #   DROP TABLE public.reports_reports;
       public         heap    dbrdsubuntume12    false            �           1259    139646    reports_reports_id_seq    SEQUENCE        CREATE SEQUENCE public.reports_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.reports_reports_id_seq;
       public          dbrdsubuntume12    false    507            `           0    0    reports_reports_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.reports_reports_id_seq OWNED BY public.reports_reports.id;
          public          dbrdsubuntume12    false    506                       1259    143721    sellbuy_answer    TABLE     �   CREATE TABLE public.sellbuy_answer (
    id bigint NOT NULL,
    answer text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    question_id bigint NOT NULL,
    user_id integer NOT NULL,
    is_active boolean NOT NULL
);
 "   DROP TABLE public.sellbuy_answer;
       public         heap    dbrdsubuntume12    false                       1259    143719    sellbuy_answer_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.sellbuy_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sellbuy_answer_id_seq;
       public          dbrdsubuntume12    false    529            a           0    0    sellbuy_answer_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.sellbuy_answer_id_seq OWNED BY public.sellbuy_answer.id;
          public          dbrdsubuntume12    false    528            �           1259    140047    sellbuy_buyers    TABLE     �   CREATE TABLE public.sellbuy_buyers (
    id bigint NOT NULL,
    quantity integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    product_id bigint NOT NULL,
    user_id integer NOT NULL
);
 "   DROP TABLE public.sellbuy_buyers;
       public         heap    dbrdsubuntume12    false            �           1259    140045    sellbuy_buyers_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.sellbuy_buyers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sellbuy_buyers_id_seq;
       public          dbrdsubuntume12    false    511            b           0    0    sellbuy_buyers_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.sellbuy_buyers_id_seq OWNED BY public.sellbuy_buyers.id;
          public          dbrdsubuntume12    false    510                       1259    140055    sellbuy_category    TABLE     k   CREATE TABLE public.sellbuy_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);
 $   DROP TABLE public.sellbuy_category;
       public         heap    dbrdsubuntume12    false                        1259    140053    sellbuy_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sellbuy_category_id_seq;
       public          dbrdsubuntume12    false    513            c           0    0    sellbuy_category_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sellbuy_category_id_seq OWNED BY public.sellbuy_category.id;
          public          dbrdsubuntume12    false    512            �           1259    139711    sellbuy_dealerprofile    TABLE     o  CREATE TABLE public.sellbuy_dealerprofile (
    id bigint NOT NULL,
    company_name character varying(100) NOT NULL,
    company_email character varying(254) NOT NULL,
    company_website character varying(200),
    company_phone character varying(17) NOT NULL,
    regional_office_location character varying(100) NOT NULL,
    regional_office_phone character varying(17) NOT NULL,
    region_address character varying(100) NOT NULL,
    dealership_paper character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    is_varified boolean NOT NULL,
    is_published boolean NOT NULL,
    seller_id bigint NOT NULL
);
 )   DROP TABLE public.sellbuy_dealerprofile;
       public         heap    dbrdsubuntume12    false            �           1259    139709    sellbuy_dealerprofile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_dealerprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.sellbuy_dealerprofile_id_seq;
       public          dbrdsubuntume12    false    509            d           0    0    sellbuy_dealerprofile_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.sellbuy_dealerprofile_id_seq OWNED BY public.sellbuy_dealerprofile.id;
          public          dbrdsubuntume12    false    508                       1259    143710    sellbuy_faq    TABLE     �   CREATE TABLE public.sellbuy_faq (
    id bigint NOT NULL,
    question text,
    answer text,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    user_id integer NOT NULL,
    is_active boolean NOT NULL
);
    DROP TABLE public.sellbuy_faq;
       public         heap    dbrdsubuntume12    false                       1259    143708    sellbuy_faq_id_seq    SEQUENCE     {   CREATE SEQUENCE public.sellbuy_faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sellbuy_faq_id_seq;
       public          dbrdsubuntume12    false    527            e           0    0    sellbuy_faq_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sellbuy_faq_id_seq OWNED BY public.sellbuy_faq.id;
          public          dbrdsubuntume12    false    526                       1259    140063    sellbuy_product    TABLE     Q  CREATE TABLE public.sellbuy_product (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(20,2) NOT NULL,
    quantity integer NOT NULL,
    details_address text NOT NULL,
    details text NOT NULL,
    buy_price double precision,
    months_used integer NOT NULL,
    selled boolean NOT NULL,
    is_active boolean NOT NULL,
    is_published boolean NOT NULL,
    is_featured boolean NOT NULL,
    is_toprated boolean NOT NULL,
    category_id bigint NOT NULL,
    consumer_id bigint,
    dealer_id bigint,
    seller_id bigint,
    selled_quantity integer
);
 #   DROP TABLE public.sellbuy_product;
       public         heap    dbrdsubuntume12    false                       1259    140061    sellbuy_product_id_seq    SEQUENCE        CREATE SEQUENCE public.sellbuy_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.sellbuy_product_id_seq;
       public          dbrdsubuntume12    false    515            f           0    0    sellbuy_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sellbuy_product_id_seq OWNED BY public.sellbuy_product.id;
          public          dbrdsubuntume12    false    514                       1259    140074    sellbuy_product_like    TABLE     �   CREATE TABLE public.sellbuy_product_like (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.sellbuy_product_like;
       public         heap    dbrdsubuntume12    false                       1259    140072    sellbuy_product_like_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_product_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sellbuy_product_like_id_seq;
       public          dbrdsubuntume12    false    517            g           0    0    sellbuy_product_like_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.sellbuy_product_like_id_seq OWNED BY public.sellbuy_product_like.id;
          public          dbrdsubuntume12    false    516                       1259    143819    sellbuy_productcomment    TABLE     .  CREATE TABLE public.sellbuy_productcomment (
    id bigint NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    is_active boolean NOT NULL,
    parent_id bigint,
    product_id bigint NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.sellbuy_productcomment;
       public         heap    dbrdsubuntume12    false                       1259    143817    sellbuy_productcomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_productcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.sellbuy_productcomment_id_seq;
       public          dbrdsubuntume12    false    531            h           0    0    sellbuy_productcomment_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.sellbuy_productcomment_id_seq OWNED BY public.sellbuy_productcomment.id;
          public          dbrdsubuntume12    false    530                       1259    143699    sellbuy_question    TABLE     �   CREATE TABLE public.sellbuy_question (
    id bigint NOT NULL,
    question text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    user_id integer NOT NULL,
    is_active boolean NOT NULL
);
 $   DROP TABLE public.sellbuy_question;
       public         heap    dbrdsubuntume12    false                       1259    143697    sellbuy_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sellbuy_question_id_seq;
       public          dbrdsubuntume12    false    525            i           0    0    sellbuy_question_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sellbuy_question_id_seq OWNED BY public.sellbuy_question.id;
          public          dbrdsubuntume12    false    524                       1259    143672    sellbuy_review    TABLE     4  CREATE TABLE public.sellbuy_review (
    id bigint NOT NULL,
    stars integer,
    review text NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    parent_id bigint,
    product_id bigint NOT NULL,
    user_id integer NOT NULL,
    is_active boolean NOT NULL
);
 "   DROP TABLE public.sellbuy_review;
       public         heap    dbrdsubuntume12    false            	           1259    143683    sellbuy_review_dislikes    TABLE     �   CREATE TABLE public.sellbuy_review_dislikes (
    id bigint NOT NULL,
    review_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.sellbuy_review_dislikes;
       public         heap    dbrdsubuntume12    false                       1259    143681    sellbuy_review_dislikes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_review_dislikes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.sellbuy_review_dislikes_id_seq;
       public          dbrdsubuntume12    false    521            j           0    0    sellbuy_review_dislikes_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.sellbuy_review_dislikes_id_seq OWNED BY public.sellbuy_review_dislikes.id;
          public          dbrdsubuntume12    false    520                       1259    143670    sellbuy_review_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.sellbuy_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sellbuy_review_id_seq;
       public          dbrdsubuntume12    false    519            k           0    0    sellbuy_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.sellbuy_review_id_seq OWNED BY public.sellbuy_review.id;
          public          dbrdsubuntume12    false    518                       1259    143691    sellbuy_review_likes    TABLE     �   CREATE TABLE public.sellbuy_review_likes (
    id bigint NOT NULL,
    review_id bigint NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.sellbuy_review_likes;
       public         heap    dbrdsubuntume12    false            
           1259    143689    sellbuy_review_likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_review_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sellbuy_review_likes_id_seq;
       public          dbrdsubuntume12    false    523            l           0    0    sellbuy_review_likes_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.sellbuy_review_likes_id_seq OWNED BY public.sellbuy_review_likes.id;
          public          dbrdsubuntume12    false    522            �           1259    139250    sellbuy_sellerprofile    TABLE     W  CREATE TABLE public.sellbuy_sellerprofile (
    id bigint NOT NULL,
    trade_license character varying(100),
    electric_bill1 character varying(100),
    electric_bill2 character varying(100),
    owner_proof character varying(100),
    contract_copy character varying(100),
    shop_address character varying(100),
    owner_photo character varying(100),
    owner_nid_photo character varying(100),
    nominee_photo character varying(100),
    nominee_nid_no character varying(100),
    nominee_nid_photo character varying(100),
    nominee_present_address character varying(100),
    nominee_permanent_address character varying(100),
    user_id integer NOT NULL,
    nominee_name character varying(100),
    nominee_phone character varying(17),
    is_active boolean NOT NULL,
    is_varified boolean NOT NULL,
    is_published boolean NOT NULL
);
 )   DROP TABLE public.sellbuy_sellerprofile;
       public         heap    dbrdsubuntume12    false            �           1259    139248    sellbuy_sellerprofile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellbuy_sellerprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.sellbuy_sellerprofile_id_seq;
       public          dbrdsubuntume12    false    493            m           0    0    sellbuy_sellerprofile_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.sellbuy_sellerprofile_id_seq OWNED BY public.sellbuy_sellerprofile.id;
          public          dbrdsubuntume12    false    492            2           1259    91072    social_activity    TABLE     �   CREATE TABLE public.social_activity (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 #   DROP TABLE public.social_activity;
       public         heap    dbrdsubuntume12    false            1           1259    91070    social_activity_id_seq    SEQUENCE        CREATE SEQUENCE public.social_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.social_activity_id_seq;
       public          dbrdsubuntume12    false    306            n           0    0    social_activity_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.social_activity_id_seq OWNED BY public.social_activity.id;
          public          dbrdsubuntume12    false    305            4           1259    91082    social_backgroud    TABLE     �   CREATE TABLE public.social_backgroud (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    rank double precision
);
 $   DROP TABLE public.social_backgroud;
       public         heap    dbrdsubuntume12    false            3           1259    91080    social_backgroud_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_backgroud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.social_backgroud_id_seq;
       public          dbrdsubuntume12    false    308            o           0    0    social_backgroud_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.social_backgroud_id_seq OWNED BY public.social_backgroud.id;
          public          dbrdsubuntume12    false    307            6           1259    91092    social_category    TABLE     �   CREATE TABLE public.social_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 #   DROP TABLE public.social_category;
       public         heap    dbrdsubuntume12    false            5           1259    91090    social_category_id_seq    SEQUENCE        CREATE SEQUENCE public.social_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.social_category_id_seq;
       public          dbrdsubuntume12    false    310            p           0    0    social_category_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.social_category_id_seq OWNED BY public.social_category.id;
          public          dbrdsubuntume12    false    309            8           1259    91102    social_check_in    TABLE     �   CREATE TABLE public.social_check_in (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 #   DROP TABLE public.social_check_in;
       public         heap    dbrdsubuntume12    false            7           1259    91100    social_check_in_id_seq    SEQUENCE        CREATE SEQUENCE public.social_check_in_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.social_check_in_id_seq;
       public          dbrdsubuntume12    false    312            q           0    0    social_check_in_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.social_check_in_id_seq OWNED BY public.social_check_in.id;
          public          dbrdsubuntume12    false    311            :           1259    91112    social_feeling    TABLE     �   CREATE TABLE public.social_feeling (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision,
    emoji character varying(100),
    icon text
);
 "   DROP TABLE public.social_feeling;
       public         heap    dbrdsubuntume12    false            9           1259    91110    social_feeling_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.social_feeling_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.social_feeling_id_seq;
       public          dbrdsubuntume12    false    314            r           0    0    social_feeling_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.social_feeling_id_seq OWNED BY public.social_feeling.id;
          public          dbrdsubuntume12    false    313            <           1259    91122 
   social_gif    TABLE     �   CREATE TABLE public.social_gif (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    rank double precision
);
    DROP TABLE public.social_gif;
       public         heap    dbrdsubuntume12    false            ;           1259    91120    social_gif_id_seq    SEQUENCE     z   CREATE SEQUENCE public.social_gif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.social_gif_id_seq;
       public          dbrdsubuntume12    false    316            s           0    0    social_gif_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.social_gif_id_seq OWNED BY public.social_gif.id;
          public          dbrdsubuntume12    false    315            >           1259    91132    social_lifeevent    TABLE     �   CREATE TABLE public.social_lifeevent (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 $   DROP TABLE public.social_lifeevent;
       public         heap    dbrdsubuntume12    false            =           1259    91130    social_lifeevent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_lifeevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.social_lifeevent_id_seq;
       public          dbrdsubuntume12    false    318            t           0    0    social_lifeevent_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.social_lifeevent_id_seq OWNED BY public.social_lifeevent.id;
          public          dbrdsubuntume12    false    317                       1259    87071    social_post_activity    TABLE     �   CREATE TABLE public.social_post_activity (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 (   DROP TABLE public.social_post_activity;
       public         heap    dbrdsubuntume12    false                       1259    87069    social_post_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.social_post_activity_id_seq;
       public          dbrdsubuntume12    false    284            u           0    0    social_post_activity_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.social_post_activity_id_seq OWNED BY public.social_post_activity.id;
          public          dbrdsubuntume12    false    283                       1259    87081    social_post_backgroud    TABLE     �   CREATE TABLE public.social_post_backgroud (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    rank double precision
);
 )   DROP TABLE public.social_post_backgroud;
       public         heap    dbrdsubuntume12    false                       1259    87079    social_post_backgroud_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_backgroud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.social_post_backgroud_id_seq;
       public          dbrdsubuntume12    false    286            v           0    0    social_post_backgroud_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.social_post_backgroud_id_seq OWNED BY public.social_post_backgroud.id;
          public          dbrdsubuntume12    false    285                        1259    87091    social_post_category    TABLE     �   CREATE TABLE public.social_post_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 (   DROP TABLE public.social_post_category;
       public         heap    dbrdsubuntume12    false                       1259    87089    social_post_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.social_post_category_id_seq;
       public          dbrdsubuntume12    false    288            w           0    0    social_post_category_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.social_post_category_id_seq OWNED BY public.social_post_category.id;
          public          dbrdsubuntume12    false    287            "           1259    87101    social_post_check_in    TABLE     �   CREATE TABLE public.social_post_check_in (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 (   DROP TABLE public.social_post_check_in;
       public         heap    dbrdsubuntume12    false            !           1259    87099    social_post_check_in_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_check_in_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.social_post_check_in_id_seq;
       public          dbrdsubuntume12    false    290            x           0    0    social_post_check_in_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.social_post_check_in_id_seq OWNED BY public.social_post_check_in.id;
          public          dbrdsubuntume12    false    289            0           1259    91047    social_post_feels    TABLE     �   CREATE TABLE public.social_post_feels (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    reaction character varying(100),
    icons text,
    rank double precision
);
 %   DROP TABLE public.social_post_feels;
       public         heap    dbrdsubuntume12    false            /           1259    91045    social_post_feels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_feels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.social_post_feels_id_seq;
       public          dbrdsubuntume12    false    304            y           0    0    social_post_feels_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.social_post_feels_id_seq OWNED BY public.social_post_feels.id;
          public          dbrdsubuntume12    false    303            $           1259    87121    social_post_gif    TABLE     �   CREATE TABLE public.social_post_gif (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    rank double precision
);
 #   DROP TABLE public.social_post_gif;
       public         heap    dbrdsubuntume12    false            #           1259    87119    social_post_gif_id_seq    SEQUENCE        CREATE SEQUENCE public.social_post_gif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.social_post_gif_id_seq;
       public          dbrdsubuntume12    false    292            z           0    0    social_post_gif_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.social_post_gif_id_seq OWNED BY public.social_post_gif.id;
          public          dbrdsubuntume12    false    291            &           1259    87131    social_post_lifeevent    TABLE     �   CREATE TABLE public.social_post_lifeevent (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 )   DROP TABLE public.social_post_lifeevent;
       public         heap    dbrdsubuntume12    false            %           1259    87129    social_post_lifeevent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_lifeevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.social_post_lifeevent_id_seq;
       public          dbrdsubuntume12    false    294            {           0    0    social_post_lifeevent_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.social_post_lifeevent_id_seq OWNED BY public.social_post_lifeevent.id;
          public          dbrdsubuntume12    false    293            (           1259    87141    social_post_privacy    TABLE     �   CREATE TABLE public.social_post_privacy (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision
);
 '   DROP TABLE public.social_post_privacy;
       public         heap    dbrdsubuntume12    false            '           1259    87139    social_post_privacy_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_privacy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.social_post_privacy_id_seq;
       public          dbrdsubuntume12    false    296            |           0    0    social_post_privacy_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.social_post_privacy_id_seq OWNED BY public.social_post_privacy.id;
          public          dbrdsubuntume12    false    295                       1259    86823    social_post_socialpost    TABLE     �  CREATE TABLE public.social_post_socialpost (
    id bigint NOT NULL,
    privacy character varying(100),
    post_text text,
    location character varying(100),
    feeling_or_activity character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    category character varying(100),
    user_id integer NOT NULL,
    "is_HQA" boolean
);
 *   DROP TABLE public.social_post_socialpost;
       public         heap    dbrdsubuntume12    false            
           1259    86834    social_post_socialpost_angry    TABLE     �   CREATE TABLE public.social_post_socialpost_angry (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 0   DROP TABLE public.social_post_socialpost_angry;
       public         heap    dbrdsubuntume12    false            	           1259    86832 #   social_post_socialpost_angry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_angry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.social_post_socialpost_angry_id_seq;
       public          dbrdsubuntume12    false    266            }           0    0 #   social_post_socialpost_angry_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.social_post_socialpost_angry_id_seq OWNED BY public.social_post_socialpost_angry.id;
          public          dbrdsubuntume12    false    265                       1259    86842    social_post_socialpost_care    TABLE     �   CREATE TABLE public.social_post_socialpost_care (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.social_post_socialpost_care;
       public         heap    dbrdsubuntume12    false                       1259    86840 "   social_post_socialpost_care_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_care_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.social_post_socialpost_care_id_seq;
       public          dbrdsubuntume12    false    268            ~           0    0 "   social_post_socialpost_care_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.social_post_socialpost_care_id_seq OWNED BY public.social_post_socialpost_care.id;
          public          dbrdsubuntume12    false    267                       1259    86850    social_post_socialpost_haha    TABLE     �   CREATE TABLE public.social_post_socialpost_haha (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.social_post_socialpost_haha;
       public         heap    dbrdsubuntume12    false                       1259    86848 "   social_post_socialpost_haha_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_haha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.social_post_socialpost_haha_id_seq;
       public          dbrdsubuntume12    false    270                       0    0 "   social_post_socialpost_haha_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.social_post_socialpost_haha_id_seq OWNED BY public.social_post_socialpost_haha.id;
          public          dbrdsubuntume12    false    269                       1259    86821    social_post_socialpost_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.social_post_socialpost_id_seq;
       public          dbrdsubuntume12    false    264            �           0    0    social_post_socialpost_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.social_post_socialpost_id_seq OWNED BY public.social_post_socialpost.id;
          public          dbrdsubuntume12    false    263                       1259    86858    social_post_socialpost_likes    TABLE     �   CREATE TABLE public.social_post_socialpost_likes (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 0   DROP TABLE public.social_post_socialpost_likes;
       public         heap    dbrdsubuntume12    false                       1259    86856 #   social_post_socialpost_likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.social_post_socialpost_likes_id_seq;
       public          dbrdsubuntume12    false    272            �           0    0 #   social_post_socialpost_likes_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.social_post_socialpost_likes_id_seq OWNED BY public.social_post_socialpost_likes.id;
          public          dbrdsubuntume12    false    271                       1259    86866    social_post_socialpost_love    TABLE     �   CREATE TABLE public.social_post_socialpost_love (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.social_post_socialpost_love;
       public         heap    dbrdsubuntume12    false                       1259    86864 "   social_post_socialpost_love_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_love_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.social_post_socialpost_love_id_seq;
       public          dbrdsubuntume12    false    274            �           0    0 "   social_post_socialpost_love_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.social_post_socialpost_love_id_seq OWNED BY public.social_post_socialpost_love.id;
          public          dbrdsubuntume12    false    273                       1259    86874    social_post_socialpost_sad    TABLE     �   CREATE TABLE public.social_post_socialpost_sad (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 .   DROP TABLE public.social_post_socialpost_sad;
       public         heap    dbrdsubuntume12    false                       1259    86872 !   social_post_socialpost_sad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_sad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.social_post_socialpost_sad_id_seq;
       public          dbrdsubuntume12    false    276            �           0    0 !   social_post_socialpost_sad_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.social_post_socialpost_sad_id_seq OWNED BY public.social_post_socialpost_sad.id;
          public          dbrdsubuntume12    false    275                       1259    86882    social_post_socialpost_senti    TABLE     �   CREATE TABLE public.social_post_socialpost_senti (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 0   DROP TABLE public.social_post_socialpost_senti;
       public         heap    dbrdsubuntume12    false                       1259    86880 #   social_post_socialpost_senti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_senti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.social_post_socialpost_senti_id_seq;
       public          dbrdsubuntume12    false    278            �           0    0 #   social_post_socialpost_senti_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.social_post_socialpost_senti_id_seq OWNED BY public.social_post_socialpost_senti.id;
          public          dbrdsubuntume12    false    277            *           1259    87151     social_post_socialpost_shared_by    TABLE     �   CREATE TABLE public.social_post_socialpost_shared_by (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 4   DROP TABLE public.social_post_socialpost_shared_by;
       public         heap    dbrdsubuntume12    false            )           1259    87149 '   social_post_socialpost_shared_by_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_shared_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.social_post_socialpost_shared_by_id_seq;
       public          dbrdsubuntume12    false    298            �           0    0 '   social_post_socialpost_shared_by_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.social_post_socialpost_shared_by_id_seq OWNED BY public.social_post_socialpost_shared_by.id;
          public          dbrdsubuntume12    false    297                       1259    86890    social_post_socialpost_tags    TABLE     �   CREATE TABLE public.social_post_socialpost_tags (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.social_post_socialpost_tags;
       public         heap    dbrdsubuntume12    false                       1259    86888 "   social_post_socialpost_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.social_post_socialpost_tags_id_seq;
       public          dbrdsubuntume12    false    280            �           0    0 "   social_post_socialpost_tags_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.social_post_socialpost_tags_id_seq OWNED BY public.social_post_socialpost_tags.id;
          public          dbrdsubuntume12    false    279                       1259    86906    social_post_socialpost_wow    TABLE     �   CREATE TABLE public.social_post_socialpost_wow (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 .   DROP TABLE public.social_post_socialpost_wow;
       public         heap    dbrdsubuntume12    false                       1259    86904 !   social_post_socialpost_wow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_socialpost_wow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.social_post_socialpost_wow_id_seq;
       public          dbrdsubuntume12    false    282            �           0    0 !   social_post_socialpost_wow_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.social_post_socialpost_wow_id_seq OWNED BY public.social_post_socialpost_wow.id;
          public          dbrdsubuntume12    false    281            .           1259    87169    social_post_subactivity    TABLE     �   CREATE TABLE public.social_post_subactivity (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision,
    activity_id bigint NOT NULL
);
 +   DROP TABLE public.social_post_subactivity;
       public         heap    dbrdsubuntume12    false            -           1259    87167    social_post_subactivity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_subactivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.social_post_subactivity_id_seq;
       public          dbrdsubuntume12    false    302            �           0    0    social_post_subactivity_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.social_post_subactivity_id_seq OWNED BY public.social_post_subactivity.id;
          public          dbrdsubuntume12    false    301            ,           1259    87159    social_post_sublifeevent    TABLE     �   CREATE TABLE public.social_post_sublifeevent (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision,
    lifeevent_id bigint NOT NULL
);
 ,   DROP TABLE public.social_post_sublifeevent;
       public         heap    dbrdsubuntume12    false            +           1259    87157    social_post_sublifeevent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_post_sublifeevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.social_post_sublifeevent_id_seq;
       public          dbrdsubuntume12    false    300            �           0    0    social_post_sublifeevent_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.social_post_sublifeevent_id_seq OWNED BY public.social_post_sublifeevent.id;
          public          dbrdsubuntume12    false    299            @           1259    91142    social_privacymodel    TABLE     �   CREATE TABLE public.social_privacymodel (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision,
    icon character varying(20),
    "nameSubtitle" character varying(250)
);
 '   DROP TABLE public.social_privacymodel;
       public         heap    dbrdsubuntume12    false            ?           1259    91140    social_privacy_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.social_privacy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.social_privacy_id_seq;
       public          dbrdsubuntume12    false    320            �           0    0    social_privacy_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.social_privacy_id_seq OWNED BY public.social_privacymodel.id;
          public          dbrdsubuntume12    false    319            F           1259    91197    social_reactions    TABLE     �   CREATE TABLE public.social_reactions (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL
);
 $   DROP TABLE public.social_reactions;
       public         heap    dbrdsubuntume12    false            E           1259    91195    social_reactions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.social_reactions_id_seq;
       public          dbrdsubuntume12    false    326            �           0    0    social_reactions_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.social_reactions_id_seq OWNED BY public.social_reactions.id;
          public          dbrdsubuntume12    false    325            `           1259    91858    social_socialphoto    TABLE     �   CREATE TABLE public.social_socialphoto (
    id bigint NOT NULL,
    caption text,
    photo character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id integer NOT NULL
);
 &   DROP TABLE public.social_socialphoto;
       public         heap    dbrdsubuntume12    false            _           1259    91856    social_socialphoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialphoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.social_socialphoto_id_seq;
       public          dbrdsubuntume12    false    352            �           0    0    social_socialphoto_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.social_socialphoto_id_seq OWNED BY public.social_socialphoto.id;
          public          dbrdsubuntume12    false    351            H           1259    91205    social_socialpost    TABLE       CREATE TABLE public.social_socialpost (
    id bigint NOT NULL,
    post_text text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    is_hqa boolean NOT NULL,
    activity_id bigint,
    background_id bigint,
    category_id bigint,
    check_in_id bigint,
    feeling_id bigint,
    gif_id bigint,
    lifeevent_id bigint,
    privacy_id bigint,
    subactivity_id bigint,
    sublifeevent_id bigint,
    user_id integer NOT NULL,
    is_active boolean NOT NULL,
    is_draft boolean NOT NULL
);
 %   DROP TABLE public.social_socialpost;
       public         heap    dbrdsubuntume12    false            J           1259    91216    social_socialpost_angry    TABLE     �   CREATE TABLE public.social_socialpost_angry (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.social_socialpost_angry;
       public         heap    dbrdsubuntume12    false            I           1259    91214    social_socialpost_angry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_angry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.social_socialpost_angry_id_seq;
       public          dbrdsubuntume12    false    330            �           0    0    social_socialpost_angry_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.social_socialpost_angry_id_seq OWNED BY public.social_socialpost_angry.id;
          public          dbrdsubuntume12    false    329            L           1259    91224    social_socialpost_care    TABLE     �   CREATE TABLE public.social_socialpost_care (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.social_socialpost_care;
       public         heap    dbrdsubuntume12    false            K           1259    91222    social_socialpost_care_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_care_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.social_socialpost_care_id_seq;
       public          dbrdsubuntume12    false    332            �           0    0    social_socialpost_care_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.social_socialpost_care_id_seq OWNED BY public.social_socialpost_care.id;
          public          dbrdsubuntume12    false    331            N           1259    91232    social_socialpost_haha    TABLE     �   CREATE TABLE public.social_socialpost_haha (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.social_socialpost_haha;
       public         heap    dbrdsubuntume12    false            M           1259    91230    social_socialpost_haha_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_haha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.social_socialpost_haha_id_seq;
       public          dbrdsubuntume12    false    334            �           0    0    social_socialpost_haha_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.social_socialpost_haha_id_seq OWNED BY public.social_socialpost_haha.id;
          public          dbrdsubuntume12    false    333            G           1259    91203    social_socialpost_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.social_socialpost_id_seq;
       public          dbrdsubuntume12    false    328            �           0    0    social_socialpost_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.social_socialpost_id_seq OWNED BY public.social_socialpost.id;
          public          dbrdsubuntume12    false    327            P           1259    91240    social_socialpost_likes    TABLE     �   CREATE TABLE public.social_socialpost_likes (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.social_socialpost_likes;
       public         heap    dbrdsubuntume12    false            O           1259    91238    social_socialpost_likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.social_socialpost_likes_id_seq;
       public          dbrdsubuntume12    false    336            �           0    0    social_socialpost_likes_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.social_socialpost_likes_id_seq OWNED BY public.social_socialpost_likes.id;
          public          dbrdsubuntume12    false    335            R           1259    91248    social_socialpost_love    TABLE     �   CREATE TABLE public.social_socialpost_love (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.social_socialpost_love;
       public         heap    dbrdsubuntume12    false            Q           1259    91246    social_socialpost_love_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_love_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.social_socialpost_love_id_seq;
       public          dbrdsubuntume12    false    338            �           0    0    social_socialpost_love_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.social_socialpost_love_id_seq OWNED BY public.social_socialpost_love.id;
          public          dbrdsubuntume12    false    337            T           1259    91256    social_socialpost_sad    TABLE     �   CREATE TABLE public.social_socialpost_sad (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.social_socialpost_sad;
       public         heap    dbrdsubuntume12    false            S           1259    91254    social_socialpost_sad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_sad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.social_socialpost_sad_id_seq;
       public          dbrdsubuntume12    false    340            �           0    0    social_socialpost_sad_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.social_socialpost_sad_id_seq OWNED BY public.social_socialpost_sad.id;
          public          dbrdsubuntume12    false    339            V           1259    91264    social_socialpost_senti    TABLE     �   CREATE TABLE public.social_socialpost_senti (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.social_socialpost_senti;
       public         heap    dbrdsubuntume12    false            U           1259    91262    social_socialpost_senti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_senti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.social_socialpost_senti_id_seq;
       public          dbrdsubuntume12    false    342            �           0    0    social_socialpost_senti_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.social_socialpost_senti_id_seq OWNED BY public.social_socialpost_senti.id;
          public          dbrdsubuntume12    false    341            X           1259    91272    social_socialpost_shared_by    TABLE     �   CREATE TABLE public.social_socialpost_shared_by (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.social_socialpost_shared_by;
       public         heap    dbrdsubuntume12    false            W           1259    91270 "   social_socialpost_shared_by_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_shared_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.social_socialpost_shared_by_id_seq;
       public          dbrdsubuntume12    false    344            �           0    0 "   social_socialpost_shared_by_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.social_socialpost_shared_by_id_seq OWNED BY public.social_socialpost_shared_by.id;
          public          dbrdsubuntume12    false    343            Z           1259    91280    social_socialpost_tags    TABLE     �   CREATE TABLE public.social_socialpost_tags (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.social_socialpost_tags;
       public         heap    dbrdsubuntume12    false            Y           1259    91278    social_socialpost_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.social_socialpost_tags_id_seq;
       public          dbrdsubuntume12    false    346            �           0    0    social_socialpost_tags_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.social_socialpost_tags_id_seq OWNED BY public.social_socialpost_tags.id;
          public          dbrdsubuntume12    false    345            \           1259    91288    social_socialpost_wow    TABLE     �   CREATE TABLE public.social_socialpost_wow (
    id bigint NOT NULL,
    socialpost_id bigint NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.social_socialpost_wow;
       public         heap    dbrdsubuntume12    false            [           1259    91286    social_socialpost_wow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialpost_wow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.social_socialpost_wow_id_seq;
       public          dbrdsubuntume12    false    348            �           0    0    social_socialpost_wow_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.social_socialpost_wow_id_seq OWNED BY public.social_socialpost_wow.id;
          public          dbrdsubuntume12    false    347            ^           1259    91829    social_socialupdatehistory    TABLE     �   CREATE TABLE public.social_socialupdatehistory (
    id bigint NOT NULL,
    post_text text,
    updated_at timestamp with time zone,
    is_hqa boolean NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp with time zone
);
 .   DROP TABLE public.social_socialupdatehistory;
       public         heap    dbrdsubuntume12    false            ]           1259    91827 !   social_socialupdatehistory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_socialupdatehistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.social_socialupdatehistory_id_seq;
       public          dbrdsubuntume12    false    350            �           0    0 !   social_socialupdatehistory_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.social_socialupdatehistory_id_seq OWNED BY public.social_socialupdatehistory.id;
          public          dbrdsubuntume12    false    349            D           1259    91162    social_subactivity    TABLE     �   CREATE TABLE public.social_subactivity (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision,
    activity_id bigint NOT NULL
);
 &   DROP TABLE public.social_subactivity;
       public         heap    dbrdsubuntume12    false            C           1259    91160    social_subactivity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_subactivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.social_subactivity_id_seq;
       public          dbrdsubuntume12    false    324            �           0    0    social_subactivity_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.social_subactivity_id_seq OWNED BY public.social_subactivity.id;
          public          dbrdsubuntume12    false    323            B           1259    91152    social_sublifeevent    TABLE     �   CREATE TABLE public.social_sublifeevent (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rank double precision,
    lifeevent_id bigint NOT NULL
);
 '   DROP TABLE public.social_sublifeevent;
       public         heap    dbrdsubuntume12    false            A           1259    91150    social_sublifeevent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_sublifeevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.social_sublifeevent_id_seq;
       public          dbrdsubuntume12    false    322            �           0    0    social_sublifeevent_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.social_sublifeevent_id_seq OWNED BY public.social_sublifeevent.id;
          public          dbrdsubuntume12    false    321            �            1259    85469    user_management_consumer    TABLE     �  CREATE TABLE public.user_management_consumer (
    id bigint NOT NULL,
    phone character varying(100),
    username character varying(100),
    first_name character varying(100),
    last_name character varying(100),
    photo character varying(100),
    occupation character varying(150),
    date_of_birth character varying(200),
    nid_number character varying(150),
    gender character varying(150),
    religion character varying(150),
    father_name character varying(250),
    father_occupation character varying(250),
    mother_name character varying(250),
    mother_occupation character varying(250),
    spouse_name character varying(250),
    address1 character varying(250),
    address2 character varying(250),
    bio text,
    blood_group character varying(100),
    height character varying(100),
    weight character varying(100),
    hobby character varying(100),
    marital_status character varying(100),
    languages character varying(100),
    about_tour character varying(100),
    about_family_members character varying(100),
    designation_and_service_organization character varying(100),
    primary_name_and_session character varying(100),
    highschool_name_and_session character varying(100),
    college_name_and_session character varying(100),
    university_name_and_session character varying(100),
    psd_name_and_session character varying(100),
    others_name_and_session character varying(100),
    father_name_change boolean NOT NULL,
    mother_name_change boolean NOT NULL,
    rank integer NOT NULL,
    add_seller boolean NOT NULL,
    refered_by character varying(250) NOT NULL,
    left_refer character varying(250),
    right_refer character varying(250),
    is_late boolean NOT NULL,
    is_master character varying(255) NOT NULL,
    password character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    city_id bigint,
    country_id bigint,
    user_id integer,
    can_follow boolean NOT NULL
);
 ,   DROP TABLE public.user_management_consumer;
       public         heap    dbrdsubuntume12    false            �            1259    85467    user_management_consumer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_management_consumer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.user_management_consumer_id_seq;
       public          dbrdsubuntume12    false    250            �           0    0    user_management_consumer_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.user_management_consumer_id_seq OWNED BY public.user_management_consumer.id;
          public          dbrdsubuntume12    false    249            �            1259    85431     user_management_consumerreferred    TABLE     �  CREATE TABLE public.user_management_consumerreferred (
    id bigint NOT NULL,
    referred_by character varying(255),
    user_id integer,
    left_refer character varying(255),
    right_refer character varying(255),
    username character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    referal_name_left character varying(255),
    referal_name_right character varying(255),
    parent_id character varying(255)
);
 4   DROP TABLE public.user_management_consumerreferred;
       public         heap    dbrdsubuntume12    false            �            1259    85429 '   user_management_consumerreferred_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_management_consumerreferred_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.user_management_consumerreferred_id_seq;
       public          dbrdsubuntume12    false    248            �           0    0 '   user_management_consumerreferred_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.user_management_consumerreferred_id_seq OWNED BY public.user_management_consumerreferred.id;
          public          dbrdsubuntume12    false    247                       1259    86438    userapp_coverphoto    TABLE     X  CREATE TABLE public.userapp_coverphoto (
    id bigint NOT NULL,
    photo character varying(100),
    caption text,
    location character varying(100),
    privacy character varying(100),
    created_at timestamp with time zone NOT NULL,
    last_used timestamp with time zone,
    is_active boolean NOT NULL,
    user_id integer NOT NULL
);
 &   DROP TABLE public.userapp_coverphoto;
       public         heap    dbrdsubuntume12    false                       1259    86436    userapp_coverphoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userapp_coverphoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.userapp_coverphoto_id_seq;
       public          dbrdsubuntume12    false    260            �           0    0    userapp_coverphoto_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.userapp_coverphoto_id_seq OWNED BY public.userapp_coverphoto.id;
          public          dbrdsubuntume12    false    259                       1259    86449    userapp_coverphoto_tags    TABLE     �   CREATE TABLE public.userapp_coverphoto_tags (
    id bigint NOT NULL,
    coverphoto_id bigint NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.userapp_coverphoto_tags;
       public         heap    dbrdsubuntume12    false                       1259    86447    userapp_coverphoto_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userapp_coverphoto_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.userapp_coverphoto_tags_id_seq;
       public          dbrdsubuntume12    false    262            �           0    0    userapp_coverphoto_tags_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.userapp_coverphoto_tags_id_seq OWNED BY public.userapp_coverphoto_tags.id;
          public          dbrdsubuntume12    false    261                        1259    86419    userapp_profilephoto    TABLE     Z  CREATE TABLE public.userapp_profilephoto (
    id bigint NOT NULL,
    photo character varying(100),
    caption text,
    location character varying(100),
    privacy character varying(100),
    created_at timestamp with time zone NOT NULL,
    last_used timestamp with time zone,
    is_active boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.userapp_profilephoto;
       public         heap    dbrdsubuntume12    false            �            1259    86417    userapp_profilephoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userapp_profilephoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.userapp_profilephoto_id_seq;
       public          dbrdsubuntume12    false    256            �           0    0    userapp_profilephoto_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.userapp_profilephoto_id_seq OWNED BY public.userapp_profilephoto.id;
          public          dbrdsubuntume12    false    255                       1259    86430    userapp_profilephoto_tags    TABLE     �   CREATE TABLE public.userapp_profilephoto_tags (
    id bigint NOT NULL,
    profilephoto_id bigint NOT NULL,
    user_id integer NOT NULL
);
 -   DROP TABLE public.userapp_profilephoto_tags;
       public         heap    dbrdsubuntume12    false                       1259    86428     userapp_profilephoto_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userapp_profilephoto_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.userapp_profilephoto_tags_id_seq;
       public          dbrdsubuntume12    false    258            �           0    0     userapp_profilephoto_tags_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.userapp_profilephoto_tags_id_seq OWNED BY public.userapp_profilephoto_tags.id;
          public          dbrdsubuntume12    false    257            �            1259    85526    userapp_userpro    TABLE     �   CREATE TABLE public.userapp_userpro (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    username character varying(200) NOT NULL
);
 #   DROP TABLE public.userapp_userpro;
       public         heap    dbrdsubuntume12    false            �            1259    85524    userapp_userpro_id_seq    SEQUENCE        CREATE SEQUENCE public.userapp_userpro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.userapp_userpro_id_seq;
       public          dbrdsubuntume12    false    252            �           0    0    userapp_userpro_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.userapp_userpro_id_seq OWNED BY public.userapp_userpro.id;
          public          dbrdsubuntume12    false    251            j           2604    84953    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    208    209    209            k           2604    84963    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    211    210    211            i           2604    84945    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    207    206    207            l           2604    84971    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    213    212    213            m           2604    84981    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    214    215    215            n           2604    84989    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    216    217    217            �           2604    139510    chat_groupmessage id    DEFAULT     |   ALTER TABLE ONLY public.chat_groupmessage ALTER COLUMN id SET DEFAULT nextval('public.chat_groupmessage_id_seq'::regclass);
 C   ALTER TABLE public.chat_groupmessage ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    501    500    501            �           2604    139484    chat_groupname id    DEFAULT     v   ALTER TABLE ONLY public.chat_groupname ALTER COLUMN id SET DEFAULT nextval('public.chat_groupname_id_seq'::regclass);
 @   ALTER TABLE public.chat_groupname ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    495    494    495            �           2604    139494    chat_groupname_admins id    DEFAULT     �   ALTER TABLE ONLY public.chat_groupname_admins ALTER COLUMN id SET DEFAULT nextval('public.chat_groupname_admins_id_seq'::regclass);
 G   ALTER TABLE public.chat_groupname_admins ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    496    497    497            �           2604    139502    chat_groupname_participants id    DEFAULT     �   ALTER TABLE ONLY public.chat_groupname_participants ALTER COLUMN id SET DEFAULT nextval('public.chat_groupname_participants_id_seq'::regclass);
 M   ALTER TABLE public.chat_groupname_participants ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    499    498    499            �           2604    139209    chat_message id    DEFAULT     r   ALTER TABLE ONLY public.chat_message ALTER COLUMN id SET DEFAULT nextval('public.chat_message_id_seq'::regclass);
 >   ALTER TABLE public.chat_message ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    491    490    491            �           2604    139199    chat_privatechtroom id    DEFAULT     �   ALTER TABLE ONLY public.chat_privatechtroom ALTER COLUMN id SET DEFAULT nextval('public.chat_privatechtroom_id_seq'::regclass);
 E   ALTER TABLE public.chat_privatechtroom ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    489    488    489            �           2604    98576    chatapp_message id    DEFAULT     x   ALTER TABLE ONLY public.chatapp_message ALTER COLUMN id SET DEFAULT nextval('public.chatapp_message_id_seq'::regclass);
 A   ALTER TABLE public.chatapp_message ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    403    402    403            �           2604    98558    chatapp_roomname id    DEFAULT     z   ALTER TABLE ONLY public.chatapp_roomname ALTER COLUMN id SET DEFAULT nextval('public.chatapp_roomname_id_seq'::regclass);
 B   ALTER TABLE public.chatapp_roomname ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    399    398    399            �           2604    98568     chatapp_roomname_participants id    DEFAULT     �   ALTER TABLE ONLY public.chatapp_roomname_participants ALTER COLUMN id SET DEFAULT nextval('public.chatapp_roomname_participants_id_seq'::regclass);
 O   ALTER TABLE public.chatapp_roomname_participants ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    400    401    401            �           2604    92302    comment_postcomment id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_id_seq'::regclass);
 E   ALTER TABLE public.comment_postcomment ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    354    353    354            �           2604    92313    comment_postcomment_angry id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_angry ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_angry_id_seq'::regclass);
 K   ALTER TABLE public.comment_postcomment_angry ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    356    355    356            �           2604    92321    comment_postcomment_care id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_care ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_care_id_seq'::regclass);
 J   ALTER TABLE public.comment_postcomment_care ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    357    358    358            �           2604    92329    comment_postcomment_haha id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_haha ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_haha_id_seq'::regclass);
 J   ALTER TABLE public.comment_postcomment_haha ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    360    359    360            �           2604    92337    comment_postcomment_likes id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_likes_id_seq'::regclass);
 K   ALTER TABLE public.comment_postcomment_likes ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    361    362    362            �           2604    92345    comment_postcomment_love id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_love ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_love_id_seq'::regclass);
 J   ALTER TABLE public.comment_postcomment_love ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    363    364    364            �           2604    92353    comment_postcomment_sad id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_sad ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_sad_id_seq'::regclass);
 I   ALTER TABLE public.comment_postcomment_sad ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    365    366    366            �           2604    92361    comment_postcomment_senti id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_senti ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_senti_id_seq'::regclass);
 K   ALTER TABLE public.comment_postcomment_senti ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    368    367    368            �           2604    92369    comment_postcomment_wow id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcomment_wow ALTER COLUMN id SET DEFAULT nextval('public.comment_postcomment_wow_id_seq'::regclass);
 I   ALTER TABLE public.comment_postcomment_wow ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    370    369    370            �           2604    97902    comment_postcommenthistory id    DEFAULT     �   ALTER TABLE ONLY public.comment_postcommenthistory ALTER COLUMN id SET DEFAULT nextval('public.comment_postcommenthistory_id_seq'::regclass);
 L   ALTER TABLE public.comment_postcommenthistory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    395    394    395            �           2604    97396    comment_postphotocomment id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_id_seq'::regclass);
 J   ALTER TABLE public.comment_postphotocomment ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    375    374    375            �           2604    97407 !   comment_postphotocomment_angry id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_angry ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_angry_id_seq'::regclass);
 P   ALTER TABLE public.comment_postphotocomment_angry ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    377    376    377            �           2604    97415     comment_postphotocomment_care id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_care ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_care_id_seq'::regclass);
 O   ALTER TABLE public.comment_postphotocomment_care ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    379    378    379            �           2604    97423     comment_postphotocomment_haha id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_haha ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_haha_id_seq'::regclass);
 O   ALTER TABLE public.comment_postphotocomment_haha ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    380    381    381            �           2604    97431 !   comment_postphotocomment_likes id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_likes_id_seq'::regclass);
 P   ALTER TABLE public.comment_postphotocomment_likes ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    383    382    383            �           2604    97439     comment_postphotocomment_love id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_love ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_love_id_seq'::regclass);
 O   ALTER TABLE public.comment_postphotocomment_love ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    384    385    385            �           2604    97447    comment_postphotocomment_sad id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_sad ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_sad_id_seq'::regclass);
 N   ALTER TABLE public.comment_postphotocomment_sad ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    387    386    387            �           2604    97455 !   comment_postphotocomment_senti id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_senti ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_senti_id_seq'::regclass);
 P   ALTER TABLE public.comment_postphotocomment_senti ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    388    389    389            �           2604    97463    comment_postphotocomment_wow id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocomment_wow ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocomment_wow_id_seq'::regclass);
 N   ALTER TABLE public.comment_postphotocomment_wow ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    391    390    391            �           2604    97891 "   comment_postphotocommenthistory id    DEFAULT     �   ALTER TABLE ONLY public.comment_postphotocommenthistory ALTER COLUMN id SET DEFAULT nextval('public.comment_postphotocommenthistory_id_seq'::regclass);
 Q   ALTER TABLE public.comment_postphotocommenthistory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    392    393    393            o           2604    85049    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    218    219    219            h           2604    84935    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    204    205    205            g           2604    84924    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    202    203    203            �           2604    100113    employer_applicants id    DEFAULT     �   ALTER TABLE ONLY public.employer_applicants ALTER COLUMN id SET DEFAULT nextval('public.employer_applicants_id_seq'::regclass);
 E   ALTER TABLE public.employer_applicants ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    428    429    429            q           2604    85109    employer_employer id    DEFAULT     |   ALTER TABLE ONLY public.employer_employer ALTER COLUMN id SET DEFAULT nextval('public.employer_employer_id_seq'::regclass);
 C   ALTER TABLE public.employer_employer ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    221    222    222            �           2604    122148    employer_employer_moderators id    DEFAULT     �   ALTER TABLE ONLY public.employer_employer_moderators ALTER COLUMN id SET DEFAULT nextval('public.employer_employer_moderators_id_seq'::regclass);
 N   ALTER TABLE public.employer_employer_moderators ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    469    468    469            �           2604    130873 '   employer_employer_pending_moderators id    DEFAULT     �   ALTER TABLE ONLY public.employer_employer_pending_moderators ALTER COLUMN id SET DEFAULT nextval('public.employer_employer_pending_moderators_id_seq'::regclass);
 V   ALTER TABLE public.employer_employer_pending_moderators ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    471    470    471            r           2604    85146    employer_jobpost id    DEFAULT     z   ALTER TABLE ONLY public.employer_jobpost ALTER COLUMN id SET DEFAULT nextval('public.employer_jobpost_id_seq'::regclass);
 B   ALTER TABLE public.employer_jobpost ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    223    224    224            �           2604    100151    employer_jobpost_applied id    DEFAULT     �   ALTER TABLE ONLY public.employer_jobpost_applied ALTER COLUMN id SET DEFAULT nextval('public.employer_jobpost_applied_id_seq'::regclass);
 J   ALTER TABLE public.employer_jobpost_applied ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    430    431    431            �           2604    98640    follow_friends id    DEFAULT     v   ALTER TABLE ONLY public.follow_friends ALTER COLUMN id SET DEFAULT nextval('public.follow_friends_id_seq'::regclass);
 @   ALTER TABLE public.follow_friends ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    404    405    405            �           2604    98650    follow_friends_follower id    DEFAULT     �   ALTER TABLE ONLY public.follow_friends_follower ALTER COLUMN id SET DEFAULT nextval('public.follow_friends_follower_id_seq'::regclass);
 I   ALTER TABLE public.follow_friends_follower ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    406    407    407            �           2604    98658    follow_friends_following id    DEFAULT     �   ALTER TABLE ONLY public.follow_friends_following ALTER COLUMN id SET DEFAULT nextval('public.follow_friends_following_id_seq'::regclass);
 J   ALTER TABLE public.follow_friends_following ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    408    409    409            �           2604    98666     follow_friends_to_be_follower id    DEFAULT     �   ALTER TABLE ONLY public.follow_friends_to_be_follower ALTER COLUMN id SET DEFAULT nextval('public.follow_friends_to_be_follower_id_seq'::regclass);
 O   ALTER TABLE public.follow_friends_to_be_follower ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    411    410    411            �           2604    98674 !   follow_friends_to_be_following id    DEFAULT     �   ALTER TABLE ONLY public.follow_friends_to_be_following ALTER COLUMN id SET DEFAULT nextval('public.follow_friends_to_be_following_id_seq'::regclass);
 P   ALTER TABLE public.follow_friends_to_be_following ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    413    412    413            �           2604    99248    followfollowing_blockedby id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_blockedby ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_blockedby_id_seq'::regclass);
 K   ALTER TABLE public.followfollowing_blockedby ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    427    426    427            �           2604    99240    followfollowing_blocklist id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_blocklist ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_blocklist_id_seq'::regclass);
 K   ALTER TABLE public.followfollowing_blocklist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    425    424    425            �           2604    98813    followfollowing_followers id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_followers ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_followers_id_seq'::regclass);
 K   ALTER TABLE public.followfollowing_followers ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    414    415    415            �           2604    98821    followfollowing_followings id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_followings ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_followings_id_seq'::regclass);
 L   ALTER TABLE public.followfollowing_followings ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    416    417    417            �           2604    98829    followfollowing_friends id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_friends ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_friends_id_seq'::regclass);
 I   ALTER TABLE public.followfollowing_friends ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    418    419    419            �           2604    98845     followfollowing_tobefollowers id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_tobefollowers ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_tobefollowers_id_seq'::regclass);
 O   ALTER TABLE public.followfollowing_tobefollowers ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    422    423    423            �           2604    98837 !   followfollowing_tobefollowings id    DEFAULT     �   ALTER TABLE ONLY public.followfollowing_tobefollowings ALTER COLUMN id SET DEFAULT nextval('public.followfollowing_tobefollowings_id_seq'::regclass);
 P   ALTER TABLE public.followfollowing_tobefollowings ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    421    420    421            �           2604    85820    jobs_armyexperience id    DEFAULT     �   ALTER TABLE ONLY public.jobs_armyexperience ALTER COLUMN id SET DEFAULT nextval('public.jobs_amryexperience_id_seq'::regclass);
 E   ALTER TABLE public.jobs_armyexperience ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    253    254    254            �           2604    112573    jobs_benefitlist id    DEFAULT     z   ALTER TABLE ONLY public.jobs_benefitlist ALTER COLUMN id SET DEFAULT nextval('public.jobs_benefitlist_id_seq'::regclass);
 B   ALTER TABLE public.jobs_benefitlist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    433    432    433            �           2604    112581    jobs_businesslist id    DEFAULT     |   ALTER TABLE ONLY public.jobs_businesslist ALTER COLUMN id SET DEFAULT nextval('public.jobs_businesslist_id_seq'::regclass);
 C   ALTER TABLE public.jobs_businesslist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    435    434    435            �           2604    118530    jobs_city id    DEFAULT     l   ALTER TABLE ONLY public.jobs_city ALTER COLUMN id SET DEFAULT nextval('public.jobs_city_id_seq'::regclass);
 ;   ALTER TABLE public.jobs_city ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    466    467    467            �           2604    118506    jobs_continent id    DEFAULT     v   ALTER TABLE ONLY public.jobs_continent ALTER COLUMN id SET DEFAULT nextval('public.jobs_continent_id_seq'::regclass);
 @   ALTER TABLE public.jobs_continent ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    460    461    461            �           2604    118514    jobs_country id    DEFAULT     r   ALTER TABLE ONLY public.jobs_country ALTER COLUMN id SET DEFAULT nextval('public.jobs_country_id_seq'::regclass);
 >   ALTER TABLE public.jobs_country ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    462    463    463            �           2604    116536    jobs_degreeorexam id    DEFAULT     |   ALTER TABLE ONLY public.jobs_degreeorexam ALTER COLUMN id SET DEFAULT nextval('public.jobs_degreeorexam_id_seq'::regclass);
 C   ALTER TABLE public.jobs_degreeorexam ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    454    455    455            {           2604    85295    jobs_disability_information id    DEFAULT     �   ALTER TABLE ONLY public.jobs_disability_information ALTER COLUMN id SET DEFAULT nextval('public.jobs_disability_information_id_seq'::regclass);
 M   ALTER TABLE public.jobs_disability_information ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    241    242    242            �           2604    116544    jobs_educationlevel id    DEFAULT     �   ALTER TABLE ONLY public.jobs_educationlevel ALTER COLUMN id SET DEFAULT nextval('public.jobs_educationlevel_id_seq'::regclass);
 E   ALTER TABLE public.jobs_educationlevel ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    456    457    457            z           2604    85284    jobs_educationprofile id    DEFAULT     �   ALTER TABLE ONLY public.jobs_educationprofile ALTER COLUMN id SET DEFAULT nextval('public.jobs_educationprofile_id_seq'::regclass);
 G   ALTER TABLE public.jobs_educationprofile ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    239    240    240            y           2604    85273    jobs_experience id    DEFAULT     x   ALTER TABLE ONLY public.jobs_experience ALTER COLUMN id SET DEFAULT nextval('public.jobs_experience_id_seq'::regclass);
 A   ALTER TABLE public.jobs_experience ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    237    238    238            �           2604    112589    jobs_experiencelist id    DEFAULT     �   ALTER TABLE ONLY public.jobs_experiencelist ALTER COLUMN id SET DEFAULT nextval('public.jobs_experiencelist_id_seq'::regclass);
 E   ALTER TABLE public.jobs_experiencelist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    436    437    437            �           2604    112597    jobs_functionaljobcategory id    DEFAULT     �   ALTER TABLE ONLY public.jobs_functionaljobcategory ALTER COLUMN id SET DEFAULT nextval('public.jobs_functionaljobcategory_id_seq'::regclass);
 L   ALTER TABLE public.jobs_functionaljobcategory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    438    439    439            �           2604    112605    jobs_industrycategory id    DEFAULT     �   ALTER TABLE ONLY public.jobs_industrycategory ALTER COLUMN id SET DEFAULT nextval('public.jobs_industrycategory_id_seq'::regclass);
 G   ALTER TABLE public.jobs_industrycategory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    440    441    441            �           2604    112613    jobs_instituionlist id    DEFAULT     �   ALTER TABLE ONLY public.jobs_instituionlist ALTER COLUMN id SET DEFAULT nextval('public.jobs_instituionlist_id_seq'::regclass);
 E   ALTER TABLE public.jobs_instituionlist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    443    442    443            s           2604    85180    jobs_jobprofile id    DEFAULT     x   ALTER TABLE ONLY public.jobs_jobprofile ALTER COLUMN id SET DEFAULT nextval('public.jobs_jobprofile_id_seq'::regclass);
 A   ALTER TABLE public.jobs_jobprofile ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    225    226    226            �           2604    112689 !   jobs_jobprofile_job_categories id    DEFAULT     �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories ALTER COLUMN id SET DEFAULT nextval('public.jobs_jobprofile_job_categories_id_seq'::regclass);
 P   ALTER TABLE public.jobs_jobprofile_job_categories ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    451    450    451            �           2604    112697 !   jobs_jobprofile_special_skills id    DEFAULT     �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills ALTER COLUMN id SET DEFAULT nextval('public.jobs_jobprofile_special_skills_id_seq'::regclass);
 P   ALTER TABLE public.jobs_jobprofile_special_skills ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    452    453    453            �           2604    116552    jobs_majorin id    DEFAULT     r   ALTER TABLE ONLY public.jobs_majorin ALTER COLUMN id SET DEFAULT nextval('public.jobs_majorin_id_seq'::regclass);
 >   ALTER TABLE public.jobs_majorin ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    459    458    459            �           2604    112629    jobs_organizationtype id    DEFAULT     �   ALTER TABLE ONLY public.jobs_organizationtype ALTER COLUMN id SET DEFAULT nextval('public.jobs_organizationtype_id_seq'::regclass);
 G   ALTER TABLE public.jobs_organizationtype ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    444    445    445            x           2604    85250     jobs_professional_certificate id    DEFAULT     �   ALTER TABLE ONLY public.jobs_professional_certificate ALTER COLUMN id SET DEFAULT nextval('public.jobs_professional_certificate_id_seq'::regclass);
 O   ALTER TABLE public.jobs_professional_certificate ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    236    235    236            w           2604    85239    jobs_project_works id    DEFAULT     ~   ALTER TABLE ONLY public.jobs_project_works ALTER COLUMN id SET DEFAULT nextval('public.jobs_project_works_id_seq'::regclass);
 D   ALTER TABLE public.jobs_project_works ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    234    233    234            v           2604    85228    jobs_reference id    DEFAULT     v   ALTER TABLE ONLY public.jobs_reference ALTER COLUMN id SET DEFAULT nextval('public.jobs_reference_id_seq'::regclass);
 @   ALTER TABLE public.jobs_reference ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    232    231    232            u           2604    85220    jobs_skills id    DEFAULT     p   ALTER TABLE ONLY public.jobs_skills ALTER COLUMN id SET DEFAULT nextval('public.jobs_skills_id_seq'::regclass);
 =   ALTER TABLE public.jobs_skills ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    230    229    230            �           2604    112637    jobs_skillslist id    DEFAULT     x   ALTER TABLE ONLY public.jobs_skillslist ALTER COLUMN id SET DEFAULT nextval('public.jobs_skillslist_id_seq'::regclass);
 A   ALTER TABLE public.jobs_skillslist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    447    446    447            �           2604    112645    jobs_specialskillcategory id    DEFAULT     �   ALTER TABLE ONLY public.jobs_specialskillcategory ALTER COLUMN id SET DEFAULT nextval('public.jobs_specialskillcategory_id_seq'::regclass);
 K   ALTER TABLE public.jobs_specialskillcategory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    448    449    449            �           2604    118522    jobs_state id    DEFAULT     n   ALTER TABLE ONLY public.jobs_state ALTER COLUMN id SET DEFAULT nextval('public.jobs_state_id_seq'::regclass);
 <   ALTER TABLE public.jobs_state ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    464    465    465            t           2604    85209    jobs_training id    DEFAULT     t   ALTER TABLE ONLY public.jobs_training ALTER COLUMN id SET DEFAULT nextval('public.jobs_training_id_seq'::regclass);
 ?   ALTER TABLE public.jobs_training ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    227    228    228            }           2604    85398    metrimony_expectaion id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_expectaion ALTER COLUMN id SET DEFAULT nextval('public.metrimony_expectaion_id_seq'::regclass);
 F   ALTER TABLE public.metrimony_expectaion ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    245    246    246                        2604    139604    metrimony_matriblockedby id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_matriblockedby ALTER COLUMN id SET DEFAULT nextval('public.metrimony_matriblockedby_id_seq'::regclass);
 J   ALTER TABLE public.metrimony_matriblockedby ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    505    504    505            �           2604    139596    metrimony_matriblocklist id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_matriblocklist ALTER COLUMN id SET DEFAULT nextval('public.metrimony_matriblocklist_id_seq'::regclass);
 J   ALTER TABLE public.metrimony_matriblocklist ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    503    502    503            |           2604    85385    metrimony_personal_info id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_id_seq'::regclass);
 I   ALTER TABLE public.metrimony_personal_info ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    244    243    244            �           2604    135963 %   metrimony_personal_info_interested id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_interested_id_seq'::regclass);
 T   ALTER TABLE public.metrimony_personal_info_interested ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    481    480    481            �           2604    135971 (   metrimony_personal_info_interested_by id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_interested_by_id_seq'::regclass);
 W   ALTER TABLE public.metrimony_personal_info_interested_by ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    482    483    483            �           2604    135979 0   metrimony_personal_info_pending_interested_by id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_pending_interested_by_id_seq'::regclass);
 _   ALTER TABLE public.metrimony_personal_info_pending_interested_by ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    484    485    485            �           2604    131706 (   metrimony_personal_info_privary_limit id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_privary_limit_id_seq'::regclass);
 W   ALTER TABLE public.metrimony_personal_info_privary_limit ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    473    472    473            �           2604    135987 &   metrimony_personal_info_shortlisted id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_shortlisted_id_seq'::regclass);
 U   ALTER TABLE public.metrimony_personal_info_shortlisted ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    487    486    487            �           2604    135941 !   metrimony_personal_info_viewed id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_viewed_id_seq'::regclass);
 P   ALTER TABLE public.metrimony_personal_info_viewed ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    479    478    479            �           2604    135919 $   metrimony_personal_info_viewed_by id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by ALTER COLUMN id SET DEFAULT nextval('public.metrimony_personal_info_viewed_by_id_seq'::regclass);
 S   ALTER TABLE public.metrimony_personal_info_viewed_by ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    477    476    477            �           2604    131714    metrimony_visaverification id    DEFAULT     �   ALTER TABLE ONLY public.metrimony_visaverification ALTER COLUMN id SET DEFAULT nextval('public.metrimony_visaverification_id_seq'::regclass);
 L   ALTER TABLE public.metrimony_visaverification ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    475    474    475            �           2604    97964    notifications_notification id    DEFAULT     �   ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);
 L   ALTER TABLE public.notifications_notification ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    397    396    397            �           2604    93785    posts_postcategory id    DEFAULT     ~   ALTER TABLE ONLY public.posts_postcategory ALTER COLUMN id SET DEFAULT nextval('public.posts_postcategory_id_seq'::regclass);
 D   ALTER TABLE public.posts_postcategory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    373    372    373                       2604    139651    reports_reports id    DEFAULT     x   ALTER TABLE ONLY public.reports_reports ALTER COLUMN id SET DEFAULT nextval('public.reports_reports_id_seq'::regclass);
 A   ALTER TABLE public.reports_reports ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    507    506    507                       2604    143724    sellbuy_answer id    DEFAULT     v   ALTER TABLE ONLY public.sellbuy_answer ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_answer_id_seq'::regclass);
 @   ALTER TABLE public.sellbuy_answer ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    529    528    529                       2604    140050    sellbuy_buyers id    DEFAULT     v   ALTER TABLE ONLY public.sellbuy_buyers ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_buyers_id_seq'::regclass);
 @   ALTER TABLE public.sellbuy_buyers ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    511    510    511                       2604    140058    sellbuy_category id    DEFAULT     z   ALTER TABLE ONLY public.sellbuy_category ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_category_id_seq'::regclass);
 B   ALTER TABLE public.sellbuy_category ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    512    513    513                       2604    139714    sellbuy_dealerprofile id    DEFAULT     �   ALTER TABLE ONLY public.sellbuy_dealerprofile ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_dealerprofile_id_seq'::regclass);
 G   ALTER TABLE public.sellbuy_dealerprofile ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    509    508    509                       2604    143713    sellbuy_faq id    DEFAULT     p   ALTER TABLE ONLY public.sellbuy_faq ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_faq_id_seq'::regclass);
 =   ALTER TABLE public.sellbuy_faq ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    527    526    527                       2604    140066    sellbuy_product id    DEFAULT     x   ALTER TABLE ONLY public.sellbuy_product ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_product_id_seq'::regclass);
 A   ALTER TABLE public.sellbuy_product ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    515    514    515                       2604    140077    sellbuy_product_like id    DEFAULT     �   ALTER TABLE ONLY public.sellbuy_product_like ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_product_like_id_seq'::regclass);
 F   ALTER TABLE public.sellbuy_product_like ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    516    517    517                       2604    143822    sellbuy_productcomment id    DEFAULT     �   ALTER TABLE ONLY public.sellbuy_productcomment ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_productcomment_id_seq'::regclass);
 H   ALTER TABLE public.sellbuy_productcomment ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    530    531    531            
           2604    143702    sellbuy_question id    DEFAULT     z   ALTER TABLE ONLY public.sellbuy_question ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_question_id_seq'::regclass);
 B   ALTER TABLE public.sellbuy_question ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    524    525    525                       2604    143675    sellbuy_review id    DEFAULT     v   ALTER TABLE ONLY public.sellbuy_review ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_review_id_seq'::regclass);
 @   ALTER TABLE public.sellbuy_review ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    518    519    519                       2604    143686    sellbuy_review_dislikes id    DEFAULT     �   ALTER TABLE ONLY public.sellbuy_review_dislikes ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_review_dislikes_id_seq'::regclass);
 I   ALTER TABLE public.sellbuy_review_dislikes ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    520    521    521            	           2604    143694    sellbuy_review_likes id    DEFAULT     �   ALTER TABLE ONLY public.sellbuy_review_likes ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_review_likes_id_seq'::regclass);
 F   ALTER TABLE public.sellbuy_review_likes ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    523    522    523            �           2604    139253    sellbuy_sellerprofile id    DEFAULT     �   ALTER TABLE ONLY public.sellbuy_sellerprofile ALTER COLUMN id SET DEFAULT nextval('public.sellbuy_sellerprofile_id_seq'::regclass);
 G   ALTER TABLE public.sellbuy_sellerprofile ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    492    493    493            �           2604    91075    social_activity id    DEFAULT     x   ALTER TABLE ONLY public.social_activity ALTER COLUMN id SET DEFAULT nextval('public.social_activity_id_seq'::regclass);
 A   ALTER TABLE public.social_activity ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    305    306    306            �           2604    91085    social_backgroud id    DEFAULT     z   ALTER TABLE ONLY public.social_backgroud ALTER COLUMN id SET DEFAULT nextval('public.social_backgroud_id_seq'::regclass);
 B   ALTER TABLE public.social_backgroud ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    307    308    308            �           2604    91095    social_category id    DEFAULT     x   ALTER TABLE ONLY public.social_category ALTER COLUMN id SET DEFAULT nextval('public.social_category_id_seq'::regclass);
 A   ALTER TABLE public.social_category ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    310    309    310            �           2604    91105    social_check_in id    DEFAULT     x   ALTER TABLE ONLY public.social_check_in ALTER COLUMN id SET DEFAULT nextval('public.social_check_in_id_seq'::regclass);
 A   ALTER TABLE public.social_check_in ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    311    312    312            �           2604    91115    social_feeling id    DEFAULT     v   ALTER TABLE ONLY public.social_feeling ALTER COLUMN id SET DEFAULT nextval('public.social_feeling_id_seq'::regclass);
 @   ALTER TABLE public.social_feeling ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    314    313    314            �           2604    91125    social_gif id    DEFAULT     n   ALTER TABLE ONLY public.social_gif ALTER COLUMN id SET DEFAULT nextval('public.social_gif_id_seq'::regclass);
 <   ALTER TABLE public.social_gif ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    316    315    316            �           2604    91135    social_lifeevent id    DEFAULT     z   ALTER TABLE ONLY public.social_lifeevent ALTER COLUMN id SET DEFAULT nextval('public.social_lifeevent_id_seq'::regclass);
 B   ALTER TABLE public.social_lifeevent ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    318    317    318            �           2604    87074    social_post_activity id    DEFAULT     �   ALTER TABLE ONLY public.social_post_activity ALTER COLUMN id SET DEFAULT nextval('public.social_post_activity_id_seq'::regclass);
 F   ALTER TABLE public.social_post_activity ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    284    283    284            �           2604    87084    social_post_backgroud id    DEFAULT     �   ALTER TABLE ONLY public.social_post_backgroud ALTER COLUMN id SET DEFAULT nextval('public.social_post_backgroud_id_seq'::regclass);
 G   ALTER TABLE public.social_post_backgroud ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    286    285    286            �           2604    87094    social_post_category id    DEFAULT     �   ALTER TABLE ONLY public.social_post_category ALTER COLUMN id SET DEFAULT nextval('public.social_post_category_id_seq'::regclass);
 F   ALTER TABLE public.social_post_category ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    287    288    288            �           2604    87104    social_post_check_in id    DEFAULT     �   ALTER TABLE ONLY public.social_post_check_in ALTER COLUMN id SET DEFAULT nextval('public.social_post_check_in_id_seq'::regclass);
 F   ALTER TABLE public.social_post_check_in ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    290    289    290            �           2604    91050    social_post_feels id    DEFAULT     |   ALTER TABLE ONLY public.social_post_feels ALTER COLUMN id SET DEFAULT nextval('public.social_post_feels_id_seq'::regclass);
 C   ALTER TABLE public.social_post_feels ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    303    304    304            �           2604    87124    social_post_gif id    DEFAULT     x   ALTER TABLE ONLY public.social_post_gif ALTER COLUMN id SET DEFAULT nextval('public.social_post_gif_id_seq'::regclass);
 A   ALTER TABLE public.social_post_gif ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    292    291    292            �           2604    87134    social_post_lifeevent id    DEFAULT     �   ALTER TABLE ONLY public.social_post_lifeevent ALTER COLUMN id SET DEFAULT nextval('public.social_post_lifeevent_id_seq'::regclass);
 G   ALTER TABLE public.social_post_lifeevent ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    294    293    294            �           2604    87144    social_post_privacy id    DEFAULT     �   ALTER TABLE ONLY public.social_post_privacy ALTER COLUMN id SET DEFAULT nextval('public.social_post_privacy_id_seq'::regclass);
 E   ALTER TABLE public.social_post_privacy ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    296    295    296            �           2604    86826    social_post_socialpost id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_id_seq'::regclass);
 H   ALTER TABLE public.social_post_socialpost ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    263    264    264            �           2604    86837    social_post_socialpost_angry id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_angry ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_angry_id_seq'::regclass);
 N   ALTER TABLE public.social_post_socialpost_angry ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    265    266    266            �           2604    86845    social_post_socialpost_care id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_care ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_care_id_seq'::regclass);
 M   ALTER TABLE public.social_post_socialpost_care ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    267    268    268            �           2604    86853    social_post_socialpost_haha id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_haha ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_haha_id_seq'::regclass);
 M   ALTER TABLE public.social_post_socialpost_haha ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    270    269    270            �           2604    86861    social_post_socialpost_likes id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_likes ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_likes_id_seq'::regclass);
 N   ALTER TABLE public.social_post_socialpost_likes ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    271    272    272            �           2604    86869    social_post_socialpost_love id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_love ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_love_id_seq'::regclass);
 M   ALTER TABLE public.social_post_socialpost_love ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    274    273    274            �           2604    86877    social_post_socialpost_sad id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_sad ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_sad_id_seq'::regclass);
 L   ALTER TABLE public.social_post_socialpost_sad ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    276    275    276            �           2604    86885    social_post_socialpost_senti id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_senti ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_senti_id_seq'::regclass);
 N   ALTER TABLE public.social_post_socialpost_senti ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    277    278    278            �           2604    87154 #   social_post_socialpost_shared_by id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_shared_by ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_shared_by_id_seq'::regclass);
 R   ALTER TABLE public.social_post_socialpost_shared_by ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    297    298    298            �           2604    86893    social_post_socialpost_tags id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_tags ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_tags_id_seq'::regclass);
 M   ALTER TABLE public.social_post_socialpost_tags ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    279    280    280            �           2604    86909    social_post_socialpost_wow id    DEFAULT     �   ALTER TABLE ONLY public.social_post_socialpost_wow ALTER COLUMN id SET DEFAULT nextval('public.social_post_socialpost_wow_id_seq'::regclass);
 L   ALTER TABLE public.social_post_socialpost_wow ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    281    282    282            �           2604    87172    social_post_subactivity id    DEFAULT     �   ALTER TABLE ONLY public.social_post_subactivity ALTER COLUMN id SET DEFAULT nextval('public.social_post_subactivity_id_seq'::regclass);
 I   ALTER TABLE public.social_post_subactivity ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    302    301    302            �           2604    87162    social_post_sublifeevent id    DEFAULT     �   ALTER TABLE ONLY public.social_post_sublifeevent ALTER COLUMN id SET DEFAULT nextval('public.social_post_sublifeevent_id_seq'::regclass);
 J   ALTER TABLE public.social_post_sublifeevent ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    300    299    300            �           2604    91145    social_privacymodel id    DEFAULT     {   ALTER TABLE ONLY public.social_privacymodel ALTER COLUMN id SET DEFAULT nextval('public.social_privacy_id_seq'::regclass);
 E   ALTER TABLE public.social_privacymodel ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    320    319    320            �           2604    91200    social_reactions id    DEFAULT     z   ALTER TABLE ONLY public.social_reactions ALTER COLUMN id SET DEFAULT nextval('public.social_reactions_id_seq'::regclass);
 B   ALTER TABLE public.social_reactions ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    325    326    326            �           2604    91861    social_socialphoto id    DEFAULT     ~   ALTER TABLE ONLY public.social_socialphoto ALTER COLUMN id SET DEFAULT nextval('public.social_socialphoto_id_seq'::regclass);
 D   ALTER TABLE public.social_socialphoto ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    352    351    352            �           2604    91208    social_socialpost id    DEFAULT     |   ALTER TABLE ONLY public.social_socialpost ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_id_seq'::regclass);
 C   ALTER TABLE public.social_socialpost ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    327    328    328            �           2604    91219    social_socialpost_angry id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_angry ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_angry_id_seq'::regclass);
 I   ALTER TABLE public.social_socialpost_angry ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    330    329    330            �           2604    91227    social_socialpost_care id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_care ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_care_id_seq'::regclass);
 H   ALTER TABLE public.social_socialpost_care ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    331    332    332            �           2604    91235    social_socialpost_haha id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_haha ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_haha_id_seq'::regclass);
 H   ALTER TABLE public.social_socialpost_haha ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    333    334    334            �           2604    91243    social_socialpost_likes id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_likes ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_likes_id_seq'::regclass);
 I   ALTER TABLE public.social_socialpost_likes ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    335    336    336            �           2604    91251    social_socialpost_love id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_love ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_love_id_seq'::regclass);
 H   ALTER TABLE public.social_socialpost_love ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    337    338    338            �           2604    91259    social_socialpost_sad id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_sad ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_sad_id_seq'::regclass);
 G   ALTER TABLE public.social_socialpost_sad ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    340    339    340            �           2604    91267    social_socialpost_senti id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_senti ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_senti_id_seq'::regclass);
 I   ALTER TABLE public.social_socialpost_senti ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    342    341    342            �           2604    91275    social_socialpost_shared_by id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_shared_by ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_shared_by_id_seq'::regclass);
 M   ALTER TABLE public.social_socialpost_shared_by ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    343    344    344            �           2604    91283    social_socialpost_tags id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_tags ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_tags_id_seq'::regclass);
 H   ALTER TABLE public.social_socialpost_tags ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    346    345    346            �           2604    91291    social_socialpost_wow id    DEFAULT     �   ALTER TABLE ONLY public.social_socialpost_wow ALTER COLUMN id SET DEFAULT nextval('public.social_socialpost_wow_id_seq'::regclass);
 G   ALTER TABLE public.social_socialpost_wow ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    347    348    348            �           2604    91832    social_socialupdatehistory id    DEFAULT     �   ALTER TABLE ONLY public.social_socialupdatehistory ALTER COLUMN id SET DEFAULT nextval('public.social_socialupdatehistory_id_seq'::regclass);
 L   ALTER TABLE public.social_socialupdatehistory ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    350    349    350            �           2604    91165    social_subactivity id    DEFAULT     ~   ALTER TABLE ONLY public.social_subactivity ALTER COLUMN id SET DEFAULT nextval('public.social_subactivity_id_seq'::regclass);
 D   ALTER TABLE public.social_subactivity ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    323    324    324            �           2604    91155    social_sublifeevent id    DEFAULT     �   ALTER TABLE ONLY public.social_sublifeevent ALTER COLUMN id SET DEFAULT nextval('public.social_sublifeevent_id_seq'::regclass);
 E   ALTER TABLE public.social_sublifeevent ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    321    322    322                       2604    85472    user_management_consumer id    DEFAULT     �   ALTER TABLE ONLY public.user_management_consumer ALTER COLUMN id SET DEFAULT nextval('public.user_management_consumer_id_seq'::regclass);
 J   ALTER TABLE public.user_management_consumer ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    250    249    250            ~           2604    85434 #   user_management_consumerreferred id    DEFAULT     �   ALTER TABLE ONLY public.user_management_consumerreferred ALTER COLUMN id SET DEFAULT nextval('public.user_management_consumerreferred_id_seq'::regclass);
 R   ALTER TABLE public.user_management_consumerreferred ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    247    248    248            �           2604    86441    userapp_coverphoto id    DEFAULT     ~   ALTER TABLE ONLY public.userapp_coverphoto ALTER COLUMN id SET DEFAULT nextval('public.userapp_coverphoto_id_seq'::regclass);
 D   ALTER TABLE public.userapp_coverphoto ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    259    260    260            �           2604    86452    userapp_coverphoto_tags id    DEFAULT     �   ALTER TABLE ONLY public.userapp_coverphoto_tags ALTER COLUMN id SET DEFAULT nextval('public.userapp_coverphoto_tags_id_seq'::regclass);
 I   ALTER TABLE public.userapp_coverphoto_tags ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    261    262    262            �           2604    86422    userapp_profilephoto id    DEFAULT     �   ALTER TABLE ONLY public.userapp_profilephoto ALTER COLUMN id SET DEFAULT nextval('public.userapp_profilephoto_id_seq'::regclass);
 F   ALTER TABLE public.userapp_profilephoto ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    255    256    256            �           2604    86433    userapp_profilephoto_tags id    DEFAULT     �   ALTER TABLE ONLY public.userapp_profilephoto_tags ALTER COLUMN id SET DEFAULT nextval('public.userapp_profilephoto_tags_id_seq'::regclass);
 K   ALTER TABLE public.userapp_profilephoto_tags ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    258    257    258            �           2604    85529    userapp_userpro id    DEFAULT     x   ALTER TABLE ONLY public.userapp_userpro ALTER COLUMN id SET DEFAULT nextval('public.userapp_userpro_id_seq'::regclass);
 A   ALTER TABLE public.userapp_userpro ALTER COLUMN id DROP DEFAULT;
       public          dbrdsubuntume12    false    252    251    252            �          0    84950 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          dbrdsubuntume12    false    209   ol
      �          0    84960    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          dbrdsubuntume12    false    211   �l
      �          0    84942    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          dbrdsubuntume12    false    207   �l
      �          0    84968 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          dbrdsubuntume12    false    213   *
      �          0    84978    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          dbrdsubuntume12    false    215   =�
      �          0    84986    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          dbrdsubuntume12    false    217   Z�
      V          0    92502    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          dbrdsubuntume12    false    371   w�
      �          0    139507    chat_groupmessage 
   TABLE DATA           S   COPY public.chat_groupmessage (id, msg, created_at, group_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    501   Ӊ
      �          0    139481    chat_groupname 
   TABLE DATA           X   COPY public.chat_groupname (id, group_name, group_name_to_show, created_at) FROM stdin;
    public          dbrdsubuntume12    false    495   v�
      �          0    139491    chat_groupname_admins 
   TABLE DATA           J   COPY public.chat_groupname_admins (id, groupname_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    497   [�
      �          0    139499    chat_groupname_participants 
   TABLE DATA           P   COPY public.chat_groupname_participants (id, groupname_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    499   ��
      �          0    139206    chat_message 
   TABLE DATA           M   COPY public.chat_message (id, msg, created_at, room_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    491   -�
      �          0    139196    chat_privatechtroom 
   TABLE DATA           P   COPY public.chat_privatechtroom (id, room_name, user1_id, user2_id) FROM stdin;
    public          dbrdsubuntume12    false    489   Z�
      v          0    98573    chatapp_message 
   TABLE DATA           V   COPY public.chatapp_message (id, msg, created_at, from_user_id, group_id) FROM stdin;
    public          dbrdsubuntume12    false    403   �
      r          0    98555    chatapp_roomname 
   TABLE DATA           O   COPY public.chatapp_roomname (id, room_name, created_at, admin_id) FROM stdin;
    public          dbrdsubuntume12    false    399   �
      t          0    98565    chatapp_roomname_participants 
   TABLE DATA           Q   COPY public.chatapp_roomname_participants (id, roomname_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    401   B�
      E          0    92299    comment_postcomment 
   TABLE DATA           ~   COPY public.comment_postcomment (id, text, image, created_at, updated_at, is_active, parent_id, post_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    354   �
      G          0    92310    comment_postcomment_angry 
   TABLE DATA           P   COPY public.comment_postcomment_angry (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    356   ��
      I          0    92318    comment_postcomment_care 
   TABLE DATA           O   COPY public.comment_postcomment_care (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    358   ��
      K          0    92326    comment_postcomment_haha 
   TABLE DATA           O   COPY public.comment_postcomment_haha (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    360   �
      M          0    92334    comment_postcomment_likes 
   TABLE DATA           P   COPY public.comment_postcomment_likes (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    362   7�
      O          0    92342    comment_postcomment_love 
   TABLE DATA           O   COPY public.comment_postcomment_love (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    364   Z�
      Q          0    92350    comment_postcomment_sad 
   TABLE DATA           N   COPY public.comment_postcomment_sad (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    366   }�
      S          0    92358    comment_postcomment_senti 
   TABLE DATA           P   COPY public.comment_postcomment_senti (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    368   ��
      U          0    92366    comment_postcomment_wow 
   TABLE DATA           N   COPY public.comment_postcomment_wow (id, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    370   ��
      n          0    97899    comment_postcommenthistory 
   TABLE DATA           j   COPY public.comment_postcommenthistory (id, text, image, updated_at, postcomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    395   ԑ
      Z          0    97393    comment_postphotocomment 
   TABLE DATA           �   COPY public.comment_postphotocomment (id, text, image, created_at, updated_at, is_active, parent_id, photo_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    375   @�
      \          0    97404    comment_postphotocomment_angry 
   TABLE DATA           Z   COPY public.comment_postphotocomment_angry (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    377   "�
      ^          0    97412    comment_postphotocomment_care 
   TABLE DATA           Y   COPY public.comment_postphotocomment_care (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    379   ?�
      `          0    97420    comment_postphotocomment_haha 
   TABLE DATA           Y   COPY public.comment_postphotocomment_haha (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    381   \�
      b          0    97428    comment_postphotocomment_likes 
   TABLE DATA           Z   COPY public.comment_postphotocomment_likes (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    383   y�
      d          0    97436    comment_postphotocomment_love 
   TABLE DATA           Y   COPY public.comment_postphotocomment_love (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    385   ��
      f          0    97444    comment_postphotocomment_sad 
   TABLE DATA           X   COPY public.comment_postphotocomment_sad (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    387   ��
      h          0    97452    comment_postphotocomment_senti 
   TABLE DATA           Z   COPY public.comment_postphotocomment_senti (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    389   ֓
      j          0    97460    comment_postphotocomment_wow 
   TABLE DATA           X   COPY public.comment_postphotocomment_wow (id, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    391   �
      l          0    97888    comment_postphotocommenthistory 
   TABLE DATA           t   COPY public.comment_postphotocommenthistory (id, text, image, updated_at, postphotocomment_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    393   �
      �          0    85046    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    219   X�
      �          0    84932    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          dbrdsubuntume12    false    205   ?�
      �          0    84921    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          dbrdsubuntume12    false    203   V�
      �          0    85077    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          dbrdsubuntume12    false    220   _�
      �          0    100110    employer_applicants 
   TABLE DATA           ?  COPY public.employer_applicants (id, application_date, present_salary, expected_salary, working_experience, cover_letter, cv, resume, nid_no, passport_no, driving_lisence_no, shortlisted, rejected, feedback, selected, interviewed, viewed, job_id, jobprofile_id, interviewed_at, selected_at, shortlisted_at) FROM stdin;
    public          dbrdsubuntume12    false    429   ��
      �          0    85106    employer_employer 
   TABLE DATA           �  COPY public.employer_employer (id, is_active, company_name, year_of_establishment, company_size, company_country, company_district, company_subdistrict, company_address, company_website, company_email, business_description, trade_licence_no, rl_no, contact_person_email, contact_person_name, contact_person_phone, contact_person_designation, facility_for_person_with_disability, user_id, username, logo, is_hidden, industry_cat_id, functional_cat_id, industry_type_id, is_published) FROM stdin;
    public          dbrdsubuntume12    false    222   ��
      �          0    122145    employer_employer_moderators 
   TABLE DATA           P   COPY public.employer_employer_moderators (id, employer_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    469   ��
      �          0    130870 $   employer_employer_pending_moderators 
   TABLE DATA           X   COPY public.employer_employer_pending_moderators (id, employer_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    471   ��
      �          0    85143    employer_jobpost 
   TABLE DATA           z  COPY public.employer_jobpost (id, job_title, vacancies, employment_status, deadline, created_at, resume_receiveing_option, special_instruction, photograph_enclosed, job_level, job_context, job_responsibilities, workplace, job_location_id, min_salary, max_salary, per_policy, show_salary, is_compare, show_alert, additional_salary_info, compensation_and_benefits, lunch_facilities, salary_review, num_of_fastival_bonous, other, degree_level, degree_name, major_in, prefered_educational_institutions, other_educational_qualifications, training_or_trade_cources, professional_certifications, experience_required, min_experience, max_experience, fresher_can_apply, area_of_experience, area_of_business, skills, additional_requirements, gender, min_age, max_age, person_with_disability_can_apply, company_name_show, company_address_show, company_business_show, which_industry_type_to_show, is_age, is_age_mendatory, is_gender, is_gender_mendatory, is_total_year_experience, is_experience_mendatory, is_area_of_experience, is_skills, is_location, is_location_mendatory, is_salary_range, is_area_of_business, is_job_level, employer_id, functional_category_id, special_skills_category_id, "NID_no_required", cover_letter_required, cv_required, driving_lisence_no_required, passport_required, rusume_required, is_active, is_freezed, industry_category_id, is_featured, is_published, activation_time) FROM stdin;
    public          dbrdsubuntume12    false    224   ��
      �          0    100148    employer_jobpost_applied 
   TABLE DATA           K   COPY public.employer_jobpost_applied (id, jobpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    431   ,�
      x          0    98637    follow_friends 
   TABLE DATA           A   COPY public.follow_friends (id, is_private, user_id) FROM stdin;
    public          dbrdsubuntume12    false    405   f�
      z          0    98647    follow_friends_follower 
   TABLE DATA           J   COPY public.follow_friends_follower (id, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    407   ��
      |          0    98655    follow_friends_following 
   TABLE DATA           K   COPY public.follow_friends_following (id, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    409   ��
      ~          0    98663    follow_friends_to_be_follower 
   TABLE DATA           P   COPY public.follow_friends_to_be_follower (id, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    411   ��
      �          0    98671    follow_friends_to_be_following 
   TABLE DATA           Q   COPY public.follow_friends_to_be_following (id, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    413   ��
      �          0    99245    followfollowing_blockedby 
   TABLE DATA           d   COPY public.followfollowing_blockedby (id, created_at, updated_at, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    427   �
      �          0    99237    followfollowing_blocklist 
   TABLE DATA           d   COPY public.followfollowing_blocklist (id, created_at, updated_at, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    425   2�
      �          0    98810    followfollowing_followers 
   TABLE DATA           d   COPY public.followfollowing_followers (id, created_at, updated_at, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    415   O�
      �          0    98818    followfollowing_followings 
   TABLE DATA           e   COPY public.followfollowing_followings (id, created_at, updated_at, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    417   ��
      �          0    98826    followfollowing_friends 
   TABLE DATA           J   COPY public.followfollowing_friends (id, is_private, user_id) FROM stdin;
    public          dbrdsubuntume12    false    419   ��
      �          0    98842    followfollowing_tobefollowers 
   TABLE DATA           h   COPY public.followfollowing_tobefollowers (id, created_at, updated_at, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    423   /�
      �          0    98834    followfollowing_tobefollowings 
   TABLE DATA           i   COPY public.followfollowing_tobefollowings (id, created_at, updated_at, friends_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    421   s�
      �          0    85817    jobs_armyexperience 
   TABLE DATA           �   COPY public.jobs_armyexperience (id, ba_no, ranks, types, arms, trade, course, date_of_commission, date_of_retirement, jobprofile_id, ba_num) FROM stdin;
    public          dbrdsubuntume12    false    254   ��
      �          0    112570    jobs_benefitlist 
   TABLE DATA           @   COPY public.jobs_benefitlist (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    433   ��
      �          0    112578    jobs_businesslist 
   TABLE DATA           A   COPY public.jobs_businesslist (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    435   <      �          0    118527 	   jobs_city 
   TABLE DATA           7   COPY public.jobs_city (id, name, state_id) FROM stdin;
    public          dbrdsubuntume12    false    467   7      �          0    118503    jobs_continent 
   TABLE DATA           2   COPY public.jobs_continent (id, name) FROM stdin;
    public          dbrdsubuntume12    false    461   i      �          0    118511    jobs_country 
   TABLE DATA           G   COPY public.jobs_country (id, name, capital, continent_id) FROM stdin;
    public          dbrdsubuntume12    false    463   �      �          0    116533    jobs_degreeorexam 
   TABLE DATA           O   COPY public.jobs_degreeorexam (id, name, created_at, edu_level_id) FROM stdin;
    public          dbrdsubuntume12    false    455   �      �          0    85292    jobs_disability_information 
   TABLE DATA           ,  COPY public.jobs_disability_information (id, national_disability_id, show_on_resume, disability_to_see, disability_to_hear, disability_to_communicate, disability_to_concentrade, disability_to_remember, "disability_to_sit_stand_walk_climbStairs", disability_to_taking_care, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    242   c      �          0    116541    jobs_educationlevel 
   TABLE DATA           C   COPY public.jobs_educationlevel (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    457   �      �          0    85281    jobs_educationprofile 
   TABLE DATA           �   COPY public.jobs_educationprofile (id, level_of_edu, degree_or_exam, major_in, institude_name, result, cgpa, scale, year_of_passing, duration, achievement, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    240   �      �          0    85270    jobs_experience 
   TABLE DATA           �   COPY public.jobs_experience (id, company_name, company_business, designation, department, "Area_of_experience", responsibilities, company_location, start_date, end_date, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    238         �          0    112586    jobs_experiencelist 
   TABLE DATA           C   COPY public.jobs_experiencelist (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    437          �          0    112594    jobs_functionaljobcategory 
   TABLE DATA           J   COPY public.jobs_functionaljobcategory (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    439   p&      �          0    112602    jobs_industrycategory 
   TABLE DATA           E   COPY public.jobs_industrycategory (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    441   �2      �          0    112610    jobs_instituionlist 
   TABLE DATA           C   COPY public.jobs_instituionlist (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    443   �>      �          0    85177    jobs_jobprofile 
   TABLE DATA           q  COPY public.jobs_jobprofile (id, nationality, passport_no, passport_issue_date, emergency_contact_no, alternative_email, portfolio_link, career_objective, present_salary, expected_salary, looking_job_level, available_for_job_type, job_location_id, country, organizations, career_summary, special_qualifications, keywords, cv_photo, cv_upload, user_id, age) FROM stdin;
    public          dbrdsubuntume12    false    226   ]K      �          0    112686    jobs_jobprofile_job_categories 
   TABLE DATA           e   COPY public.jobs_jobprofile_job_categories (id, jobprofile_id, functionaljobcategory_id) FROM stdin;
    public          dbrdsubuntume12    false    451   �L      �          0    112694    jobs_jobprofile_special_skills 
   TABLE DATA           d   COPY public.jobs_jobprofile_special_skills (id, jobprofile_id, specialskillcategory_id) FROM stdin;
    public          dbrdsubuntume12    false    453   �L      �          0    116549    jobs_majorin 
   TABLE DATA           G   COPY public.jobs_majorin (id, name, created_at, degree_id) FROM stdin;
    public          dbrdsubuntume12    false    459   �L      �          0    112626    jobs_organizationtype 
   TABLE DATA           E   COPY public.jobs_organizationtype (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    445   �M      �          0    85247    jobs_professional_certificate 
   TABLE DATA           �   COPY public.jobs_professional_certificate (id, certification, institute, location, start_date, end_date, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    236   RZ      �          0    85236    jobs_project_works 
   TABLE DATA           �   COPY public.jobs_project_works (id, name, description, tools, link, contribution, is_live, learings, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    234   oZ      �          0    85225    jobs_reference 
   TABLE DATA           �   COPY public.jobs_reference (id, name, organization, designation, relation, mobile, phone_off, phone_res, address, email, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    232   �Z      �          0    85217    jobs_skills 
   TABLE DATA           P   COPY public.jobs_skills (id, skill_name, learned_by, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    230   �Z      �          0    112634    jobs_skillslist 
   TABLE DATA           ?   COPY public.jobs_skillslist (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    447   �Z      �          0    112642    jobs_specialskillcategory 
   TABLE DATA           I   COPY public.jobs_specialskillcategory (id, name, created_at) FROM stdin;
    public          dbrdsubuntume12    false    449   "g      �          0    118519 
   jobs_state 
   TABLE DATA           :   COPY public.jobs_state (id, name, country_id) FROM stdin;
    public          dbrdsubuntume12    false    465   �s      �          0    85206    jobs_training 
   TABLE DATA           �   COPY public.jobs_training (id, title, country, topic_covered, training_year, institute, duration, location, jobprofile_id) FROM stdin;
    public          dbrdsubuntume12    false    228   �s      �          0    85395    metrimony_expectaion 
   TABLE DATA           $  COPY public.metrimony_expectaion (id, min_age, max_age, min_height, max_height, marital_status, residency_country, religion, complexion, education, profession, drinking_havits, smoking_habits, diet, user_id, monthly_income_max, mother_tongue, physical_status, monthly_income_min) FROM stdin;
    public          dbrdsubuntume12    false    246   �s      �          0    139601    metrimony_matriblockedby 
   TABLE DATA           i   COPY public.metrimony_matriblockedby (id, created_at, updated_at, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    505   tt      �          0    139593    metrimony_matriblocklist 
   TABLE DATA           i   COPY public.metrimony_matriblocklist (id, created_at, updated_at, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    503   �t      �          0    85382    metrimony_personal_info 
   TABLE DATA           �  COPY public.metrimony_personal_info (id, guardians_type, sur_name, age, profile_photo, mother_tongue, diet, do_u_smoke, do_u_drink, have_child, district, state, residency_country, birth_country, grow_up_country, present_address, permanent_address, work_location, employed_by, company, salary, working_from, no_of_boy_child_of_your_father, no_of_girl_child_of_your_father, family_type, family_status, eye_color, hair_color, hair_style, complexion, any_disability, body_type, interest, music, read_books, tv_shows, sports_shows, sports, fav_dress_style, fav_color, know_dancing, know_singing, user_id, guardians_phone, phone, birth_certificate, nid_verified, passport_no, passport_verified, education, photo2, photo3) FROM stdin;
    public          dbrdsubuntume12    false    244   u      �          0    135960 "   metrimony_personal_info_interested 
   TABLE DATA           [   COPY public.metrimony_personal_info_interested (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    481   (v      �          0    135968 %   metrimony_personal_info_interested_by 
   TABLE DATA           ^   COPY public.metrimony_personal_info_interested_by (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    483   Vv      �          0    135976 -   metrimony_personal_info_pending_interested_by 
   TABLE DATA           f   COPY public.metrimony_personal_info_pending_interested_by (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    485   �v      �          0    131703 %   metrimony_personal_info_privary_limit 
   TABLE DATA           ^   COPY public.metrimony_personal_info_privary_limit (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    473   �v      �          0    135984 #   metrimony_personal_info_shortlisted 
   TABLE DATA           \   COPY public.metrimony_personal_info_shortlisted (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    487   �v      �          0    135938    metrimony_personal_info_viewed 
   TABLE DATA           W   COPY public.metrimony_personal_info_viewed (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    479   �v      �          0    135916 !   metrimony_personal_info_viewed_by 
   TABLE DATA           Z   COPY public.metrimony_personal_info_viewed_by (id, personal_info_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    477   w      �          0    131711    metrimony_visaverification 
   TABLE DATA           �   COPY public.metrimony_visaverification (id, visa_no, visa_type, visa_country, expiry_date, visa_image, visa_varified, matrimony_id) FROM stdin;
    public          dbrdsubuntume12    false    475   5w      p          0    97961    notifications_notification 
   TABLE DATA           r   COPY public.notifications_notification (id, text, created_at, url, from_user_id, to_user_id, is_read) FROM stdin;
    public          dbrdsubuntume12    false    397   mw      X          0    93782    posts_postcategory 
   TABLE DATA           B   COPY public.posts_postcategory (id, name, type, urls) FROM stdin;
    public          dbrdsubuntume12    false    373   0x      �          0    139648    reports_reports 
   TABLE DATA           �   COPY public.reports_reports (id, report_text, report_image, type, created_at, consumer_to_id, employer_to_id, jobpost_to_id, matri_pro_to_id, user_id, is_active) FROM stdin;
    public          dbrdsubuntume12    false    507   �x      �          0    143721    sellbuy_answer 
   TABLE DATA           a   COPY public.sellbuy_answer (id, answer, created_at, question_id, user_id, is_active) FROM stdin;
    public          dbrdsubuntume12    false    529   z      �          0    140047    sellbuy_buyers 
   TABLE DATA           c   COPY public.sellbuy_buyers (id, quantity, created_at, updated_at, product_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    511   fz      �          0    140055    sellbuy_category 
   TABLE DATA           4   COPY public.sellbuy_category (id, name) FROM stdin;
    public          dbrdsubuntume12    false    513   �z      �          0    139711    sellbuy_dealerprofile 
   TABLE DATA           �   COPY public.sellbuy_dealerprofile (id, company_name, company_email, company_website, company_phone, regional_office_location, regional_office_phone, region_address, dealership_paper, is_active, is_varified, is_published, seller_id) FROM stdin;
    public          dbrdsubuntume12    false    509   �z      �          0    143710    sellbuy_faq 
   TABLE DATA           g   COPY public.sellbuy_faq (id, question, answer, created_at, product_id, user_id, is_active) FROM stdin;
    public          dbrdsubuntume12    false    527   r{      �          0    140063    sellbuy_product 
   TABLE DATA           �   COPY public.sellbuy_product (id, name, price, quantity, details_address, details, buy_price, months_used, selled, is_active, is_published, is_featured, is_toprated, category_id, consumer_id, dealer_id, seller_id, selled_quantity) FROM stdin;
    public          dbrdsubuntume12    false    515   �{      �          0    140074    sellbuy_product_like 
   TABLE DATA           G   COPY public.sellbuy_product_like (id, product_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    517   �|      �          0    143819    sellbuy_productcomment 
   TABLE DATA           }   COPY public.sellbuy_productcomment (id, text, created_at, updated_at, is_active, parent_id, product_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    531   �|      �          0    143699    sellbuy_question 
   TABLE DATA           d   COPY public.sellbuy_question (id, question, created_at, product_id, user_id, is_active) FROM stdin;
    public          dbrdsubuntume12    false    525   �|      �          0    143672    sellbuy_review 
   TABLE DATA           y   COPY public.sellbuy_review (id, stars, review, image, created_at, parent_id, product_id, user_id, is_active) FROM stdin;
    public          dbrdsubuntume12    false    519   L}      �          0    143683    sellbuy_review_dislikes 
   TABLE DATA           I   COPY public.sellbuy_review_dislikes (id, review_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    521   8~      �          0    143691    sellbuy_review_likes 
   TABLE DATA           F   COPY public.sellbuy_review_likes (id, review_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    523   U~      �          0    139250    sellbuy_sellerprofile 
   TABLE DATA           \  COPY public.sellbuy_sellerprofile (id, trade_license, electric_bill1, electric_bill2, owner_proof, contract_copy, shop_address, owner_photo, owner_nid_photo, nominee_photo, nominee_nid_no, nominee_nid_photo, nominee_present_address, nominee_permanent_address, user_id, nominee_name, nominee_phone, is_active, is_varified, is_published) FROM stdin;
    public          dbrdsubuntume12    false    493   r~                0    91072    social_activity 
   TABLE DATA           9   COPY public.social_activity (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    306   
                0    91082    social_backgroud 
   TABLE DATA           A   COPY public.social_backgroud (id, name, image, rank) FROM stdin;
    public          dbrdsubuntume12    false    308   5                0    91092    social_category 
   TABLE DATA           9   COPY public.social_category (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    310   �                0    91102    social_check_in 
   TABLE DATA           9   COPY public.social_check_in (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    312   �                0    91112    social_feeling 
   TABLE DATA           E   COPY public.social_feeling (id, name, rank, emoji, icon) FROM stdin;
    public          dbrdsubuntume12    false    314   	�                0    91122 
   social_gif 
   TABLE DATA           ;   COPY public.social_gif (id, name, image, rank) FROM stdin;
    public          dbrdsubuntume12    false    316   ��      !          0    91132    social_lifeevent 
   TABLE DATA           :   COPY public.social_lifeevent (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    318   ـ      �          0    87071    social_post_activity 
   TABLE DATA           >   COPY public.social_post_activity (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    284   �                0    87081    social_post_backgroud 
   TABLE DATA           F   COPY public.social_post_backgroud (id, name, image, rank) FROM stdin;
    public          dbrdsubuntume12    false    286   .�                0    87091    social_post_category 
   TABLE DATA           >   COPY public.social_post_category (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    288   ��                0    87101    social_post_check_in 
   TABLE DATA           >   COPY public.social_post_check_in (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    290   ��                0    91047    social_post_feels 
   TABLE DATA           L   COPY public.social_post_feels (id, name, reaction, icons, rank) FROM stdin;
    public          dbrdsubuntume12    false    304   �                0    87121    social_post_gif 
   TABLE DATA           @   COPY public.social_post_gif (id, name, image, rank) FROM stdin;
    public          dbrdsubuntume12    false    292   >�      	          0    87131    social_post_lifeevent 
   TABLE DATA           ?   COPY public.social_post_lifeevent (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    294   ��                0    87141    social_post_privacy 
   TABLE DATA           =   COPY public.social_post_privacy (id, name, rank) FROM stdin;
    public          dbrdsubuntume12    false    296   Ȃ      �          0    86823    social_post_socialpost 
   TABLE DATA           �   COPY public.social_post_socialpost (id, privacy, post_text, location, feeling_or_activity, created_at, updated_at, category, user_id, "is_HQA") FROM stdin;
    public          dbrdsubuntume12    false    264   �      �          0    86834    social_post_socialpost_angry 
   TABLE DATA           R   COPY public.social_post_socialpost_angry (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    266   ��      �          0    86842    social_post_socialpost_care 
   TABLE DATA           Q   COPY public.social_post_socialpost_care (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    268   ��      �          0    86850    social_post_socialpost_haha 
   TABLE DATA           Q   COPY public.social_post_socialpost_haha (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    270   ׃      �          0    86858    social_post_socialpost_likes 
   TABLE DATA           R   COPY public.social_post_socialpost_likes (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    272   �      �          0    86866    social_post_socialpost_love 
   TABLE DATA           Q   COPY public.social_post_socialpost_love (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    274   �      �          0    86874    social_post_socialpost_sad 
   TABLE DATA           P   COPY public.social_post_socialpost_sad (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    276   .�      �          0    86882    social_post_socialpost_senti 
   TABLE DATA           R   COPY public.social_post_socialpost_senti (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    278   K�                0    87151     social_post_socialpost_shared_by 
   TABLE DATA           V   COPY public.social_post_socialpost_shared_by (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    298   h�      �          0    86890    social_post_socialpost_tags 
   TABLE DATA           Q   COPY public.social_post_socialpost_tags (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    280   ��      �          0    86906    social_post_socialpost_wow 
   TABLE DATA           P   COPY public.social_post_socialpost_wow (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    282   ��                0    87169    social_post_subactivity 
   TABLE DATA           N   COPY public.social_post_subactivity (id, name, rank, activity_id) FROM stdin;
    public          dbrdsubuntume12    false    302   ӄ                0    87159    social_post_sublifeevent 
   TABLE DATA           P   COPY public.social_post_sublifeevent (id, name, rank, lifeevent_id) FROM stdin;
    public          dbrdsubuntume12    false    300   ��      #          0    91142    social_privacymodel 
   TABLE DATA           S   COPY public.social_privacymodel (id, name, rank, icon, "nameSubtitle") FROM stdin;
    public          dbrdsubuntume12    false    320   �      )          0    91197    social_reactions 
   TABLE DATA           ;   COPY public.social_reactions (id, name, image) FROM stdin;
    public          dbrdsubuntume12    false    326   ��      C          0    91858    social_socialphoto 
   TABLE DATA           ^   COPY public.social_socialphoto (id, caption, photo, created_at, post_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    352   !�      +          0    91205    social_socialpost 
   TABLE DATA           �   COPY public.social_socialpost (id, post_text, created_at, updated_at, is_hqa, activity_id, background_id, category_id, check_in_id, feeling_id, gif_id, lifeevent_id, privacy_id, subactivity_id, sublifeevent_id, user_id, is_active, is_draft) FROM stdin;
    public          dbrdsubuntume12    false    328   /�      -          0    91216    social_socialpost_angry 
   TABLE DATA           M   COPY public.social_socialpost_angry (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    330   �      /          0    91224    social_socialpost_care 
   TABLE DATA           L   COPY public.social_socialpost_care (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    332   �      1          0    91232    social_socialpost_haha 
   TABLE DATA           L   COPY public.social_socialpost_haha (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    334   7�      3          0    91240    social_socialpost_likes 
   TABLE DATA           M   COPY public.social_socialpost_likes (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    336   Z�      5          0    91248    social_socialpost_love 
   TABLE DATA           L   COPY public.social_socialpost_love (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    338   }�      7          0    91256    social_socialpost_sad 
   TABLE DATA           K   COPY public.social_socialpost_sad (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    340   ��      9          0    91264    social_socialpost_senti 
   TABLE DATA           M   COPY public.social_socialpost_senti (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    342   ǈ      ;          0    91272    social_socialpost_shared_by 
   TABLE DATA           Q   COPY public.social_socialpost_shared_by (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    344   �      =          0    91280    social_socialpost_tags 
   TABLE DATA           L   COPY public.social_socialpost_tags (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    346   �      ?          0    91288    social_socialpost_wow 
   TABLE DATA           K   COPY public.social_socialpost_wow (id, socialpost_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    348   ?�      A          0    91829    social_socialupdatehistory 
   TABLE DATA           l   COPY public.social_socialupdatehistory (id, post_text, updated_at, is_hqa, post_id, created_at) FROM stdin;
    public          dbrdsubuntume12    false    350   b�      '          0    91162    social_subactivity 
   TABLE DATA           I   COPY public.social_subactivity (id, name, rank, activity_id) FROM stdin;
    public          dbrdsubuntume12    false    324   9�      %          0    91152    social_sublifeevent 
   TABLE DATA           K   COPY public.social_sublifeevent (id, name, rank, lifeevent_id) FROM stdin;
    public          dbrdsubuntume12    false    322   e�      �          0    85469    user_management_consumer 
   TABLE DATA           �  COPY public.user_management_consumer (id, phone, username, first_name, last_name, photo, occupation, date_of_birth, nid_number, gender, religion, father_name, father_occupation, mother_name, mother_occupation, spouse_name, address1, address2, bio, blood_group, height, weight, hobby, marital_status, languages, about_tour, about_family_members, designation_and_service_organization, primary_name_and_session, highschool_name_and_session, college_name_and_session, university_name_and_session, psd_name_and_session, others_name_and_session, father_name_change, mother_name_change, rank, add_seller, refered_by, left_refer, right_refer, is_late, is_master, password, created_at, updated_at, city_id, country_id, user_id, can_follow) FROM stdin;
    public          dbrdsubuntume12    false    250   ��      �          0    85431     user_management_consumerreferred 
   TABLE DATA           �   COPY public.user_management_consumerreferred (id, referred_by, user_id, left_refer, right_refer, username, first_name, last_name, referal_name_left, referal_name_right, parent_id) FROM stdin;
    public          dbrdsubuntume12    false    248   ދ      �          0    86438    userapp_coverphoto 
   TABLE DATA           ~   COPY public.userapp_coverphoto (id, photo, caption, location, privacy, created_at, last_used, is_active, user_id) FROM stdin;
    public          dbrdsubuntume12    false    260   ��      �          0    86449    userapp_coverphoto_tags 
   TABLE DATA           M   COPY public.userapp_coverphoto_tags (id, coverphoto_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    262   ��      �          0    86419    userapp_profilephoto 
   TABLE DATA           �   COPY public.userapp_profilephoto (id, photo, caption, location, privacy, created_at, last_used, is_active, user_id) FROM stdin;
    public          dbrdsubuntume12    false    256   ��      �          0    86430    userapp_profilephoto_tags 
   TABLE DATA           Q   COPY public.userapp_profilephoto_tags (id, profilephoto_id, user_id) FROM stdin;
    public          dbrdsubuntume12    false    258   ;�      �          0    85526    userapp_userpro 
   TABLE DATA           @   COPY public.userapp_userpro (id, user_id, username) FROM stdin;
    public          dbrdsubuntume12    false    252   ޏ      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          dbrdsubuntume12    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          dbrdsubuntume12    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 504, true);
          public          dbrdsubuntume12    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          dbrdsubuntume12    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 25, true);
          public          dbrdsubuntume12    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          dbrdsubuntume12    false    216            �           0    0    chat_groupmessage_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.chat_groupmessage_id_seq', 5, true);
          public          dbrdsubuntume12    false    500            �           0    0    chat_groupname_admins_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.chat_groupname_admins_id_seq', 11, true);
          public          dbrdsubuntume12    false    496            �           0    0    chat_groupname_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.chat_groupname_id_seq', 9, true);
          public          dbrdsubuntume12    false    494            �           0    0 "   chat_groupname_participants_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.chat_groupname_participants_id_seq', 31, true);
          public          dbrdsubuntume12    false    498            �           0    0    chat_message_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.chat_message_id_seq', 14, true);
          public          dbrdsubuntume12    false    490            �           0    0    chat_privatechtroom_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.chat_privatechtroom_id_seq', 10, true);
          public          dbrdsubuntume12    false    488            �           0    0    chatapp_message_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.chatapp_message_id_seq', 10, true);
          public          dbrdsubuntume12    false    402            �           0    0    chatapp_roomname_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.chatapp_roomname_id_seq', 2, true);
          public          dbrdsubuntume12    false    398            �           0    0 $   chatapp_roomname_participants_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.chatapp_roomname_participants_id_seq', 7, true);
          public          dbrdsubuntume12    false    400            �           0    0     comment_postcomment_angry_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.comment_postcomment_angry_id_seq', 1, false);
          public          dbrdsubuntume12    false    355            �           0    0    comment_postcomment_care_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.comment_postcomment_care_id_seq', 1, false);
          public          dbrdsubuntume12    false    357            �           0    0    comment_postcomment_haha_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comment_postcomment_haha_id_seq', 1, true);
          public          dbrdsubuntume12    false    359            �           0    0    comment_postcomment_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.comment_postcomment_id_seq', 8, true);
          public          dbrdsubuntume12    false    353            �           0    0     comment_postcomment_likes_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.comment_postcomment_likes_id_seq', 3, true);
          public          dbrdsubuntume12    false    361            �           0    0    comment_postcomment_love_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comment_postcomment_love_id_seq', 2, true);
          public          dbrdsubuntume12    false    363            �           0    0    comment_postcomment_sad_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comment_postcomment_sad_id_seq', 1, false);
          public          dbrdsubuntume12    false    365            �           0    0     comment_postcomment_senti_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.comment_postcomment_senti_id_seq', 1, false);
          public          dbrdsubuntume12    false    367            �           0    0    comment_postcomment_wow_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comment_postcomment_wow_id_seq', 1, false);
          public          dbrdsubuntume12    false    369            �           0    0 !   comment_postcommenthistory_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.comment_postcommenthistory_id_seq', 3, true);
          public          dbrdsubuntume12    false    394            �           0    0 %   comment_postphotocomment_angry_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.comment_postphotocomment_angry_id_seq', 1, false);
          public          dbrdsubuntume12    false    376            �           0    0 $   comment_postphotocomment_care_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.comment_postphotocomment_care_id_seq', 1, false);
          public          dbrdsubuntume12    false    378            �           0    0 $   comment_postphotocomment_haha_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.comment_postphotocomment_haha_id_seq', 1, false);
          public          dbrdsubuntume12    false    380            �           0    0    comment_postphotocomment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.comment_postphotocomment_id_seq', 3, true);
          public          dbrdsubuntume12    false    374            �           0    0 %   comment_postphotocomment_likes_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.comment_postphotocomment_likes_id_seq', 1, true);
          public          dbrdsubuntume12    false    382            �           0    0 $   comment_postphotocomment_love_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.comment_postphotocomment_love_id_seq', 1, true);
          public          dbrdsubuntume12    false    384            �           0    0 #   comment_postphotocomment_sad_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.comment_postphotocomment_sad_id_seq', 1, false);
          public          dbrdsubuntume12    false    386            �           0    0 %   comment_postphotocomment_senti_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.comment_postphotocomment_senti_id_seq', 1, false);
          public          dbrdsubuntume12    false    388            �           0    0 #   comment_postphotocomment_wow_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.comment_postphotocomment_wow_id_seq', 1, false);
          public          dbrdsubuntume12    false    390            �           0    0 &   comment_postphotocommenthistory_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.comment_postphotocommenthistory_id_seq', 1, true);
          public          dbrdsubuntume12    false    392            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 592, true);
          public          dbrdsubuntume12    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.django_content_type_id_seq', 124, true);
          public          dbrdsubuntume12    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_migrations_id_seq', 170, true);
          public          dbrdsubuntume12    false    202            �           0    0    employer_applicants_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.employer_applicants_id_seq', 18, true);
          public          dbrdsubuntume12    false    428            �           0    0    employer_employer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.employer_employer_id_seq', 30, true);
          public          dbrdsubuntume12    false    221            �           0    0 #   employer_employer_moderators_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.employer_employer_moderators_id_seq', 4, true);
          public          dbrdsubuntume12    false    468            �           0    0 +   employer_employer_pending_moderators_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.employer_employer_pending_moderators_id_seq', 2, true);
          public          dbrdsubuntume12    false    470            �           0    0    employer_jobpost_applied_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.employer_jobpost_applied_id_seq', 15, true);
          public          dbrdsubuntume12    false    430            �           0    0    employer_jobpost_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.employer_jobpost_id_seq', 24, true);
          public          dbrdsubuntume12    false    223            �           0    0    follow_friends_follower_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.follow_friends_follower_id_seq', 2, true);
          public          dbrdsubuntume12    false    406            �           0    0    follow_friends_following_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.follow_friends_following_id_seq', 2, true);
          public          dbrdsubuntume12    false    408            �           0    0    follow_friends_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.follow_friends_id_seq', 2, true);
          public          dbrdsubuntume12    false    404            �           0    0 $   follow_friends_to_be_follower_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.follow_friends_to_be_follower_id_seq', 1, false);
          public          dbrdsubuntume12    false    410            �           0    0 %   follow_friends_to_be_following_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.follow_friends_to_be_following_id_seq', 1, false);
          public          dbrdsubuntume12    false    412            �           0    0     followfollowing_blockedby_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.followfollowing_blockedby_id_seq', 1, true);
          public          dbrdsubuntume12    false    426            �           0    0     followfollowing_blocklist_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.followfollowing_blocklist_id_seq', 1, true);
          public          dbrdsubuntume12    false    424            �           0    0     followfollowing_followers_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.followfollowing_followers_id_seq', 6, true);
          public          dbrdsubuntume12    false    414            �           0    0 !   followfollowing_followings_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.followfollowing_followings_id_seq', 6, true);
          public          dbrdsubuntume12    false    416            �           0    0    followfollowing_friends_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.followfollowing_friends_id_seq', 4, true);
          public          dbrdsubuntume12    false    418            �           0    0 $   followfollowing_tobefollowers_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.followfollowing_tobefollowers_id_seq', 4, true);
          public          dbrdsubuntume12    false    422            �           0    0 %   followfollowing_tobefollowings_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.followfollowing_tobefollowings_id_seq', 2, true);
          public          dbrdsubuntume12    false    420            �           0    0    jobs_amryexperience_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.jobs_amryexperience_id_seq', 10, true);
          public          dbrdsubuntume12    false    253            �           0    0    jobs_benefitlist_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jobs_benefitlist_id_seq', 60, true);
          public          dbrdsubuntume12    false    432            �           0    0    jobs_businesslist_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.jobs_businesslist_id_seq', 85, true);
          public          dbrdsubuntume12    false    434            �           0    0    jobs_city_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.jobs_city_id_seq', 2, true);
          public          dbrdsubuntume12    false    466            �           0    0    jobs_continent_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jobs_continent_id_seq', 2, true);
          public          dbrdsubuntume12    false    460            �           0    0    jobs_country_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.jobs_country_id_seq', 3, true);
          public          dbrdsubuntume12    false    462            �           0    0    jobs_degreeorexam_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jobs_degreeorexam_id_seq', 3, true);
          public          dbrdsubuntume12    false    454            �           0    0 "   jobs_disability_information_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.jobs_disability_information_id_seq', 2, true);
          public          dbrdsubuntume12    false    241            �           0    0    jobs_educationlevel_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.jobs_educationlevel_id_seq', 2, true);
          public          dbrdsubuntume12    false    456            �           0    0    jobs_educationprofile_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.jobs_educationprofile_id_seq', 6, true);
          public          dbrdsubuntume12    false    239            �           0    0    jobs_experience_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jobs_experience_id_seq', 7, true);
          public          dbrdsubuntume12    false    237            �           0    0    jobs_experiencelist_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.jobs_experiencelist_id_seq', 70, true);
          public          dbrdsubuntume12    false    436            �           0    0 !   jobs_functionaljobcategory_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.jobs_functionaljobcategory_id_seq', 61, true);
          public          dbrdsubuntume12    false    438            �           0    0    jobs_industrycategory_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.jobs_industrycategory_id_seq', 61, true);
          public          dbrdsubuntume12    false    440            �           0    0    jobs_instituionlist_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.jobs_instituionlist_id_seq', 63, true);
          public          dbrdsubuntume12    false    442            �           0    0    jobs_jobprofile_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jobs_jobprofile_id_seq', 11, true);
          public          dbrdsubuntume12    false    225            �           0    0 %   jobs_jobprofile_job_categories_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.jobs_jobprofile_job_categories_id_seq', 5, true);
          public          dbrdsubuntume12    false    450            �           0    0 %   jobs_jobprofile_special_skills_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.jobs_jobprofile_special_skills_id_seq', 5, true);
          public          dbrdsubuntume12    false    452            �           0    0    jobs_majorin_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jobs_majorin_id_seq', 10, true);
          public          dbrdsubuntume12    false    458            �           0    0    jobs_organizationtype_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.jobs_organizationtype_id_seq', 61, true);
          public          dbrdsubuntume12    false    444            �           0    0 $   jobs_professional_certificate_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.jobs_professional_certificate_id_seq', 4, true);
          public          dbrdsubuntume12    false    235            �           0    0    jobs_project_works_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.jobs_project_works_id_seq', 1, true);
          public          dbrdsubuntume12    false    233            �           0    0    jobs_reference_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jobs_reference_id_seq', 1, true);
          public          dbrdsubuntume12    false    231            �           0    0    jobs_skills_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.jobs_skills_id_seq', 1, true);
          public          dbrdsubuntume12    false    229            �           0    0    jobs_skillslist_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jobs_skillslist_id_seq', 60, true);
          public          dbrdsubuntume12    false    446            �           0    0     jobs_specialskillcategory_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.jobs_specialskillcategory_id_seq', 61, true);
          public          dbrdsubuntume12    false    448            �           0    0    jobs_state_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.jobs_state_id_seq', 4, true);
          public          dbrdsubuntume12    false    464            �           0    0    jobs_training_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jobs_training_id_seq', 12, true);
          public          dbrdsubuntume12    false    227            �           0    0    metrimony_expectaion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.metrimony_expectaion_id_seq', 2, true);
          public          dbrdsubuntume12    false    245            �           0    0    metrimony_matriblockedby_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.metrimony_matriblockedby_id_seq', 2, true);
          public          dbrdsubuntume12    false    504            �           0    0    metrimony_matriblocklist_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.metrimony_matriblocklist_id_seq', 4, true);
          public          dbrdsubuntume12    false    502            �           0    0    metrimony_personal_info_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.metrimony_personal_info_id_seq', 4, true);
          public          dbrdsubuntume12    false    243            �           0    0 ,   metrimony_personal_info_interested_by_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.metrimony_personal_info_interested_by_id_seq', 5, true);
          public          dbrdsubuntume12    false    482            �           0    0 )   metrimony_personal_info_interested_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.metrimony_personal_info_interested_id_seq', 6, true);
          public          dbrdsubuntume12    false    480            �           0    0 4   metrimony_personal_info_pending_interested_by_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.metrimony_personal_info_pending_interested_by_id_seq', 5, true);
          public          dbrdsubuntume12    false    484            �           0    0 ,   metrimony_personal_info_privary_limit_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.metrimony_personal_info_privary_limit_id_seq', 2, true);
          public          dbrdsubuntume12    false    472            �           0    0 *   metrimony_personal_info_shortlisted_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.metrimony_personal_info_shortlisted_id_seq', 12, true);
          public          dbrdsubuntume12    false    486            �           0    0 (   metrimony_personal_info_viewed_by_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.metrimony_personal_info_viewed_by_id_seq', 3, true);
          public          dbrdsubuntume12    false    476                        0    0 %   metrimony_personal_info_viewed_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.metrimony_personal_info_viewed_id_seq', 6, true);
          public          dbrdsubuntume12    false    478                       0    0 !   metrimony_visaverification_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.metrimony_visaverification_id_seq', 1, true);
          public          dbrdsubuntume12    false    474                       0    0 !   notifications_notification_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.notifications_notification_id_seq', 8, true);
          public          dbrdsubuntume12    false    396                       0    0    posts_postcategory_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.posts_postcategory_id_seq', 9, true);
          public          dbrdsubuntume12    false    372                       0    0    reports_reports_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.reports_reports_id_seq', 14, true);
          public          dbrdsubuntume12    false    506                       0    0    sellbuy_answer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sellbuy_answer_id_seq', 1, true);
          public          dbrdsubuntume12    false    528                       0    0    sellbuy_buyers_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sellbuy_buyers_id_seq', 7, true);
          public          dbrdsubuntume12    false    510                       0    0    sellbuy_category_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sellbuy_category_id_seq', 1, true);
          public          dbrdsubuntume12    false    512                       0    0    sellbuy_dealerprofile_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.sellbuy_dealerprofile_id_seq', 2, true);
          public          dbrdsubuntume12    false    508            	           0    0    sellbuy_faq_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sellbuy_faq_id_seq', 2, true);
          public          dbrdsubuntume12    false    526            
           0    0    sellbuy_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sellbuy_product_id_seq', 12, true);
          public          dbrdsubuntume12    false    514                       0    0    sellbuy_product_like_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sellbuy_product_like_id_seq', 3, true);
          public          dbrdsubuntume12    false    516                       0    0    sellbuy_productcomment_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.sellbuy_productcomment_id_seq', 1, false);
          public          dbrdsubuntume12    false    530                       0    0    sellbuy_question_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sellbuy_question_id_seq', 1, true);
          public          dbrdsubuntume12    false    524                       0    0    sellbuy_review_dislikes_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.sellbuy_review_dislikes_id_seq', 1, false);
          public          dbrdsubuntume12    false    520                       0    0    sellbuy_review_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sellbuy_review_id_seq', 5, true);
          public          dbrdsubuntume12    false    518                       0    0    sellbuy_review_likes_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.sellbuy_review_likes_id_seq', 1, false);
          public          dbrdsubuntume12    false    522                       0    0    sellbuy_sellerprofile_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.sellbuy_sellerprofile_id_seq', 1, true);
          public          dbrdsubuntume12    false    492                       0    0    social_activity_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.social_activity_id_seq', 1, true);
          public          dbrdsubuntume12    false    305                       0    0    social_backgroud_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.social_backgroud_id_seq', 1, true);
          public          dbrdsubuntume12    false    307                       0    0    social_category_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.social_category_id_seq', 2, true);
          public          dbrdsubuntume12    false    309                       0    0    social_check_in_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.social_check_in_id_seq', 1, true);
          public          dbrdsubuntume12    false    311                       0    0    social_feeling_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.social_feeling_id_seq', 1, true);
          public          dbrdsubuntume12    false    313                       0    0    social_gif_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.social_gif_id_seq', 1, true);
          public          dbrdsubuntume12    false    315                       0    0    social_lifeevent_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.social_lifeevent_id_seq', 1, true);
          public          dbrdsubuntume12    false    317                       0    0    social_post_activity_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.social_post_activity_id_seq', 1, true);
          public          dbrdsubuntume12    false    283                       0    0    social_post_backgroud_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.social_post_backgroud_id_seq', 1, true);
          public          dbrdsubuntume12    false    285                       0    0    social_post_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.social_post_category_id_seq', 1, true);
          public          dbrdsubuntume12    false    287                       0    0    social_post_check_in_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.social_post_check_in_id_seq', 1, true);
          public          dbrdsubuntume12    false    289                       0    0    social_post_feels_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.social_post_feels_id_seq', 1, true);
          public          dbrdsubuntume12    false    303                       0    0    social_post_gif_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.social_post_gif_id_seq', 1, true);
          public          dbrdsubuntume12    false    291                       0    0    social_post_lifeevent_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.social_post_lifeevent_id_seq', 1, true);
          public          dbrdsubuntume12    false    293                        0    0    social_post_privacy_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.social_post_privacy_id_seq', 1, true);
          public          dbrdsubuntume12    false    295            !           0    0 #   social_post_socialpost_angry_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.social_post_socialpost_angry_id_seq', 1, false);
          public          dbrdsubuntume12    false    265            "           0    0 "   social_post_socialpost_care_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.social_post_socialpost_care_id_seq', 2, true);
          public          dbrdsubuntume12    false    267            #           0    0 "   social_post_socialpost_haha_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.social_post_socialpost_haha_id_seq', 1, false);
          public          dbrdsubuntume12    false    269            $           0    0    social_post_socialpost_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.social_post_socialpost_id_seq', 2, true);
          public          dbrdsubuntume12    false    263            %           0    0 #   social_post_socialpost_likes_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.social_post_socialpost_likes_id_seq', 66, true);
          public          dbrdsubuntume12    false    271            &           0    0 "   social_post_socialpost_love_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.social_post_socialpost_love_id_seq', 20, true);
          public          dbrdsubuntume12    false    273            '           0    0 !   social_post_socialpost_sad_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.social_post_socialpost_sad_id_seq', 1, true);
          public          dbrdsubuntume12    false    275            (           0    0 #   social_post_socialpost_senti_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.social_post_socialpost_senti_id_seq', 1, false);
          public          dbrdsubuntume12    false    277            )           0    0 '   social_post_socialpost_shared_by_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.social_post_socialpost_shared_by_id_seq', 1, false);
          public          dbrdsubuntume12    false    297            *           0    0 "   social_post_socialpost_tags_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.social_post_socialpost_tags_id_seq', 4, true);
          public          dbrdsubuntume12    false    279            +           0    0 !   social_post_socialpost_wow_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.social_post_socialpost_wow_id_seq', 3, true);
          public          dbrdsubuntume12    false    281            ,           0    0    social_post_subactivity_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.social_post_subactivity_id_seq', 1, false);
          public          dbrdsubuntume12    false    301            -           0    0    social_post_sublifeevent_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.social_post_sublifeevent_id_seq', 1, false);
          public          dbrdsubuntume12    false    299            .           0    0    social_privacy_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.social_privacy_id_seq', 4, true);
          public          dbrdsubuntume12    false    319            /           0    0    social_reactions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.social_reactions_id_seq', 1, true);
          public          dbrdsubuntume12    false    325            0           0    0    social_socialphoto_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.social_socialphoto_id_seq', 8, true);
          public          dbrdsubuntume12    false    351            1           0    0    social_socialpost_angry_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.social_socialpost_angry_id_seq', 3, true);
          public          dbrdsubuntume12    false    329            2           0    0    social_socialpost_care_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.social_socialpost_care_id_seq', 2, true);
          public          dbrdsubuntume12    false    331            3           0    0    social_socialpost_haha_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.social_socialpost_haha_id_seq', 2, true);
          public          dbrdsubuntume12    false    333            4           0    0    social_socialpost_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.social_socialpost_id_seq', 8, true);
          public          dbrdsubuntume12    false    327            5           0    0    social_socialpost_likes_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.social_socialpost_likes_id_seq', 2, true);
          public          dbrdsubuntume12    false    335            6           0    0    social_socialpost_love_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.social_socialpost_love_id_seq', 4, true);
          public          dbrdsubuntume12    false    337            7           0    0    social_socialpost_sad_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.social_socialpost_sad_id_seq', 3, true);
          public          dbrdsubuntume12    false    339            8           0    0    social_socialpost_senti_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.social_socialpost_senti_id_seq', 2, true);
          public          dbrdsubuntume12    false    341            9           0    0 "   social_socialpost_shared_by_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.social_socialpost_shared_by_id_seq', 4, true);
          public          dbrdsubuntume12    false    343            :           0    0    social_socialpost_tags_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.social_socialpost_tags_id_seq', 3, true);
          public          dbrdsubuntume12    false    345            ;           0    0    social_socialpost_wow_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.social_socialpost_wow_id_seq', 2, true);
          public          dbrdsubuntume12    false    347            <           0    0 !   social_socialupdatehistory_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.social_socialupdatehistory_id_seq', 5, true);
          public          dbrdsubuntume12    false    349            =           0    0    social_subactivity_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.social_subactivity_id_seq', 2, true);
          public          dbrdsubuntume12    false    323            >           0    0    social_sublifeevent_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.social_sublifeevent_id_seq', 1, true);
          public          dbrdsubuntume12    false    321            ?           0    0    user_management_consumer_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.user_management_consumer_id_seq', 13, true);
          public          dbrdsubuntume12    false    249            @           0    0 '   user_management_consumerreferred_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.user_management_consumerreferred_id_seq', 1, false);
          public          dbrdsubuntume12    false    247            A           0    0    userapp_coverphoto_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.userapp_coverphoto_id_seq', 2, true);
          public          dbrdsubuntume12    false    259            B           0    0    userapp_coverphoto_tags_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.userapp_coverphoto_tags_id_seq', 4, true);
          public          dbrdsubuntume12    false    261            C           0    0    userapp_profilephoto_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.userapp_profilephoto_id_seq', 28, true);
          public          dbrdsubuntume12    false    255            D           0    0     userapp_profilephoto_tags_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.userapp_profilephoto_tags_id_seq', 62, true);
          public          dbrdsubuntume12    false    257            E           0    0    userapp_userpro_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.userapp_userpro_id_seq', 1, false);
          public          dbrdsubuntume12    false    251                       2606    85075    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            dbrdsubuntume12    false    209                        2606    85002 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            dbrdsubuntume12    false    211    211            #           2606    84965 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            dbrdsubuntume12    false    211                       2606    84955    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            dbrdsubuntume12    false    209                       2606    84993 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            dbrdsubuntume12    false    207    207                       2606    84947 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            dbrdsubuntume12    false    207            +           2606    84983 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            dbrdsubuntume12    false    215            .           2606    85017 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            dbrdsubuntume12    false    215    215            %           2606    84973    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            dbrdsubuntume12    false    213            1           2606    84991 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            dbrdsubuntume12    false    217            4           2606    85031 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            dbrdsubuntume12    false    217    217            (           2606    85069     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            dbrdsubuntume12    false    213            �           2606    92506 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            dbrdsubuntume12    false    371            �           2606    92508 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            dbrdsubuntume12    false    371            �           2606    139515 (   chat_groupmessage chat_groupmessage_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.chat_groupmessage
    ADD CONSTRAINT chat_groupmessage_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.chat_groupmessage DROP CONSTRAINT chat_groupmessage_pkey;
       public            dbrdsubuntume12    false    501            �           2606    139518 N   chat_groupname_admins chat_groupname_admins_groupname_id_user_id_6cbb1583_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupname_admins
    ADD CONSTRAINT chat_groupname_admins_groupname_id_user_id_6cbb1583_uniq UNIQUE (groupname_id, user_id);
 x   ALTER TABLE ONLY public.chat_groupname_admins DROP CONSTRAINT chat_groupname_admins_groupname_id_user_id_6cbb1583_uniq;
       public            dbrdsubuntume12    false    497    497            �           2606    139496 0   chat_groupname_admins chat_groupname_admins_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.chat_groupname_admins
    ADD CONSTRAINT chat_groupname_admins_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.chat_groupname_admins DROP CONSTRAINT chat_groupname_admins_pkey;
       public            dbrdsubuntume12    false    497            �           2606    139488 ,   chat_groupname chat_groupname_group_name_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.chat_groupname
    ADD CONSTRAINT chat_groupname_group_name_key UNIQUE (group_name);
 V   ALTER TABLE ONLY public.chat_groupname DROP CONSTRAINT chat_groupname_group_name_key;
       public            dbrdsubuntume12    false    495            �           2606    139532 Z   chat_groupname_participants chat_groupname_participants_groupname_id_user_id_fae9ddc0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupname_participants
    ADD CONSTRAINT chat_groupname_participants_groupname_id_user_id_fae9ddc0_uniq UNIQUE (groupname_id, user_id);
 �   ALTER TABLE ONLY public.chat_groupname_participants DROP CONSTRAINT chat_groupname_participants_groupname_id_user_id_fae9ddc0_uniq;
       public            dbrdsubuntume12    false    499    499            �           2606    139504 <   chat_groupname_participants chat_groupname_participants_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.chat_groupname_participants
    ADD CONSTRAINT chat_groupname_participants_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.chat_groupname_participants DROP CONSTRAINT chat_groupname_participants_pkey;
       public            dbrdsubuntume12    false    499            �           2606    139486 "   chat_groupname chat_groupname_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.chat_groupname
    ADD CONSTRAINT chat_groupname_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.chat_groupname DROP CONSTRAINT chat_groupname_pkey;
       public            dbrdsubuntume12    false    495            �           2606    139214    chat_message chat_message_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.chat_message DROP CONSTRAINT chat_message_pkey;
       public            dbrdsubuntume12    false    491            �           2606    139201 ,   chat_privatechtroom chat_privatechtroom_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.chat_privatechtroom
    ADD CONSTRAINT chat_privatechtroom_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.chat_privatechtroom DROP CONSTRAINT chat_privatechtroom_pkey;
       public            dbrdsubuntume12    false    489            �           2606    139203 5   chat_privatechtroom chat_privatechtroom_room_name_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.chat_privatechtroom
    ADD CONSTRAINT chat_privatechtroom_room_name_key UNIQUE (room_name);
 _   ALTER TABLE ONLY public.chat_privatechtroom DROP CONSTRAINT chat_privatechtroom_room_name_key;
       public            dbrdsubuntume12    false    489                       2606    98581 $   chatapp_message chatapp_message_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.chatapp_message
    ADD CONSTRAINT chatapp_message_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.chatapp_message DROP CONSTRAINT chatapp_message_pkey;
       public            dbrdsubuntume12    false    403                       2606    98570 @   chatapp_roomname_participants chatapp_roomname_participants_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.chatapp_roomname_participants
    ADD CONSTRAINT chatapp_roomname_participants_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.chatapp_roomname_participants DROP CONSTRAINT chatapp_roomname_participants_pkey;
       public            dbrdsubuntume12    false    401                       2606    98590 ]   chatapp_roomname_participants chatapp_roomname_participants_roomname_id_user_id_c016828b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.chatapp_roomname_participants
    ADD CONSTRAINT chatapp_roomname_participants_roomname_id_user_id_c016828b_uniq UNIQUE (roomname_id, user_id);
 �   ALTER TABLE ONLY public.chatapp_roomname_participants DROP CONSTRAINT chatapp_roomname_participants_roomname_id_user_id_c016828b_uniq;
       public            dbrdsubuntume12    false    401    401                       2606    98560 &   chatapp_roomname chatapp_roomname_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.chatapp_roomname
    ADD CONSTRAINT chatapp_roomname_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.chatapp_roomname DROP CONSTRAINT chatapp_roomname_pkey;
       public            dbrdsubuntume12    false    399                       2606    98562 /   chatapp_roomname chatapp_roomname_room_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.chatapp_roomname
    ADD CONSTRAINT chatapp_roomname_room_name_key UNIQUE (room_name);
 Y   ALTER TABLE ONLY public.chatapp_roomname DROP CONSTRAINT chatapp_roomname_room_name_key;
       public            dbrdsubuntume12    false    399            �           2606    92315 8   comment_postcomment_angry comment_postcomment_angry_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.comment_postcomment_angry
    ADD CONSTRAINT comment_postcomment_angry_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.comment_postcomment_angry DROP CONSTRAINT comment_postcomment_angry_pkey;
       public            dbrdsubuntume12    false    356            �           2606    92391 X   comment_postcomment_angry comment_postcomment_angry_postcomment_id_user_id_280d257c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_angry
    ADD CONSTRAINT comment_postcomment_angry_postcomment_id_user_id_280d257c_uniq UNIQUE (postcomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postcomment_angry DROP CONSTRAINT comment_postcomment_angry_postcomment_id_user_id_280d257c_uniq;
       public            dbrdsubuntume12    false    356    356            �           2606    92323 6   comment_postcomment_care comment_postcomment_care_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.comment_postcomment_care
    ADD CONSTRAINT comment_postcomment_care_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.comment_postcomment_care DROP CONSTRAINT comment_postcomment_care_pkey;
       public            dbrdsubuntume12    false    358            �           2606    92405 V   comment_postcomment_care comment_postcomment_care_postcomment_id_user_id_2d1055c6_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_care
    ADD CONSTRAINT comment_postcomment_care_postcomment_id_user_id_2d1055c6_uniq UNIQUE (postcomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postcomment_care DROP CONSTRAINT comment_postcomment_care_postcomment_id_user_id_2d1055c6_uniq;
       public            dbrdsubuntume12    false    358    358            �           2606    92331 6   comment_postcomment_haha comment_postcomment_haha_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.comment_postcomment_haha
    ADD CONSTRAINT comment_postcomment_haha_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.comment_postcomment_haha DROP CONSTRAINT comment_postcomment_haha_pkey;
       public            dbrdsubuntume12    false    360            �           2606    92419 V   comment_postcomment_haha comment_postcomment_haha_postcomment_id_user_id_8e481a3f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_haha
    ADD CONSTRAINT comment_postcomment_haha_postcomment_id_user_id_8e481a3f_uniq UNIQUE (postcomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postcomment_haha DROP CONSTRAINT comment_postcomment_haha_postcomment_id_user_id_8e481a3f_uniq;
       public            dbrdsubuntume12    false    360    360            �           2606    92339 8   comment_postcomment_likes comment_postcomment_likes_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.comment_postcomment_likes
    ADD CONSTRAINT comment_postcomment_likes_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.comment_postcomment_likes DROP CONSTRAINT comment_postcomment_likes_pkey;
       public            dbrdsubuntume12    false    362            �           2606    92433 X   comment_postcomment_likes comment_postcomment_likes_postcomment_id_user_id_9a064584_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_likes
    ADD CONSTRAINT comment_postcomment_likes_postcomment_id_user_id_9a064584_uniq UNIQUE (postcomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postcomment_likes DROP CONSTRAINT comment_postcomment_likes_postcomment_id_user_id_9a064584_uniq;
       public            dbrdsubuntume12    false    362    362            �           2606    92347 6   comment_postcomment_love comment_postcomment_love_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.comment_postcomment_love
    ADD CONSTRAINT comment_postcomment_love_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.comment_postcomment_love DROP CONSTRAINT comment_postcomment_love_pkey;
       public            dbrdsubuntume12    false    364            �           2606    92447 V   comment_postcomment_love comment_postcomment_love_postcomment_id_user_id_c4311015_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_love
    ADD CONSTRAINT comment_postcomment_love_postcomment_id_user_id_c4311015_uniq UNIQUE (postcomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postcomment_love DROP CONSTRAINT comment_postcomment_love_postcomment_id_user_id_c4311015_uniq;
       public            dbrdsubuntume12    false    364    364            �           2606    92307 ,   comment_postcomment comment_postcomment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.comment_postcomment
    ADD CONSTRAINT comment_postcomment_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.comment_postcomment DROP CONSTRAINT comment_postcomment_pkey;
       public            dbrdsubuntume12    false    354            �           2606    92355 4   comment_postcomment_sad comment_postcomment_sad_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.comment_postcomment_sad
    ADD CONSTRAINT comment_postcomment_sad_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.comment_postcomment_sad DROP CONSTRAINT comment_postcomment_sad_pkey;
       public            dbrdsubuntume12    false    366            �           2606    92461 T   comment_postcomment_sad comment_postcomment_sad_postcomment_id_user_id_d014dee3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_sad
    ADD CONSTRAINT comment_postcomment_sad_postcomment_id_user_id_d014dee3_uniq UNIQUE (postcomment_id, user_id);
 ~   ALTER TABLE ONLY public.comment_postcomment_sad DROP CONSTRAINT comment_postcomment_sad_postcomment_id_user_id_d014dee3_uniq;
       public            dbrdsubuntume12    false    366    366            �           2606    92363 8   comment_postcomment_senti comment_postcomment_senti_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.comment_postcomment_senti
    ADD CONSTRAINT comment_postcomment_senti_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.comment_postcomment_senti DROP CONSTRAINT comment_postcomment_senti_pkey;
       public            dbrdsubuntume12    false    368            �           2606    92475 X   comment_postcomment_senti comment_postcomment_senti_postcomment_id_user_id_9915f666_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_senti
    ADD CONSTRAINT comment_postcomment_senti_postcomment_id_user_id_9915f666_uniq UNIQUE (postcomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postcomment_senti DROP CONSTRAINT comment_postcomment_senti_postcomment_id_user_id_9915f666_uniq;
       public            dbrdsubuntume12    false    368    368            �           2606    92371 4   comment_postcomment_wow comment_postcomment_wow_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.comment_postcomment_wow
    ADD CONSTRAINT comment_postcomment_wow_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.comment_postcomment_wow DROP CONSTRAINT comment_postcomment_wow_pkey;
       public            dbrdsubuntume12    false    370            �           2606    92489 T   comment_postcomment_wow comment_postcomment_wow_postcomment_id_user_id_ebdb1e7c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_wow
    ADD CONSTRAINT comment_postcomment_wow_postcomment_id_user_id_ebdb1e7c_uniq UNIQUE (postcomment_id, user_id);
 ~   ALTER TABLE ONLY public.comment_postcomment_wow DROP CONSTRAINT comment_postcomment_wow_postcomment_id_user_id_ebdb1e7c_uniq;
       public            dbrdsubuntume12    false    370    370            	           2606    97907 :   comment_postcommenthistory comment_postcommenthistory_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.comment_postcommenthistory
    ADD CONSTRAINT comment_postcommenthistory_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.comment_postcommenthistory DROP CONSTRAINT comment_postcommenthistory_pkey;
       public            dbrdsubuntume12    false    395            �           2606    97409 B   comment_postphotocomment_angry comment_postphotocomment_angry_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_angry
    ADD CONSTRAINT comment_postphotocomment_angry_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.comment_postphotocomment_angry DROP CONSTRAINT comment_postphotocomment_angry_pkey;
       public            dbrdsubuntume12    false    377            �           2606    97417 @   comment_postphotocomment_care comment_postphotocomment_care_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.comment_postphotocomment_care
    ADD CONSTRAINT comment_postphotocomment_care_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.comment_postphotocomment_care DROP CONSTRAINT comment_postphotocomment_care_pkey;
       public            dbrdsubuntume12    false    379            �           2606    97425 @   comment_postphotocomment_haha comment_postphotocomment_haha_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.comment_postphotocomment_haha
    ADD CONSTRAINT comment_postphotocomment_haha_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.comment_postphotocomment_haha DROP CONSTRAINT comment_postphotocomment_haha_pkey;
       public            dbrdsubuntume12    false    381            �           2606    97433 B   comment_postphotocomment_likes comment_postphotocomment_likes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_likes
    ADD CONSTRAINT comment_postphotocomment_likes_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.comment_postphotocomment_likes DROP CONSTRAINT comment_postphotocomment_likes_pkey;
       public            dbrdsubuntume12    false    383            �           2606    97441 @   comment_postphotocomment_love comment_postphotocomment_love_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.comment_postphotocomment_love
    ADD CONSTRAINT comment_postphotocomment_love_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.comment_postphotocomment_love DROP CONSTRAINT comment_postphotocomment_love_pkey;
       public            dbrdsubuntume12    false    385            �           2606    97401 6   comment_postphotocomment comment_postphotocomment_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.comment_postphotocomment
    ADD CONSTRAINT comment_postphotocomment_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.comment_postphotocomment DROP CONSTRAINT comment_postphotocomment_pkey;
       public            dbrdsubuntume12    false    375            �           2606    97541 ]   comment_postphotocomment_love comment_postphotocomment_postphotocomment_id_user_034a9f2c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_love
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_034a9f2c_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_love DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_034a9f2c_uniq;
       public            dbrdsubuntume12    false    385    385            �           2606    97527 ^   comment_postphotocomment_likes comment_postphotocomment_postphotocomment_id_user_11a62a7d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_likes
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_11a62a7d_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_likes DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_11a62a7d_uniq;
       public            dbrdsubuntume12    false    383    383            �           2606    97513 ]   comment_postphotocomment_haha comment_postphotocomment_postphotocomment_id_user_18649108_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_haha
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_18649108_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_haha DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_18649108_uniq;
       public            dbrdsubuntume12    false    381    381            �           2606    97499 ]   comment_postphotocomment_care comment_postphotocomment_postphotocomment_id_user_3516e6d2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_care
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_3516e6d2_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_care DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_3516e6d2_uniq;
       public            dbrdsubuntume12    false    379    379            �           2606    97485 ^   comment_postphotocomment_angry comment_postphotocomment_postphotocomment_id_user_36d1c2d6_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_angry
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_36d1c2d6_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_angry DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_36d1c2d6_uniq;
       public            dbrdsubuntume12    false    377    377            �           2606    97569 ^   comment_postphotocomment_senti comment_postphotocomment_postphotocomment_id_user_aa838cde_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_senti
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_aa838cde_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_senti DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_aa838cde_uniq;
       public            dbrdsubuntume12    false    389    389            �           2606    97555 \   comment_postphotocomment_sad comment_postphotocomment_postphotocomment_id_user_af0c7be6_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_sad
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_af0c7be6_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_sad DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_af0c7be6_uniq;
       public            dbrdsubuntume12    false    387    387            �           2606    97583 \   comment_postphotocomment_wow comment_postphotocomment_postphotocomment_id_user_cbf1349b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_wow
    ADD CONSTRAINT comment_postphotocomment_postphotocomment_id_user_cbf1349b_uniq UNIQUE (postphotocomment_id, user_id);
 �   ALTER TABLE ONLY public.comment_postphotocomment_wow DROP CONSTRAINT comment_postphotocomment_postphotocomment_id_user_cbf1349b_uniq;
       public            dbrdsubuntume12    false    391    391            �           2606    97449 >   comment_postphotocomment_sad comment_postphotocomment_sad_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.comment_postphotocomment_sad
    ADD CONSTRAINT comment_postphotocomment_sad_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.comment_postphotocomment_sad DROP CONSTRAINT comment_postphotocomment_sad_pkey;
       public            dbrdsubuntume12    false    387            �           2606    97457 B   comment_postphotocomment_senti comment_postphotocomment_senti_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_senti
    ADD CONSTRAINT comment_postphotocomment_senti_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.comment_postphotocomment_senti DROP CONSTRAINT comment_postphotocomment_senti_pkey;
       public            dbrdsubuntume12    false    389                       2606    97465 >   comment_postphotocomment_wow comment_postphotocomment_wow_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.comment_postphotocomment_wow
    ADD CONSTRAINT comment_postphotocomment_wow_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.comment_postphotocomment_wow DROP CONSTRAINT comment_postphotocomment_wow_pkey;
       public            dbrdsubuntume12    false    391                       2606    97896 D   comment_postphotocommenthistory comment_postphotocommenthistory_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocommenthistory
    ADD CONSTRAINT comment_postphotocommenthistory_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.comment_postphotocommenthistory DROP CONSTRAINT comment_postphotocommenthistory_pkey;
       public            dbrdsubuntume12    false    393            7           2606    85055 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            dbrdsubuntume12    false    219                       2606    84939 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            dbrdsubuntume12    false    205    205                       2606    84937 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            dbrdsubuntume12    false    205                       2606    84929 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            dbrdsubuntume12    false    203            ;           2606    85084 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            dbrdsubuntume12    false    220            [           2606    100120 ,   employer_applicants employer_applicants_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.employer_applicants
    ADD CONSTRAINT employer_applicants_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.employer_applicants DROP CONSTRAINT employer_applicants_pkey;
       public            dbrdsubuntume12    false    429            �           2606    122152 [   employer_employer_moderators employer_employer_moderators_employer_id_user_id_937c7eeb_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_moderators
    ADD CONSTRAINT employer_employer_moderators_employer_id_user_id_937c7eeb_uniq UNIQUE (employer_id, user_id);
 �   ALTER TABLE ONLY public.employer_employer_moderators DROP CONSTRAINT employer_employer_moderators_employer_id_user_id_937c7eeb_uniq;
       public            dbrdsubuntume12    false    469    469            �           2606    122150 >   employer_employer_moderators employer_employer_moderators_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.employer_employer_moderators
    ADD CONSTRAINT employer_employer_moderators_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.employer_employer_moderators DROP CONSTRAINT employer_employer_moderators_pkey;
       public            dbrdsubuntume12    false    469            �           2606    130877 _   employer_employer_pending_moderators employer_employer_pendin_employer_id_user_id_792b819d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_pending_moderators
    ADD CONSTRAINT employer_employer_pendin_employer_id_user_id_792b819d_uniq UNIQUE (employer_id, user_id);
 �   ALTER TABLE ONLY public.employer_employer_pending_moderators DROP CONSTRAINT employer_employer_pendin_employer_id_user_id_792b819d_uniq;
       public            dbrdsubuntume12    false    471    471            �           2606    130875 N   employer_employer_pending_moderators employer_employer_pending_moderators_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_pending_moderators
    ADD CONSTRAINT employer_employer_pending_moderators_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.employer_employer_pending_moderators DROP CONSTRAINT employer_employer_pending_moderators_pkey;
       public            dbrdsubuntume12    false    471            A           2606    85114 (   employer_employer employer_employer_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.employer_employer
    ADD CONSTRAINT employer_employer_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.employer_employer DROP CONSTRAINT employer_employer_pkey;
       public            dbrdsubuntume12    false    222            E           2606    98740 0   employer_employer employer_employer_username_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.employer_employer
    ADD CONSTRAINT employer_employer_username_key UNIQUE (username);
 Z   ALTER TABLE ONLY public.employer_employer DROP CONSTRAINT employer_employer_username_key;
       public            dbrdsubuntume12    false    222            ^           2606    100155 R   employer_jobpost_applied employer_jobpost_applied_jobpost_id_user_id_4548eca7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost_applied
    ADD CONSTRAINT employer_jobpost_applied_jobpost_id_user_id_4548eca7_uniq UNIQUE (jobpost_id, user_id);
 |   ALTER TABLE ONLY public.employer_jobpost_applied DROP CONSTRAINT employer_jobpost_applied_jobpost_id_user_id_4548eca7_uniq;
       public            dbrdsubuntume12    false    431    431            `           2606    100153 6   employer_jobpost_applied employer_jobpost_applied_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.employer_jobpost_applied
    ADD CONSTRAINT employer_jobpost_applied_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.employer_jobpost_applied DROP CONSTRAINT employer_jobpost_applied_pkey;
       public            dbrdsubuntume12    false    431            K           2606    85151 &   employer_jobpost employer_jobpost_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.employer_jobpost
    ADD CONSTRAINT employer_jobpost_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.employer_jobpost DROP CONSTRAINT employer_jobpost_pkey;
       public            dbrdsubuntume12    false    224            &           2606    98683 P   follow_friends_follower follow_friends_follower_friends_id_user_id_ee7ac9e7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_follower
    ADD CONSTRAINT follow_friends_follower_friends_id_user_id_ee7ac9e7_uniq UNIQUE (friends_id, user_id);
 z   ALTER TABLE ONLY public.follow_friends_follower DROP CONSTRAINT follow_friends_follower_friends_id_user_id_ee7ac9e7_uniq;
       public            dbrdsubuntume12    false    407    407            (           2606    98652 4   follow_friends_follower follow_friends_follower_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.follow_friends_follower
    ADD CONSTRAINT follow_friends_follower_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.follow_friends_follower DROP CONSTRAINT follow_friends_follower_pkey;
       public            dbrdsubuntume12    false    407            ,           2606    98697 R   follow_friends_following follow_friends_following_friends_id_user_id_e0aaefdf_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_following
    ADD CONSTRAINT follow_friends_following_friends_id_user_id_e0aaefdf_uniq UNIQUE (friends_id, user_id);
 |   ALTER TABLE ONLY public.follow_friends_following DROP CONSTRAINT follow_friends_following_friends_id_user_id_e0aaefdf_uniq;
       public            dbrdsubuntume12    false    409    409            .           2606    98660 6   follow_friends_following follow_friends_following_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.follow_friends_following
    ADD CONSTRAINT follow_friends_following_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.follow_friends_following DROP CONSTRAINT follow_friends_following_pkey;
       public            dbrdsubuntume12    false    409            !           2606    98642 "   follow_friends follow_friends_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.follow_friends
    ADD CONSTRAINT follow_friends_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.follow_friends DROP CONSTRAINT follow_friends_pkey;
       public            dbrdsubuntume12    false    405            2           2606    98711 \   follow_friends_to_be_follower follow_friends_to_be_follower_friends_id_user_id_74bfa56d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_follower
    ADD CONSTRAINT follow_friends_to_be_follower_friends_id_user_id_74bfa56d_uniq UNIQUE (friends_id, user_id);
 �   ALTER TABLE ONLY public.follow_friends_to_be_follower DROP CONSTRAINT follow_friends_to_be_follower_friends_id_user_id_74bfa56d_uniq;
       public            dbrdsubuntume12    false    411    411            4           2606    98668 @   follow_friends_to_be_follower follow_friends_to_be_follower_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.follow_friends_to_be_follower
    ADD CONSTRAINT follow_friends_to_be_follower_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.follow_friends_to_be_follower DROP CONSTRAINT follow_friends_to_be_follower_pkey;
       public            dbrdsubuntume12    false    411            8           2606    98725 ^   follow_friends_to_be_following follow_friends_to_be_following_friends_id_user_id_0e750fc9_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_following
    ADD CONSTRAINT follow_friends_to_be_following_friends_id_user_id_0e750fc9_uniq UNIQUE (friends_id, user_id);
 �   ALTER TABLE ONLY public.follow_friends_to_be_following DROP CONSTRAINT follow_friends_to_be_following_friends_id_user_id_0e750fc9_uniq;
       public            dbrdsubuntume12    false    413    413            :           2606    98676 B   follow_friends_to_be_following follow_friends_to_be_following_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_following
    ADD CONSTRAINT follow_friends_to_be_following_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.follow_friends_to_be_following DROP CONSTRAINT follow_friends_to_be_following_pkey;
       public            dbrdsubuntume12    false    413            #           2606    98644 )   follow_friends follow_friends_user_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.follow_friends
    ADD CONSTRAINT follow_friends_user_id_key UNIQUE (user_id);
 S   ALTER TABLE ONLY public.follow_friends DROP CONSTRAINT follow_friends_user_id_key;
       public            dbrdsubuntume12    false    405            V           2606    99250 8   followfollowing_blockedby followfollowing_blockedby_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.followfollowing_blockedby
    ADD CONSTRAINT followfollowing_blockedby_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.followfollowing_blockedby DROP CONSTRAINT followfollowing_blockedby_pkey;
       public            dbrdsubuntume12    false    427            R           2606    99242 8   followfollowing_blocklist followfollowing_blocklist_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.followfollowing_blocklist
    ADD CONSTRAINT followfollowing_blocklist_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.followfollowing_blocklist DROP CONSTRAINT followfollowing_blocklist_pkey;
       public            dbrdsubuntume12    false    425            >           2606    98815 8   followfollowing_followers followfollowing_followers_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.followfollowing_followers
    ADD CONSTRAINT followfollowing_followers_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.followfollowing_followers DROP CONSTRAINT followfollowing_followers_pkey;
       public            dbrdsubuntume12    false    415            B           2606    98823 :   followfollowing_followings followfollowing_followings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.followfollowing_followings
    ADD CONSTRAINT followfollowing_followings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.followfollowing_followings DROP CONSTRAINT followfollowing_followings_pkey;
       public            dbrdsubuntume12    false    417            E           2606    98831 4   followfollowing_friends followfollowing_friends_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.followfollowing_friends
    ADD CONSTRAINT followfollowing_friends_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.followfollowing_friends DROP CONSTRAINT followfollowing_friends_pkey;
       public            dbrdsubuntume12    false    419            G           2606    98849 ;   followfollowing_friends followfollowing_friends_user_id_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.followfollowing_friends
    ADD CONSTRAINT followfollowing_friends_user_id_key UNIQUE (user_id);
 e   ALTER TABLE ONLY public.followfollowing_friends DROP CONSTRAINT followfollowing_friends_user_id_key;
       public            dbrdsubuntume12    false    419            N           2606    98847 @   followfollowing_tobefollowers followfollowing_tobefollowers_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.followfollowing_tobefollowers
    ADD CONSTRAINT followfollowing_tobefollowers_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.followfollowing_tobefollowers DROP CONSTRAINT followfollowing_tobefollowers_pkey;
       public            dbrdsubuntume12    false    423            J           2606    98839 B   followfollowing_tobefollowings followfollowing_tobefollowings_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_tobefollowings
    ADD CONSTRAINT followfollowing_tobefollowings_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.followfollowing_tobefollowings DROP CONSTRAINT followfollowing_tobefollowings_pkey;
       public            dbrdsubuntume12    false    421            �           2606    85825 ,   jobs_armyexperience jobs_amryexperience_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.jobs_armyexperience
    ADD CONSTRAINT jobs_amryexperience_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.jobs_armyexperience DROP CONSTRAINT jobs_amryexperience_pkey;
       public            dbrdsubuntume12    false    254            c           2606    112575 &   jobs_benefitlist jobs_benefitlist_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jobs_benefitlist
    ADD CONSTRAINT jobs_benefitlist_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jobs_benefitlist DROP CONSTRAINT jobs_benefitlist_pkey;
       public            dbrdsubuntume12    false    433            e           2606    112583 (   jobs_businesslist jobs_businesslist_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.jobs_businesslist
    ADD CONSTRAINT jobs_businesslist_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.jobs_businesslist DROP CONSTRAINT jobs_businesslist_pkey;
       public            dbrdsubuntume12    false    435            �           2606    118532    jobs_city jobs_city_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.jobs_city
    ADD CONSTRAINT jobs_city_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.jobs_city DROP CONSTRAINT jobs_city_pkey;
       public            dbrdsubuntume12    false    467            �           2606    118508 "   jobs_continent jobs_continent_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jobs_continent
    ADD CONSTRAINT jobs_continent_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jobs_continent DROP CONSTRAINT jobs_continent_pkey;
       public            dbrdsubuntume12    false    461            �           2606    118516    jobs_country jobs_country_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jobs_country
    ADD CONSTRAINT jobs_country_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jobs_country DROP CONSTRAINT jobs_country_pkey;
       public            dbrdsubuntume12    false    463            �           2606    116538 (   jobs_degreeorexam jobs_degreeorexam_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.jobs_degreeorexam
    ADD CONSTRAINT jobs_degreeorexam_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.jobs_degreeorexam DROP CONSTRAINT jobs_degreeorexam_pkey;
       public            dbrdsubuntume12    false    455            h           2606    85302 I   jobs_disability_information jobs_disability_information_jobprofile_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.jobs_disability_information
    ADD CONSTRAINT jobs_disability_information_jobprofile_id_key UNIQUE (jobprofile_id);
 s   ALTER TABLE ONLY public.jobs_disability_information DROP CONSTRAINT jobs_disability_information_jobprofile_id_key;
       public            dbrdsubuntume12    false    242            j           2606    85300 <   jobs_disability_information jobs_disability_information_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.jobs_disability_information
    ADD CONSTRAINT jobs_disability_information_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.jobs_disability_information DROP CONSTRAINT jobs_disability_information_pkey;
       public            dbrdsubuntume12    false    242            �           2606    116546 ,   jobs_educationlevel jobs_educationlevel_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.jobs_educationlevel
    ADD CONSTRAINT jobs_educationlevel_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.jobs_educationlevel DROP CONSTRAINT jobs_educationlevel_pkey;
       public            dbrdsubuntume12    false    457            f           2606    85289 0   jobs_educationprofile jobs_educationprofile_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.jobs_educationprofile
    ADD CONSTRAINT jobs_educationprofile_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.jobs_educationprofile DROP CONSTRAINT jobs_educationprofile_pkey;
       public            dbrdsubuntume12    false    240            c           2606    85278 $   jobs_experience jobs_experience_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jobs_experience
    ADD CONSTRAINT jobs_experience_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jobs_experience DROP CONSTRAINT jobs_experience_pkey;
       public            dbrdsubuntume12    false    238            g           2606    112591 ,   jobs_experiencelist jobs_experiencelist_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.jobs_experiencelist
    ADD CONSTRAINT jobs_experiencelist_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.jobs_experiencelist DROP CONSTRAINT jobs_experiencelist_pkey;
       public            dbrdsubuntume12    false    437            i           2606    112599 :   jobs_functionaljobcategory jobs_functionaljobcategory_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.jobs_functionaljobcategory
    ADD CONSTRAINT jobs_functionaljobcategory_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.jobs_functionaljobcategory DROP CONSTRAINT jobs_functionaljobcategory_pkey;
       public            dbrdsubuntume12    false    439            k           2606    112607 0   jobs_industrycategory jobs_industrycategory_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.jobs_industrycategory
    ADD CONSTRAINT jobs_industrycategory_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.jobs_industrycategory DROP CONSTRAINT jobs_industrycategory_pkey;
       public            dbrdsubuntume12    false    441            m           2606    112615 ,   jobs_instituionlist jobs_instituionlist_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.jobs_instituionlist
    ADD CONSTRAINT jobs_instituionlist_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.jobs_instituionlist DROP CONSTRAINT jobs_instituionlist_pkey;
       public            dbrdsubuntume12    false    443            u           2606    112701 ^   jobs_jobprofile_job_categories jobs_jobprofile_job_cate_jobprofile_id_functional_2f61031f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories
    ADD CONSTRAINT jobs_jobprofile_job_cate_jobprofile_id_functional_2f61031f_uniq UNIQUE (jobprofile_id, functionaljobcategory_id);
 �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories DROP CONSTRAINT jobs_jobprofile_job_cate_jobprofile_id_functional_2f61031f_uniq;
       public            dbrdsubuntume12    false    451    451            y           2606    112691 B   jobs_jobprofile_job_categories jobs_jobprofile_job_categories_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories
    ADD CONSTRAINT jobs_jobprofile_job_categories_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.jobs_jobprofile_job_categories DROP CONSTRAINT jobs_jobprofile_job_categories_pkey;
       public            dbrdsubuntume12    false    451            O           2606    85185 $   jobs_jobprofile jobs_jobprofile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jobs_jobprofile
    ADD CONSTRAINT jobs_jobprofile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jobs_jobprofile DROP CONSTRAINT jobs_jobprofile_pkey;
       public            dbrdsubuntume12    false    226            {           2606    112715 ^   jobs_jobprofile_special_skills jobs_jobprofile_special__jobprofile_id_specialski_6abd0727_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills
    ADD CONSTRAINT jobs_jobprofile_special__jobprofile_id_specialski_6abd0727_uniq UNIQUE (jobprofile_id, specialskillcategory_id);
 �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills DROP CONSTRAINT jobs_jobprofile_special__jobprofile_id_specialski_6abd0727_uniq;
       public            dbrdsubuntume12    false    453    453            ~           2606    112699 B   jobs_jobprofile_special_skills jobs_jobprofile_special_skills_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills
    ADD CONSTRAINT jobs_jobprofile_special_skills_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.jobs_jobprofile_special_skills DROP CONSTRAINT jobs_jobprofile_special_skills_pkey;
       public            dbrdsubuntume12    false    453            Q           2606    85262 +   jobs_jobprofile jobs_jobprofile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.jobs_jobprofile
    ADD CONSTRAINT jobs_jobprofile_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.jobs_jobprofile DROP CONSTRAINT jobs_jobprofile_user_id_key;
       public            dbrdsubuntume12    false    226            �           2606    116554    jobs_majorin jobs_majorin_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jobs_majorin
    ADD CONSTRAINT jobs_majorin_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jobs_majorin DROP CONSTRAINT jobs_majorin_pkey;
       public            dbrdsubuntume12    false    459            o           2606    112631 0   jobs_organizationtype jobs_organizationtype_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.jobs_organizationtype
    ADD CONSTRAINT jobs_organizationtype_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.jobs_organizationtype DROP CONSTRAINT jobs_organizationtype_pkey;
       public            dbrdsubuntume12    false    445            `           2606    85252 @   jobs_professional_certificate jobs_professional_certificate_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.jobs_professional_certificate
    ADD CONSTRAINT jobs_professional_certificate_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.jobs_professional_certificate DROP CONSTRAINT jobs_professional_certificate_pkey;
       public            dbrdsubuntume12    false    236            ]           2606    85244 *   jobs_project_works jobs_project_works_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.jobs_project_works
    ADD CONSTRAINT jobs_project_works_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.jobs_project_works DROP CONSTRAINT jobs_project_works_pkey;
       public            dbrdsubuntume12    false    234            Z           2606    85233 "   jobs_reference jobs_reference_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jobs_reference
    ADD CONSTRAINT jobs_reference_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jobs_reference DROP CONSTRAINT jobs_reference_pkey;
       public            dbrdsubuntume12    false    232            W           2606    85222    jobs_skills jobs_skills_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.jobs_skills DROP CONSTRAINT jobs_skills_pkey;
       public            dbrdsubuntume12    false    230            q           2606    112639 $   jobs_skillslist jobs_skillslist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jobs_skillslist
    ADD CONSTRAINT jobs_skillslist_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jobs_skillslist DROP CONSTRAINT jobs_skillslist_pkey;
       public            dbrdsubuntume12    false    447            s           2606    112647 8   jobs_specialskillcategory jobs_specialskillcategory_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.jobs_specialskillcategory
    ADD CONSTRAINT jobs_specialskillcategory_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.jobs_specialskillcategory DROP CONSTRAINT jobs_specialskillcategory_pkey;
       public            dbrdsubuntume12    false    449            �           2606    118524    jobs_state jobs_state_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.jobs_state
    ADD CONSTRAINT jobs_state_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.jobs_state DROP CONSTRAINT jobs_state_pkey;
       public            dbrdsubuntume12    false    465            T           2606    85214     jobs_training jobs_training_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jobs_training
    ADD CONSTRAINT jobs_training_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jobs_training DROP CONSTRAINT jobs_training_pkey;
       public            dbrdsubuntume12    false    228            p           2606    85403 .   metrimony_expectaion metrimony_expectaion_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.metrimony_expectaion
    ADD CONSTRAINT metrimony_expectaion_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.metrimony_expectaion DROP CONSTRAINT metrimony_expectaion_pkey;
       public            dbrdsubuntume12    false    246            r           2606    85405 5   metrimony_expectaion metrimony_expectaion_user_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.metrimony_expectaion
    ADD CONSTRAINT metrimony_expectaion_user_id_key UNIQUE (user_id);
 _   ALTER TABLE ONLY public.metrimony_expectaion DROP CONSTRAINT metrimony_expectaion_user_id_key;
       public            dbrdsubuntume12    false    246            �           2606    139606 6   metrimony_matriblockedby metrimony_matriblockedby_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.metrimony_matriblockedby
    ADD CONSTRAINT metrimony_matriblockedby_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.metrimony_matriblockedby DROP CONSTRAINT metrimony_matriblockedby_pkey;
       public            dbrdsubuntume12    false    505            �           2606    139598 6   metrimony_matriblocklist metrimony_matriblocklist_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.metrimony_matriblocklist
    ADD CONSTRAINT metrimony_matriblocklist_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.metrimony_matriblocklist DROP CONSTRAINT metrimony_matriblocklist_pkey;
       public            dbrdsubuntume12    false    503            �           2606    135945 ^   metrimony_personal_info_viewed metrimony_personal_info__personal_info_id_user_id_070f259b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_070f259b_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_viewed DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_070f259b_uniq;
       public            dbrdsubuntume12    false    479    479            �           2606    135923 a   metrimony_personal_info_viewed_by metrimony_personal_info__personal_info_id_user_id_2680667b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_2680667b_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_2680667b_uniq;
       public            dbrdsubuntume12    false    477    477            �           2606    135991 b   metrimony_personal_info_interested metrimony_personal_info__personal_info_id_user_id_4918f697_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_4918f697_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_interested DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_4918f697_uniq;
       public            dbrdsubuntume12    false    481    481            �           2606    131720 e   metrimony_personal_info_privary_limit metrimony_personal_info__personal_info_id_user_id_6220af76_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_6220af76_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_6220af76_uniq;
       public            dbrdsubuntume12    false    473    473            �           2606    136005 e   metrimony_personal_info_interested_by metrimony_personal_info__personal_info_id_user_id_ca64e77c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_ca64e77c_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_ca64e77c_uniq;
       public            dbrdsubuntume12    false    483    483            �           2606    136019 m   metrimony_personal_info_pending_interested_by metrimony_personal_info__personal_info_id_user_id_edba2012_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_edba2012_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_edba2012_uniq;
       public            dbrdsubuntume12    false    485    485            �           2606    136033 c   metrimony_personal_info_shortlisted metrimony_personal_info__personal_info_id_user_id_fffb882b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted
    ADD CONSTRAINT metrimony_personal_info__personal_info_id_user_id_fffb882b_uniq UNIQUE (personal_info_id, user_id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted DROP CONSTRAINT metrimony_personal_info__personal_info_id_user_id_fffb882b_uniq;
       public            dbrdsubuntume12    false    487    487            �           2606    135973 P   metrimony_personal_info_interested_by metrimony_personal_info_interested_by_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by
    ADD CONSTRAINT metrimony_personal_info_interested_by_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.metrimony_personal_info_interested_by DROP CONSTRAINT metrimony_personal_info_interested_by_pkey;
       public            dbrdsubuntume12    false    483            �           2606    135965 J   metrimony_personal_info_interested metrimony_personal_info_interested_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested
    ADD CONSTRAINT metrimony_personal_info_interested_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.metrimony_personal_info_interested DROP CONSTRAINT metrimony_personal_info_interested_pkey;
       public            dbrdsubuntume12    false    481            �           2606    135981 `   metrimony_personal_info_pending_interested_by metrimony_personal_info_pending_interested_by_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by
    ADD CONSTRAINT metrimony_personal_info_pending_interested_by_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by DROP CONSTRAINT metrimony_personal_info_pending_interested_by_pkey;
       public            dbrdsubuntume12    false    485            l           2606    85390 4   metrimony_personal_info metrimony_personal_info_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.metrimony_personal_info
    ADD CONSTRAINT metrimony_personal_info_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.metrimony_personal_info DROP CONSTRAINT metrimony_personal_info_pkey;
       public            dbrdsubuntume12    false    244            �           2606    131708 P   metrimony_personal_info_privary_limit metrimony_personal_info_privary_limit_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit
    ADD CONSTRAINT metrimony_personal_info_privary_limit_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit DROP CONSTRAINT metrimony_personal_info_privary_limit_pkey;
       public            dbrdsubuntume12    false    473            �           2606    135989 L   metrimony_personal_info_shortlisted metrimony_personal_info_shortlisted_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted
    ADD CONSTRAINT metrimony_personal_info_shortlisted_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted DROP CONSTRAINT metrimony_personal_info_shortlisted_pkey;
       public            dbrdsubuntume12    false    487            n           2606    85392 ;   metrimony_personal_info metrimony_personal_info_user_id_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.metrimony_personal_info
    ADD CONSTRAINT metrimony_personal_info_user_id_key UNIQUE (user_id);
 e   ALTER TABLE ONLY public.metrimony_personal_info DROP CONSTRAINT metrimony_personal_info_user_id_key;
       public            dbrdsubuntume12    false    244            �           2606    135921 H   metrimony_personal_info_viewed_by metrimony_personal_info_viewed_by_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by
    ADD CONSTRAINT metrimony_personal_info_viewed_by_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by DROP CONSTRAINT metrimony_personal_info_viewed_by_pkey;
       public            dbrdsubuntume12    false    477            �           2606    135943 B   metrimony_personal_info_viewed metrimony_personal_info_viewed_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed
    ADD CONSTRAINT metrimony_personal_info_viewed_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.metrimony_personal_info_viewed DROP CONSTRAINT metrimony_personal_info_viewed_pkey;
       public            dbrdsubuntume12    false    479            �           2606    131718 F   metrimony_visaverification metrimony_visaverification_matrimony_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_visaverification
    ADD CONSTRAINT metrimony_visaverification_matrimony_id_key UNIQUE (matrimony_id);
 p   ALTER TABLE ONLY public.metrimony_visaverification DROP CONSTRAINT metrimony_visaverification_matrimony_id_key;
       public            dbrdsubuntume12    false    475            �           2606    131716 :   metrimony_visaverification metrimony_visaverification_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.metrimony_visaverification
    ADD CONSTRAINT metrimony_visaverification_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.metrimony_visaverification DROP CONSTRAINT metrimony_visaverification_pkey;
       public            dbrdsubuntume12    false    475                       2606    97966 :   notifications_notification notifications_notification_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notification_pkey;
       public            dbrdsubuntume12    false    397            �           2606    93787 *   posts_postcategory posts_postcategory_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.posts_postcategory
    ADD CONSTRAINT posts_postcategory_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.posts_postcategory DROP CONSTRAINT posts_postcategory_pkey;
       public            dbrdsubuntume12    false    373            �           2606    139656 $   reports_reports reports_reports_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.reports_reports
    ADD CONSTRAINT reports_reports_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.reports_reports DROP CONSTRAINT reports_reports_pkey;
       public            dbrdsubuntume12    false    507            /           2606    143729 "   sellbuy_answer sellbuy_answer_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.sellbuy_answer
    ADD CONSTRAINT sellbuy_answer_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.sellbuy_answer DROP CONSTRAINT sellbuy_answer_pkey;
       public            dbrdsubuntume12    false    529                       2606    140052 "   sellbuy_buyers sellbuy_buyers_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.sellbuy_buyers
    ADD CONSTRAINT sellbuy_buyers_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.sellbuy_buyers DROP CONSTRAINT sellbuy_buyers_pkey;
       public            dbrdsubuntume12    false    511                       2606    140060 &   sellbuy_category sellbuy_category_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sellbuy_category
    ADD CONSTRAINT sellbuy_category_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sellbuy_category DROP CONSTRAINT sellbuy_category_pkey;
       public            dbrdsubuntume12    false    513                       2606    139719 0   sellbuy_dealerprofile sellbuy_dealerprofile_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sellbuy_dealerprofile
    ADD CONSTRAINT sellbuy_dealerprofile_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.sellbuy_dealerprofile DROP CONSTRAINT sellbuy_dealerprofile_pkey;
       public            dbrdsubuntume12    false    509            +           2606    143718    sellbuy_faq sellbuy_faq_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sellbuy_faq
    ADD CONSTRAINT sellbuy_faq_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.sellbuy_faq DROP CONSTRAINT sellbuy_faq_pkey;
       public            dbrdsubuntume12    false    527                       2606    140079 .   sellbuy_product_like sellbuy_product_like_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sellbuy_product_like
    ADD CONSTRAINT sellbuy_product_like_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sellbuy_product_like DROP CONSTRAINT sellbuy_product_like_pkey;
       public            dbrdsubuntume12    false    517                       2606    140115 J   sellbuy_product_like sellbuy_product_like_product_id_user_id_ec2adafc_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product_like
    ADD CONSTRAINT sellbuy_product_like_product_id_user_id_ec2adafc_uniq UNIQUE (product_id, user_id);
 t   ALTER TABLE ONLY public.sellbuy_product_like DROP CONSTRAINT sellbuy_product_like_product_id_user_id_ec2adafc_uniq;
       public            dbrdsubuntume12    false    517    517                       2606    140071 $   sellbuy_product sellbuy_product_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.sellbuy_product
    ADD CONSTRAINT sellbuy_product_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.sellbuy_product DROP CONSTRAINT sellbuy_product_pkey;
       public            dbrdsubuntume12    false    515            4           2606    143827 2   sellbuy_productcomment sellbuy_productcomment_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.sellbuy_productcomment
    ADD CONSTRAINT sellbuy_productcomment_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.sellbuy_productcomment DROP CONSTRAINT sellbuy_productcomment_pkey;
       public            dbrdsubuntume12    false    531            '           2606    143707 &   sellbuy_question sellbuy_question_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sellbuy_question
    ADD CONSTRAINT sellbuy_question_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sellbuy_question DROP CONSTRAINT sellbuy_question_pkey;
       public            dbrdsubuntume12    false    525                       2606    143688 4   sellbuy_review_dislikes sellbuy_review_dislikes_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.sellbuy_review_dislikes
    ADD CONSTRAINT sellbuy_review_dislikes_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.sellbuy_review_dislikes DROP CONSTRAINT sellbuy_review_dislikes_pkey;
       public            dbrdsubuntume12    false    521                       2606    143749 O   sellbuy_review_dislikes sellbuy_review_dislikes_review_id_user_id_da1d52e1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review_dislikes
    ADD CONSTRAINT sellbuy_review_dislikes_review_id_user_id_da1d52e1_uniq UNIQUE (review_id, user_id);
 y   ALTER TABLE ONLY public.sellbuy_review_dislikes DROP CONSTRAINT sellbuy_review_dislikes_review_id_user_id_da1d52e1_uniq;
       public            dbrdsubuntume12    false    521    521            !           2606    143696 .   sellbuy_review_likes sellbuy_review_likes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sellbuy_review_likes
    ADD CONSTRAINT sellbuy_review_likes_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sellbuy_review_likes DROP CONSTRAINT sellbuy_review_likes_pkey;
       public            dbrdsubuntume12    false    523            $           2606    143763 I   sellbuy_review_likes sellbuy_review_likes_review_id_user_id_f0d3dd88_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review_likes
    ADD CONSTRAINT sellbuy_review_likes_review_id_user_id_f0d3dd88_uniq UNIQUE (review_id, user_id);
 s   ALTER TABLE ONLY public.sellbuy_review_likes DROP CONSTRAINT sellbuy_review_likes_review_id_user_id_f0d3dd88_uniq;
       public            dbrdsubuntume12    false    523    523                       2606    143680 "   sellbuy_review sellbuy_review_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.sellbuy_review
    ADD CONSTRAINT sellbuy_review_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.sellbuy_review DROP CONSTRAINT sellbuy_review_pkey;
       public            dbrdsubuntume12    false    519            �           2606    139258 0   sellbuy_sellerprofile sellbuy_sellerprofile_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sellbuy_sellerprofile
    ADD CONSTRAINT sellbuy_sellerprofile_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.sellbuy_sellerprofile DROP CONSTRAINT sellbuy_sellerprofile_pkey;
       public            dbrdsubuntume12    false    493            �           2606    139260 7   sellbuy_sellerprofile sellbuy_sellerprofile_user_id_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.sellbuy_sellerprofile
    ADD CONSTRAINT sellbuy_sellerprofile_user_id_key UNIQUE (user_id);
 a   ALTER TABLE ONLY public.sellbuy_sellerprofile DROP CONSTRAINT sellbuy_sellerprofile_user_id_key;
       public            dbrdsubuntume12    false    493                       2606    91079 (   social_activity social_activity_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.social_activity
    ADD CONSTRAINT social_activity_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.social_activity DROP CONSTRAINT social_activity_name_key;
       public            dbrdsubuntume12    false    306                       2606    91077 $   social_activity social_activity_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.social_activity
    ADD CONSTRAINT social_activity_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.social_activity DROP CONSTRAINT social_activity_pkey;
       public            dbrdsubuntume12    false    306                       2606    91089 *   social_backgroud social_backgroud_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.social_backgroud
    ADD CONSTRAINT social_backgroud_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.social_backgroud DROP CONSTRAINT social_backgroud_name_key;
       public            dbrdsubuntume12    false    308                       2606    91087 &   social_backgroud social_backgroud_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.social_backgroud
    ADD CONSTRAINT social_backgroud_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.social_backgroud DROP CONSTRAINT social_backgroud_pkey;
       public            dbrdsubuntume12    false    308                       2606    91099 (   social_category social_category_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.social_category
    ADD CONSTRAINT social_category_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.social_category DROP CONSTRAINT social_category_name_key;
       public            dbrdsubuntume12    false    310                       2606    91097 $   social_category social_category_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.social_category
    ADD CONSTRAINT social_category_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.social_category DROP CONSTRAINT social_category_pkey;
       public            dbrdsubuntume12    false    310                       2606    91109 (   social_check_in social_check_in_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.social_check_in
    ADD CONSTRAINT social_check_in_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.social_check_in DROP CONSTRAINT social_check_in_name_key;
       public            dbrdsubuntume12    false    312                        2606    91107 $   social_check_in social_check_in_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.social_check_in
    ADD CONSTRAINT social_check_in_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.social_check_in DROP CONSTRAINT social_check_in_pkey;
       public            dbrdsubuntume12    false    312            #           2606    91119 &   social_feeling social_feeling_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.social_feeling
    ADD CONSTRAINT social_feeling_name_key UNIQUE (name);
 P   ALTER TABLE ONLY public.social_feeling DROP CONSTRAINT social_feeling_name_key;
       public            dbrdsubuntume12    false    314            %           2606    91117 "   social_feeling social_feeling_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.social_feeling
    ADD CONSTRAINT social_feeling_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.social_feeling DROP CONSTRAINT social_feeling_pkey;
       public            dbrdsubuntume12    false    314            (           2606    91129    social_gif social_gif_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.social_gif
    ADD CONSTRAINT social_gif_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.social_gif DROP CONSTRAINT social_gif_name_key;
       public            dbrdsubuntume12    false    316            *           2606    91127    social_gif social_gif_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.social_gif
    ADD CONSTRAINT social_gif_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.social_gif DROP CONSTRAINT social_gif_pkey;
       public            dbrdsubuntume12    false    316            -           2606    91139 *   social_lifeevent social_lifeevent_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.social_lifeevent
    ADD CONSTRAINT social_lifeevent_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.social_lifeevent DROP CONSTRAINT social_lifeevent_name_key;
       public            dbrdsubuntume12    false    318            /           2606    91137 &   social_lifeevent social_lifeevent_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.social_lifeevent
    ADD CONSTRAINT social_lifeevent_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.social_lifeevent DROP CONSTRAINT social_lifeevent_pkey;
       public            dbrdsubuntume12    false    318            �           2606    87078 2   social_post_activity social_post_activity_name_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.social_post_activity
    ADD CONSTRAINT social_post_activity_name_key UNIQUE (name);
 \   ALTER TABLE ONLY public.social_post_activity DROP CONSTRAINT social_post_activity_name_key;
       public            dbrdsubuntume12    false    284            �           2606    87076 .   social_post_activity social_post_activity_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.social_post_activity
    ADD CONSTRAINT social_post_activity_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.social_post_activity DROP CONSTRAINT social_post_activity_pkey;
       public            dbrdsubuntume12    false    284            �           2606    87088 4   social_post_backgroud social_post_backgroud_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.social_post_backgroud
    ADD CONSTRAINT social_post_backgroud_name_key UNIQUE (name);
 ^   ALTER TABLE ONLY public.social_post_backgroud DROP CONSTRAINT social_post_backgroud_name_key;
       public            dbrdsubuntume12    false    286            �           2606    87086 0   social_post_backgroud social_post_backgroud_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.social_post_backgroud
    ADD CONSTRAINT social_post_backgroud_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.social_post_backgroud DROP CONSTRAINT social_post_backgroud_pkey;
       public            dbrdsubuntume12    false    286            �           2606    87098 2   social_post_category social_post_category_name_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.social_post_category
    ADD CONSTRAINT social_post_category_name_key UNIQUE (name);
 \   ALTER TABLE ONLY public.social_post_category DROP CONSTRAINT social_post_category_name_key;
       public            dbrdsubuntume12    false    288            �           2606    87096 .   social_post_category social_post_category_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.social_post_category
    ADD CONSTRAINT social_post_category_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.social_post_category DROP CONSTRAINT social_post_category_pkey;
       public            dbrdsubuntume12    false    288            �           2606    87108 2   social_post_check_in social_post_check_in_name_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.social_post_check_in
    ADD CONSTRAINT social_post_check_in_name_key UNIQUE (name);
 \   ALTER TABLE ONLY public.social_post_check_in DROP CONSTRAINT social_post_check_in_name_key;
       public            dbrdsubuntume12    false    290            �           2606    87106 .   social_post_check_in social_post_check_in_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.social_post_check_in
    ADD CONSTRAINT social_post_check_in_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.social_post_check_in DROP CONSTRAINT social_post_check_in_pkey;
       public            dbrdsubuntume12    false    290            
           2606    91057 ,   social_post_feels social_post_feels_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.social_post_feels
    ADD CONSTRAINT social_post_feels_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.social_post_feels DROP CONSTRAINT social_post_feels_name_key;
       public            dbrdsubuntume12    false    304                       2606    91055 (   social_post_feels social_post_feels_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.social_post_feels
    ADD CONSTRAINT social_post_feels_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.social_post_feels DROP CONSTRAINT social_post_feels_pkey;
       public            dbrdsubuntume12    false    304            �           2606    87128 (   social_post_gif social_post_gif_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.social_post_gif
    ADD CONSTRAINT social_post_gif_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.social_post_gif DROP CONSTRAINT social_post_gif_name_key;
       public            dbrdsubuntume12    false    292            �           2606    87126 $   social_post_gif social_post_gif_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.social_post_gif
    ADD CONSTRAINT social_post_gif_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.social_post_gif DROP CONSTRAINT social_post_gif_pkey;
       public            dbrdsubuntume12    false    292            �           2606    87138 4   social_post_lifeevent social_post_lifeevent_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.social_post_lifeevent
    ADD CONSTRAINT social_post_lifeevent_name_key UNIQUE (name);
 ^   ALTER TABLE ONLY public.social_post_lifeevent DROP CONSTRAINT social_post_lifeevent_name_key;
       public            dbrdsubuntume12    false    294            �           2606    87136 0   social_post_lifeevent social_post_lifeevent_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.social_post_lifeevent
    ADD CONSTRAINT social_post_lifeevent_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.social_post_lifeevent DROP CONSTRAINT social_post_lifeevent_pkey;
       public            dbrdsubuntume12    false    294            �           2606    87148 0   social_post_privacy social_post_privacy_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.social_post_privacy
    ADD CONSTRAINT social_post_privacy_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.social_post_privacy DROP CONSTRAINT social_post_privacy_name_key;
       public            dbrdsubuntume12    false    296            �           2606    87146 ,   social_post_privacy social_post_privacy_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.social_post_privacy
    ADD CONSTRAINT social_post_privacy_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.social_post_privacy DROP CONSTRAINT social_post_privacy_pkey;
       public            dbrdsubuntume12    false    296            �           2606    86919 Y   social_post_socialpost_angry social_post_socialpost_a_socialpost_id_user_id_aa3809af_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_angry
    ADD CONSTRAINT social_post_socialpost_a_socialpost_id_user_id_aa3809af_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_angry DROP CONSTRAINT social_post_socialpost_a_socialpost_id_user_id_aa3809af_uniq;
       public            dbrdsubuntume12    false    266    266            �           2606    86839 >   social_post_socialpost_angry social_post_socialpost_angry_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.social_post_socialpost_angry
    ADD CONSTRAINT social_post_socialpost_angry_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.social_post_socialpost_angry DROP CONSTRAINT social_post_socialpost_angry_pkey;
       public            dbrdsubuntume12    false    266            �           2606    86847 <   social_post_socialpost_care social_post_socialpost_care_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.social_post_socialpost_care
    ADD CONSTRAINT social_post_socialpost_care_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.social_post_socialpost_care DROP CONSTRAINT social_post_socialpost_care_pkey;
       public            dbrdsubuntume12    false    268            �           2606    86933 [   social_post_socialpost_care social_post_socialpost_care_socialpost_id_user_id_084f9ed2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_care
    ADD CONSTRAINT social_post_socialpost_care_socialpost_id_user_id_084f9ed2_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_care DROP CONSTRAINT social_post_socialpost_care_socialpost_id_user_id_084f9ed2_uniq;
       public            dbrdsubuntume12    false    268    268            �           2606    86855 <   social_post_socialpost_haha social_post_socialpost_haha_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.social_post_socialpost_haha
    ADD CONSTRAINT social_post_socialpost_haha_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.social_post_socialpost_haha DROP CONSTRAINT social_post_socialpost_haha_pkey;
       public            dbrdsubuntume12    false    270            �           2606    86947 [   social_post_socialpost_haha social_post_socialpost_haha_socialpost_id_user_id_00902ece_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_haha
    ADD CONSTRAINT social_post_socialpost_haha_socialpost_id_user_id_00902ece_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_haha DROP CONSTRAINT social_post_socialpost_haha_socialpost_id_user_id_00902ece_uniq;
       public            dbrdsubuntume12    false    270    270            �           2606    86961 Y   social_post_socialpost_likes social_post_socialpost_l_socialpost_id_user_id_7a11c00b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_likes
    ADD CONSTRAINT social_post_socialpost_l_socialpost_id_user_id_7a11c00b_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_likes DROP CONSTRAINT social_post_socialpost_l_socialpost_id_user_id_7a11c00b_uniq;
       public            dbrdsubuntume12    false    272    272            �           2606    86863 >   social_post_socialpost_likes social_post_socialpost_likes_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.social_post_socialpost_likes
    ADD CONSTRAINT social_post_socialpost_likes_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.social_post_socialpost_likes DROP CONSTRAINT social_post_socialpost_likes_pkey;
       public            dbrdsubuntume12    false    272            �           2606    86871 <   social_post_socialpost_love social_post_socialpost_love_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.social_post_socialpost_love
    ADD CONSTRAINT social_post_socialpost_love_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.social_post_socialpost_love DROP CONSTRAINT social_post_socialpost_love_pkey;
       public            dbrdsubuntume12    false    274            �           2606    86975 [   social_post_socialpost_love social_post_socialpost_love_socialpost_id_user_id_32cbf3d3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_love
    ADD CONSTRAINT social_post_socialpost_love_socialpost_id_user_id_32cbf3d3_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_love DROP CONSTRAINT social_post_socialpost_love_socialpost_id_user_id_32cbf3d3_uniq;
       public            dbrdsubuntume12    false    274    274            �           2606    86831 2   social_post_socialpost social_post_socialpost_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.social_post_socialpost
    ADD CONSTRAINT social_post_socialpost_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.social_post_socialpost DROP CONSTRAINT social_post_socialpost_pkey;
       public            dbrdsubuntume12    false    264            �           2606    87186 ]   social_post_socialpost_shared_by social_post_socialpost_s_socialpost_id_user_id_b923f400_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_shared_by
    ADD CONSTRAINT social_post_socialpost_s_socialpost_id_user_id_b923f400_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_shared_by DROP CONSTRAINT social_post_socialpost_s_socialpost_id_user_id_b923f400_uniq;
       public            dbrdsubuntume12    false    298    298            �           2606    87003 Y   social_post_socialpost_senti social_post_socialpost_s_socialpost_id_user_id_bd5fff03_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_senti
    ADD CONSTRAINT social_post_socialpost_s_socialpost_id_user_id_bd5fff03_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_senti DROP CONSTRAINT social_post_socialpost_s_socialpost_id_user_id_bd5fff03_uniq;
       public            dbrdsubuntume12    false    278    278            �           2606    86879 :   social_post_socialpost_sad social_post_socialpost_sad_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.social_post_socialpost_sad
    ADD CONSTRAINT social_post_socialpost_sad_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.social_post_socialpost_sad DROP CONSTRAINT social_post_socialpost_sad_pkey;
       public            dbrdsubuntume12    false    276            �           2606    86989 Y   social_post_socialpost_sad social_post_socialpost_sad_socialpost_id_user_id_a2fda8f2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_sad
    ADD CONSTRAINT social_post_socialpost_sad_socialpost_id_user_id_a2fda8f2_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_sad DROP CONSTRAINT social_post_socialpost_sad_socialpost_id_user_id_a2fda8f2_uniq;
       public            dbrdsubuntume12    false    276    276            �           2606    86887 >   social_post_socialpost_senti social_post_socialpost_senti_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.social_post_socialpost_senti
    ADD CONSTRAINT social_post_socialpost_senti_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.social_post_socialpost_senti DROP CONSTRAINT social_post_socialpost_senti_pkey;
       public            dbrdsubuntume12    false    278            �           2606    87156 F   social_post_socialpost_shared_by social_post_socialpost_shared_by_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_shared_by
    ADD CONSTRAINT social_post_socialpost_shared_by_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.social_post_socialpost_shared_by DROP CONSTRAINT social_post_socialpost_shared_by_pkey;
       public            dbrdsubuntume12    false    298            �           2606    86895 <   social_post_socialpost_tags social_post_socialpost_tags_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.social_post_socialpost_tags
    ADD CONSTRAINT social_post_socialpost_tags_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.social_post_socialpost_tags DROP CONSTRAINT social_post_socialpost_tags_pkey;
       public            dbrdsubuntume12    false    280            �           2606    87017 [   social_post_socialpost_tags social_post_socialpost_tags_socialpost_id_user_id_84c90aec_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_tags
    ADD CONSTRAINT social_post_socialpost_tags_socialpost_id_user_id_84c90aec_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_tags DROP CONSTRAINT social_post_socialpost_tags_socialpost_id_user_id_84c90aec_uniq;
       public            dbrdsubuntume12    false    280    280            �           2606    86911 :   social_post_socialpost_wow social_post_socialpost_wow_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.social_post_socialpost_wow
    ADD CONSTRAINT social_post_socialpost_wow_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.social_post_socialpost_wow DROP CONSTRAINT social_post_socialpost_wow_pkey;
       public            dbrdsubuntume12    false    282            �           2606    87045 Y   social_post_socialpost_wow social_post_socialpost_wow_socialpost_id_user_id_8c04d8e5_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_wow
    ADD CONSTRAINT social_post_socialpost_wow_socialpost_id_user_id_8c04d8e5_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_post_socialpost_wow DROP CONSTRAINT social_post_socialpost_wow_socialpost_id_user_id_8c04d8e5_uniq;
       public            dbrdsubuntume12    false    282    282                       2606    87176 8   social_post_subactivity social_post_subactivity_name_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.social_post_subactivity
    ADD CONSTRAINT social_post_subactivity_name_key UNIQUE (name);
 b   ALTER TABLE ONLY public.social_post_subactivity DROP CONSTRAINT social_post_subactivity_name_key;
       public            dbrdsubuntume12    false    302                       2606    87174 4   social_post_subactivity social_post_subactivity_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.social_post_subactivity
    ADD CONSTRAINT social_post_subactivity_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.social_post_subactivity DROP CONSTRAINT social_post_subactivity_pkey;
       public            dbrdsubuntume12    false    302            �           2606    87166 :   social_post_sublifeevent social_post_sublifeevent_name_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.social_post_sublifeevent
    ADD CONSTRAINT social_post_sublifeevent_name_key UNIQUE (name);
 d   ALTER TABLE ONLY public.social_post_sublifeevent DROP CONSTRAINT social_post_sublifeevent_name_key;
       public            dbrdsubuntume12    false    300                       2606    87164 6   social_post_sublifeevent social_post_sublifeevent_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.social_post_sublifeevent
    ADD CONSTRAINT social_post_sublifeevent_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.social_post_sublifeevent DROP CONSTRAINT social_post_sublifeevent_pkey;
       public            dbrdsubuntume12    false    300            2           2606    91149 +   social_privacymodel social_privacy_name_key 
   CONSTRAINT     f   ALTER TABLE ONLY public.social_privacymodel
    ADD CONSTRAINT social_privacy_name_key UNIQUE (name);
 U   ALTER TABLE ONLY public.social_privacymodel DROP CONSTRAINT social_privacy_name_key;
       public            dbrdsubuntume12    false    320            4           2606    91147 '   social_privacymodel social_privacy_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.social_privacymodel
    ADD CONSTRAINT social_privacy_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.social_privacymodel DROP CONSTRAINT social_privacy_pkey;
       public            dbrdsubuntume12    false    320            B           2606    91202 &   social_reactions social_reactions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.social_reactions
    ADD CONSTRAINT social_reactions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.social_reactions DROP CONSTRAINT social_reactions_pkey;
       public            dbrdsubuntume12    false    326            �           2606    91866 *   social_socialphoto social_socialphoto_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.social_socialphoto
    ADD CONSTRAINT social_socialphoto_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.social_socialphoto DROP CONSTRAINT social_socialphoto_pkey;
       public            dbrdsubuntume12    false    352            Q           2606    91221 4   social_socialpost_angry social_socialpost_angry_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.social_socialpost_angry
    ADD CONSTRAINT social_socialpost_angry_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.social_socialpost_angry DROP CONSTRAINT social_socialpost_angry_pkey;
       public            dbrdsubuntume12    false    330            T           2606    91361 S   social_socialpost_angry social_socialpost_angry_socialpost_id_user_id_4571d245_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_angry
    ADD CONSTRAINT social_socialpost_angry_socialpost_id_user_id_4571d245_uniq UNIQUE (socialpost_id, user_id);
 }   ALTER TABLE ONLY public.social_socialpost_angry DROP CONSTRAINT social_socialpost_angry_socialpost_id_user_id_4571d245_uniq;
       public            dbrdsubuntume12    false    330    330            W           2606    91229 2   social_socialpost_care social_socialpost_care_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.social_socialpost_care
    ADD CONSTRAINT social_socialpost_care_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.social_socialpost_care DROP CONSTRAINT social_socialpost_care_pkey;
       public            dbrdsubuntume12    false    332            Z           2606    91375 Q   social_socialpost_care social_socialpost_care_socialpost_id_user_id_2bf4f0fd_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_care
    ADD CONSTRAINT social_socialpost_care_socialpost_id_user_id_2bf4f0fd_uniq UNIQUE (socialpost_id, user_id);
 {   ALTER TABLE ONLY public.social_socialpost_care DROP CONSTRAINT social_socialpost_care_socialpost_id_user_id_2bf4f0fd_uniq;
       public            dbrdsubuntume12    false    332    332            ]           2606    91237 2   social_socialpost_haha social_socialpost_haha_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.social_socialpost_haha
    ADD CONSTRAINT social_socialpost_haha_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.social_socialpost_haha DROP CONSTRAINT social_socialpost_haha_pkey;
       public            dbrdsubuntume12    false    334            `           2606    91389 Q   social_socialpost_haha social_socialpost_haha_socialpost_id_user_id_a8225495_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_haha
    ADD CONSTRAINT social_socialpost_haha_socialpost_id_user_id_a8225495_uniq UNIQUE (socialpost_id, user_id);
 {   ALTER TABLE ONLY public.social_socialpost_haha DROP CONSTRAINT social_socialpost_haha_socialpost_id_user_id_a8225495_uniq;
       public            dbrdsubuntume12    false    334    334            c           2606    91245 4   social_socialpost_likes social_socialpost_likes_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.social_socialpost_likes
    ADD CONSTRAINT social_socialpost_likes_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.social_socialpost_likes DROP CONSTRAINT social_socialpost_likes_pkey;
       public            dbrdsubuntume12    false    336            f           2606    91403 S   social_socialpost_likes social_socialpost_likes_socialpost_id_user_id_1553d28d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_likes
    ADD CONSTRAINT social_socialpost_likes_socialpost_id_user_id_1553d28d_uniq UNIQUE (socialpost_id, user_id);
 }   ALTER TABLE ONLY public.social_socialpost_likes DROP CONSTRAINT social_socialpost_likes_socialpost_id_user_id_1553d28d_uniq;
       public            dbrdsubuntume12    false    336    336            i           2606    91253 2   social_socialpost_love social_socialpost_love_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.social_socialpost_love
    ADD CONSTRAINT social_socialpost_love_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.social_socialpost_love DROP CONSTRAINT social_socialpost_love_pkey;
       public            dbrdsubuntume12    false    338            l           2606    91417 Q   social_socialpost_love social_socialpost_love_socialpost_id_user_id_fc567020_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_love
    ADD CONSTRAINT social_socialpost_love_socialpost_id_user_id_fc567020_uniq UNIQUE (socialpost_id, user_id);
 {   ALTER TABLE ONLY public.social_socialpost_love DROP CONSTRAINT social_socialpost_love_socialpost_id_user_id_fc567020_uniq;
       public            dbrdsubuntume12    false    338    338            K           2606    91213 (   social_socialpost social_socialpost_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_pkey;
       public            dbrdsubuntume12    false    328            o           2606    91261 0   social_socialpost_sad social_socialpost_sad_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.social_socialpost_sad
    ADD CONSTRAINT social_socialpost_sad_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.social_socialpost_sad DROP CONSTRAINT social_socialpost_sad_pkey;
       public            dbrdsubuntume12    false    340            r           2606    91431 O   social_socialpost_sad social_socialpost_sad_socialpost_id_user_id_427d415e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_sad
    ADD CONSTRAINT social_socialpost_sad_socialpost_id_user_id_427d415e_uniq UNIQUE (socialpost_id, user_id);
 y   ALTER TABLE ONLY public.social_socialpost_sad DROP CONSTRAINT social_socialpost_sad_socialpost_id_user_id_427d415e_uniq;
       public            dbrdsubuntume12    false    340    340            u           2606    91269 4   social_socialpost_senti social_socialpost_senti_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.social_socialpost_senti
    ADD CONSTRAINT social_socialpost_senti_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.social_socialpost_senti DROP CONSTRAINT social_socialpost_senti_pkey;
       public            dbrdsubuntume12    false    342            x           2606    91445 S   social_socialpost_senti social_socialpost_senti_socialpost_id_user_id_dd04a55d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_senti
    ADD CONSTRAINT social_socialpost_senti_socialpost_id_user_id_dd04a55d_uniq UNIQUE (socialpost_id, user_id);
 }   ALTER TABLE ONLY public.social_socialpost_senti DROP CONSTRAINT social_socialpost_senti_socialpost_id_user_id_dd04a55d_uniq;
       public            dbrdsubuntume12    false    342    342            {           2606    91277 <   social_socialpost_shared_by social_socialpost_shared_by_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.social_socialpost_shared_by
    ADD CONSTRAINT social_socialpost_shared_by_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.social_socialpost_shared_by DROP CONSTRAINT social_socialpost_shared_by_pkey;
       public            dbrdsubuntume12    false    344            ~           2606    91459 [   social_socialpost_shared_by social_socialpost_shared_by_socialpost_id_user_id_69953b28_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_shared_by
    ADD CONSTRAINT social_socialpost_shared_by_socialpost_id_user_id_69953b28_uniq UNIQUE (socialpost_id, user_id);
 �   ALTER TABLE ONLY public.social_socialpost_shared_by DROP CONSTRAINT social_socialpost_shared_by_socialpost_id_user_id_69953b28_uniq;
       public            dbrdsubuntume12    false    344    344            �           2606    91285 2   social_socialpost_tags social_socialpost_tags_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.social_socialpost_tags
    ADD CONSTRAINT social_socialpost_tags_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.social_socialpost_tags DROP CONSTRAINT social_socialpost_tags_pkey;
       public            dbrdsubuntume12    false    346            �           2606    91473 Q   social_socialpost_tags social_socialpost_tags_socialpost_id_user_id_3450a4a2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_tags
    ADD CONSTRAINT social_socialpost_tags_socialpost_id_user_id_3450a4a2_uniq UNIQUE (socialpost_id, user_id);
 {   ALTER TABLE ONLY public.social_socialpost_tags DROP CONSTRAINT social_socialpost_tags_socialpost_id_user_id_3450a4a2_uniq;
       public            dbrdsubuntume12    false    346    346            �           2606    91293 0   social_socialpost_wow social_socialpost_wow_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.social_socialpost_wow
    ADD CONSTRAINT social_socialpost_wow_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.social_socialpost_wow DROP CONSTRAINT social_socialpost_wow_pkey;
       public            dbrdsubuntume12    false    348            �           2606    91487 O   social_socialpost_wow social_socialpost_wow_socialpost_id_user_id_fad39c59_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_wow
    ADD CONSTRAINT social_socialpost_wow_socialpost_id_user_id_fad39c59_uniq UNIQUE (socialpost_id, user_id);
 y   ALTER TABLE ONLY public.social_socialpost_wow DROP CONSTRAINT social_socialpost_wow_socialpost_id_user_id_fad39c59_uniq;
       public            dbrdsubuntume12    false    348    348            �           2606    91837 :   social_socialupdatehistory social_socialupdatehistory_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.social_socialupdatehistory
    ADD CONSTRAINT social_socialupdatehistory_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.social_socialupdatehistory DROP CONSTRAINT social_socialupdatehistory_pkey;
       public            dbrdsubuntume12    false    350            >           2606    91169 .   social_subactivity social_subactivity_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.social_subactivity
    ADD CONSTRAINT social_subactivity_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.social_subactivity DROP CONSTRAINT social_subactivity_name_key;
       public            dbrdsubuntume12    false    324            @           2606    91167 *   social_subactivity social_subactivity_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.social_subactivity
    ADD CONSTRAINT social_subactivity_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.social_subactivity DROP CONSTRAINT social_subactivity_pkey;
       public            dbrdsubuntume12    false    324            8           2606    91159 0   social_sublifeevent social_sublifeevent_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.social_sublifeevent
    ADD CONSTRAINT social_sublifeevent_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.social_sublifeevent DROP CONSTRAINT social_sublifeevent_name_key;
       public            dbrdsubuntume12    false    322            :           2606    91157 ,   social_sublifeevent social_sublifeevent_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.social_sublifeevent
    ADD CONSTRAINT social_sublifeevent_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.social_sublifeevent DROP CONSTRAINT social_sublifeevent_pkey;
       public            dbrdsubuntume12    false    322            x           2606    85477 6   user_management_consumer user_management_consumer_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.user_management_consumer
    ADD CONSTRAINT user_management_consumer_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.user_management_consumer DROP CONSTRAINT user_management_consumer_pkey;
       public            dbrdsubuntume12    false    250            z           2606    85481 =   user_management_consumer user_management_consumer_user_id_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.user_management_consumer
    ADD CONSTRAINT user_management_consumer_user_id_key UNIQUE (user_id);
 g   ALTER TABLE ONLY public.user_management_consumer DROP CONSTRAINT user_management_consumer_user_id_key;
       public            dbrdsubuntume12    false    250            }           2606    85479 >   user_management_consumer user_management_consumer_username_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.user_management_consumer
    ADD CONSTRAINT user_management_consumer_username_key UNIQUE (username);
 h   ALTER TABLE ONLY public.user_management_consumer DROP CONSTRAINT user_management_consumer_username_key;
       public            dbrdsubuntume12    false    250            t           2606    85439 F   user_management_consumerreferred user_management_consumerreferred_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_management_consumerreferred
    ADD CONSTRAINT user_management_consumerreferred_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.user_management_consumerreferred DROP CONSTRAINT user_management_consumerreferred_pkey;
       public            dbrdsubuntume12    false    248            �           2606    86446 *   userapp_coverphoto userapp_coverphoto_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.userapp_coverphoto
    ADD CONSTRAINT userapp_coverphoto_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.userapp_coverphoto DROP CONSTRAINT userapp_coverphoto_pkey;
       public            dbrdsubuntume12    false    260            �           2606    86482 S   userapp_coverphoto_tags userapp_coverphoto_tags_coverphoto_id_user_id_903c039b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.userapp_coverphoto_tags
    ADD CONSTRAINT userapp_coverphoto_tags_coverphoto_id_user_id_903c039b_uniq UNIQUE (coverphoto_id, user_id);
 }   ALTER TABLE ONLY public.userapp_coverphoto_tags DROP CONSTRAINT userapp_coverphoto_tags_coverphoto_id_user_id_903c039b_uniq;
       public            dbrdsubuntume12    false    262    262            �           2606    86454 4   userapp_coverphoto_tags userapp_coverphoto_tags_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.userapp_coverphoto_tags
    ADD CONSTRAINT userapp_coverphoto_tags_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.userapp_coverphoto_tags DROP CONSTRAINT userapp_coverphoto_tags_pkey;
       public            dbrdsubuntume12    false    262            �           2606    86427 .   userapp_profilephoto userapp_profilephoto_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.userapp_profilephoto
    ADD CONSTRAINT userapp_profilephoto_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.userapp_profilephoto DROP CONSTRAINT userapp_profilephoto_pkey;
       public            dbrdsubuntume12    false    256            �           2606    86435 8   userapp_profilephoto_tags userapp_profilephoto_tags_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.userapp_profilephoto_tags
    ADD CONSTRAINT userapp_profilephoto_tags_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.userapp_profilephoto_tags DROP CONSTRAINT userapp_profilephoto_tags_pkey;
       public            dbrdsubuntume12    false    258            �           2606    86462 Y   userapp_profilephoto_tags userapp_profilephoto_tags_profilephoto_id_user_id_ab24b563_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.userapp_profilephoto_tags
    ADD CONSTRAINT userapp_profilephoto_tags_profilephoto_id_user_id_ab24b563_uniq UNIQUE (profilephoto_id, user_id);
 �   ALTER TABLE ONLY public.userapp_profilephoto_tags DROP CONSTRAINT userapp_profilephoto_tags_profilephoto_id_user_id_ab24b563_uniq;
       public            dbrdsubuntume12    false    258    258                       2606    85531 $   userapp_userpro userapp_userpro_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.userapp_userpro
    ADD CONSTRAINT userapp_userpro_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.userapp_userpro DROP CONSTRAINT userapp_userpro_pkey;
       public            dbrdsubuntume12    false    252            �           2606    85533 +   userapp_userpro userapp_userpro_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.userapp_userpro
    ADD CONSTRAINT userapp_userpro_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.userapp_userpro DROP CONSTRAINT userapp_userpro_user_id_key;
       public            dbrdsubuntume12    false    252            �           2606    85535 ,   userapp_userpro userapp_userpro_username_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.userapp_userpro
    ADD CONSTRAINT userapp_userpro_username_key UNIQUE (username);
 V   ALTER TABLE ONLY public.userapp_userpro DROP CONSTRAINT userapp_userpro_username_key;
       public            dbrdsubuntume12    false    252                       1259    85076    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            dbrdsubuntume12    false    209                       1259    85013 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            dbrdsubuntume12    false    211            !           1259    85014 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            dbrdsubuntume12    false    211                       1259    84999 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            dbrdsubuntume12    false    207            )           1259    85029 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            dbrdsubuntume12    false    215            ,           1259    85028 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            dbrdsubuntume12    false    215            /           1259    85043 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            dbrdsubuntume12    false    217            2           1259    85042 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            dbrdsubuntume12    false    217            &           1259    85070     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            dbrdsubuntume12    false    213            �           1259    92514 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            dbrdsubuntume12    false    371            �           1259    139555 #   chat_groupmessage_group_id_754429fc    INDEX     e   CREATE INDEX chat_groupmessage_group_id_754429fc ON public.chat_groupmessage USING btree (group_id);
 7   DROP INDEX public.chat_groupmessage_group_id_754429fc;
       public            dbrdsubuntume12    false    501            �           1259    139556 "   chat_groupmessage_user_id_fe29b95d    INDEX     c   CREATE INDEX chat_groupmessage_user_id_fe29b95d ON public.chat_groupmessage USING btree (user_id);
 6   DROP INDEX public.chat_groupmessage_user_id_fe29b95d;
       public            dbrdsubuntume12    false    501            �           1259    139529 +   chat_groupname_admins_groupname_id_25125137    INDEX     u   CREATE INDEX chat_groupname_admins_groupname_id_25125137 ON public.chat_groupname_admins USING btree (groupname_id);
 ?   DROP INDEX public.chat_groupname_admins_groupname_id_25125137;
       public            dbrdsubuntume12    false    497            �           1259    139530 &   chat_groupname_admins_user_id_ee63f710    INDEX     k   CREATE INDEX chat_groupname_admins_user_id_ee63f710 ON public.chat_groupname_admins USING btree (user_id);
 :   DROP INDEX public.chat_groupname_admins_user_id_ee63f710;
       public            dbrdsubuntume12    false    497            �           1259    139516 '   chat_groupname_group_name_6b3b1a12_like    INDEX     |   CREATE INDEX chat_groupname_group_name_6b3b1a12_like ON public.chat_groupname USING btree (group_name varchar_pattern_ops);
 ;   DROP INDEX public.chat_groupname_group_name_6b3b1a12_like;
       public            dbrdsubuntume12    false    495            �           1259    139543 1   chat_groupname_participants_groupname_id_98126150    INDEX     �   CREATE INDEX chat_groupname_participants_groupname_id_98126150 ON public.chat_groupname_participants USING btree (groupname_id);
 E   DROP INDEX public.chat_groupname_participants_groupname_id_98126150;
       public            dbrdsubuntume12    false    499            �           1259    139544 ,   chat_groupname_participants_user_id_8839a457    INDEX     w   CREATE INDEX chat_groupname_participants_user_id_8839a457 ON public.chat_groupname_participants USING btree (user_id);
 @   DROP INDEX public.chat_groupname_participants_user_id_8839a457;
       public            dbrdsubuntume12    false    499            �           1259    139238    chat_message_room_id_5e7d8d78    INDEX     Y   CREATE INDEX chat_message_room_id_5e7d8d78 ON public.chat_message USING btree (room_id);
 1   DROP INDEX public.chat_message_room_id_5e7d8d78;
       public            dbrdsubuntume12    false    491            �           1259    139239    chat_message_user_id_a47c01bb    INDEX     Y   CREATE INDEX chat_message_user_id_a47c01bb ON public.chat_message USING btree (user_id);
 1   DROP INDEX public.chat_message_user_id_a47c01bb;
       public            dbrdsubuntume12    false    491            �           1259    139225 +   chat_privatechtroom_room_name_a66707cc_like    INDEX     �   CREATE INDEX chat_privatechtroom_room_name_a66707cc_like ON public.chat_privatechtroom USING btree (room_name varchar_pattern_ops);
 ?   DROP INDEX public.chat_privatechtroom_room_name_a66707cc_like;
       public            dbrdsubuntume12    false    489            �           1259    139226 %   chat_privatechtroom_user1_id_efd5a913    INDEX     i   CREATE INDEX chat_privatechtroom_user1_id_efd5a913 ON public.chat_privatechtroom USING btree (user1_id);
 9   DROP INDEX public.chat_privatechtroom_user1_id_efd5a913;
       public            dbrdsubuntume12    false    489            �           1259    139227 %   chat_privatechtroom_user2_id_d14fa7dd    INDEX     i   CREATE INDEX chat_privatechtroom_user2_id_d14fa7dd ON public.chat_privatechtroom USING btree (user2_id);
 9   DROP INDEX public.chat_privatechtroom_user2_id_d14fa7dd;
       public            dbrdsubuntume12    false    489                       1259    98613 %   chatapp_message_from_user_id_4fb7977a    INDEX     i   CREATE INDEX chatapp_message_from_user_id_4fb7977a ON public.chatapp_message USING btree (from_user_id);
 9   DROP INDEX public.chatapp_message_from_user_id_4fb7977a;
       public            dbrdsubuntume12    false    403                       1259    98614 !   chatapp_message_group_id_e8cbe766    INDEX     a   CREATE INDEX chatapp_message_group_id_e8cbe766 ON public.chatapp_message USING btree (group_id);
 5   DROP INDEX public.chatapp_message_group_id_e8cbe766;
       public            dbrdsubuntume12    false    403                       1259    98588 "   chatapp_roomname_admin_id_14e9b87d    INDEX     c   CREATE INDEX chatapp_roomname_admin_id_14e9b87d ON public.chatapp_roomname USING btree (admin_id);
 6   DROP INDEX public.chatapp_roomname_admin_id_14e9b87d;
       public            dbrdsubuntume12    false    399                       1259    98601 2   chatapp_roomname_participants_roomname_id_66268ed3    INDEX     �   CREATE INDEX chatapp_roomname_participants_roomname_id_66268ed3 ON public.chatapp_roomname_participants USING btree (roomname_id);
 F   DROP INDEX public.chatapp_roomname_participants_roomname_id_66268ed3;
       public            dbrdsubuntume12    false    401                       1259    98602 .   chatapp_roomname_participants_user_id_cc4efff9    INDEX     {   CREATE INDEX chatapp_roomname_participants_user_id_cc4efff9 ON public.chatapp_roomname_participants USING btree (user_id);
 B   DROP INDEX public.chatapp_roomname_participants_user_id_cc4efff9;
       public            dbrdsubuntume12    false    401                       1259    98587 (   chatapp_roomname_room_name_9340cda8_like    INDEX     ~   CREATE INDEX chatapp_roomname_room_name_9340cda8_like ON public.chatapp_roomname USING btree (room_name varchar_pattern_ops);
 <   DROP INDEX public.chatapp_roomname_room_name_9340cda8_like;
       public            dbrdsubuntume12    false    399            �           1259    92402 1   comment_postcomment_angry_postcomment_id_4d6e3d57    INDEX     �   CREATE INDEX comment_postcomment_angry_postcomment_id_4d6e3d57 ON public.comment_postcomment_angry USING btree (postcomment_id);
 E   DROP INDEX public.comment_postcomment_angry_postcomment_id_4d6e3d57;
       public            dbrdsubuntume12    false    356            �           1259    92403 *   comment_postcomment_angry_user_id_2f028a37    INDEX     s   CREATE INDEX comment_postcomment_angry_user_id_2f028a37 ON public.comment_postcomment_angry USING btree (user_id);
 >   DROP INDEX public.comment_postcomment_angry_user_id_2f028a37;
       public            dbrdsubuntume12    false    356            �           1259    92416 0   comment_postcomment_care_postcomment_id_f05a74ec    INDEX        CREATE INDEX comment_postcomment_care_postcomment_id_f05a74ec ON public.comment_postcomment_care USING btree (postcomment_id);
 D   DROP INDEX public.comment_postcomment_care_postcomment_id_f05a74ec;
       public            dbrdsubuntume12    false    358            �           1259    92417 )   comment_postcomment_care_user_id_d7de2de8    INDEX     q   CREATE INDEX comment_postcomment_care_user_id_d7de2de8 ON public.comment_postcomment_care USING btree (user_id);
 =   DROP INDEX public.comment_postcomment_care_user_id_d7de2de8;
       public            dbrdsubuntume12    false    358            �           1259    92430 0   comment_postcomment_haha_postcomment_id_323f220b    INDEX        CREATE INDEX comment_postcomment_haha_postcomment_id_323f220b ON public.comment_postcomment_haha USING btree (postcomment_id);
 D   DROP INDEX public.comment_postcomment_haha_postcomment_id_323f220b;
       public            dbrdsubuntume12    false    360            �           1259    92431 )   comment_postcomment_haha_user_id_cccd063f    INDEX     q   CREATE INDEX comment_postcomment_haha_user_id_cccd063f ON public.comment_postcomment_haha USING btree (user_id);
 =   DROP INDEX public.comment_postcomment_haha_user_id_cccd063f;
       public            dbrdsubuntume12    false    360            �           1259    92444 1   comment_postcomment_likes_postcomment_id_d24bd329    INDEX     �   CREATE INDEX comment_postcomment_likes_postcomment_id_d24bd329 ON public.comment_postcomment_likes USING btree (postcomment_id);
 E   DROP INDEX public.comment_postcomment_likes_postcomment_id_d24bd329;
       public            dbrdsubuntume12    false    362            �           1259    92445 *   comment_postcomment_likes_user_id_8be0e63d    INDEX     s   CREATE INDEX comment_postcomment_likes_user_id_8be0e63d ON public.comment_postcomment_likes USING btree (user_id);
 >   DROP INDEX public.comment_postcomment_likes_user_id_8be0e63d;
       public            dbrdsubuntume12    false    362            �           1259    92458 0   comment_postcomment_love_postcomment_id_b426a042    INDEX        CREATE INDEX comment_postcomment_love_postcomment_id_b426a042 ON public.comment_postcomment_love USING btree (postcomment_id);
 D   DROP INDEX public.comment_postcomment_love_postcomment_id_b426a042;
       public            dbrdsubuntume12    false    364            �           1259    92459 )   comment_postcomment_love_user_id_8a331f22    INDEX     q   CREATE INDEX comment_postcomment_love_user_id_8a331f22 ON public.comment_postcomment_love USING btree (user_id);
 =   DROP INDEX public.comment_postcomment_love_user_id_8a331f22;
       public            dbrdsubuntume12    false    364            �           1259    92387 &   comment_postcomment_parent_id_6a10978c    INDEX     k   CREATE INDEX comment_postcomment_parent_id_6a10978c ON public.comment_postcomment USING btree (parent_id);
 :   DROP INDEX public.comment_postcomment_parent_id_6a10978c;
       public            dbrdsubuntume12    false    354            �           1259    92388 $   comment_postcomment_post_id_33329df0    INDEX     g   CREATE INDEX comment_postcomment_post_id_33329df0 ON public.comment_postcomment USING btree (post_id);
 8   DROP INDEX public.comment_postcomment_post_id_33329df0;
       public            dbrdsubuntume12    false    354            �           1259    92472 /   comment_postcomment_sad_postcomment_id_0133d10f    INDEX     }   CREATE INDEX comment_postcomment_sad_postcomment_id_0133d10f ON public.comment_postcomment_sad USING btree (postcomment_id);
 C   DROP INDEX public.comment_postcomment_sad_postcomment_id_0133d10f;
       public            dbrdsubuntume12    false    366            �           1259    92473 (   comment_postcomment_sad_user_id_edffbf40    INDEX     o   CREATE INDEX comment_postcomment_sad_user_id_edffbf40 ON public.comment_postcomment_sad USING btree (user_id);
 <   DROP INDEX public.comment_postcomment_sad_user_id_edffbf40;
       public            dbrdsubuntume12    false    366            �           1259    92486 1   comment_postcomment_senti_postcomment_id_924fffed    INDEX     �   CREATE INDEX comment_postcomment_senti_postcomment_id_924fffed ON public.comment_postcomment_senti USING btree (postcomment_id);
 E   DROP INDEX public.comment_postcomment_senti_postcomment_id_924fffed;
       public            dbrdsubuntume12    false    368            �           1259    92487 *   comment_postcomment_senti_user_id_e43572ca    INDEX     s   CREATE INDEX comment_postcomment_senti_user_id_e43572ca ON public.comment_postcomment_senti USING btree (user_id);
 >   DROP INDEX public.comment_postcomment_senti_user_id_e43572ca;
       public            dbrdsubuntume12    false    368            �           1259    92389 $   comment_postcomment_user_id_eafd4d81    INDEX     g   CREATE INDEX comment_postcomment_user_id_eafd4d81 ON public.comment_postcomment USING btree (user_id);
 8   DROP INDEX public.comment_postcomment_user_id_eafd4d81;
       public            dbrdsubuntume12    false    354            �           1259    92500 /   comment_postcomment_wow_postcomment_id_933861d1    INDEX     }   CREATE INDEX comment_postcomment_wow_postcomment_id_933861d1 ON public.comment_postcomment_wow USING btree (postcomment_id);
 C   DROP INDEX public.comment_postcomment_wow_postcomment_id_933861d1;
       public            dbrdsubuntume12    false    370            �           1259    92501 (   comment_postcomment_wow_user_id_32548887    INDEX     o   CREATE INDEX comment_postcomment_wow_user_id_32548887 ON public.comment_postcomment_wow USING btree (user_id);
 <   DROP INDEX public.comment_postcomment_wow_user_id_32548887;
       public            dbrdsubuntume12    false    370            
           1259    97930 2   comment_postcommenthistory_postcomment_id_0c75b18b    INDEX     �   CREATE INDEX comment_postcommenthistory_postcomment_id_0c75b18b ON public.comment_postcommenthistory USING btree (postcomment_id);
 F   DROP INDEX public.comment_postcommenthistory_postcomment_id_0c75b18b;
       public            dbrdsubuntume12    false    395                       1259    97931 +   comment_postcommenthistory_user_id_57371404    INDEX     u   CREATE INDEX comment_postcommenthistory_user_id_57371404 ON public.comment_postcommenthistory USING btree (user_id);
 ?   DROP INDEX public.comment_postcommenthistory_user_id_57371404;
       public            dbrdsubuntume12    false    395            �           1259    97496 ;   comment_postphotocomment_angry_postphotocomment_id_042a7e5c    INDEX     �   CREATE INDEX comment_postphotocomment_angry_postphotocomment_id_042a7e5c ON public.comment_postphotocomment_angry USING btree (postphotocomment_id);
 O   DROP INDEX public.comment_postphotocomment_angry_postphotocomment_id_042a7e5c;
       public            dbrdsubuntume12    false    377            �           1259    97497 /   comment_postphotocomment_angry_user_id_411781d0    INDEX     }   CREATE INDEX comment_postphotocomment_angry_user_id_411781d0 ON public.comment_postphotocomment_angry USING btree (user_id);
 C   DROP INDEX public.comment_postphotocomment_angry_user_id_411781d0;
       public            dbrdsubuntume12    false    377            �           1259    97510 :   comment_postphotocomment_care_postphotocomment_id_b1840016    INDEX     �   CREATE INDEX comment_postphotocomment_care_postphotocomment_id_b1840016 ON public.comment_postphotocomment_care USING btree (postphotocomment_id);
 N   DROP INDEX public.comment_postphotocomment_care_postphotocomment_id_b1840016;
       public            dbrdsubuntume12    false    379            �           1259    97511 .   comment_postphotocomment_care_user_id_73667487    INDEX     {   CREATE INDEX comment_postphotocomment_care_user_id_73667487 ON public.comment_postphotocomment_care USING btree (user_id);
 B   DROP INDEX public.comment_postphotocomment_care_user_id_73667487;
       public            dbrdsubuntume12    false    379            �           1259    97524 :   comment_postphotocomment_haha_postphotocomment_id_661c4f19    INDEX     �   CREATE INDEX comment_postphotocomment_haha_postphotocomment_id_661c4f19 ON public.comment_postphotocomment_haha USING btree (postphotocomment_id);
 N   DROP INDEX public.comment_postphotocomment_haha_postphotocomment_id_661c4f19;
       public            dbrdsubuntume12    false    381            �           1259    97525 .   comment_postphotocomment_haha_user_id_a2fde95c    INDEX     {   CREATE INDEX comment_postphotocomment_haha_user_id_a2fde95c ON public.comment_postphotocomment_haha USING btree (user_id);
 B   DROP INDEX public.comment_postphotocomment_haha_user_id_a2fde95c;
       public            dbrdsubuntume12    false    381            �           1259    97538 ;   comment_postphotocomment_likes_postphotocomment_id_272894fd    INDEX     �   CREATE INDEX comment_postphotocomment_likes_postphotocomment_id_272894fd ON public.comment_postphotocomment_likes USING btree (postphotocomment_id);
 O   DROP INDEX public.comment_postphotocomment_likes_postphotocomment_id_272894fd;
       public            dbrdsubuntume12    false    383            �           1259    97539 /   comment_postphotocomment_likes_user_id_2f924e32    INDEX     }   CREATE INDEX comment_postphotocomment_likes_user_id_2f924e32 ON public.comment_postphotocomment_likes USING btree (user_id);
 C   DROP INDEX public.comment_postphotocomment_likes_user_id_2f924e32;
       public            dbrdsubuntume12    false    383            �           1259    97552 :   comment_postphotocomment_love_postphotocomment_id_f62cb61e    INDEX     �   CREATE INDEX comment_postphotocomment_love_postphotocomment_id_f62cb61e ON public.comment_postphotocomment_love USING btree (postphotocomment_id);
 N   DROP INDEX public.comment_postphotocomment_love_postphotocomment_id_f62cb61e;
       public            dbrdsubuntume12    false    385            �           1259    97553 .   comment_postphotocomment_love_user_id_085dad68    INDEX     {   CREATE INDEX comment_postphotocomment_love_user_id_085dad68 ON public.comment_postphotocomment_love USING btree (user_id);
 B   DROP INDEX public.comment_postphotocomment_love_user_id_085dad68;
       public            dbrdsubuntume12    false    385            �           1259    97481 +   comment_postphotocomment_parent_id_34d56f70    INDEX     u   CREATE INDEX comment_postphotocomment_parent_id_34d56f70 ON public.comment_postphotocomment USING btree (parent_id);
 ?   DROP INDEX public.comment_postphotocomment_parent_id_34d56f70;
       public            dbrdsubuntume12    false    375            �           1259    97482 *   comment_postphotocomment_photo_id_5c5aac33    INDEX     s   CREATE INDEX comment_postphotocomment_photo_id_5c5aac33 ON public.comment_postphotocomment USING btree (photo_id);
 >   DROP INDEX public.comment_postphotocomment_photo_id_5c5aac33;
       public            dbrdsubuntume12    false    375            �           1259    97566 9   comment_postphotocomment_sad_postphotocomment_id_6b21c374    INDEX     �   CREATE INDEX comment_postphotocomment_sad_postphotocomment_id_6b21c374 ON public.comment_postphotocomment_sad USING btree (postphotocomment_id);
 M   DROP INDEX public.comment_postphotocomment_sad_postphotocomment_id_6b21c374;
       public            dbrdsubuntume12    false    387            �           1259    97567 -   comment_postphotocomment_sad_user_id_3bfb9ca8    INDEX     y   CREATE INDEX comment_postphotocomment_sad_user_id_3bfb9ca8 ON public.comment_postphotocomment_sad USING btree (user_id);
 A   DROP INDEX public.comment_postphotocomment_sad_user_id_3bfb9ca8;
       public            dbrdsubuntume12    false    387            �           1259    97580 ;   comment_postphotocomment_senti_postphotocomment_id_03647fe9    INDEX     �   CREATE INDEX comment_postphotocomment_senti_postphotocomment_id_03647fe9 ON public.comment_postphotocomment_senti USING btree (postphotocomment_id);
 O   DROP INDEX public.comment_postphotocomment_senti_postphotocomment_id_03647fe9;
       public            dbrdsubuntume12    false    389            �           1259    97581 /   comment_postphotocomment_senti_user_id_1976f98f    INDEX     }   CREATE INDEX comment_postphotocomment_senti_user_id_1976f98f ON public.comment_postphotocomment_senti USING btree (user_id);
 C   DROP INDEX public.comment_postphotocomment_senti_user_id_1976f98f;
       public            dbrdsubuntume12    false    389            �           1259    97483 )   comment_postphotocomment_user_id_ead60baf    INDEX     q   CREATE INDEX comment_postphotocomment_user_id_ead60baf ON public.comment_postphotocomment USING btree (user_id);
 =   DROP INDEX public.comment_postphotocomment_user_id_ead60baf;
       public            dbrdsubuntume12    false    375                       1259    97594 9   comment_postphotocomment_wow_postphotocomment_id_33acb3f4    INDEX     �   CREATE INDEX comment_postphotocomment_wow_postphotocomment_id_33acb3f4 ON public.comment_postphotocomment_wow USING btree (postphotocomment_id);
 M   DROP INDEX public.comment_postphotocomment_wow_postphotocomment_id_33acb3f4;
       public            dbrdsubuntume12    false    391                       1259    97595 -   comment_postphotocomment_wow_user_id_2a7f23cb    INDEX     y   CREATE INDEX comment_postphotocomment_wow_user_id_2a7f23cb ON public.comment_postphotocomment_wow USING btree (user_id);
 A   DROP INDEX public.comment_postphotocomment_wow_user_id_2a7f23cb;
       public            dbrdsubuntume12    false    391                       1259    97918 <   comment_postphotocommenthistory_postphotocomment_id_d518babb    INDEX     �   CREATE INDEX comment_postphotocommenthistory_postphotocomment_id_d518babb ON public.comment_postphotocommenthistory USING btree (postphotocomment_id);
 P   DROP INDEX public.comment_postphotocommenthistory_postphotocomment_id_d518babb;
       public            dbrdsubuntume12    false    393                       1259    97919 0   comment_postphotocommenthistory_user_id_37b15aba    INDEX        CREATE INDEX comment_postphotocommenthistory_user_id_37b15aba ON public.comment_postphotocommenthistory USING btree (user_id);
 D   DROP INDEX public.comment_postphotocommenthistory_user_id_37b15aba;
       public            dbrdsubuntume12    false    393            5           1259    85066 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            dbrdsubuntume12    false    219            8           1259    85067 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            dbrdsubuntume12    false    219            9           1259    85086 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            dbrdsubuntume12    false    220            <           1259    85085 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            dbrdsubuntume12    false    220            X           1259    100131 #   employer_applicants_job_id_d6178125    INDEX     e   CREATE INDEX employer_applicants_job_id_d6178125 ON public.employer_applicants USING btree (job_id);
 7   DROP INDEX public.employer_applicants_job_id_d6178125;
       public            dbrdsubuntume12    false    429            Y           1259    100140 *   employer_applicants_jobprofile_id_ed8265b0    INDEX     s   CREATE INDEX employer_applicants_jobprofile_id_ed8265b0 ON public.employer_applicants USING btree (jobprofile_id);
 >   DROP INDEX public.employer_applicants_jobprofile_id_ed8265b0;
       public            dbrdsubuntume12    false    429            =           1259    111550 ,   employer_employer_functional_cat_id_337ea705    INDEX     w   CREATE INDEX employer_employer_functional_cat_id_337ea705 ON public.employer_employer USING btree (functional_cat_id);
 @   DROP INDEX public.employer_employer_functional_cat_id_337ea705;
       public            dbrdsubuntume12    false    222            >           1259    111531 *   employer_employer_industry_cat_id_e04a50bd    INDEX     s   CREATE INDEX employer_employer_industry_cat_id_e04a50bd ON public.employer_employer USING btree (industry_cat_id);
 >   DROP INDEX public.employer_employer_industry_cat_id_e04a50bd;
       public            dbrdsubuntume12    false    222            �           1259    122163 1   employer_employer_moderators_employer_id_763847d5    INDEX     �   CREATE INDEX employer_employer_moderators_employer_id_763847d5 ON public.employer_employer_moderators USING btree (employer_id);
 E   DROP INDEX public.employer_employer_moderators_employer_id_763847d5;
       public            dbrdsubuntume12    false    469            �           1259    122164 -   employer_employer_moderators_user_id_6c56a3a9    INDEX     y   CREATE INDEX employer_employer_moderators_user_id_6c56a3a9 ON public.employer_employer_moderators USING btree (user_id);
 A   DROP INDEX public.employer_employer_moderators_user_id_6c56a3a9;
       public            dbrdsubuntume12    false    469            ?           1259    111551 /   employer_employer_organization_type_id_eea79bff    INDEX     y   CREATE INDEX employer_employer_organization_type_id_eea79bff ON public.employer_employer USING btree (industry_type_id);
 C   DROP INDEX public.employer_employer_organization_type_id_eea79bff;
       public            dbrdsubuntume12    false    222            �           1259    130888 9   employer_employer_pending_moderators_employer_id_8855529e    INDEX     �   CREATE INDEX employer_employer_pending_moderators_employer_id_8855529e ON public.employer_employer_pending_moderators USING btree (employer_id);
 M   DROP INDEX public.employer_employer_pending_moderators_employer_id_8855529e;
       public            dbrdsubuntume12    false    471            �           1259    130889 5   employer_employer_pending_moderators_user_id_26d29548    INDEX     �   CREATE INDEX employer_employer_pending_moderators_user_id_26d29548 ON public.employer_employer_pending_moderators USING btree (user_id);
 I   DROP INDEX public.employer_employer_pending_moderators_user_id_26d29548;
       public            dbrdsubuntume12    false    471            B           1259    111197 "   employer_employer_user_id_33293a8d    INDEX     c   CREATE INDEX employer_employer_user_id_33293a8d ON public.employer_employer USING btree (user_id);
 6   DROP INDEX public.employer_employer_user_id_33293a8d;
       public            dbrdsubuntume12    false    222            C           1259    98741 (   employer_employer_username_a2852c88_like    INDEX     ~   CREATE INDEX employer_employer_username_a2852c88_like ON public.employer_employer USING btree (username varchar_pattern_ops);
 <   DROP INDEX public.employer_employer_username_a2852c88_like;
       public            dbrdsubuntume12    false    222            \           1259    100166 ,   employer_jobpost_applied_jobpost_id_fd60bafb    INDEX     w   CREATE INDEX employer_jobpost_applied_jobpost_id_fd60bafb ON public.employer_jobpost_applied USING btree (jobpost_id);
 @   DROP INDEX public.employer_jobpost_applied_jobpost_id_fd60bafb;
       public            dbrdsubuntume12    false    431            a           1259    100167 )   employer_jobpost_applied_user_id_d8f7a488    INDEX     q   CREATE INDEX employer_jobpost_applied_user_id_d8f7a488 ON public.employer_jobpost_applied USING btree (user_id);
 =   DROP INDEX public.employer_jobpost_applied_user_id_d8f7a488;
       public            dbrdsubuntume12    false    431            F           1259    85162 %   employer_jobpost_employer_id_1c2c1b18    INDEX     i   CREATE INDEX employer_jobpost_employer_id_1c2c1b18 ON public.employer_jobpost USING btree (employer_id);
 9   DROP INDEX public.employer_jobpost_employer_id_1c2c1b18;
       public            dbrdsubuntume12    false    224            G           1259    100069 0   employer_jobpost_functional_category_id_062f5c13    INDEX        CREATE INDEX employer_jobpost_functional_category_id_062f5c13 ON public.employer_jobpost USING btree (functional_category_id);
 D   DROP INDEX public.employer_jobpost_functional_category_id_062f5c13;
       public            dbrdsubuntume12    false    224            H           1259    112007 .   employer_jobpost_industry_category_id_d43c29fa    INDEX     {   CREATE INDEX employer_jobpost_industry_category_id_d43c29fa ON public.employer_jobpost USING btree (industry_category_id);
 B   DROP INDEX public.employer_jobpost_industry_category_id_d43c29fa;
       public            dbrdsubuntume12    false    224            I           1259    118572 )   employer_jobpost_job_location_id_9adb5775    INDEX     q   CREATE INDEX employer_jobpost_job_location_id_9adb5775 ON public.employer_jobpost USING btree (job_location_id);
 =   DROP INDEX public.employer_jobpost_job_location_id_9adb5775;
       public            dbrdsubuntume12    false    224            L           1259    100070 4   employer_jobpost_special_skills_category_id_984114da    INDEX     �   CREATE INDEX employer_jobpost_special_skills_category_id_984114da ON public.employer_jobpost USING btree (special_skills_category_id);
 H   DROP INDEX public.employer_jobpost_special_skills_category_id_984114da;
       public            dbrdsubuntume12    false    224            $           1259    98694 +   follow_friends_follower_friends_id_85d501b7    INDEX     u   CREATE INDEX follow_friends_follower_friends_id_85d501b7 ON public.follow_friends_follower USING btree (friends_id);
 ?   DROP INDEX public.follow_friends_follower_friends_id_85d501b7;
       public            dbrdsubuntume12    false    407            )           1259    98695 (   follow_friends_follower_user_id_6d67dd62    INDEX     o   CREATE INDEX follow_friends_follower_user_id_6d67dd62 ON public.follow_friends_follower USING btree (user_id);
 <   DROP INDEX public.follow_friends_follower_user_id_6d67dd62;
       public            dbrdsubuntume12    false    407            *           1259    98708 ,   follow_friends_following_friends_id_5303b11d    INDEX     w   CREATE INDEX follow_friends_following_friends_id_5303b11d ON public.follow_friends_following USING btree (friends_id);
 @   DROP INDEX public.follow_friends_following_friends_id_5303b11d;
       public            dbrdsubuntume12    false    409            /           1259    98709 )   follow_friends_following_user_id_32756a4a    INDEX     q   CREATE INDEX follow_friends_following_user_id_32756a4a ON public.follow_friends_following USING btree (user_id);
 =   DROP INDEX public.follow_friends_following_user_id_32756a4a;
       public            dbrdsubuntume12    false    409            0           1259    98722 1   follow_friends_to_be_follower_friends_id_bf285438    INDEX     �   CREATE INDEX follow_friends_to_be_follower_friends_id_bf285438 ON public.follow_friends_to_be_follower USING btree (friends_id);
 E   DROP INDEX public.follow_friends_to_be_follower_friends_id_bf285438;
       public            dbrdsubuntume12    false    411            5           1259    98723 .   follow_friends_to_be_follower_user_id_67869386    INDEX     {   CREATE INDEX follow_friends_to_be_follower_user_id_67869386 ON public.follow_friends_to_be_follower USING btree (user_id);
 B   DROP INDEX public.follow_friends_to_be_follower_user_id_67869386;
       public            dbrdsubuntume12    false    411            6           1259    98736 2   follow_friends_to_be_following_friends_id_ce894f15    INDEX     �   CREATE INDEX follow_friends_to_be_following_friends_id_ce894f15 ON public.follow_friends_to_be_following USING btree (friends_id);
 F   DROP INDEX public.follow_friends_to_be_following_friends_id_ce894f15;
       public            dbrdsubuntume12    false    413            ;           1259    98737 /   follow_friends_to_be_following_user_id_367d9fa8    INDEX     }   CREATE INDEX follow_friends_to_be_following_user_id_367d9fa8 ON public.follow_friends_to_be_following USING btree (user_id);
 C   DROP INDEX public.follow_friends_to_be_following_user_id_367d9fa8;
       public            dbrdsubuntume12    false    413            T           1259    99273 -   followfollowing_blockedby_friends_id_505196ad    INDEX     y   CREATE INDEX followfollowing_blockedby_friends_id_505196ad ON public.followfollowing_blockedby USING btree (friends_id);
 A   DROP INDEX public.followfollowing_blockedby_friends_id_505196ad;
       public            dbrdsubuntume12    false    427            W           1259    99274 *   followfollowing_blockedby_user_id_7f39cfbd    INDEX     s   CREATE INDEX followfollowing_blockedby_user_id_7f39cfbd ON public.followfollowing_blockedby USING btree (user_id);
 >   DROP INDEX public.followfollowing_blockedby_user_id_7f39cfbd;
       public            dbrdsubuntume12    false    427            P           1259    99261 -   followfollowing_blocklist_friends_id_e75971bd    INDEX     y   CREATE INDEX followfollowing_blocklist_friends_id_e75971bd ON public.followfollowing_blocklist USING btree (friends_id);
 A   DROP INDEX public.followfollowing_blocklist_friends_id_e75971bd;
       public            dbrdsubuntume12    false    425            S           1259    99262 *   followfollowing_blocklist_user_id_132f91a4    INDEX     s   CREATE INDEX followfollowing_blocklist_user_id_132f91a4 ON public.followfollowing_blocklist USING btree (user_id);
 >   DROP INDEX public.followfollowing_blocklist_user_id_132f91a4;
       public            dbrdsubuntume12    false    425            <           1259    98901 -   followfollowing_followers_friends_id_571fe6c3    INDEX     y   CREATE INDEX followfollowing_followers_friends_id_571fe6c3 ON public.followfollowing_followers USING btree (friends_id);
 A   DROP INDEX public.followfollowing_followers_friends_id_571fe6c3;
       public            dbrdsubuntume12    false    415            ?           1259    98902 *   followfollowing_followers_user_id_2c6d8092    INDEX     s   CREATE INDEX followfollowing_followers_user_id_2c6d8092 ON public.followfollowing_followers USING btree (user_id);
 >   DROP INDEX public.followfollowing_followers_user_id_2c6d8092;
       public            dbrdsubuntume12    false    415            @           1259    98899 .   followfollowing_followings_friends_id_89b86772    INDEX     {   CREATE INDEX followfollowing_followings_friends_id_89b86772 ON public.followfollowing_followings USING btree (friends_id);
 B   DROP INDEX public.followfollowing_followings_friends_id_89b86772;
       public            dbrdsubuntume12    false    417            C           1259    98900 +   followfollowing_followings_user_id_4f03c564    INDEX     u   CREATE INDEX followfollowing_followings_user_id_4f03c564 ON public.followfollowing_followings USING btree (user_id);
 ?   DROP INDEX public.followfollowing_followings_user_id_4f03c564;
       public            dbrdsubuntume12    false    417            L           1259    98897 1   followfollowing_tobefollowers_friends_id_b62a3170    INDEX     �   CREATE INDEX followfollowing_tobefollowers_friends_id_b62a3170 ON public.followfollowing_tobefollowers USING btree (friends_id);
 E   DROP INDEX public.followfollowing_tobefollowers_friends_id_b62a3170;
       public            dbrdsubuntume12    false    423            O           1259    98898 .   followfollowing_tobefollowers_user_id_71bbb058    INDEX     {   CREATE INDEX followfollowing_tobefollowers_user_id_71bbb058 ON public.followfollowing_tobefollowers USING btree (user_id);
 B   DROP INDEX public.followfollowing_tobefollowers_user_id_71bbb058;
       public            dbrdsubuntume12    false    423            H           1259    98885 2   followfollowing_tobefollowings_friends_id_43b3a92a    INDEX     �   CREATE INDEX followfollowing_tobefollowings_friends_id_43b3a92a ON public.followfollowing_tobefollowings USING btree (friends_id);
 F   DROP INDEX public.followfollowing_tobefollowings_friends_id_43b3a92a;
       public            dbrdsubuntume12    false    421            K           1259    98886 /   followfollowing_tobefollowings_user_id_8935b5d9    INDEX     }   CREATE INDEX followfollowing_tobefollowings_user_id_8935b5d9 ON public.followfollowing_tobefollowings USING btree (user_id);
 C   DROP INDEX public.followfollowing_tobefollowings_user_id_8935b5d9;
       public            dbrdsubuntume12    false    421            �           1259    85831 *   jobs_amryexperience_jobprofile_id_be0ec663    INDEX     s   CREATE INDEX jobs_amryexperience_jobprofile_id_be0ec663 ON public.jobs_armyexperience USING btree (jobprofile_id);
 >   DROP INDEX public.jobs_amryexperience_jobprofile_id_be0ec663;
       public            dbrdsubuntume12    false    254            �           1259    118550    jobs_city_country_id_dc608449    INDEX     W   CREATE INDEX jobs_city_country_id_dc608449 ON public.jobs_city USING btree (state_id);
 1   DROP INDEX public.jobs_city_country_id_dc608449;
       public            dbrdsubuntume12    false    467            �           1259    118538 "   jobs_country_continent_id_eb7c8bbf    INDEX     c   CREATE INDEX jobs_country_continent_id_eb7c8bbf ON public.jobs_country USING btree (continent_id);
 6   DROP INDEX public.jobs_country_continent_id_eb7c8bbf;
       public            dbrdsubuntume12    false    463            �           1259    116566 '   jobs_degreeorexam_edu_level_id_d3c2141a    INDEX     m   CREATE INDEX jobs_degreeorexam_edu_level_id_d3c2141a ON public.jobs_degreeorexam USING btree (edu_level_id);
 ;   DROP INDEX public.jobs_degreeorexam_edu_level_id_d3c2141a;
       public            dbrdsubuntume12    false    455            d           1259    85374 ,   jobs_educationprofile_jobprofile_id_cf95e9c5    INDEX     w   CREATE INDEX jobs_educationprofile_jobprofile_id_cf95e9c5 ON public.jobs_educationprofile USING btree (jobprofile_id);
 @   DROP INDEX public.jobs_educationprofile_jobprofile_id_cf95e9c5;
       public            dbrdsubuntume12    false    240            a           1259    85368 &   jobs_experience_jobprofile_id_c1e25191    INDEX     k   CREATE INDEX jobs_experience_jobprofile_id_c1e25191 ON public.jobs_experience USING btree (jobprofile_id);
 :   DROP INDEX public.jobs_experience_jobprofile_id_c1e25191;
       public            dbrdsubuntume12    false    238            v           1259    112713 <   jobs_jobprofile_job_catego_functionaljobcategory_id_18136d20    INDEX     �   CREATE INDEX jobs_jobprofile_job_catego_functionaljobcategory_id_18136d20 ON public.jobs_jobprofile_job_categories USING btree (functionaljobcategory_id);
 P   DROP INDEX public.jobs_jobprofile_job_catego_functionaljobcategory_id_18136d20;
       public            dbrdsubuntume12    false    451            w           1259    112712 5   jobs_jobprofile_job_categories_jobprofile_id_e33355ba    INDEX     �   CREATE INDEX jobs_jobprofile_job_categories_jobprofile_id_e33355ba ON public.jobs_jobprofile_job_categories USING btree (jobprofile_id);
 I   DROP INDEX public.jobs_jobprofile_job_categories_jobprofile_id_e33355ba;
       public            dbrdsubuntume12    false    451            M           1259    121194 (   jobs_jobprofile_job_location_id_32dcda21    INDEX     o   CREATE INDEX jobs_jobprofile_job_location_id_32dcda21 ON public.jobs_jobprofile USING btree (job_location_id);
 <   DROP INDEX public.jobs_jobprofile_job_location_id_32dcda21;
       public            dbrdsubuntume12    false    226            |           1259    112726 5   jobs_jobprofile_special_skills_jobprofile_id_ee55fd34    INDEX     �   CREATE INDEX jobs_jobprofile_special_skills_jobprofile_id_ee55fd34 ON public.jobs_jobprofile_special_skills USING btree (jobprofile_id);
 I   DROP INDEX public.jobs_jobprofile_special_skills_jobprofile_id_ee55fd34;
       public            dbrdsubuntume12    false    453                       1259    112727 ?   jobs_jobprofile_special_skills_specialskillcategory_id_b25b574e    INDEX     �   CREATE INDEX jobs_jobprofile_special_skills_specialskillcategory_id_b25b574e ON public.jobs_jobprofile_special_skills USING btree (specialskillcategory_id);
 S   DROP INDEX public.jobs_jobprofile_special_skills_specialskillcategory_id_b25b574e;
       public            dbrdsubuntume12    false    453            �           1259    116565    jobs_majorin_degree_id_9295b263    INDEX     ]   CREATE INDEX jobs_majorin_degree_id_9295b263 ON public.jobs_majorin USING btree (degree_id);
 3   DROP INDEX public.jobs_majorin_degree_id_9295b263;
       public            dbrdsubuntume12    false    459            ^           1259    85348 4   jobs_professional_certificate_jobprofile_id_d75bc07e    INDEX     �   CREATE INDEX jobs_professional_certificate_jobprofile_id_d75bc07e ON public.jobs_professional_certificate USING btree (jobprofile_id);
 H   DROP INDEX public.jobs_professional_certificate_jobprofile_id_d75bc07e;
       public            dbrdsubuntume12    false    236            [           1259    85342 )   jobs_project_works_jobprofile_id_e159399e    INDEX     q   CREATE INDEX jobs_project_works_jobprofile_id_e159399e ON public.jobs_project_works USING btree (jobprofile_id);
 =   DROP INDEX public.jobs_project_works_jobprofile_id_e159399e;
       public            dbrdsubuntume12    false    234            X           1259    85336 %   jobs_reference_jobprofile_id_3e0a7bba    INDEX     i   CREATE INDEX jobs_reference_jobprofile_id_3e0a7bba ON public.jobs_reference USING btree (jobprofile_id);
 9   DROP INDEX public.jobs_reference_jobprofile_id_3e0a7bba;
       public            dbrdsubuntume12    false    232            U           1259    85330 "   jobs_skills_jobprofile_id_9f94ddb7    INDEX     c   CREATE INDEX jobs_skills_jobprofile_id_9f94ddb7 ON public.jobs_skills USING btree (jobprofile_id);
 6   DROP INDEX public.jobs_skills_jobprofile_id_9f94ddb7;
       public            dbrdsubuntume12    false    230            �           1259    118544    jobs_state_country_id_7c0f7a3d    INDEX     [   CREATE INDEX jobs_state_country_id_7c0f7a3d ON public.jobs_state USING btree (country_id);
 2   DROP INDEX public.jobs_state_country_id_7c0f7a3d;
       public            dbrdsubuntume12    false    465            R           1259    85324 $   jobs_training_jobprofile_id_50609c40    INDEX     g   CREATE INDEX jobs_training_jobprofile_id_50609c40 ON public.jobs_training USING btree (jobprofile_id);
 8   DROP INDEX public.jobs_training_jobprofile_id_50609c40;
       public            dbrdsubuntume12    false    228            �           1259    139629 2   metrimony_matriblockedby_personal_info_id_da425c53    INDEX     �   CREATE INDEX metrimony_matriblockedby_personal_info_id_da425c53 ON public.metrimony_matriblockedby USING btree (personal_info_id);
 F   DROP INDEX public.metrimony_matriblockedby_personal_info_id_da425c53;
       public            dbrdsubuntume12    false    505            �           1259    139644 )   metrimony_matriblockedby_user_id_c2341b3a    INDEX     q   CREATE INDEX metrimony_matriblockedby_user_id_c2341b3a ON public.metrimony_matriblockedby USING btree (user_id);
 =   DROP INDEX public.metrimony_matriblockedby_user_id_c2341b3a;
       public            dbrdsubuntume12    false    505            �           1259    139617 2   metrimony_matriblocklist_personal_info_id_aee7a90f    INDEX     �   CREATE INDEX metrimony_matriblocklist_personal_info_id_aee7a90f ON public.metrimony_matriblocklist USING btree (personal_info_id);
 F   DROP INDEX public.metrimony_matriblocklist_personal_info_id_aee7a90f;
       public            dbrdsubuntume12    false    503            �           1259    139645 )   metrimony_matriblocklist_user_id_117c59f9    INDEX     q   CREATE INDEX metrimony_matriblocklist_user_id_117c59f9 ON public.metrimony_matriblocklist USING btree (user_id);
 =   DROP INDEX public.metrimony_matriblocklist_user_id_117c59f9;
       public            dbrdsubuntume12    false    503            �           1259    136016 ?   metrimony_personal_info_interested_by_personal_info_id_8136467a    INDEX     �   CREATE INDEX metrimony_personal_info_interested_by_personal_info_id_8136467a ON public.metrimony_personal_info_interested_by USING btree (personal_info_id);
 S   DROP INDEX public.metrimony_personal_info_interested_by_personal_info_id_8136467a;
       public            dbrdsubuntume12    false    483            �           1259    136017 6   metrimony_personal_info_interested_by_user_id_c11e4a58    INDEX     �   CREATE INDEX metrimony_personal_info_interested_by_user_id_c11e4a58 ON public.metrimony_personal_info_interested_by USING btree (user_id);
 J   DROP INDEX public.metrimony_personal_info_interested_by_user_id_c11e4a58;
       public            dbrdsubuntume12    false    483            �           1259    136002 <   metrimony_personal_info_interested_personal_info_id_e9112764    INDEX     �   CREATE INDEX metrimony_personal_info_interested_personal_info_id_e9112764 ON public.metrimony_personal_info_interested USING btree (personal_info_id);
 P   DROP INDEX public.metrimony_personal_info_interested_personal_info_id_e9112764;
       public            dbrdsubuntume12    false    481            �           1259    136003 3   metrimony_personal_info_interested_user_id_fbd4e5e8    INDEX     �   CREATE INDEX metrimony_personal_info_interested_user_id_fbd4e5e8 ON public.metrimony_personal_info_interested USING btree (user_id);
 G   DROP INDEX public.metrimony_personal_info_interested_user_id_fbd4e5e8;
       public            dbrdsubuntume12    false    481            �           1259    136030 4   metrimony_personal_info_pe_personal_info_id_72831fbe    INDEX     �   CREATE INDEX metrimony_personal_info_pe_personal_info_id_72831fbe ON public.metrimony_personal_info_pending_interested_by USING btree (personal_info_id);
 H   DROP INDEX public.metrimony_personal_info_pe_personal_info_id_72831fbe;
       public            dbrdsubuntume12    false    485            �           1259    136031 >   metrimony_personal_info_pending_interested_by_user_id_280e2f3d    INDEX     �   CREATE INDEX metrimony_personal_info_pending_interested_by_user_id_280e2f3d ON public.metrimony_personal_info_pending_interested_by USING btree (user_id);
 R   DROP INDEX public.metrimony_personal_info_pending_interested_by_user_id_280e2f3d;
       public            dbrdsubuntume12    false    485            �           1259    131731 ?   metrimony_personal_info_privary_limit_personal_info_id_fe7965df    INDEX     �   CREATE INDEX metrimony_personal_info_privary_limit_personal_info_id_fe7965df ON public.metrimony_personal_info_privary_limit USING btree (personal_info_id);
 S   DROP INDEX public.metrimony_personal_info_privary_limit_personal_info_id_fe7965df;
       public            dbrdsubuntume12    false    473            �           1259    131732 6   metrimony_personal_info_privary_limit_user_id_f33b9329    INDEX     �   CREATE INDEX metrimony_personal_info_privary_limit_user_id_f33b9329 ON public.metrimony_personal_info_privary_limit USING btree (user_id);
 J   DROP INDEX public.metrimony_personal_info_privary_limit_user_id_f33b9329;
       public            dbrdsubuntume12    false    473            �           1259    136044 =   metrimony_personal_info_shortlisted_personal_info_id_e10c0f4c    INDEX     �   CREATE INDEX metrimony_personal_info_shortlisted_personal_info_id_e10c0f4c ON public.metrimony_personal_info_shortlisted USING btree (personal_info_id);
 Q   DROP INDEX public.metrimony_personal_info_shortlisted_personal_info_id_e10c0f4c;
       public            dbrdsubuntume12    false    487            �           1259    136045 4   metrimony_personal_info_shortlisted_user_id_4aeb7aa7    INDEX     �   CREATE INDEX metrimony_personal_info_shortlisted_user_id_4aeb7aa7 ON public.metrimony_personal_info_shortlisted USING btree (user_id);
 H   DROP INDEX public.metrimony_personal_info_shortlisted_user_id_4aeb7aa7;
       public            dbrdsubuntume12    false    487            �           1259    135934 ;   metrimony_personal_info_viewed_by_personal_info_id_1aaecaef    INDEX     �   CREATE INDEX metrimony_personal_info_viewed_by_personal_info_id_1aaecaef ON public.metrimony_personal_info_viewed_by USING btree (personal_info_id);
 O   DROP INDEX public.metrimony_personal_info_viewed_by_personal_info_id_1aaecaef;
       public            dbrdsubuntume12    false    477            �           1259    135935 2   metrimony_personal_info_viewed_by_user_id_3c520316    INDEX     �   CREATE INDEX metrimony_personal_info_viewed_by_user_id_3c520316 ON public.metrimony_personal_info_viewed_by USING btree (user_id);
 F   DROP INDEX public.metrimony_personal_info_viewed_by_user_id_3c520316;
       public            dbrdsubuntume12    false    477            �           1259    135956 8   metrimony_personal_info_viewed_personal_info_id_177ca629    INDEX     �   CREATE INDEX metrimony_personal_info_viewed_personal_info_id_177ca629 ON public.metrimony_personal_info_viewed USING btree (personal_info_id);
 L   DROP INDEX public.metrimony_personal_info_viewed_personal_info_id_177ca629;
       public            dbrdsubuntume12    false    479            �           1259    135957 /   metrimony_personal_info_viewed_user_id_35ddc927    INDEX     }   CREATE INDEX metrimony_personal_info_viewed_user_id_35ddc927 ON public.metrimony_personal_info_viewed USING btree (user_id);
 C   DROP INDEX public.metrimony_personal_info_viewed_user_id_35ddc927;
       public            dbrdsubuntume12    false    479                       1259    97977 0   notifications_notification_from_user_id_4f1e70d0    INDEX        CREATE INDEX notifications_notification_from_user_id_4f1e70d0 ON public.notifications_notification USING btree (from_user_id);
 D   DROP INDEX public.notifications_notification_from_user_id_4f1e70d0;
       public            dbrdsubuntume12    false    397                       1259    97978 .   notifications_notification_to_user_id_17192cb7    INDEX     {   CREATE INDEX notifications_notification_to_user_id_17192cb7 ON public.notifications_notification USING btree (to_user_id);
 B   DROP INDEX public.notifications_notification_to_user_id_17192cb7;
       public            dbrdsubuntume12    false    397            �           1259    139682 '   reports_reports_consumer_to_id_a706e53a    INDEX     m   CREATE INDEX reports_reports_consumer_to_id_a706e53a ON public.reports_reports USING btree (consumer_to_id);
 ;   DROP INDEX public.reports_reports_consumer_to_id_a706e53a;
       public            dbrdsubuntume12    false    507            �           1259    139683 '   reports_reports_employer_to_id_5b766f4d    INDEX     m   CREATE INDEX reports_reports_employer_to_id_5b766f4d ON public.reports_reports USING btree (employer_to_id);
 ;   DROP INDEX public.reports_reports_employer_to_id_5b766f4d;
       public            dbrdsubuntume12    false    507            �           1259    139684 &   reports_reports_jobpost_to_id_62d9f435    INDEX     k   CREATE INDEX reports_reports_jobpost_to_id_62d9f435 ON public.reports_reports USING btree (jobpost_to_id);
 :   DROP INDEX public.reports_reports_jobpost_to_id_62d9f435;
       public            dbrdsubuntume12    false    507            �           1259    139685 (   reports_reports_matri_pro_to_id_9add4cc1    INDEX     o   CREATE INDEX reports_reports_matri_pro_to_id_9add4cc1 ON public.reports_reports USING btree (matri_pro_to_id);
 <   DROP INDEX public.reports_reports_matri_pro_to_id_9add4cc1;
       public            dbrdsubuntume12    false    507            �           1259    139686     reports_reports_user_id_707c8c68    INDEX     _   CREATE INDEX reports_reports_user_id_707c8c68 ON public.reports_reports USING btree (user_id);
 4   DROP INDEX public.reports_reports_user_id_707c8c68;
       public            dbrdsubuntume12    false    507            0           1259    143810 #   sellbuy_answer_question_id_1cf43686    INDEX     e   CREATE INDEX sellbuy_answer_question_id_1cf43686 ON public.sellbuy_answer USING btree (question_id);
 7   DROP INDEX public.sellbuy_answer_question_id_1cf43686;
       public            dbrdsubuntume12    false    529            1           1259    143811    sellbuy_answer_user_id_0c8d9531    INDEX     ]   CREATE INDEX sellbuy_answer_user_id_0c8d9531 ON public.sellbuy_answer USING btree (user_id);
 3   DROP INDEX public.sellbuy_answer_user_id_0c8d9531;
       public            dbrdsubuntume12    false    529                       1259    140128 "   sellbuy_buyers_product_id_a48a2416    INDEX     c   CREATE INDEX sellbuy_buyers_product_id_a48a2416 ON public.sellbuy_buyers USING btree (product_id);
 6   DROP INDEX public.sellbuy_buyers_product_id_a48a2416;
       public            dbrdsubuntume12    false    511                       1259    140129    sellbuy_buyers_user_id_93ff1a4f    INDEX     ]   CREATE INDEX sellbuy_buyers_user_id_93ff1a4f ON public.sellbuy_buyers USING btree (user_id);
 3   DROP INDEX public.sellbuy_buyers_user_id_93ff1a4f;
       public            dbrdsubuntume12    false    511                       1259    139725 (   sellbuy_dealerprofile_seller_id_ea1e30c3    INDEX     o   CREATE INDEX sellbuy_dealerprofile_seller_id_ea1e30c3 ON public.sellbuy_dealerprofile USING btree (seller_id);
 <   DROP INDEX public.sellbuy_dealerprofile_seller_id_ea1e30c3;
       public            dbrdsubuntume12    false    509            ,           1259    143798    sellbuy_faq_product_id_34905e83    INDEX     ]   CREATE INDEX sellbuy_faq_product_id_34905e83 ON public.sellbuy_faq USING btree (product_id);
 3   DROP INDEX public.sellbuy_faq_product_id_34905e83;
       public            dbrdsubuntume12    false    527            -           1259    143799    sellbuy_faq_user_id_b606ef44    INDEX     W   CREATE INDEX sellbuy_faq_user_id_b606ef44 ON public.sellbuy_faq USING btree (user_id);
 0   DROP INDEX public.sellbuy_faq_user_id_b606ef44;
       public            dbrdsubuntume12    false    527            	           1259    140110 $   sellbuy_product_category_id_e40e14c7    INDEX     g   CREATE INDEX sellbuy_product_category_id_e40e14c7 ON public.sellbuy_product USING btree (category_id);
 8   DROP INDEX public.sellbuy_product_category_id_e40e14c7;
       public            dbrdsubuntume12    false    515            
           1259    140111 $   sellbuy_product_consumer_id_5a091f3d    INDEX     g   CREATE INDEX sellbuy_product_consumer_id_5a091f3d ON public.sellbuy_product USING btree (consumer_id);
 8   DROP INDEX public.sellbuy_product_consumer_id_5a091f3d;
       public            dbrdsubuntume12    false    515                       1259    140112 "   sellbuy_product_dealer_id_1c8dd8c5    INDEX     c   CREATE INDEX sellbuy_product_dealer_id_1c8dd8c5 ON public.sellbuy_product USING btree (dealer_id);
 6   DROP INDEX public.sellbuy_product_dealer_id_1c8dd8c5;
       public            dbrdsubuntume12    false    515                       1259    140126 (   sellbuy_product_like_product_id_acc66afb    INDEX     o   CREATE INDEX sellbuy_product_like_product_id_acc66afb ON public.sellbuy_product_like USING btree (product_id);
 <   DROP INDEX public.sellbuy_product_like_product_id_acc66afb;
       public            dbrdsubuntume12    false    517                       1259    140127 %   sellbuy_product_like_user_id_3a11f52b    INDEX     i   CREATE INDEX sellbuy_product_like_user_id_3a11f52b ON public.sellbuy_product_like USING btree (user_id);
 9   DROP INDEX public.sellbuy_product_like_user_id_3a11f52b;
       public            dbrdsubuntume12    false    517                       1259    140113 "   sellbuy_product_seller_id_88c86c54    INDEX     c   CREATE INDEX sellbuy_product_seller_id_88c86c54 ON public.sellbuy_product USING btree (seller_id);
 6   DROP INDEX public.sellbuy_product_seller_id_88c86c54;
       public            dbrdsubuntume12    false    515            2           1259    143843 )   sellbuy_productcomment_parent_id_2e757f0f    INDEX     q   CREATE INDEX sellbuy_productcomment_parent_id_2e757f0f ON public.sellbuy_productcomment USING btree (parent_id);
 =   DROP INDEX public.sellbuy_productcomment_parent_id_2e757f0f;
       public            dbrdsubuntume12    false    531            5           1259    143844 *   sellbuy_productcomment_product_id_422878a2    INDEX     s   CREATE INDEX sellbuy_productcomment_product_id_422878a2 ON public.sellbuy_productcomment USING btree (product_id);
 >   DROP INDEX public.sellbuy_productcomment_product_id_422878a2;
       public            dbrdsubuntume12    false    531            6           1259    143845 '   sellbuy_productcomment_user_id_129e2f9a    INDEX     m   CREATE INDEX sellbuy_productcomment_user_id_129e2f9a ON public.sellbuy_productcomment USING btree (user_id);
 ;   DROP INDEX public.sellbuy_productcomment_user_id_129e2f9a;
       public            dbrdsubuntume12    false    531            (           1259    143786 $   sellbuy_question_product_id_377f59d1    INDEX     g   CREATE INDEX sellbuy_question_product_id_377f59d1 ON public.sellbuy_question USING btree (product_id);
 8   DROP INDEX public.sellbuy_question_product_id_377f59d1;
       public            dbrdsubuntume12    false    525            )           1259    143787 !   sellbuy_question_user_id_55c3b9e3    INDEX     a   CREATE INDEX sellbuy_question_user_id_55c3b9e3 ON public.sellbuy_question USING btree (user_id);
 5   DROP INDEX public.sellbuy_question_user_id_55c3b9e3;
       public            dbrdsubuntume12    false    525                       1259    143760 *   sellbuy_review_dislikes_review_id_49b33411    INDEX     s   CREATE INDEX sellbuy_review_dislikes_review_id_49b33411 ON public.sellbuy_review_dislikes USING btree (review_id);
 >   DROP INDEX public.sellbuy_review_dislikes_review_id_49b33411;
       public            dbrdsubuntume12    false    521                       1259    143761 (   sellbuy_review_dislikes_user_id_be73b516    INDEX     o   CREATE INDEX sellbuy_review_dislikes_user_id_be73b516 ON public.sellbuy_review_dislikes USING btree (user_id);
 <   DROP INDEX public.sellbuy_review_dislikes_user_id_be73b516;
       public            dbrdsubuntume12    false    521            "           1259    143774 '   sellbuy_review_likes_review_id_f29608c6    INDEX     m   CREATE INDEX sellbuy_review_likes_review_id_f29608c6 ON public.sellbuy_review_likes USING btree (review_id);
 ;   DROP INDEX public.sellbuy_review_likes_review_id_f29608c6;
       public            dbrdsubuntume12    false    523            %           1259    143775 %   sellbuy_review_likes_user_id_a70e4dff    INDEX     i   CREATE INDEX sellbuy_review_likes_user_id_a70e4dff ON public.sellbuy_review_likes USING btree (user_id);
 9   DROP INDEX public.sellbuy_review_likes_user_id_a70e4dff;
       public            dbrdsubuntume12    false    523                       1259    143745 !   sellbuy_review_parent_id_103d996d    INDEX     a   CREATE INDEX sellbuy_review_parent_id_103d996d ON public.sellbuy_review USING btree (parent_id);
 5   DROP INDEX public.sellbuy_review_parent_id_103d996d;
       public            dbrdsubuntume12    false    519                       1259    143746 "   sellbuy_review_product_id_56bf410f    INDEX     c   CREATE INDEX sellbuy_review_product_id_56bf410f ON public.sellbuy_review USING btree (product_id);
 6   DROP INDEX public.sellbuy_review_product_id_56bf410f;
       public            dbrdsubuntume12    false    519                       1259    143747    sellbuy_review_user_id_6aaeb290    INDEX     ]   CREATE INDEX sellbuy_review_user_id_6aaeb290 ON public.sellbuy_review USING btree (user_id);
 3   DROP INDEX public.sellbuy_review_user_id_6aaeb290;
       public            dbrdsubuntume12    false    519                       1259    91170 "   social_activity_name_573dd941_like    INDEX     r   CREATE INDEX social_activity_name_573dd941_like ON public.social_activity USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.social_activity_name_573dd941_like;
       public            dbrdsubuntume12    false    306                       1259    91171 #   social_backgroud_name_71ba5388_like    INDEX     t   CREATE INDEX social_backgroud_name_71ba5388_like ON public.social_backgroud USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.social_backgroud_name_71ba5388_like;
       public            dbrdsubuntume12    false    308                       1259    91172 "   social_category_name_1971abb0_like    INDEX     r   CREATE INDEX social_category_name_1971abb0_like ON public.social_category USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.social_category_name_1971abb0_like;
       public            dbrdsubuntume12    false    310                       1259    91173 "   social_check_in_name_3c3bfed4_like    INDEX     r   CREATE INDEX social_check_in_name_3c3bfed4_like ON public.social_check_in USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.social_check_in_name_3c3bfed4_like;
       public            dbrdsubuntume12    false    312            !           1259    91174 !   social_feeling_name_1a43bf79_like    INDEX     p   CREATE INDEX social_feeling_name_1a43bf79_like ON public.social_feeling USING btree (name varchar_pattern_ops);
 5   DROP INDEX public.social_feeling_name_1a43bf79_like;
       public            dbrdsubuntume12    false    314            &           1259    91175    social_gif_name_abb072c3_like    INDEX     h   CREATE INDEX social_gif_name_abb072c3_like ON public.social_gif USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.social_gif_name_abb072c3_like;
       public            dbrdsubuntume12    false    316            +           1259    91176 #   social_lifeevent_name_dece6113_like    INDEX     t   CREATE INDEX social_lifeevent_name_dece6113_like ON public.social_lifeevent USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.social_lifeevent_name_dece6113_like;
       public            dbrdsubuntume12    false    318            �           1259    87177 '   social_post_activity_name_5e35a249_like    INDEX     |   CREATE INDEX social_post_activity_name_5e35a249_like ON public.social_post_activity USING btree (name varchar_pattern_ops);
 ;   DROP INDEX public.social_post_activity_name_5e35a249_like;
       public            dbrdsubuntume12    false    284            �           1259    87178 (   social_post_backgroud_name_0787406d_like    INDEX     ~   CREATE INDEX social_post_backgroud_name_0787406d_like ON public.social_post_backgroud USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.social_post_backgroud_name_0787406d_like;
       public            dbrdsubuntume12    false    286            �           1259    87179 '   social_post_category_name_83e77893_like    INDEX     |   CREATE INDEX social_post_category_name_83e77893_like ON public.social_post_category USING btree (name varchar_pattern_ops);
 ;   DROP INDEX public.social_post_category_name_83e77893_like;
       public            dbrdsubuntume12    false    288            �           1259    87180 '   social_post_check_in_name_358953f1_like    INDEX     |   CREATE INDEX social_post_check_in_name_358953f1_like ON public.social_post_check_in USING btree (name varchar_pattern_ops);
 ;   DROP INDEX public.social_post_check_in_name_358953f1_like;
       public            dbrdsubuntume12    false    290                       1259    91058 $   social_post_feels_name_474fbcc6_like    INDEX     v   CREATE INDEX social_post_feels_name_474fbcc6_like ON public.social_post_feels USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.social_post_feels_name_474fbcc6_like;
       public            dbrdsubuntume12    false    304            �           1259    87182 "   social_post_gif_name_66b443a1_like    INDEX     r   CREATE INDEX social_post_gif_name_66b443a1_like ON public.social_post_gif USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.social_post_gif_name_66b443a1_like;
       public            dbrdsubuntume12    false    292            �           1259    87183 (   social_post_lifeevent_name_2cd5d7c0_like    INDEX     ~   CREATE INDEX social_post_lifeevent_name_2cd5d7c0_like ON public.social_post_lifeevent USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.social_post_lifeevent_name_2cd5d7c0_like;
       public            dbrdsubuntume12    false    294            �           1259    87184 &   social_post_privacy_name_a891e790_like    INDEX     z   CREATE INDEX social_post_privacy_name_a891e790_like ON public.social_post_privacy USING btree (name varchar_pattern_ops);
 :   DROP INDEX public.social_post_privacy_name_a891e790_like;
       public            dbrdsubuntume12    false    296            �           1259    86930 3   social_post_socialpost_angry_socialpost_id_8a14a2e9    INDEX     �   CREATE INDEX social_post_socialpost_angry_socialpost_id_8a14a2e9 ON public.social_post_socialpost_angry USING btree (socialpost_id);
 G   DROP INDEX public.social_post_socialpost_angry_socialpost_id_8a14a2e9;
       public            dbrdsubuntume12    false    266            �           1259    86931 -   social_post_socialpost_angry_user_id_3a2c46f3    INDEX     y   CREATE INDEX social_post_socialpost_angry_user_id_3a2c46f3 ON public.social_post_socialpost_angry USING btree (user_id);
 A   DROP INDEX public.social_post_socialpost_angry_user_id_3a2c46f3;
       public            dbrdsubuntume12    false    266            �           1259    86944 2   social_post_socialpost_care_socialpost_id_910f514b    INDEX     �   CREATE INDEX social_post_socialpost_care_socialpost_id_910f514b ON public.social_post_socialpost_care USING btree (socialpost_id);
 F   DROP INDEX public.social_post_socialpost_care_socialpost_id_910f514b;
       public            dbrdsubuntume12    false    268            �           1259    86945 ,   social_post_socialpost_care_user_id_5db1340b    INDEX     w   CREATE INDEX social_post_socialpost_care_user_id_5db1340b ON public.social_post_socialpost_care USING btree (user_id);
 @   DROP INDEX public.social_post_socialpost_care_user_id_5db1340b;
       public            dbrdsubuntume12    false    268            �           1259    86958 2   social_post_socialpost_haha_socialpost_id_f9907e5c    INDEX     �   CREATE INDEX social_post_socialpost_haha_socialpost_id_f9907e5c ON public.social_post_socialpost_haha USING btree (socialpost_id);
 F   DROP INDEX public.social_post_socialpost_haha_socialpost_id_f9907e5c;
       public            dbrdsubuntume12    false    270            �           1259    86959 ,   social_post_socialpost_haha_user_id_1a004c13    INDEX     w   CREATE INDEX social_post_socialpost_haha_user_id_1a004c13 ON public.social_post_socialpost_haha USING btree (user_id);
 @   DROP INDEX public.social_post_socialpost_haha_user_id_1a004c13;
       public            dbrdsubuntume12    false    270            �           1259    86972 3   social_post_socialpost_likes_socialpost_id_875a43ea    INDEX     �   CREATE INDEX social_post_socialpost_likes_socialpost_id_875a43ea ON public.social_post_socialpost_likes USING btree (socialpost_id);
 G   DROP INDEX public.social_post_socialpost_likes_socialpost_id_875a43ea;
       public            dbrdsubuntume12    false    272            �           1259    86973 -   social_post_socialpost_likes_user_id_99b81b08    INDEX     y   CREATE INDEX social_post_socialpost_likes_user_id_99b81b08 ON public.social_post_socialpost_likes USING btree (user_id);
 A   DROP INDEX public.social_post_socialpost_likes_user_id_99b81b08;
       public            dbrdsubuntume12    false    272            �           1259    86986 2   social_post_socialpost_love_socialpost_id_32efbc41    INDEX     �   CREATE INDEX social_post_socialpost_love_socialpost_id_32efbc41 ON public.social_post_socialpost_love USING btree (socialpost_id);
 F   DROP INDEX public.social_post_socialpost_love_socialpost_id_32efbc41;
       public            dbrdsubuntume12    false    274            �           1259    86987 ,   social_post_socialpost_love_user_id_6ec30f34    INDEX     w   CREATE INDEX social_post_socialpost_love_user_id_6ec30f34 ON public.social_post_socialpost_love USING btree (user_id);
 @   DROP INDEX public.social_post_socialpost_love_user_id_6ec30f34;
       public            dbrdsubuntume12    false    274            �           1259    87000 1   social_post_socialpost_sad_socialpost_id_960b1b26    INDEX     �   CREATE INDEX social_post_socialpost_sad_socialpost_id_960b1b26 ON public.social_post_socialpost_sad USING btree (socialpost_id);
 E   DROP INDEX public.social_post_socialpost_sad_socialpost_id_960b1b26;
       public            dbrdsubuntume12    false    276            �           1259    87001 +   social_post_socialpost_sad_user_id_1792db4d    INDEX     u   CREATE INDEX social_post_socialpost_sad_user_id_1792db4d ON public.social_post_socialpost_sad USING btree (user_id);
 ?   DROP INDEX public.social_post_socialpost_sad_user_id_1792db4d;
       public            dbrdsubuntume12    false    276            �           1259    87014 3   social_post_socialpost_senti_socialpost_id_60e7d5e1    INDEX     �   CREATE INDEX social_post_socialpost_senti_socialpost_id_60e7d5e1 ON public.social_post_socialpost_senti USING btree (socialpost_id);
 G   DROP INDEX public.social_post_socialpost_senti_socialpost_id_60e7d5e1;
       public            dbrdsubuntume12    false    278            �           1259    87015 -   social_post_socialpost_senti_user_id_d37e9520    INDEX     y   CREATE INDEX social_post_socialpost_senti_user_id_d37e9520 ON public.social_post_socialpost_senti USING btree (user_id);
 A   DROP INDEX public.social_post_socialpost_senti_user_id_d37e9520;
       public            dbrdsubuntume12    false    278            �           1259    87197 7   social_post_socialpost_shared_by_socialpost_id_a902a2e1    INDEX     �   CREATE INDEX social_post_socialpost_shared_by_socialpost_id_a902a2e1 ON public.social_post_socialpost_shared_by USING btree (socialpost_id);
 K   DROP INDEX public.social_post_socialpost_shared_by_socialpost_id_a902a2e1;
       public            dbrdsubuntume12    false    298            �           1259    87198 1   social_post_socialpost_shared_by_user_id_08ccacc2    INDEX     �   CREATE INDEX social_post_socialpost_shared_by_user_id_08ccacc2 ON public.social_post_socialpost_shared_by USING btree (user_id);
 E   DROP INDEX public.social_post_socialpost_shared_by_user_id_08ccacc2;
       public            dbrdsubuntume12    false    298            �           1259    87028 2   social_post_socialpost_tags_socialpost_id_b19106ff    INDEX     �   CREATE INDEX social_post_socialpost_tags_socialpost_id_b19106ff ON public.social_post_socialpost_tags USING btree (socialpost_id);
 F   DROP INDEX public.social_post_socialpost_tags_socialpost_id_b19106ff;
       public            dbrdsubuntume12    false    280            �           1259    87029 ,   social_post_socialpost_tags_user_id_663bdb5f    INDEX     w   CREATE INDEX social_post_socialpost_tags_user_id_663bdb5f ON public.social_post_socialpost_tags USING btree (user_id);
 @   DROP INDEX public.social_post_socialpost_tags_user_id_663bdb5f;
       public            dbrdsubuntume12    false    280            �           1259    86917 '   social_post_socialpost_user_id_973d1b9a    INDEX     m   CREATE INDEX social_post_socialpost_user_id_973d1b9a ON public.social_post_socialpost USING btree (user_id);
 ;   DROP INDEX public.social_post_socialpost_user_id_973d1b9a;
       public            dbrdsubuntume12    false    264            �           1259    87056 1   social_post_socialpost_wow_socialpost_id_8bf96a57    INDEX     �   CREATE INDEX social_post_socialpost_wow_socialpost_id_8bf96a57 ON public.social_post_socialpost_wow USING btree (socialpost_id);
 E   DROP INDEX public.social_post_socialpost_wow_socialpost_id_8bf96a57;
       public            dbrdsubuntume12    false    282            �           1259    87057 +   social_post_socialpost_wow_user_id_9c09d264    INDEX     u   CREATE INDEX social_post_socialpost_wow_user_id_9c09d264 ON public.social_post_socialpost_wow USING btree (user_id);
 ?   DROP INDEX public.social_post_socialpost_wow_user_id_9c09d264;
       public            dbrdsubuntume12    false    282                       1259    87212 ,   social_post_subactivity_activity_id_9cbb05f8    INDEX     w   CREATE INDEX social_post_subactivity_activity_id_9cbb05f8 ON public.social_post_subactivity USING btree (activity_id);
 @   DROP INDEX public.social_post_subactivity_activity_id_9cbb05f8;
       public            dbrdsubuntume12    false    302                       1259    87211 *   social_post_subactivity_name_20bf86fe_like    INDEX     �   CREATE INDEX social_post_subactivity_name_20bf86fe_like ON public.social_post_subactivity USING btree (name varchar_pattern_ops);
 >   DROP INDEX public.social_post_subactivity_name_20bf86fe_like;
       public            dbrdsubuntume12    false    302            �           1259    87205 .   social_post_sublifeevent_lifeevent_id_5f205074    INDEX     {   CREATE INDEX social_post_sublifeevent_lifeevent_id_5f205074 ON public.social_post_sublifeevent USING btree (lifeevent_id);
 B   DROP INDEX public.social_post_sublifeevent_lifeevent_id_5f205074;
       public            dbrdsubuntume12    false    300            �           1259    87204 +   social_post_sublifeevent_name_0f77f4b8_like    INDEX     �   CREATE INDEX social_post_sublifeevent_name_0f77f4b8_like ON public.social_post_sublifeevent USING btree (name varchar_pattern_ops);
 ?   DROP INDEX public.social_post_sublifeevent_name_0f77f4b8_like;
       public            dbrdsubuntume12    false    300            0           1259    91177 !   social_privacy_name_b0b56050_like    INDEX     u   CREATE INDEX social_privacy_name_b0b56050_like ON public.social_privacymodel USING btree (name varchar_pattern_ops);
 5   DROP INDEX public.social_privacy_name_b0b56050_like;
       public            dbrdsubuntume12    false    320            �           1259    91877 #   social_socialphoto_post_id_d8153b52    INDEX     e   CREATE INDEX social_socialphoto_post_id_d8153b52 ON public.social_socialphoto USING btree (post_id);
 7   DROP INDEX public.social_socialphoto_post_id_d8153b52;
       public            dbrdsubuntume12    false    352            �           1259    91878 #   social_socialphoto_user_id_6e7a65e3    INDEX     e   CREATE INDEX social_socialphoto_user_id_6e7a65e3 ON public.social_socialphoto USING btree (user_id);
 7   DROP INDEX public.social_socialphoto_user_id_6e7a65e3;
       public            dbrdsubuntume12    false    352            C           1259    91349 &   social_socialpost_activity_id_b2708113    INDEX     k   CREATE INDEX social_socialpost_activity_id_b2708113 ON public.social_socialpost USING btree (activity_id);
 :   DROP INDEX public.social_socialpost_activity_id_b2708113;
       public            dbrdsubuntume12    false    328            R           1259    91372 .   social_socialpost_angry_socialpost_id_7c8f2d37    INDEX     {   CREATE INDEX social_socialpost_angry_socialpost_id_7c8f2d37 ON public.social_socialpost_angry USING btree (socialpost_id);
 B   DROP INDEX public.social_socialpost_angry_socialpost_id_7c8f2d37;
       public            dbrdsubuntume12    false    330            U           1259    91373 (   social_socialpost_angry_user_id_4d9d36d0    INDEX     o   CREATE INDEX social_socialpost_angry_user_id_4d9d36d0 ON public.social_socialpost_angry USING btree (user_id);
 <   DROP INDEX public.social_socialpost_angry_user_id_4d9d36d0;
       public            dbrdsubuntume12    false    330            D           1259    91350 (   social_socialpost_background_id_0240af5c    INDEX     o   CREATE INDEX social_socialpost_background_id_0240af5c ON public.social_socialpost USING btree (background_id);
 <   DROP INDEX public.social_socialpost_background_id_0240af5c;
       public            dbrdsubuntume12    false    328            X           1259    91386 -   social_socialpost_care_socialpost_id_aabcd936    INDEX     y   CREATE INDEX social_socialpost_care_socialpost_id_aabcd936 ON public.social_socialpost_care USING btree (socialpost_id);
 A   DROP INDEX public.social_socialpost_care_socialpost_id_aabcd936;
       public            dbrdsubuntume12    false    332            [           1259    91387 '   social_socialpost_care_user_id_21b4a08e    INDEX     m   CREATE INDEX social_socialpost_care_user_id_21b4a08e ON public.social_socialpost_care USING btree (user_id);
 ;   DROP INDEX public.social_socialpost_care_user_id_21b4a08e;
       public            dbrdsubuntume12    false    332            E           1259    91351 &   social_socialpost_category_id_4130e353    INDEX     k   CREATE INDEX social_socialpost_category_id_4130e353 ON public.social_socialpost USING btree (category_id);
 :   DROP INDEX public.social_socialpost_category_id_4130e353;
       public            dbrdsubuntume12    false    328            F           1259    91352 &   social_socialpost_check_in_id_096dc6b1    INDEX     k   CREATE INDEX social_socialpost_check_in_id_096dc6b1 ON public.social_socialpost USING btree (check_in_id);
 :   DROP INDEX public.social_socialpost_check_in_id_096dc6b1;
       public            dbrdsubuntume12    false    328            G           1259    91353 %   social_socialpost_feeling_id_1bf21e43    INDEX     i   CREATE INDEX social_socialpost_feeling_id_1bf21e43 ON public.social_socialpost USING btree (feeling_id);
 9   DROP INDEX public.social_socialpost_feeling_id_1bf21e43;
       public            dbrdsubuntume12    false    328            H           1259    91354 !   social_socialpost_gif_id_125aa86a    INDEX     a   CREATE INDEX social_socialpost_gif_id_125aa86a ON public.social_socialpost USING btree (gif_id);
 5   DROP INDEX public.social_socialpost_gif_id_125aa86a;
       public            dbrdsubuntume12    false    328            ^           1259    91400 -   social_socialpost_haha_socialpost_id_cdcf6fe7    INDEX     y   CREATE INDEX social_socialpost_haha_socialpost_id_cdcf6fe7 ON public.social_socialpost_haha USING btree (socialpost_id);
 A   DROP INDEX public.social_socialpost_haha_socialpost_id_cdcf6fe7;
       public            dbrdsubuntume12    false    334            a           1259    91401 '   social_socialpost_haha_user_id_042d2297    INDEX     m   CREATE INDEX social_socialpost_haha_user_id_042d2297 ON public.social_socialpost_haha USING btree (user_id);
 ;   DROP INDEX public.social_socialpost_haha_user_id_042d2297;
       public            dbrdsubuntume12    false    334            I           1259    91355 '   social_socialpost_lifeevent_id_02d9be17    INDEX     m   CREATE INDEX social_socialpost_lifeevent_id_02d9be17 ON public.social_socialpost USING btree (lifeevent_id);
 ;   DROP INDEX public.social_socialpost_lifeevent_id_02d9be17;
       public            dbrdsubuntume12    false    328            d           1259    91414 .   social_socialpost_likes_socialpost_id_1488c2d6    INDEX     {   CREATE INDEX social_socialpost_likes_socialpost_id_1488c2d6 ON public.social_socialpost_likes USING btree (socialpost_id);
 B   DROP INDEX public.social_socialpost_likes_socialpost_id_1488c2d6;
       public            dbrdsubuntume12    false    336            g           1259    91415 (   social_socialpost_likes_user_id_58c41778    INDEX     o   CREATE INDEX social_socialpost_likes_user_id_58c41778 ON public.social_socialpost_likes USING btree (user_id);
 <   DROP INDEX public.social_socialpost_likes_user_id_58c41778;
       public            dbrdsubuntume12    false    336            j           1259    91428 -   social_socialpost_love_socialpost_id_092cd8f8    INDEX     y   CREATE INDEX social_socialpost_love_socialpost_id_092cd8f8 ON public.social_socialpost_love USING btree (socialpost_id);
 A   DROP INDEX public.social_socialpost_love_socialpost_id_092cd8f8;
       public            dbrdsubuntume12    false    338            m           1259    91429 '   social_socialpost_love_user_id_d93fa155    INDEX     m   CREATE INDEX social_socialpost_love_user_id_d93fa155 ON public.social_socialpost_love USING btree (user_id);
 ;   DROP INDEX public.social_socialpost_love_user_id_d93fa155;
       public            dbrdsubuntume12    false    338            L           1259    91356 %   social_socialpost_privacy_id_69848425    INDEX     i   CREATE INDEX social_socialpost_privacy_id_69848425 ON public.social_socialpost USING btree (privacy_id);
 9   DROP INDEX public.social_socialpost_privacy_id_69848425;
       public            dbrdsubuntume12    false    328            p           1259    91442 ,   social_socialpost_sad_socialpost_id_48f65bbb    INDEX     w   CREATE INDEX social_socialpost_sad_socialpost_id_48f65bbb ON public.social_socialpost_sad USING btree (socialpost_id);
 @   DROP INDEX public.social_socialpost_sad_socialpost_id_48f65bbb;
       public            dbrdsubuntume12    false    340            s           1259    91443 &   social_socialpost_sad_user_id_91a2a088    INDEX     k   CREATE INDEX social_socialpost_sad_user_id_91a2a088 ON public.social_socialpost_sad USING btree (user_id);
 :   DROP INDEX public.social_socialpost_sad_user_id_91a2a088;
       public            dbrdsubuntume12    false    340            v           1259    91456 .   social_socialpost_senti_socialpost_id_7579ab10    INDEX     {   CREATE INDEX social_socialpost_senti_socialpost_id_7579ab10 ON public.social_socialpost_senti USING btree (socialpost_id);
 B   DROP INDEX public.social_socialpost_senti_socialpost_id_7579ab10;
       public            dbrdsubuntume12    false    342            y           1259    91457 (   social_socialpost_senti_user_id_53640180    INDEX     o   CREATE INDEX social_socialpost_senti_user_id_53640180 ON public.social_socialpost_senti USING btree (user_id);
 <   DROP INDEX public.social_socialpost_senti_user_id_53640180;
       public            dbrdsubuntume12    false    342            |           1259    91470 2   social_socialpost_shared_by_socialpost_id_c548b508    INDEX     �   CREATE INDEX social_socialpost_shared_by_socialpost_id_c548b508 ON public.social_socialpost_shared_by USING btree (socialpost_id);
 F   DROP INDEX public.social_socialpost_shared_by_socialpost_id_c548b508;
       public            dbrdsubuntume12    false    344                       1259    91471 ,   social_socialpost_shared_by_user_id_0dc7f0c6    INDEX     w   CREATE INDEX social_socialpost_shared_by_user_id_0dc7f0c6 ON public.social_socialpost_shared_by USING btree (user_id);
 @   DROP INDEX public.social_socialpost_shared_by_user_id_0dc7f0c6;
       public            dbrdsubuntume12    false    344            M           1259    91357 )   social_socialpost_subactivity_id_e4e0721f    INDEX     q   CREATE INDEX social_socialpost_subactivity_id_e4e0721f ON public.social_socialpost USING btree (subactivity_id);
 =   DROP INDEX public.social_socialpost_subactivity_id_e4e0721f;
       public            dbrdsubuntume12    false    328            N           1259    91358 *   social_socialpost_sublifeevent_id_aa0d2ed8    INDEX     s   CREATE INDEX social_socialpost_sublifeevent_id_aa0d2ed8 ON public.social_socialpost USING btree (sublifeevent_id);
 >   DROP INDEX public.social_socialpost_sublifeevent_id_aa0d2ed8;
       public            dbrdsubuntume12    false    328            �           1259    91484 -   social_socialpost_tags_socialpost_id_2ccfd25b    INDEX     y   CREATE INDEX social_socialpost_tags_socialpost_id_2ccfd25b ON public.social_socialpost_tags USING btree (socialpost_id);
 A   DROP INDEX public.social_socialpost_tags_socialpost_id_2ccfd25b;
       public            dbrdsubuntume12    false    346            �           1259    91485 '   social_socialpost_tags_user_id_1fd9cbe4    INDEX     m   CREATE INDEX social_socialpost_tags_user_id_1fd9cbe4 ON public.social_socialpost_tags USING btree (user_id);
 ;   DROP INDEX public.social_socialpost_tags_user_id_1fd9cbe4;
       public            dbrdsubuntume12    false    346            O           1259    91359 "   social_socialpost_user_id_bdc98344    INDEX     c   CREATE INDEX social_socialpost_user_id_bdc98344 ON public.social_socialpost USING btree (user_id);
 6   DROP INDEX public.social_socialpost_user_id_bdc98344;
       public            dbrdsubuntume12    false    328            �           1259    91498 ,   social_socialpost_wow_socialpost_id_3a0b05f0    INDEX     w   CREATE INDEX social_socialpost_wow_socialpost_id_3a0b05f0 ON public.social_socialpost_wow USING btree (socialpost_id);
 @   DROP INDEX public.social_socialpost_wow_socialpost_id_3a0b05f0;
       public            dbrdsubuntume12    false    348            �           1259    91499 &   social_socialpost_wow_user_id_4e3946d1    INDEX     k   CREATE INDEX social_socialpost_wow_user_id_4e3946d1 ON public.social_socialpost_wow USING btree (user_id);
 :   DROP INDEX public.social_socialpost_wow_user_id_4e3946d1;
       public            dbrdsubuntume12    false    348            �           1259    91843 +   social_socialupdatehistory_post_id_4e4b3ad3    INDEX     u   CREATE INDEX social_socialupdatehistory_post_id_4e4b3ad3 ON public.social_socialupdatehistory USING btree (post_id);
 ?   DROP INDEX public.social_socialupdatehistory_post_id_4e4b3ad3;
       public            dbrdsubuntume12    false    350            ;           1259    91191 '   social_subactivity_activity_id_4cff9bbe    INDEX     m   CREATE INDEX social_subactivity_activity_id_4cff9bbe ON public.social_subactivity USING btree (activity_id);
 ;   DROP INDEX public.social_subactivity_activity_id_4cff9bbe;
       public            dbrdsubuntume12    false    324            <           1259    91190 %   social_subactivity_name_0bf4f31a_like    INDEX     x   CREATE INDEX social_subactivity_name_0bf4f31a_like ON public.social_subactivity USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.social_subactivity_name_0bf4f31a_like;
       public            dbrdsubuntume12    false    324            5           1259    91184 )   social_sublifeevent_lifeevent_id_039283d2    INDEX     q   CREATE INDEX social_sublifeevent_lifeevent_id_039283d2 ON public.social_sublifeevent USING btree (lifeevent_id);
 =   DROP INDEX public.social_sublifeevent_lifeevent_id_039283d2;
       public            dbrdsubuntume12    false    322            6           1259    91183 &   social_sublifeevent_name_ddfe8c51_like    INDEX     z   CREATE INDEX social_sublifeevent_name_ddfe8c51_like ON public.social_sublifeevent USING btree (name varchar_pattern_ops);
 :   DROP INDEX public.social_sublifeevent_name_ddfe8c51_like;
       public            dbrdsubuntume12    false    322            u           1259    85520 )   user_management_consumer_city_id_249aeebf    INDEX     q   CREATE INDEX user_management_consumer_city_id_249aeebf ON public.user_management_consumer USING btree (city_id);
 =   DROP INDEX public.user_management_consumer_city_id_249aeebf;
       public            dbrdsubuntume12    false    250            v           1259    85521 ,   user_management_consumer_country_id_9a89b3be    INDEX     w   CREATE INDEX user_management_consumer_country_id_9a89b3be ON public.user_management_consumer USING btree (country_id);
 @   DROP INDEX public.user_management_consumer_country_id_9a89b3be;
       public            dbrdsubuntume12    false    250            {           1259    85519 /   user_management_consumer_username_3d8db87a_like    INDEX     �   CREATE INDEX user_management_consumer_username_3d8db87a_like ON public.user_management_consumer USING btree (username varchar_pattern_ops);
 C   DROP INDEX public.user_management_consumer_username_3d8db87a_like;
       public            dbrdsubuntume12    false    250            �           1259    86493 .   userapp_coverphoto_tags_coverphoto_id_5e1e3b85    INDEX     {   CREATE INDEX userapp_coverphoto_tags_coverphoto_id_5e1e3b85 ON public.userapp_coverphoto_tags USING btree (coverphoto_id);
 B   DROP INDEX public.userapp_coverphoto_tags_coverphoto_id_5e1e3b85;
       public            dbrdsubuntume12    false    262            �           1259    86494 (   userapp_coverphoto_tags_user_id_dae097c6    INDEX     o   CREATE INDEX userapp_coverphoto_tags_user_id_dae097c6 ON public.userapp_coverphoto_tags USING btree (user_id);
 <   DROP INDEX public.userapp_coverphoto_tags_user_id_dae097c6;
       public            dbrdsubuntume12    false    262            �           1259    86480 #   userapp_coverphoto_user_id_50111c18    INDEX     e   CREATE INDEX userapp_coverphoto_user_id_50111c18 ON public.userapp_coverphoto USING btree (user_id);
 7   DROP INDEX public.userapp_coverphoto_user_id_50111c18;
       public            dbrdsubuntume12    false    260            �           1259    86473 2   userapp_profilephoto_tags_profilephoto_id_0a886f2e    INDEX     �   CREATE INDEX userapp_profilephoto_tags_profilephoto_id_0a886f2e ON public.userapp_profilephoto_tags USING btree (profilephoto_id);
 F   DROP INDEX public.userapp_profilephoto_tags_profilephoto_id_0a886f2e;
       public            dbrdsubuntume12    false    258            �           1259    86474 *   userapp_profilephoto_tags_user_id_cccdd704    INDEX     s   CREATE INDEX userapp_profilephoto_tags_user_id_cccdd704 ON public.userapp_profilephoto_tags USING btree (user_id);
 >   DROP INDEX public.userapp_profilephoto_tags_user_id_cccdd704;
       public            dbrdsubuntume12    false    258            �           1259    86460 %   userapp_profilephoto_user_id_f97ea345    INDEX     i   CREATE INDEX userapp_profilephoto_user_id_f97ea345 ON public.userapp_profilephoto USING btree (user_id);
 9   DROP INDEX public.userapp_profilephoto_user_id_f97ea345;
       public            dbrdsubuntume12    false    256            �           1259    85536 &   userapp_userpro_username_486cfab5_like    INDEX     z   CREATE INDEX userapp_userpro_username_486cfab5_like ON public.userapp_userpro USING btree (username varchar_pattern_ops);
 :   DROP INDEX public.userapp_userpro_username_486cfab5_like;
       public            dbrdsubuntume12    false    252            9           2606    85008 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          dbrdsubuntume12    false    207    211    4888            8           2606    85003 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          dbrdsubuntume12    false    4893    209    211            7           2606    84994 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          dbrdsubuntume12    false    4883    205    207            ;           2606    85023 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          dbrdsubuntume12    false    4893    215    209            :           2606    85018 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          dbrdsubuntume12    false    215    4901    213            =           2606    85037 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          dbrdsubuntume12    false    4888    207    217            <           2606    85032 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    217    4901            �           2606    92509 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       public          dbrdsubuntume12    false    371    213    4901                       2606    139545 J   chat_groupmessage chat_groupmessage_group_id_754429fc_fk_chat_groupname_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupmessage
    ADD CONSTRAINT chat_groupmessage_group_id_754429fc_fk_chat_groupname_id FOREIGN KEY (group_id) REFERENCES public.chat_groupname(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.chat_groupmessage DROP CONSTRAINT chat_groupmessage_group_id_754429fc_fk_chat_groupname_id;
       public          dbrdsubuntume12    false    5600    495    501                       2606    139550 D   chat_groupmessage chat_groupmessage_user_id_fe29b95d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupmessage
    ADD CONSTRAINT chat_groupmessage_user_id_fe29b95d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.chat_groupmessage DROP CONSTRAINT chat_groupmessage_user_id_fe29b95d_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    501    213                       2606    139519 M   chat_groupname_admins chat_groupname_admin_groupname_id_25125137_fk_chat_grou    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupname_admins
    ADD CONSTRAINT chat_groupname_admin_groupname_id_25125137_fk_chat_grou FOREIGN KEY (groupname_id) REFERENCES public.chat_groupname(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.chat_groupname_admins DROP CONSTRAINT chat_groupname_admin_groupname_id_25125137_fk_chat_grou;
       public          dbrdsubuntume12    false    5600    495    497                       2606    139524 L   chat_groupname_admins chat_groupname_admins_user_id_ee63f710_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupname_admins
    ADD CONSTRAINT chat_groupname_admins_user_id_ee63f710_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.chat_groupname_admins DROP CONSTRAINT chat_groupname_admins_user_id_ee63f710_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    497    213            	           2606    139533 S   chat_groupname_participants chat_groupname_parti_groupname_id_98126150_fk_chat_grou    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupname_participants
    ADD CONSTRAINT chat_groupname_parti_groupname_id_98126150_fk_chat_grou FOREIGN KEY (groupname_id) REFERENCES public.chat_groupname(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.chat_groupname_participants DROP CONSTRAINT chat_groupname_parti_groupname_id_98126150_fk_chat_grou;
       public          dbrdsubuntume12    false    5600    495    499            
           2606    139538 X   chat_groupname_participants chat_groupname_participants_user_id_8839a457_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_groupname_participants
    ADD CONSTRAINT chat_groupname_participants_user_id_8839a457_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.chat_groupname_participants DROP CONSTRAINT chat_groupname_participants_user_id_8839a457_fk_auth_user_id;
       public          dbrdsubuntume12    false    499    213    4901                       2606    139228 D   chat_message chat_message_room_id_5e7d8d78_fk_chat_privatechtroom_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_room_id_5e7d8d78_fk_chat_privatechtroom_id FOREIGN KEY (room_id) REFERENCES public.chat_privatechtroom(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.chat_message DROP CONSTRAINT chat_message_room_id_5e7d8d78_fk_chat_privatechtroom_id;
       public          dbrdsubuntume12    false    489    491    5582                       2606    139233 :   chat_message chat_message_user_id_a47c01bb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_user_id_a47c01bb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.chat_message DROP CONSTRAINT chat_message_user_id_a47c01bb_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    491                       2606    139215 I   chat_privatechtroom chat_privatechtroom_user1_id_efd5a913_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_privatechtroom
    ADD CONSTRAINT chat_privatechtroom_user1_id_efd5a913_fk_auth_user_id FOREIGN KEY (user1_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.chat_privatechtroom DROP CONSTRAINT chat_privatechtroom_user1_id_efd5a913_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    489    213                       2606    139220 I   chat_privatechtroom chat_privatechtroom_user2_id_d14fa7dd_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_privatechtroom
    ADD CONSTRAINT chat_privatechtroom_user2_id_d14fa7dd_fk_auth_user_id FOREIGN KEY (user2_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.chat_privatechtroom DROP CONSTRAINT chat_privatechtroom_user2_id_d14fa7dd_fk_auth_user_id;
       public          dbrdsubuntume12    false    489    4901    213            �           2606    98603 E   chatapp_message chatapp_message_from_user_id_4fb7977a_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatapp_message
    ADD CONSTRAINT chatapp_message_from_user_id_4fb7977a_fk_auth_user_id FOREIGN KEY (from_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.chatapp_message DROP CONSTRAINT chatapp_message_from_user_id_4fb7977a_fk_auth_user_id;
       public          dbrdsubuntume12    false    403    213    4901            �           2606    98608 H   chatapp_message chatapp_message_group_id_e8cbe766_fk_chatapp_roomname_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatapp_message
    ADD CONSTRAINT chatapp_message_group_id_e8cbe766_fk_chatapp_roomname_id FOREIGN KEY (group_id) REFERENCES public.chatapp_roomname(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.chatapp_message DROP CONSTRAINT chatapp_message_group_id_e8cbe766_fk_chatapp_roomname_id;
       public          dbrdsubuntume12    false    403    399    5394            �           2606    98582 C   chatapp_roomname chatapp_roomname_admin_id_14e9b87d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatapp_roomname
    ADD CONSTRAINT chatapp_roomname_admin_id_14e9b87d_fk_auth_user_id FOREIGN KEY (admin_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.chatapp_roomname DROP CONSTRAINT chatapp_roomname_admin_id_14e9b87d_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    399            �           2606    98591 T   chatapp_roomname_participants chatapp_roomname_par_roomname_id_66268ed3_fk_chatapp_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatapp_roomname_participants
    ADD CONSTRAINT chatapp_roomname_par_roomname_id_66268ed3_fk_chatapp_r FOREIGN KEY (roomname_id) REFERENCES public.chatapp_roomname(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.chatapp_roomname_participants DROP CONSTRAINT chatapp_roomname_par_roomname_id_66268ed3_fk_chatapp_r;
       public          dbrdsubuntume12    false    401    5394    399            �           2606    98596 \   chatapp_roomname_participants chatapp_roomname_participants_user_id_cc4efff9_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatapp_roomname_participants
    ADD CONSTRAINT chatapp_roomname_participants_user_id_cc4efff9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.chatapp_roomname_participants DROP CONSTRAINT chatapp_roomname_participants_user_id_cc4efff9_fk_auth_user_id;
       public          dbrdsubuntume12    false    401    213    4901            �           2606    92462 Q   comment_postcomment_sad comment_postcomment__postcomment_id_0133d10f_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_sad
    ADD CONSTRAINT comment_postcomment__postcomment_id_0133d10f_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.comment_postcomment_sad DROP CONSTRAINT comment_postcomment__postcomment_id_0133d10f_fk_comment_p;
       public          dbrdsubuntume12    false    354    366    5269            �           2606    92420 R   comment_postcomment_haha comment_postcomment__postcomment_id_323f220b_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_haha
    ADD CONSTRAINT comment_postcomment__postcomment_id_323f220b_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postcomment_haha DROP CONSTRAINT comment_postcomment__postcomment_id_323f220b_fk_comment_p;
       public          dbrdsubuntume12    false    354    360    5269            �           2606    92392 S   comment_postcomment_angry comment_postcomment__postcomment_id_4d6e3d57_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_angry
    ADD CONSTRAINT comment_postcomment__postcomment_id_4d6e3d57_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.comment_postcomment_angry DROP CONSTRAINT comment_postcomment__postcomment_id_4d6e3d57_fk_comment_p;
       public          dbrdsubuntume12    false    5269    354    356            �           2606    92476 S   comment_postcomment_senti comment_postcomment__postcomment_id_924fffed_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_senti
    ADD CONSTRAINT comment_postcomment__postcomment_id_924fffed_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.comment_postcomment_senti DROP CONSTRAINT comment_postcomment__postcomment_id_924fffed_fk_comment_p;
       public          dbrdsubuntume12    false    5269    368    354            �           2606    92490 Q   comment_postcomment_wow comment_postcomment__postcomment_id_933861d1_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_wow
    ADD CONSTRAINT comment_postcomment__postcomment_id_933861d1_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.comment_postcomment_wow DROP CONSTRAINT comment_postcomment__postcomment_id_933861d1_fk_comment_p;
       public          dbrdsubuntume12    false    370    354    5269            �           2606    92448 R   comment_postcomment_love comment_postcomment__postcomment_id_b426a042_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_love
    ADD CONSTRAINT comment_postcomment__postcomment_id_b426a042_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postcomment_love DROP CONSTRAINT comment_postcomment__postcomment_id_b426a042_fk_comment_p;
       public          dbrdsubuntume12    false    354    364    5269            �           2606    92434 S   comment_postcomment_likes comment_postcomment__postcomment_id_d24bd329_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_likes
    ADD CONSTRAINT comment_postcomment__postcomment_id_d24bd329_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.comment_postcomment_likes DROP CONSTRAINT comment_postcomment__postcomment_id_d24bd329_fk_comment_p;
       public          dbrdsubuntume12    false    362    354    5269            �           2606    92406 R   comment_postcomment_care comment_postcomment__postcomment_id_f05a74ec_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_care
    ADD CONSTRAINT comment_postcomment__postcomment_id_f05a74ec_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postcomment_care DROP CONSTRAINT comment_postcomment__postcomment_id_f05a74ec_fk_comment_p;
       public          dbrdsubuntume12    false    354    5269    358            �           2606    92397 T   comment_postcomment_angry comment_postcomment_angry_user_id_2f028a37_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_angry
    ADD CONSTRAINT comment_postcomment_angry_user_id_2f028a37_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.comment_postcomment_angry DROP CONSTRAINT comment_postcomment_angry_user_id_2f028a37_fk_auth_user_id;
       public          dbrdsubuntume12    false    356    4901    213            �           2606    92411 R   comment_postcomment_care comment_postcomment_care_user_id_d7de2de8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_care
    ADD CONSTRAINT comment_postcomment_care_user_id_d7de2de8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postcomment_care DROP CONSTRAINT comment_postcomment_care_user_id_d7de2de8_fk_auth_user_id;
       public          dbrdsubuntume12    false    358    213    4901            �           2606    92425 R   comment_postcomment_haha comment_postcomment_haha_user_id_cccd063f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_haha
    ADD CONSTRAINT comment_postcomment_haha_user_id_cccd063f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postcomment_haha DROP CONSTRAINT comment_postcomment_haha_user_id_cccd063f_fk_auth_user_id;
       public          dbrdsubuntume12    false    360    4901    213            �           2606    92439 T   comment_postcomment_likes comment_postcomment_likes_user_id_8be0e63d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_likes
    ADD CONSTRAINT comment_postcomment_likes_user_id_8be0e63d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.comment_postcomment_likes DROP CONSTRAINT comment_postcomment_likes_user_id_8be0e63d_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    362    213            �           2606    92453 R   comment_postcomment_love comment_postcomment_love_user_id_8a331f22_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_love
    ADD CONSTRAINT comment_postcomment_love_user_id_8a331f22_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postcomment_love DROP CONSTRAINT comment_postcomment_love_user_id_8a331f22_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    364    4901            �           2606    92372 G   comment_postcomment comment_postcomment_parent_id_6a10978c_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment
    ADD CONSTRAINT comment_postcomment_parent_id_6a10978c_fk_comment_p FOREIGN KEY (parent_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.comment_postcomment DROP CONSTRAINT comment_postcomment_parent_id_6a10978c_fk_comment_p;
       public          dbrdsubuntume12    false    354    354    5269            �           2606    92377 P   comment_postcomment comment_postcomment_post_id_33329df0_fk_social_socialpost_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment
    ADD CONSTRAINT comment_postcomment_post_id_33329df0_fk_social_socialpost_id FOREIGN KEY (post_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.comment_postcomment DROP CONSTRAINT comment_postcomment_post_id_33329df0_fk_social_socialpost_id;
       public          dbrdsubuntume12    false    328    354    5195            �           2606    92467 P   comment_postcomment_sad comment_postcomment_sad_user_id_edffbf40_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_sad
    ADD CONSTRAINT comment_postcomment_sad_user_id_edffbf40_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.comment_postcomment_sad DROP CONSTRAINT comment_postcomment_sad_user_id_edffbf40_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    366    4901            �           2606    92481 T   comment_postcomment_senti comment_postcomment_senti_user_id_e43572ca_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_senti
    ADD CONSTRAINT comment_postcomment_senti_user_id_e43572ca_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.comment_postcomment_senti DROP CONSTRAINT comment_postcomment_senti_user_id_e43572ca_fk_auth_user_id;
       public          dbrdsubuntume12    false    368    213    4901            �           2606    92382 H   comment_postcomment comment_postcomment_user_id_eafd4d81_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment
    ADD CONSTRAINT comment_postcomment_user_id_eafd4d81_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.comment_postcomment DROP CONSTRAINT comment_postcomment_user_id_eafd4d81_fk_auth_user_id;
       public          dbrdsubuntume12    false    354    213    4901            �           2606    92495 P   comment_postcomment_wow comment_postcomment_wow_user_id_32548887_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcomment_wow
    ADD CONSTRAINT comment_postcomment_wow_user_id_32548887_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.comment_postcomment_wow DROP CONSTRAINT comment_postcomment_wow_user_id_32548887_fk_auth_user_id;
       public          dbrdsubuntume12    false    370    4901    213            �           2606    97920 T   comment_postcommenthistory comment_postcommenth_postcomment_id_0c75b18b_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcommenthistory
    ADD CONSTRAINT comment_postcommenth_postcomment_id_0c75b18b_fk_comment_p FOREIGN KEY (postcomment_id) REFERENCES public.comment_postcomment(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.comment_postcommenthistory DROP CONSTRAINT comment_postcommenth_postcomment_id_0c75b18b_fk_comment_p;
       public          dbrdsubuntume12    false    5269    354    395            �           2606    97925 V   comment_postcommenthistory comment_postcommenthistory_user_id_57371404_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postcommenthistory
    ADD CONSTRAINT comment_postcommenthistory_user_id_57371404_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postcommenthistory DROP CONSTRAINT comment_postcommenthistory_user_id_57371404_fk_auth_user_id;
       public          dbrdsubuntume12    false    395    213    4901            �           2606    97466 M   comment_postphotocomment comment_postphotocom_parent_id_34d56f70_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment
    ADD CONSTRAINT comment_postphotocom_parent_id_34d56f70_fk_comment_p FOREIGN KEY (parent_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.comment_postphotocomment DROP CONSTRAINT comment_postphotocom_parent_id_34d56f70_fk_comment_p;
       public          dbrdsubuntume12    false    5330    375    375            �           2606    97471 L   comment_postphotocomment comment_postphotocom_photo_id_5c5aac33_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment
    ADD CONSTRAINT comment_postphotocom_photo_id_5c5aac33_fk_social_so FOREIGN KEY (photo_id) REFERENCES public.social_socialphoto(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.comment_postphotocomment DROP CONSTRAINT comment_postphotocom_photo_id_5c5aac33_fk_social_so;
       public          dbrdsubuntume12    false    375    352    5264            �           2606    97570 ]   comment_postphotocomment_senti comment_postphotocom_postphotocomment_id_03647fe9_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_senti
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_03647fe9_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_senti DROP CONSTRAINT comment_postphotocom_postphotocomment_id_03647fe9_fk_comment_p;
       public          dbrdsubuntume12    false    375    389    5330            �           2606    97486 ]   comment_postphotocomment_angry comment_postphotocom_postphotocomment_id_042a7e5c_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_angry
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_042a7e5c_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_angry DROP CONSTRAINT comment_postphotocom_postphotocomment_id_042a7e5c_fk_comment_p;
       public          dbrdsubuntume12    false    5330    377    375            �           2606    97528 ]   comment_postphotocomment_likes comment_postphotocom_postphotocomment_id_272894fd_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_likes
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_272894fd_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_likes DROP CONSTRAINT comment_postphotocom_postphotocomment_id_272894fd_fk_comment_p;
       public          dbrdsubuntume12    false    375    383    5330            �           2606    97584 [   comment_postphotocomment_wow comment_postphotocom_postphotocomment_id_33acb3f4_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_wow
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_33acb3f4_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_wow DROP CONSTRAINT comment_postphotocom_postphotocomment_id_33acb3f4_fk_comment_p;
       public          dbrdsubuntume12    false    391    375    5330            �           2606    97514 \   comment_postphotocomment_haha comment_postphotocom_postphotocomment_id_661c4f19_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_haha
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_661c4f19_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_haha DROP CONSTRAINT comment_postphotocom_postphotocomment_id_661c4f19_fk_comment_p;
       public          dbrdsubuntume12    false    375    5330    381            �           2606    97556 [   comment_postphotocomment_sad comment_postphotocom_postphotocomment_id_6b21c374_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_sad
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_6b21c374_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_sad DROP CONSTRAINT comment_postphotocom_postphotocomment_id_6b21c374_fk_comment_p;
       public          dbrdsubuntume12    false    5330    387    375            �           2606    97500 \   comment_postphotocomment_care comment_postphotocom_postphotocomment_id_b1840016_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_care
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_b1840016_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_care DROP CONSTRAINT comment_postphotocom_postphotocomment_id_b1840016_fk_comment_p;
       public          dbrdsubuntume12    false    5330    375    379            �           2606    97908 ^   comment_postphotocommenthistory comment_postphotocom_postphotocomment_id_d518babb_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocommenthistory
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_d518babb_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocommenthistory DROP CONSTRAINT comment_postphotocom_postphotocomment_id_d518babb_fk_comment_p;
       public          dbrdsubuntume12    false    5330    393    375            �           2606    97542 \   comment_postphotocomment_love comment_postphotocom_postphotocomment_id_f62cb61e_fk_comment_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_love
    ADD CONSTRAINT comment_postphotocom_postphotocomment_id_f62cb61e_fk_comment_p FOREIGN KEY (postphotocomment_id) REFERENCES public.comment_postphotocomment(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_love DROP CONSTRAINT comment_postphotocom_postphotocomment_id_f62cb61e_fk_comment_p;
       public          dbrdsubuntume12    false    5330    385    375            �           2606    97913 R   comment_postphotocommenthistory comment_postphotocom_user_id_37b15aba_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocommenthistory
    ADD CONSTRAINT comment_postphotocom_user_id_37b15aba_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postphotocommenthistory DROP CONSTRAINT comment_postphotocom_user_id_37b15aba_fk_auth_user;
       public          dbrdsubuntume12    false    393    4901    213            �           2606    97491 ^   comment_postphotocomment_angry comment_postphotocomment_angry_user_id_411781d0_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_angry
    ADD CONSTRAINT comment_postphotocomment_angry_user_id_411781d0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_angry DROP CONSTRAINT comment_postphotocomment_angry_user_id_411781d0_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    377    213            �           2606    97505 \   comment_postphotocomment_care comment_postphotocomment_care_user_id_73667487_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_care
    ADD CONSTRAINT comment_postphotocomment_care_user_id_73667487_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_care DROP CONSTRAINT comment_postphotocomment_care_user_id_73667487_fk_auth_user_id;
       public          dbrdsubuntume12    false    379    213    4901            �           2606    97519 \   comment_postphotocomment_haha comment_postphotocomment_haha_user_id_a2fde95c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_haha
    ADD CONSTRAINT comment_postphotocomment_haha_user_id_a2fde95c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_haha DROP CONSTRAINT comment_postphotocomment_haha_user_id_a2fde95c_fk_auth_user_id;
       public          dbrdsubuntume12    false    381    4901    213            �           2606    97533 ^   comment_postphotocomment_likes comment_postphotocomment_likes_user_id_2f924e32_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_likes
    ADD CONSTRAINT comment_postphotocomment_likes_user_id_2f924e32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_likes DROP CONSTRAINT comment_postphotocomment_likes_user_id_2f924e32_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    383    213            �           2606    97547 \   comment_postphotocomment_love comment_postphotocomment_love_user_id_085dad68_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_love
    ADD CONSTRAINT comment_postphotocomment_love_user_id_085dad68_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_love DROP CONSTRAINT comment_postphotocomment_love_user_id_085dad68_fk_auth_user_id;
       public          dbrdsubuntume12    false    385    4901    213            �           2606    97561 Z   comment_postphotocomment_sad comment_postphotocomment_sad_user_id_3bfb9ca8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_sad
    ADD CONSTRAINT comment_postphotocomment_sad_user_id_3bfb9ca8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_sad DROP CONSTRAINT comment_postphotocomment_sad_user_id_3bfb9ca8_fk_auth_user_id;
       public          dbrdsubuntume12    false    387    4901    213            �           2606    97575 ^   comment_postphotocomment_senti comment_postphotocomment_senti_user_id_1976f98f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_senti
    ADD CONSTRAINT comment_postphotocomment_senti_user_id_1976f98f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_senti DROP CONSTRAINT comment_postphotocomment_senti_user_id_1976f98f_fk_auth_user_id;
       public          dbrdsubuntume12    false    389    213    4901            �           2606    97476 R   comment_postphotocomment comment_postphotocomment_user_id_ead60baf_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment
    ADD CONSTRAINT comment_postphotocomment_user_id_ead60baf_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.comment_postphotocomment DROP CONSTRAINT comment_postphotocomment_user_id_ead60baf_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    375    4901            �           2606    97589 Z   comment_postphotocomment_wow comment_postphotocomment_wow_user_id_2a7f23cb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_postphotocomment_wow
    ADD CONSTRAINT comment_postphotocomment_wow_user_id_2a7f23cb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.comment_postphotocomment_wow DROP CONSTRAINT comment_postphotocomment_wow_user_id_2a7f23cb_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    391            >           2606    85056 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          dbrdsubuntume12    false    205    219    4883            ?           2606    85061 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    219    4901            �           2606    100121 N   employer_applicants employer_applicants_job_id_d6178125_fk_employer_jobpost_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_applicants
    ADD CONSTRAINT employer_applicants_job_id_d6178125_fk_employer_jobpost_id FOREIGN KEY (job_id) REFERENCES public.employer_jobpost(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.employer_applicants DROP CONSTRAINT employer_applicants_job_id_d6178125_fk_employer_jobpost_id;
       public          dbrdsubuntume12    false    224    4939    429            �           2606    100141 K   employer_applicants employer_applicants_jobprofile_id_ed8265b0_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_applicants
    ADD CONSTRAINT employer_applicants_jobprofile_id_ed8265b0_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.employer_applicants DROP CONSTRAINT employer_applicants_jobprofile_id_ed8265b0_fk_jobs_jobp;
       public          dbrdsubuntume12    false    429    4943    226            A           2606    112653 K   employer_employer employer_employer_functional_cat_id_337ea705_fk_jobs_func    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer
    ADD CONSTRAINT employer_employer_functional_cat_id_337ea705_fk_jobs_func FOREIGN KEY (functional_cat_id) REFERENCES public.jobs_functionaljobcategory(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.employer_employer DROP CONSTRAINT employer_employer_functional_cat_id_337ea705_fk_jobs_func;
       public          dbrdsubuntume12    false    222    439    5481            B           2606    112658 I   employer_employer employer_employer_industry_cat_id_e04a50bd_fk_jobs_indu    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer
    ADD CONSTRAINT employer_employer_industry_cat_id_e04a50bd_fk_jobs_indu FOREIGN KEY (industry_cat_id) REFERENCES public.jobs_industrycategory(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.employer_employer DROP CONSTRAINT employer_employer_industry_cat_id_e04a50bd_fk_jobs_indu;
       public          dbrdsubuntume12    false    5483    441    222            C           2606    112663 J   employer_employer employer_employer_industry_type_id_a06a0b4a_fk_jobs_orga    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer
    ADD CONSTRAINT employer_employer_industry_type_id_a06a0b4a_fk_jobs_orga FOREIGN KEY (industry_type_id) REFERENCES public.jobs_organizationtype(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.employer_employer DROP CONSTRAINT employer_employer_industry_type_id_a06a0b4a_fk_jobs_orga;
       public          dbrdsubuntume12    false    5487    445    222            �           2606    122153 S   employer_employer_moderators employer_employer_mo_employer_id_763847d5_fk_employer_    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_moderators
    ADD CONSTRAINT employer_employer_mo_employer_id_763847d5_fk_employer_ FOREIGN KEY (employer_id) REFERENCES public.employer_employer(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.employer_employer_moderators DROP CONSTRAINT employer_employer_mo_employer_id_763847d5_fk_employer_;
       public          dbrdsubuntume12    false    4929    222    469            �           2606    122158 Z   employer_employer_moderators employer_employer_moderators_user_id_6c56a3a9_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_moderators
    ADD CONSTRAINT employer_employer_moderators_user_id_6c56a3a9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.employer_employer_moderators DROP CONSTRAINT employer_employer_moderators_user_id_6c56a3a9_fk_auth_user_id;
       public          dbrdsubuntume12    false    469    213    4901            �           2606    130878 [   employer_employer_pending_moderators employer_employer_pe_employer_id_8855529e_fk_employer_    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_pending_moderators
    ADD CONSTRAINT employer_employer_pe_employer_id_8855529e_fk_employer_ FOREIGN KEY (employer_id) REFERENCES public.employer_employer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.employer_employer_pending_moderators DROP CONSTRAINT employer_employer_pe_employer_id_8855529e_fk_employer_;
       public          dbrdsubuntume12    false    4929    471    222            �           2606    130883 W   employer_employer_pending_moderators employer_employer_pe_user_id_26d29548_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer_pending_moderators
    ADD CONSTRAINT employer_employer_pe_user_id_26d29548_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.employer_employer_pending_moderators DROP CONSTRAINT employer_employer_pe_user_id_26d29548_fk_auth_user;
       public          dbrdsubuntume12    false    4901    213    471            @           2606    111198 D   employer_employer employer_employer_user_id_33293a8d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_employer
    ADD CONSTRAINT employer_employer_user_id_33293a8d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.employer_employer DROP CONSTRAINT employer_employer_user_id_33293a8d_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    222    4901            �           2606    100156 N   employer_jobpost_applied employer_jobpost_app_jobpost_id_fd60bafb_fk_employer_    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost_applied
    ADD CONSTRAINT employer_jobpost_app_jobpost_id_fd60bafb_fk_employer_ FOREIGN KEY (jobpost_id) REFERENCES public.employer_jobpost(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.employer_jobpost_applied DROP CONSTRAINT employer_jobpost_app_jobpost_id_fd60bafb_fk_employer_;
       public          dbrdsubuntume12    false    431    4939    224            �           2606    100161 R   employer_jobpost_applied employer_jobpost_applied_user_id_d8f7a488_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost_applied
    ADD CONSTRAINT employer_jobpost_applied_user_id_d8f7a488_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.employer_jobpost_applied DROP CONSTRAINT employer_jobpost_applied_user_id_d8f7a488_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    431            D           2606    85157 N   employer_jobpost employer_jobpost_employer_id_1c2c1b18_fk_employer_employer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost
    ADD CONSTRAINT employer_jobpost_employer_id_1c2c1b18_fk_employer_employer_id FOREIGN KEY (employer_id) REFERENCES public.employer_employer(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.employer_jobpost DROP CONSTRAINT employer_jobpost_employer_id_1c2c1b18_fk_employer_employer_id;
       public          dbrdsubuntume12    false    4929    224    222            E           2606    112668 L   employer_jobpost employer_jobpost_functional_category__062f5c13_fk_jobs_func    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost
    ADD CONSTRAINT employer_jobpost_functional_category__062f5c13_fk_jobs_func FOREIGN KEY (functional_category_id) REFERENCES public.jobs_functionaljobcategory(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.employer_jobpost DROP CONSTRAINT employer_jobpost_functional_category__062f5c13_fk_jobs_func;
       public          dbrdsubuntume12    false    224    439    5481            F           2606    112673 L   employer_jobpost employer_jobpost_industry_category_id_d43c29fa_fk_jobs_indu    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost
    ADD CONSTRAINT employer_jobpost_industry_category_id_d43c29fa_fk_jobs_indu FOREIGN KEY (industry_category_id) REFERENCES public.jobs_industrycategory(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.employer_jobpost DROP CONSTRAINT employer_jobpost_industry_category_id_d43c29fa_fk_jobs_indu;
       public          dbrdsubuntume12    false    441    224    5483            H           2606    118573 J   employer_jobpost employer_jobpost_job_location_id_9adb5775_fk_jobs_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost
    ADD CONSTRAINT employer_jobpost_job_location_id_9adb5775_fk_jobs_city_id FOREIGN KEY (job_location_id) REFERENCES public.jobs_city(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.employer_jobpost DROP CONSTRAINT employer_jobpost_job_location_id_9adb5775_fk_jobs_city_id;
       public          dbrdsubuntume12    false    5522    224    467            G           2606    112678 L   employer_jobpost employer_jobpost_special_skills_categ_984114da_fk_jobs_spec    FK CONSTRAINT     �   ALTER TABLE ONLY public.employer_jobpost
    ADD CONSTRAINT employer_jobpost_special_skills_categ_984114da_fk_jobs_spec FOREIGN KEY (special_skills_category_id) REFERENCES public.jobs_specialskillcategory(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.employer_jobpost DROP CONSTRAINT employer_jobpost_special_skills_categ_984114da_fk_jobs_spec;
       public          dbrdsubuntume12    false    224    449    5491            �           2606    98698 N   follow_friends_following follow_friends_follo_friends_id_5303b11d_fk_follow_fr    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_following
    ADD CONSTRAINT follow_friends_follo_friends_id_5303b11d_fk_follow_fr FOREIGN KEY (friends_id) REFERENCES public.follow_friends(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.follow_friends_following DROP CONSTRAINT follow_friends_follo_friends_id_5303b11d_fk_follow_fr;
       public          dbrdsubuntume12    false    405    409    5409            �           2606    98684 M   follow_friends_follower follow_friends_follo_friends_id_85d501b7_fk_follow_fr    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_follower
    ADD CONSTRAINT follow_friends_follo_friends_id_85d501b7_fk_follow_fr FOREIGN KEY (friends_id) REFERENCES public.follow_friends(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.follow_friends_follower DROP CONSTRAINT follow_friends_follo_friends_id_85d501b7_fk_follow_fr;
       public          dbrdsubuntume12    false    405    5409    407            �           2606    98689 P   follow_friends_follower follow_friends_follower_user_id_6d67dd62_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_follower
    ADD CONSTRAINT follow_friends_follower_user_id_6d67dd62_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.follow_friends_follower DROP CONSTRAINT follow_friends_follower_user_id_6d67dd62_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    407    213            �           2606    98703 R   follow_friends_following follow_friends_following_user_id_32756a4a_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_following
    ADD CONSTRAINT follow_friends_following_user_id_32756a4a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.follow_friends_following DROP CONSTRAINT follow_friends_following_user_id_32756a4a_fk_auth_user_id;
       public          dbrdsubuntume12    false    409    213    4901            �           2606    98717 \   follow_friends_to_be_follower follow_friends_to_be_follower_user_id_67869386_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_follower
    ADD CONSTRAINT follow_friends_to_be_follower_user_id_67869386_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.follow_friends_to_be_follower DROP CONSTRAINT follow_friends_to_be_follower_user_id_67869386_fk_auth_user_id;
       public          dbrdsubuntume12    false    411    213    4901            �           2606    98731 ^   follow_friends_to_be_following follow_friends_to_be_following_user_id_367d9fa8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_following
    ADD CONSTRAINT follow_friends_to_be_following_user_id_367d9fa8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.follow_friends_to_be_following DROP CONSTRAINT follow_friends_to_be_following_user_id_367d9fa8_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    413            �           2606    98712 S   follow_friends_to_be_follower follow_friends_to_be_friends_id_bf285438_fk_follow_fr    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_follower
    ADD CONSTRAINT follow_friends_to_be_friends_id_bf285438_fk_follow_fr FOREIGN KEY (friends_id) REFERENCES public.follow_friends(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.follow_friends_to_be_follower DROP CONSTRAINT follow_friends_to_be_friends_id_bf285438_fk_follow_fr;
       public          dbrdsubuntume12    false    5409    405    411            �           2606    98726 T   follow_friends_to_be_following follow_friends_to_be_friends_id_ce894f15_fk_follow_fr    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends_to_be_following
    ADD CONSTRAINT follow_friends_to_be_friends_id_ce894f15_fk_follow_fr FOREIGN KEY (friends_id) REFERENCES public.follow_friends(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.follow_friends_to_be_following DROP CONSTRAINT follow_friends_to_be_friends_id_ce894f15_fk_follow_fr;
       public          dbrdsubuntume12    false    405    5409    413            �           2606    98677 >   follow_friends follow_friends_user_id_8c488c9a_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow_friends
    ADD CONSTRAINT follow_friends_user_id_8c488c9a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.follow_friends DROP CONSTRAINT follow_friends_user_id_8c488c9a_fk_auth_user_id;
       public          dbrdsubuntume12    false    405    213    4901            �           2606    99263 O   followfollowing_blockedby followfollowing_bloc_friends_id_505196ad_fk_followfol    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_blockedby
    ADD CONSTRAINT followfollowing_bloc_friends_id_505196ad_fk_followfol FOREIGN KEY (friends_id) REFERENCES public.followfollowing_friends(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.followfollowing_blockedby DROP CONSTRAINT followfollowing_bloc_friends_id_505196ad_fk_followfol;
       public          dbrdsubuntume12    false    419    5445    427            �           2606    99251 O   followfollowing_blocklist followfollowing_bloc_friends_id_e75971bd_fk_followfol    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_blocklist
    ADD CONSTRAINT followfollowing_bloc_friends_id_e75971bd_fk_followfol FOREIGN KEY (friends_id) REFERENCES public.followfollowing_friends(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.followfollowing_blocklist DROP CONSTRAINT followfollowing_bloc_friends_id_e75971bd_fk_followfol;
       public          dbrdsubuntume12    false    5445    425    419            �           2606    99268 T   followfollowing_blockedby followfollowing_blockedby_user_id_7f39cfbd_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_blockedby
    ADD CONSTRAINT followfollowing_blockedby_user_id_7f39cfbd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.followfollowing_blockedby DROP CONSTRAINT followfollowing_blockedby_user_id_7f39cfbd_fk_auth_user_id;
       public          dbrdsubuntume12    false    427    4901    213            �           2606    99256 T   followfollowing_blocklist followfollowing_blocklist_user_id_132f91a4_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_blocklist
    ADD CONSTRAINT followfollowing_blocklist_user_id_132f91a4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.followfollowing_blocklist DROP CONSTRAINT followfollowing_blocklist_user_id_132f91a4_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    425    213            �           2606    98865 O   followfollowing_followers followfollowing_foll_friends_id_571fe6c3_fk_followfol    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_followers
    ADD CONSTRAINT followfollowing_foll_friends_id_571fe6c3_fk_followfol FOREIGN KEY (friends_id) REFERENCES public.followfollowing_friends(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.followfollowing_followers DROP CONSTRAINT followfollowing_foll_friends_id_571fe6c3_fk_followfol;
       public          dbrdsubuntume12    false    5445    419    415            �           2606    98855 P   followfollowing_followings followfollowing_foll_friends_id_89b86772_fk_followfol    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_followings
    ADD CONSTRAINT followfollowing_foll_friends_id_89b86772_fk_followfol FOREIGN KEY (friends_id) REFERENCES public.followfollowing_friends(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.followfollowing_followings DROP CONSTRAINT followfollowing_foll_friends_id_89b86772_fk_followfol;
       public          dbrdsubuntume12    false    419    5445    417            �           2606    98870 T   followfollowing_followers followfollowing_followers_user_id_2c6d8092_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_followers
    ADD CONSTRAINT followfollowing_followers_user_id_2c6d8092_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.followfollowing_followers DROP CONSTRAINT followfollowing_followers_user_id_2c6d8092_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    415            �           2606    98860 V   followfollowing_followings followfollowing_followings_user_id_4f03c564_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_followings
    ADD CONSTRAINT followfollowing_followings_user_id_4f03c564_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.followfollowing_followings DROP CONSTRAINT followfollowing_followings_user_id_4f03c564_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    417    213            �           2606    98850 P   followfollowing_friends followfollowing_friends_user_id_d79f73f7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_friends
    ADD CONSTRAINT followfollowing_friends_user_id_d79f73f7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.followfollowing_friends DROP CONSTRAINT followfollowing_friends_user_id_d79f73f7_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    419    213            �           2606    98875 T   followfollowing_tobefollowings followfollowing_tobe_friends_id_43b3a92a_fk_followfol    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_tobefollowings
    ADD CONSTRAINT followfollowing_tobe_friends_id_43b3a92a_fk_followfol FOREIGN KEY (friends_id) REFERENCES public.followfollowing_friends(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.followfollowing_tobefollowings DROP CONSTRAINT followfollowing_tobe_friends_id_43b3a92a_fk_followfol;
       public          dbrdsubuntume12    false    421    5445    419            �           2606    98887 S   followfollowing_tobefollowers followfollowing_tobe_friends_id_b62a3170_fk_followfol    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_tobefollowers
    ADD CONSTRAINT followfollowing_tobe_friends_id_b62a3170_fk_followfol FOREIGN KEY (friends_id) REFERENCES public.followfollowing_friends(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.followfollowing_tobefollowers DROP CONSTRAINT followfollowing_tobe_friends_id_b62a3170_fk_followfol;
       public          dbrdsubuntume12    false    419    423    5445            �           2606    98892 \   followfollowing_tobefollowers followfollowing_tobefollowers_user_id_71bbb058_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_tobefollowers
    ADD CONSTRAINT followfollowing_tobefollowers_user_id_71bbb058_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.followfollowing_tobefollowers DROP CONSTRAINT followfollowing_tobefollowers_user_id_71bbb058_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    423            �           2606    98880 ^   followfollowing_tobefollowings followfollowing_tobefollowings_user_id_8935b5d9_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.followfollowing_tobefollowings
    ADD CONSTRAINT followfollowing_tobefollowings_user_id_8935b5d9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.followfollowing_tobefollowings DROP CONSTRAINT followfollowing_tobefollowings_user_id_8935b5d9_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    421            X           2606    85826 K   jobs_armyexperience jobs_amryexperience_jobprofile_id_be0ec663_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_armyexperience
    ADD CONSTRAINT jobs_amryexperience_jobprofile_id_be0ec663_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.jobs_armyexperience DROP CONSTRAINT jobs_amryexperience_jobprofile_id_be0ec663_fk_jobs_jobp;
       public          dbrdsubuntume12    false    226    4943    254            �           2606    118556 6   jobs_city jobs_city_state_id_256f4ada_fk_jobs_state_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_city
    ADD CONSTRAINT jobs_city_state_id_256f4ada_fk_jobs_state_id FOREIGN KEY (state_id) REFERENCES public.jobs_state(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.jobs_city DROP CONSTRAINT jobs_city_state_id_256f4ada_fk_jobs_state_id;
       public          dbrdsubuntume12    false    465    5519    467            �           2606    118533 D   jobs_country jobs_country_continent_id_eb7c8bbf_fk_jobs_continent_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_country
    ADD CONSTRAINT jobs_country_continent_id_eb7c8bbf_fk_jobs_continent_id FOREIGN KEY (continent_id) REFERENCES public.jobs_continent(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.jobs_country DROP CONSTRAINT jobs_country_continent_id_eb7c8bbf_fk_jobs_continent_id;
       public          dbrdsubuntume12    false    463    5513    461            �           2606    116555 F   jobs_degreeorexam jobs_degreeorexam_edu_level_id_d3c2141a_fk_jobs_educ    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_degreeorexam
    ADD CONSTRAINT jobs_degreeorexam_edu_level_id_d3c2141a_fk_jobs_educ FOREIGN KEY (edu_level_id) REFERENCES public.jobs_educationlevel(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.jobs_degreeorexam DROP CONSTRAINT jobs_degreeorexam_edu_level_id_d3c2141a_fk_jobs_educ;
       public          dbrdsubuntume12    false    455    457    5508            R           2606    85375 T   jobs_disability_information jobs_disability_info_jobprofile_id_6bb29fbe_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_disability_information
    ADD CONSTRAINT jobs_disability_info_jobprofile_id_6bb29fbe_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.jobs_disability_information DROP CONSTRAINT jobs_disability_info_jobprofile_id_6bb29fbe_fk_jobs_jobp;
       public          dbrdsubuntume12    false    4943    242    226            Q           2606    85369 N   jobs_educationprofile jobs_educationprofil_jobprofile_id_cf95e9c5_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_educationprofile
    ADD CONSTRAINT jobs_educationprofil_jobprofile_id_cf95e9c5_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.jobs_educationprofile DROP CONSTRAINT jobs_educationprofil_jobprofile_id_cf95e9c5_fk_jobs_jobp;
       public          dbrdsubuntume12    false    240    4943    226            P           2606    85363 L   jobs_experience jobs_experience_jobprofile_id_c1e25191_fk_jobs_jobprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_experience
    ADD CONSTRAINT jobs_experience_jobprofile_id_c1e25191_fk_jobs_jobprofile_id FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.jobs_experience DROP CONSTRAINT jobs_experience_jobprofile_id_c1e25191_fk_jobs_jobprofile_id;
       public          dbrdsubuntume12    false    4943    238    226            �           2606    112707 ^   jobs_jobprofile_job_categories jobs_jobprofile_job__functionaljobcategor_18136d20_fk_jobs_func    FK CONSTRAINT       ALTER TABLE ONLY public.jobs_jobprofile_job_categories
    ADD CONSTRAINT jobs_jobprofile_job__functionaljobcategor_18136d20_fk_jobs_func FOREIGN KEY (functionaljobcategory_id) REFERENCES public.jobs_functionaljobcategory(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories DROP CONSTRAINT jobs_jobprofile_job__functionaljobcategor_18136d20_fk_jobs_func;
       public          dbrdsubuntume12    false    451    439    5481            �           2606    112702 W   jobs_jobprofile_job_categories jobs_jobprofile_job__jobprofile_id_e33355ba_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories
    ADD CONSTRAINT jobs_jobprofile_job__jobprofile_id_e33355ba_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.jobs_jobprofile_job_categories DROP CONSTRAINT jobs_jobprofile_job__jobprofile_id_e33355ba_fk_jobs_jobp;
       public          dbrdsubuntume12    false    226    4943    451            J           2606    121195 H   jobs_jobprofile jobs_jobprofile_job_location_id_32dcda21_fk_jobs_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile
    ADD CONSTRAINT jobs_jobprofile_job_location_id_32dcda21_fk_jobs_city_id FOREIGN KEY (job_location_id) REFERENCES public.jobs_city(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.jobs_jobprofile DROP CONSTRAINT jobs_jobprofile_job_location_id_32dcda21_fk_jobs_city_id;
       public          dbrdsubuntume12    false    226    467    5522            �           2606    112716 W   jobs_jobprofile_special_skills jobs_jobprofile_spec_jobprofile_id_ee55fd34_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills
    ADD CONSTRAINT jobs_jobprofile_spec_jobprofile_id_ee55fd34_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills DROP CONSTRAINT jobs_jobprofile_spec_jobprofile_id_ee55fd34_fk_jobs_jobp;
       public          dbrdsubuntume12    false    226    453    4943            �           2606    112721 ^   jobs_jobprofile_special_skills jobs_jobprofile_spec_specialskillcategory_b25b574e_fk_jobs_spec    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills
    ADD CONSTRAINT jobs_jobprofile_spec_specialskillcategory_b25b574e_fk_jobs_spec FOREIGN KEY (specialskillcategory_id) REFERENCES public.jobs_specialskillcategory(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.jobs_jobprofile_special_skills DROP CONSTRAINT jobs_jobprofile_spec_specialskillcategory_b25b574e_fk_jobs_spec;
       public          dbrdsubuntume12    false    453    5491    449            I           2606    85263 @   jobs_jobprofile jobs_jobprofile_user_id_dec8df4c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_jobprofile
    ADD CONSTRAINT jobs_jobprofile_user_id_dec8df4c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.jobs_jobprofile DROP CONSTRAINT jobs_jobprofile_user_id_dec8df4c_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    226    4901            �           2606    116560 D   jobs_majorin jobs_majorin_degree_id_9295b263_fk_jobs_degreeorexam_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_majorin
    ADD CONSTRAINT jobs_majorin_degree_id_9295b263_fk_jobs_degreeorexam_id FOREIGN KEY (degree_id) REFERENCES public.jobs_degreeorexam(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.jobs_majorin DROP CONSTRAINT jobs_majorin_degree_id_9295b263_fk_jobs_degreeorexam_id;
       public          dbrdsubuntume12    false    455    459    5506            O           2606    85343 V   jobs_professional_certificate jobs_professional_ce_jobprofile_id_d75bc07e_fk_jobs_jobp    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_professional_certificate
    ADD CONSTRAINT jobs_professional_ce_jobprofile_id_d75bc07e_fk_jobs_jobp FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.jobs_professional_certificate DROP CONSTRAINT jobs_professional_ce_jobprofile_id_d75bc07e_fk_jobs_jobp;
       public          dbrdsubuntume12    false    4943    236    226            N           2606    85337 R   jobs_project_works jobs_project_works_jobprofile_id_e159399e_fk_jobs_jobprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_project_works
    ADD CONSTRAINT jobs_project_works_jobprofile_id_e159399e_fk_jobs_jobprofile_id FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.jobs_project_works DROP CONSTRAINT jobs_project_works_jobprofile_id_e159399e_fk_jobs_jobprofile_id;
       public          dbrdsubuntume12    false    4943    226    234            M           2606    85331 J   jobs_reference jobs_reference_jobprofile_id_3e0a7bba_fk_jobs_jobprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_reference
    ADD CONSTRAINT jobs_reference_jobprofile_id_3e0a7bba_fk_jobs_jobprofile_id FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.jobs_reference DROP CONSTRAINT jobs_reference_jobprofile_id_3e0a7bba_fk_jobs_jobprofile_id;
       public          dbrdsubuntume12    false    226    4943    232            L           2606    85325 D   jobs_skills jobs_skills_jobprofile_id_9f94ddb7_fk_jobs_jobprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_jobprofile_id_9f94ddb7_fk_jobs_jobprofile_id FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.jobs_skills DROP CONSTRAINT jobs_skills_jobprofile_id_9f94ddb7_fk_jobs_jobprofile_id;
       public          dbrdsubuntume12    false    230    4943    226            �           2606    118539 <   jobs_state jobs_state_country_id_7c0f7a3d_fk_jobs_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_state
    ADD CONSTRAINT jobs_state_country_id_7c0f7a3d_fk_jobs_country_id FOREIGN KEY (country_id) REFERENCES public.jobs_country(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.jobs_state DROP CONSTRAINT jobs_state_country_id_7c0f7a3d_fk_jobs_country_id;
       public          dbrdsubuntume12    false    465    5516    463            K           2606    85319 H   jobs_training jobs_training_jobprofile_id_50609c40_fk_jobs_jobprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_training
    ADD CONSTRAINT jobs_training_jobprofile_id_50609c40_fk_jobs_jobprofile_id FOREIGN KEY (jobprofile_id) REFERENCES public.jobs_jobprofile(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.jobs_training DROP CONSTRAINT jobs_training_jobprofile_id_50609c40_fk_jobs_jobprofile_id;
       public          dbrdsubuntume12    false    226    4943    228            T           2606    85411 J   metrimony_expectaion metrimony_expectaion_user_id_0f0ca0bb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_expectaion
    ADD CONSTRAINT metrimony_expectaion_user_id_0f0ca0bb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.metrimony_expectaion DROP CONSTRAINT metrimony_expectaion_user_id_0f0ca0bb_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    246    213                       2606    139607 T   metrimony_matriblocklist metrimony_matriblock_personal_info_id_aee7a90f_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_matriblocklist
    ADD CONSTRAINT metrimony_matriblock_personal_info_id_aee7a90f_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.metrimony_matriblocklist DROP CONSTRAINT metrimony_matriblock_personal_info_id_aee7a90f_fk_metrimony;
       public          dbrdsubuntume12    false    244    503    4972                       2606    139619 T   metrimony_matriblockedby metrimony_matriblock_personal_info_id_da425c53_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_matriblockedby
    ADD CONSTRAINT metrimony_matriblock_personal_info_id_da425c53_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.metrimony_matriblockedby DROP CONSTRAINT metrimony_matriblock_personal_info_id_da425c53_fk_metrimony;
       public          dbrdsubuntume12    false    4972    505    244                       2606    139633 R   metrimony_matriblockedby metrimony_matriblockedby_user_id_c2341b3a_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_matriblockedby
    ADD CONSTRAINT metrimony_matriblockedby_user_id_c2341b3a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.metrimony_matriblockedby DROP CONSTRAINT metrimony_matriblockedby_user_id_c2341b3a_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    505    4901                       2606    139639 R   metrimony_matriblocklist metrimony_matriblocklist_user_id_117c59f9_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_matriblocklist
    ADD CONSTRAINT metrimony_matriblocklist_user_id_117c59f9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.metrimony_matriblocklist DROP CONSTRAINT metrimony_matriblocklist_user_id_117c59f9_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    503            �           2606    135946 Z   metrimony_personal_info_viewed metrimony_personal_i_personal_info_id_177ca629_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_177ca629_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_viewed DROP CONSTRAINT metrimony_personal_i_personal_info_id_177ca629_fk_metrimony;
       public          dbrdsubuntume12    false    479    4972    244            �           2606    135924 ]   metrimony_personal_info_viewed_by metrimony_personal_i_personal_info_id_1aaecaef_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_1aaecaef_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by DROP CONSTRAINT metrimony_personal_i_personal_info_id_1aaecaef_fk_metrimony;
       public          dbrdsubuntume12    false    4972    477    244            �           2606    136020 i   metrimony_personal_info_pending_interested_by metrimony_personal_i_personal_info_id_72831fbe_fk_metrimony    FK CONSTRAINT       ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_72831fbe_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by DROP CONSTRAINT metrimony_personal_i_personal_info_id_72831fbe_fk_metrimony;
       public          dbrdsubuntume12    false    4972    244    485            �           2606    136006 a   metrimony_personal_info_interested_by metrimony_personal_i_personal_info_id_8136467a_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_8136467a_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by DROP CONSTRAINT metrimony_personal_i_personal_info_id_8136467a_fk_metrimony;
       public          dbrdsubuntume12    false    4972    244    483                        2606    136034 _   metrimony_personal_info_shortlisted metrimony_personal_i_personal_info_id_e10c0f4c_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_e10c0f4c_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted DROP CONSTRAINT metrimony_personal_i_personal_info_id_e10c0f4c_fk_metrimony;
       public          dbrdsubuntume12    false    244    4972    487            �           2606    135992 ^   metrimony_personal_info_interested metrimony_personal_i_personal_info_id_e9112764_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_e9112764_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_interested DROP CONSTRAINT metrimony_personal_i_personal_info_id_e9112764_fk_metrimony;
       public          dbrdsubuntume12    false    4972    481    244            �           2606    131721 a   metrimony_personal_info_privary_limit metrimony_personal_i_personal_info_id_fe7965df_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit
    ADD CONSTRAINT metrimony_personal_i_personal_info_id_fe7965df_fk_metrimony FOREIGN KEY (personal_info_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit DROP CONSTRAINT metrimony_personal_i_personal_info_id_fe7965df_fk_metrimony;
       public          dbrdsubuntume12    false    4972    473    244            �           2606    136025 `   metrimony_personal_info_pending_interested_by metrimony_personal_i_user_id_280e2f3d_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by
    ADD CONSTRAINT metrimony_personal_i_user_id_280e2f3d_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_pending_interested_by DROP CONSTRAINT metrimony_personal_i_user_id_280e2f3d_fk_auth_user;
       public          dbrdsubuntume12    false    485    4901    213            �           2606    135929 T   metrimony_personal_info_viewed_by metrimony_personal_i_user_id_3c520316_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by
    ADD CONSTRAINT metrimony_personal_i_user_id_3c520316_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.metrimony_personal_info_viewed_by DROP CONSTRAINT metrimony_personal_i_user_id_3c520316_fk_auth_user;
       public          dbrdsubuntume12    false    477    213    4901                       2606    136039 V   metrimony_personal_info_shortlisted metrimony_personal_i_user_id_4aeb7aa7_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted
    ADD CONSTRAINT metrimony_personal_i_user_id_4aeb7aa7_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_shortlisted DROP CONSTRAINT metrimony_personal_i_user_id_4aeb7aa7_fk_auth_user;
       public          dbrdsubuntume12    false    487    213    4901            �           2606    136011 X   metrimony_personal_info_interested_by metrimony_personal_i_user_id_c11e4a58_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by
    ADD CONSTRAINT metrimony_personal_i_user_id_c11e4a58_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_interested_by DROP CONSTRAINT metrimony_personal_i_user_id_c11e4a58_fk_auth_user;
       public          dbrdsubuntume12    false    483    4901    213            �           2606    131726 X   metrimony_personal_info_privary_limit metrimony_personal_i_user_id_f33b9329_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit
    ADD CONSTRAINT metrimony_personal_i_user_id_f33b9329_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_privary_limit DROP CONSTRAINT metrimony_personal_i_user_id_f33b9329_fk_auth_user;
       public          dbrdsubuntume12    false    213    4901    473            �           2606    135997 U   metrimony_personal_info_interested metrimony_personal_i_user_id_fbd4e5e8_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_interested
    ADD CONSTRAINT metrimony_personal_i_user_id_fbd4e5e8_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.metrimony_personal_info_interested DROP CONSTRAINT metrimony_personal_i_user_id_fbd4e5e8_fk_auth_user;
       public          dbrdsubuntume12    false    213    4901    481            S           2606    85406 P   metrimony_personal_info metrimony_personal_info_user_id_75ba1ad3_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info
    ADD CONSTRAINT metrimony_personal_info_user_id_75ba1ad3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.metrimony_personal_info DROP CONSTRAINT metrimony_personal_info_user_id_75ba1ad3_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    244            �           2606    135951 ^   metrimony_personal_info_viewed metrimony_personal_info_viewed_user_id_35ddc927_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_personal_info_viewed
    ADD CONSTRAINT metrimony_personal_info_viewed_user_id_35ddc927_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metrimony_personal_info_viewed DROP CONSTRAINT metrimony_personal_info_viewed_user_id_35ddc927_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    479            �           2606    131733 R   metrimony_visaverification metrimony_visaverifi_matrimony_id_c36e6082_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrimony_visaverification
    ADD CONSTRAINT metrimony_visaverifi_matrimony_id_c36e6082_fk_metrimony FOREIGN KEY (matrimony_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.metrimony_visaverification DROP CONSTRAINT metrimony_visaverifi_matrimony_id_c36e6082_fk_metrimony;
       public          dbrdsubuntume12    false    4972    244    475            �           2606    97967 R   notifications_notification notifications_notifi_from_user_id_4f1e70d0_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_from_user_id_4f1e70d0_fk_auth_user FOREIGN KEY (from_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_from_user_id_4f1e70d0_fk_auth_user;
       public          dbrdsubuntume12    false    213    397    4901            �           2606    97972 Y   notifications_notification notifications_notification_to_user_id_17192cb7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_to_user_id_17192cb7_fk_auth_user_id FOREIGN KEY (to_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notification_to_user_id_17192cb7_fk_auth_user_id;
       public          dbrdsubuntume12    false    397    213    4901                       2606    139657 D   reports_reports reports_reports_consumer_to_id_a706e53a_fk_user_mana    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports_reports
    ADD CONSTRAINT reports_reports_consumer_to_id_a706e53a_fk_user_mana FOREIGN KEY (consumer_to_id) REFERENCES public.user_management_consumer(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.reports_reports DROP CONSTRAINT reports_reports_consumer_to_id_a706e53a_fk_user_mana;
       public          dbrdsubuntume12    false    250    4984    507                       2606    139662 O   reports_reports reports_reports_employer_to_id_5b766f4d_fk_employer_employer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports_reports
    ADD CONSTRAINT reports_reports_employer_to_id_5b766f4d_fk_employer_employer_id FOREIGN KEY (employer_to_id) REFERENCES public.employer_employer(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.reports_reports DROP CONSTRAINT reports_reports_employer_to_id_5b766f4d_fk_employer_employer_id;
       public          dbrdsubuntume12    false    222    4929    507                       2606    139667 M   reports_reports reports_reports_jobpost_to_id_62d9f435_fk_employer_jobpost_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports_reports
    ADD CONSTRAINT reports_reports_jobpost_to_id_62d9f435_fk_employer_jobpost_id FOREIGN KEY (jobpost_to_id) REFERENCES public.employer_jobpost(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.reports_reports DROP CONSTRAINT reports_reports_jobpost_to_id_62d9f435_fk_employer_jobpost_id;
       public          dbrdsubuntume12    false    507    4939    224                       2606    139672 E   reports_reports reports_reports_matri_pro_to_id_9add4cc1_fk_metrimony    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports_reports
    ADD CONSTRAINT reports_reports_matri_pro_to_id_9add4cc1_fk_metrimony FOREIGN KEY (matri_pro_to_id) REFERENCES public.metrimony_personal_info(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.reports_reports DROP CONSTRAINT reports_reports_matri_pro_to_id_9add4cc1_fk_metrimony;
       public          dbrdsubuntume12    false    507    244    4972                       2606    139677 @   reports_reports reports_reports_user_id_707c8c68_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports_reports
    ADD CONSTRAINT reports_reports_user_id_707c8c68_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.reports_reports DROP CONSTRAINT reports_reports_user_id_707c8c68_fk_auth_user_id;
       public          dbrdsubuntume12    false    507    213    4901            *           2606    143800 I   sellbuy_answer sellbuy_answer_question_id_1cf43686_fk_sellbuy_question_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_answer
    ADD CONSTRAINT sellbuy_answer_question_id_1cf43686_fk_sellbuy_question_id FOREIGN KEY (question_id) REFERENCES public.sellbuy_question(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.sellbuy_answer DROP CONSTRAINT sellbuy_answer_question_id_1cf43686_fk_sellbuy_question_id;
       public          dbrdsubuntume12    false    5671    525    529            +           2606    143805 >   sellbuy_answer sellbuy_answer_user_id_0c8d9531_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_answer
    ADD CONSTRAINT sellbuy_answer_user_id_0c8d9531_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.sellbuy_answer DROP CONSTRAINT sellbuy_answer_user_id_0c8d9531_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    529                       2606    140080 G   sellbuy_buyers sellbuy_buyers_product_id_a48a2416_fk_sellbuy_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_buyers
    ADD CONSTRAINT sellbuy_buyers_product_id_a48a2416_fk_sellbuy_product_id FOREIGN KEY (product_id) REFERENCES public.sellbuy_product(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.sellbuy_buyers DROP CONSTRAINT sellbuy_buyers_product_id_a48a2416_fk_sellbuy_product_id;
       public          dbrdsubuntume12    false    515    5645    511                       2606    140085 >   sellbuy_buyers sellbuy_buyers_user_id_93ff1a4f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_buyers
    ADD CONSTRAINT sellbuy_buyers_user_id_93ff1a4f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.sellbuy_buyers DROP CONSTRAINT sellbuy_buyers_user_id_93ff1a4f_fk_auth_user_id;
       public          dbrdsubuntume12    false    511    4901    213                       2606    139720 J   sellbuy_dealerprofile sellbuy_dealerprofil_seller_id_ea1e30c3_fk_sellbuy_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_dealerprofile
    ADD CONSTRAINT sellbuy_dealerprofil_seller_id_ea1e30c3_fk_sellbuy_s FOREIGN KEY (seller_id) REFERENCES public.sellbuy_sellerprofile(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.sellbuy_dealerprofile DROP CONSTRAINT sellbuy_dealerprofil_seller_id_ea1e30c3_fk_sellbuy_s;
       public          dbrdsubuntume12    false    493    509    5593            (           2606    143788 A   sellbuy_faq sellbuy_faq_product_id_34905e83_fk_sellbuy_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_faq
    ADD CONSTRAINT sellbuy_faq_product_id_34905e83_fk_sellbuy_product_id FOREIGN KEY (product_id) REFERENCES public.sellbuy_product(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.sellbuy_faq DROP CONSTRAINT sellbuy_faq_product_id_34905e83_fk_sellbuy_product_id;
       public          dbrdsubuntume12    false    515    527    5645            )           2606    143793 8   sellbuy_faq sellbuy_faq_user_id_b606ef44_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_faq
    ADD CONSTRAINT sellbuy_faq_user_id_b606ef44_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.sellbuy_faq DROP CONSTRAINT sellbuy_faq_user_id_b606ef44_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    527    213                       2606    140090 K   sellbuy_product sellbuy_product_category_id_e40e14c7_fk_sellbuy_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product
    ADD CONSTRAINT sellbuy_product_category_id_e40e14c7_fk_sellbuy_category_id FOREIGN KEY (category_id) REFERENCES public.sellbuy_category(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.sellbuy_product DROP CONSTRAINT sellbuy_product_category_id_e40e14c7_fk_sellbuy_category_id;
       public          dbrdsubuntume12    false    5640    513    515                       2606    140095 A   sellbuy_product sellbuy_product_consumer_id_5a091f3d_fk_user_mana    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product
    ADD CONSTRAINT sellbuy_product_consumer_id_5a091f3d_fk_user_mana FOREIGN KEY (consumer_id) REFERENCES public.user_management_consumer(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.sellbuy_product DROP CONSTRAINT sellbuy_product_consumer_id_5a091f3d_fk_user_mana;
       public          dbrdsubuntume12    false    4984    515    250                       2606    140100 N   sellbuy_product sellbuy_product_dealer_id_1c8dd8c5_fk_sellbuy_dealerprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product
    ADD CONSTRAINT sellbuy_product_dealer_id_1c8dd8c5_fk_sellbuy_dealerprofile_id FOREIGN KEY (dealer_id) REFERENCES public.sellbuy_dealerprofile(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.sellbuy_product DROP CONSTRAINT sellbuy_product_dealer_id_1c8dd8c5_fk_sellbuy_dealerprofile_id;
       public          dbrdsubuntume12    false    5633    515    509                       2606    140116 S   sellbuy_product_like sellbuy_product_like_product_id_acc66afb_fk_sellbuy_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product_like
    ADD CONSTRAINT sellbuy_product_like_product_id_acc66afb_fk_sellbuy_product_id FOREIGN KEY (product_id) REFERENCES public.sellbuy_product(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.sellbuy_product_like DROP CONSTRAINT sellbuy_product_like_product_id_acc66afb_fk_sellbuy_product_id;
       public          dbrdsubuntume12    false    5645    515    517                       2606    140121 J   sellbuy_product_like sellbuy_product_like_user_id_3a11f52b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product_like
    ADD CONSTRAINT sellbuy_product_like_user_id_3a11f52b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.sellbuy_product_like DROP CONSTRAINT sellbuy_product_like_user_id_3a11f52b_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    517                       2606    140105 N   sellbuy_product sellbuy_product_seller_id_88c86c54_fk_sellbuy_sellerprofile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_product
    ADD CONSTRAINT sellbuy_product_seller_id_88c86c54_fk_sellbuy_sellerprofile_id FOREIGN KEY (seller_id) REFERENCES public.sellbuy_sellerprofile(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.sellbuy_product DROP CONSTRAINT sellbuy_product_seller_id_88c86c54_fk_sellbuy_sellerprofile_id;
       public          dbrdsubuntume12    false    5593    493    515            ,           2606    143828 K   sellbuy_productcomment sellbuy_productcomme_parent_id_2e757f0f_fk_sellbuy_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_productcomment
    ADD CONSTRAINT sellbuy_productcomme_parent_id_2e757f0f_fk_sellbuy_p FOREIGN KEY (parent_id) REFERENCES public.sellbuy_productcomment(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.sellbuy_productcomment DROP CONSTRAINT sellbuy_productcomme_parent_id_2e757f0f_fk_sellbuy_p;
       public          dbrdsubuntume12    false    531    5684    531            -           2606    143833 L   sellbuy_productcomment sellbuy_productcomme_product_id_422878a2_fk_sellbuy_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_productcomment
    ADD CONSTRAINT sellbuy_productcomme_product_id_422878a2_fk_sellbuy_p FOREIGN KEY (product_id) REFERENCES public.sellbuy_product(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.sellbuy_productcomment DROP CONSTRAINT sellbuy_productcomme_product_id_422878a2_fk_sellbuy_p;
       public          dbrdsubuntume12    false    5645    515    531            .           2606    143838 N   sellbuy_productcomment sellbuy_productcomment_user_id_129e2f9a_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_productcomment
    ADD CONSTRAINT sellbuy_productcomment_user_id_129e2f9a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.sellbuy_productcomment DROP CONSTRAINT sellbuy_productcomment_user_id_129e2f9a_fk_auth_user_id;
       public          dbrdsubuntume12    false    531    4901    213            &           2606    143776 K   sellbuy_question sellbuy_question_product_id_377f59d1_fk_sellbuy_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_question
    ADD CONSTRAINT sellbuy_question_product_id_377f59d1_fk_sellbuy_product_id FOREIGN KEY (product_id) REFERENCES public.sellbuy_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.sellbuy_question DROP CONSTRAINT sellbuy_question_product_id_377f59d1_fk_sellbuy_product_id;
       public          dbrdsubuntume12    false    515    5645    525            '           2606    143781 B   sellbuy_question sellbuy_question_user_id_55c3b9e3_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_question
    ADD CONSTRAINT sellbuy_question_user_id_55c3b9e3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.sellbuy_question DROP CONSTRAINT sellbuy_question_user_id_55c3b9e3_fk_auth_user_id;
       public          dbrdsubuntume12    false    525    213    4901            "           2606    143750 W   sellbuy_review_dislikes sellbuy_review_dislikes_review_id_49b33411_fk_sellbuy_review_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review_dislikes
    ADD CONSTRAINT sellbuy_review_dislikes_review_id_49b33411_fk_sellbuy_review_id FOREIGN KEY (review_id) REFERENCES public.sellbuy_review(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.sellbuy_review_dislikes DROP CONSTRAINT sellbuy_review_dislikes_review_id_49b33411_fk_sellbuy_review_id;
       public          dbrdsubuntume12    false    5655    521    519            #           2606    143755 P   sellbuy_review_dislikes sellbuy_review_dislikes_user_id_be73b516_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review_dislikes
    ADD CONSTRAINT sellbuy_review_dislikes_user_id_be73b516_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.sellbuy_review_dislikes DROP CONSTRAINT sellbuy_review_dislikes_user_id_be73b516_fk_auth_user_id;
       public          dbrdsubuntume12    false    521    4901    213            $           2606    143764 Q   sellbuy_review_likes sellbuy_review_likes_review_id_f29608c6_fk_sellbuy_review_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review_likes
    ADD CONSTRAINT sellbuy_review_likes_review_id_f29608c6_fk_sellbuy_review_id FOREIGN KEY (review_id) REFERENCES public.sellbuy_review(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.sellbuy_review_likes DROP CONSTRAINT sellbuy_review_likes_review_id_f29608c6_fk_sellbuy_review_id;
       public          dbrdsubuntume12    false    519    523    5655            %           2606    143769 J   sellbuy_review_likes sellbuy_review_likes_user_id_a70e4dff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review_likes
    ADD CONSTRAINT sellbuy_review_likes_user_id_a70e4dff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.sellbuy_review_likes DROP CONSTRAINT sellbuy_review_likes_user_id_a70e4dff_fk_auth_user_id;
       public          dbrdsubuntume12    false    523    4901    213                       2606    143730 E   sellbuy_review sellbuy_review_parent_id_103d996d_fk_sellbuy_review_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review
    ADD CONSTRAINT sellbuy_review_parent_id_103d996d_fk_sellbuy_review_id FOREIGN KEY (parent_id) REFERENCES public.sellbuy_review(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.sellbuy_review DROP CONSTRAINT sellbuy_review_parent_id_103d996d_fk_sellbuy_review_id;
       public          dbrdsubuntume12    false    519    519    5655                        2606    143735 G   sellbuy_review sellbuy_review_product_id_56bf410f_fk_sellbuy_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review
    ADD CONSTRAINT sellbuy_review_product_id_56bf410f_fk_sellbuy_product_id FOREIGN KEY (product_id) REFERENCES public.sellbuy_product(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.sellbuy_review DROP CONSTRAINT sellbuy_review_product_id_56bf410f_fk_sellbuy_product_id;
       public          dbrdsubuntume12    false    515    5645    519            !           2606    143740 >   sellbuy_review sellbuy_review_user_id_6aaeb290_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_review
    ADD CONSTRAINT sellbuy_review_user_id_6aaeb290_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.sellbuy_review DROP CONSTRAINT sellbuy_review_user_id_6aaeb290_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    519                       2606    139261 L   sellbuy_sellerprofile sellbuy_sellerprofile_user_id_37632e1f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sellbuy_sellerprofile
    ADD CONSTRAINT sellbuy_sellerprofile_user_id_37632e1f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.sellbuy_sellerprofile DROP CONSTRAINT sellbuy_sellerprofile_user_id_37632e1f_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    493    213            h           2606    86976 T   social_post_socialpost_love social_post_socialpo_socialpost_id_32efbc41_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_love
    ADD CONSTRAINT social_post_socialpo_socialpost_id_32efbc41_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.social_post_socialpost_love DROP CONSTRAINT social_post_socialpo_socialpost_id_32efbc41_fk_social_po;
       public          dbrdsubuntume12    false    274    5019    264            l           2606    87004 U   social_post_socialpost_senti social_post_socialpo_socialpost_id_60e7d5e1_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_senti
    ADD CONSTRAINT social_post_socialpo_socialpost_id_60e7d5e1_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.social_post_socialpost_senti DROP CONSTRAINT social_post_socialpo_socialpost_id_60e7d5e1_fk_social_po;
       public          dbrdsubuntume12    false    5019    278    264            f           2606    86962 U   social_post_socialpost_likes social_post_socialpo_socialpost_id_875a43ea_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_likes
    ADD CONSTRAINT social_post_socialpo_socialpost_id_875a43ea_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.social_post_socialpost_likes DROP CONSTRAINT social_post_socialpo_socialpost_id_875a43ea_fk_social_po;
       public          dbrdsubuntume12    false    264    5019    272            `           2606    86920 U   social_post_socialpost_angry social_post_socialpo_socialpost_id_8a14a2e9_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_angry
    ADD CONSTRAINT social_post_socialpo_socialpost_id_8a14a2e9_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.social_post_socialpost_angry DROP CONSTRAINT social_post_socialpo_socialpost_id_8a14a2e9_fk_social_po;
       public          dbrdsubuntume12    false    264    266    5019            p           2606    87046 S   social_post_socialpost_wow social_post_socialpo_socialpost_id_8bf96a57_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_wow
    ADD CONSTRAINT social_post_socialpo_socialpost_id_8bf96a57_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.social_post_socialpost_wow DROP CONSTRAINT social_post_socialpo_socialpost_id_8bf96a57_fk_social_po;
       public          dbrdsubuntume12    false    264    5019    282            b           2606    86934 T   social_post_socialpost_care social_post_socialpo_socialpost_id_910f514b_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_care
    ADD CONSTRAINT social_post_socialpo_socialpost_id_910f514b_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.social_post_socialpost_care DROP CONSTRAINT social_post_socialpo_socialpost_id_910f514b_fk_social_po;
       public          dbrdsubuntume12    false    268    5019    264            j           2606    86990 S   social_post_socialpost_sad social_post_socialpo_socialpost_id_960b1b26_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_sad
    ADD CONSTRAINT social_post_socialpo_socialpost_id_960b1b26_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.social_post_socialpost_sad DROP CONSTRAINT social_post_socialpo_socialpost_id_960b1b26_fk_social_po;
       public          dbrdsubuntume12    false    5019    276    264            r           2606    87187 Y   social_post_socialpost_shared_by social_post_socialpo_socialpost_id_a902a2e1_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_shared_by
    ADD CONSTRAINT social_post_socialpo_socialpost_id_a902a2e1_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_shared_by DROP CONSTRAINT social_post_socialpo_socialpost_id_a902a2e1_fk_social_po;
       public          dbrdsubuntume12    false    5019    264    298            n           2606    87018 T   social_post_socialpost_tags social_post_socialpo_socialpost_id_b19106ff_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_tags
    ADD CONSTRAINT social_post_socialpo_socialpost_id_b19106ff_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.social_post_socialpost_tags DROP CONSTRAINT social_post_socialpo_socialpost_id_b19106ff_fk_social_po;
       public          dbrdsubuntume12    false    264    280    5019            d           2606    86948 T   social_post_socialpost_haha social_post_socialpo_socialpost_id_f9907e5c_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_haha
    ADD CONSTRAINT social_post_socialpo_socialpost_id_f9907e5c_fk_social_po FOREIGN KEY (socialpost_id) REFERENCES public.social_post_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.social_post_socialpost_haha DROP CONSTRAINT social_post_socialpo_socialpost_id_f9907e5c_fk_social_po;
       public          dbrdsubuntume12    false    270    5019    264            s           2606    87192 S   social_post_socialpost_shared_by social_post_socialpo_user_id_08ccacc2_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_shared_by
    ADD CONSTRAINT social_post_socialpo_user_id_08ccacc2_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.social_post_socialpost_shared_by DROP CONSTRAINT social_post_socialpo_user_id_08ccacc2_fk_auth_user;
       public          dbrdsubuntume12    false    213    298    4901            a           2606    86925 Z   social_post_socialpost_angry social_post_socialpost_angry_user_id_3a2c46f3_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_angry
    ADD CONSTRAINT social_post_socialpost_angry_user_id_3a2c46f3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_angry DROP CONSTRAINT social_post_socialpost_angry_user_id_3a2c46f3_fk_auth_user_id;
       public          dbrdsubuntume12    false    266    4901    213            c           2606    86939 X   social_post_socialpost_care social_post_socialpost_care_user_id_5db1340b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_care
    ADD CONSTRAINT social_post_socialpost_care_user_id_5db1340b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_care DROP CONSTRAINT social_post_socialpost_care_user_id_5db1340b_fk_auth_user_id;
       public          dbrdsubuntume12    false    268    213    4901            e           2606    86953 X   social_post_socialpost_haha social_post_socialpost_haha_user_id_1a004c13_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_haha
    ADD CONSTRAINT social_post_socialpost_haha_user_id_1a004c13_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_haha DROP CONSTRAINT social_post_socialpost_haha_user_id_1a004c13_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    270    213            g           2606    86967 Z   social_post_socialpost_likes social_post_socialpost_likes_user_id_99b81b08_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_likes
    ADD CONSTRAINT social_post_socialpost_likes_user_id_99b81b08_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_likes DROP CONSTRAINT social_post_socialpost_likes_user_id_99b81b08_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    272            i           2606    86981 X   social_post_socialpost_love social_post_socialpost_love_user_id_6ec30f34_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_love
    ADD CONSTRAINT social_post_socialpost_love_user_id_6ec30f34_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_love DROP CONSTRAINT social_post_socialpost_love_user_id_6ec30f34_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    274            k           2606    86995 V   social_post_socialpost_sad social_post_socialpost_sad_user_id_1792db4d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_sad
    ADD CONSTRAINT social_post_socialpost_sad_user_id_1792db4d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_sad DROP CONSTRAINT social_post_socialpost_sad_user_id_1792db4d_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    276    4901            m           2606    87009 Z   social_post_socialpost_senti social_post_socialpost_senti_user_id_d37e9520_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_senti
    ADD CONSTRAINT social_post_socialpost_senti_user_id_d37e9520_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_senti DROP CONSTRAINT social_post_socialpost_senti_user_id_d37e9520_fk_auth_user_id;
       public          dbrdsubuntume12    false    278    213    4901            o           2606    87023 X   social_post_socialpost_tags social_post_socialpost_tags_user_id_663bdb5f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_tags
    ADD CONSTRAINT social_post_socialpost_tags_user_id_663bdb5f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_tags DROP CONSTRAINT social_post_socialpost_tags_user_id_663bdb5f_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    280    213            _           2606    86912 N   social_post_socialpost social_post_socialpost_user_id_973d1b9a_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost
    ADD CONSTRAINT social_post_socialpost_user_id_973d1b9a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_post_socialpost DROP CONSTRAINT social_post_socialpost_user_id_973d1b9a_fk_auth_user_id;
       public          dbrdsubuntume12    false    264    4901    213            q           2606    87051 V   social_post_socialpost_wow social_post_socialpost_wow_user_id_9c09d264_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_socialpost_wow
    ADD CONSTRAINT social_post_socialpost_wow_user_id_9c09d264_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_post_socialpost_wow DROP CONSTRAINT social_post_socialpost_wow_user_id_9c09d264_fk_auth_user_id;
       public          dbrdsubuntume12    false    282    213    4901            u           2606    87206 N   social_post_subactivity social_post_subactiv_activity_id_9cbb05f8_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_subactivity
    ADD CONSTRAINT social_post_subactiv_activity_id_9cbb05f8_fk_social_po FOREIGN KEY (activity_id) REFERENCES public.social_post_activity(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_post_subactivity DROP CONSTRAINT social_post_subactiv_activity_id_9cbb05f8_fk_social_po;
       public          dbrdsubuntume12    false    302    5079    284            t           2606    87199 P   social_post_sublifeevent social_post_sublifee_lifeevent_id_5f205074_fk_social_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_post_sublifeevent
    ADD CONSTRAINT social_post_sublifee_lifeevent_id_5f205074_fk_social_po FOREIGN KEY (lifeevent_id) REFERENCES public.social_post_lifeevent(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_post_sublifeevent DROP CONSTRAINT social_post_sublifee_lifeevent_id_5f205074_fk_social_po;
       public          dbrdsubuntume12    false    294    5104    300            �           2606    91867 N   social_socialphoto social_socialphoto_post_id_d8153b52_fk_social_socialpost_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialphoto
    ADD CONSTRAINT social_socialphoto_post_id_d8153b52_fk_social_socialpost_id FOREIGN KEY (post_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialphoto DROP CONSTRAINT social_socialphoto_post_id_d8153b52_fk_social_socialpost_id;
       public          dbrdsubuntume12    false    328    5195    352            �           2606    91872 F   social_socialphoto social_socialphoto_user_id_6e7a65e3_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialphoto
    ADD CONSTRAINT social_socialphoto_user_id_6e7a65e3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.social_socialphoto DROP CONSTRAINT social_socialphoto_user_id_6e7a65e3_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    352            y           2606    91506 N   social_socialpost social_socialpost_activity_id_b2708113_fk_social_activity_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_activity_id_b2708113_fk_social_activity_id FOREIGN KEY (activity_id) REFERENCES public.social_activity(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_activity_id_b2708113_fk_social_activity_id;
       public          dbrdsubuntume12    false    306    5137    328            �           2606    91362 P   social_socialpost_angry social_socialpost_an_socialpost_id_7c8f2d37_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_angry
    ADD CONSTRAINT social_socialpost_an_socialpost_id_7c8f2d37_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost_angry DROP CONSTRAINT social_socialpost_an_socialpost_id_7c8f2d37_fk_social_so;
       public          dbrdsubuntume12    false    330    5195    328            �           2606    91367 P   social_socialpost_angry social_socialpost_angry_user_id_4d9d36d0_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_angry
    ADD CONSTRAINT social_socialpost_angry_user_id_4d9d36d0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost_angry DROP CONSTRAINT social_socialpost_angry_user_id_4d9d36d0_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    330            z           2606    91511 Q   social_socialpost social_socialpost_background_id_0240af5c_fk_social_backgroud_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_background_id_0240af5c_fk_social_backgroud_id FOREIGN KEY (background_id) REFERENCES public.social_backgroud(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_background_id_0240af5c_fk_social_backgroud_id;
       public          dbrdsubuntume12    false    328    5142    308            �           2606    91376 O   social_socialpost_care social_socialpost_ca_socialpost_id_aabcd936_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_care
    ADD CONSTRAINT social_socialpost_ca_socialpost_id_aabcd936_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.social_socialpost_care DROP CONSTRAINT social_socialpost_ca_socialpost_id_aabcd936_fk_social_so;
       public          dbrdsubuntume12    false    328    332    5195            �           2606    91381 N   social_socialpost_care social_socialpost_care_user_id_21b4a08e_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_care
    ADD CONSTRAINT social_socialpost_care_user_id_21b4a08e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost_care DROP CONSTRAINT social_socialpost_care_user_id_21b4a08e_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    332            �           2606    97607 N   social_socialpost social_socialpost_category_id_4130e353_fk_social_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_category_id_4130e353_fk_social_category_id FOREIGN KEY (category_id) REFERENCES public.social_category(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_category_id_4130e353_fk_social_category_id;
       public          dbrdsubuntume12    false    5147    310    328            {           2606    91516 N   social_socialpost social_socialpost_check_in_id_096dc6b1_fk_social_check_in_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_check_in_id_096dc6b1_fk_social_check_in_id FOREIGN KEY (check_in_id) REFERENCES public.social_check_in(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_check_in_id_096dc6b1_fk_social_check_in_id;
       public          dbrdsubuntume12    false    312    5152    328            |           2606    91521 L   social_socialpost social_socialpost_feeling_id_1bf21e43_fk_social_feeling_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_feeling_id_1bf21e43_fk_social_feeling_id FOREIGN KEY (feeling_id) REFERENCES public.social_feeling(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_feeling_id_1bf21e43_fk_social_feeling_id;
       public          dbrdsubuntume12    false    5157    328    314            }           2606    91526 D   social_socialpost social_socialpost_gif_id_125aa86a_fk_social_gif_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_gif_id_125aa86a_fk_social_gif_id FOREIGN KEY (gif_id) REFERENCES public.social_gif(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_gif_id_125aa86a_fk_social_gif_id;
       public          dbrdsubuntume12    false    316    328    5162            �           2606    91390 O   social_socialpost_haha social_socialpost_ha_socialpost_id_cdcf6fe7_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_haha
    ADD CONSTRAINT social_socialpost_ha_socialpost_id_cdcf6fe7_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.social_socialpost_haha DROP CONSTRAINT social_socialpost_ha_socialpost_id_cdcf6fe7_fk_social_so;
       public          dbrdsubuntume12    false    5195    334    328            �           2606    91395 N   social_socialpost_haha social_socialpost_haha_user_id_042d2297_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_haha
    ADD CONSTRAINT social_socialpost_haha_user_id_042d2297_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost_haha DROP CONSTRAINT social_socialpost_haha_user_id_042d2297_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    334            �           2606    91404 P   social_socialpost_likes social_socialpost_li_socialpost_id_1488c2d6_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_likes
    ADD CONSTRAINT social_socialpost_li_socialpost_id_1488c2d6_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost_likes DROP CONSTRAINT social_socialpost_li_socialpost_id_1488c2d6_fk_social_so;
       public          dbrdsubuntume12    false    336    5195    328            ~           2606    91531 P   social_socialpost social_socialpost_lifeevent_id_02d9be17_fk_social_lifeevent_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_lifeevent_id_02d9be17_fk_social_lifeevent_id FOREIGN KEY (lifeevent_id) REFERENCES public.social_lifeevent(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_lifeevent_id_02d9be17_fk_social_lifeevent_id;
       public          dbrdsubuntume12    false    328    5167    318            �           2606    91409 P   social_socialpost_likes social_socialpost_likes_user_id_58c41778_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_likes
    ADD CONSTRAINT social_socialpost_likes_user_id_58c41778_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost_likes DROP CONSTRAINT social_socialpost_likes_user_id_58c41778_fk_auth_user_id;
       public          dbrdsubuntume12    false    336    4901    213            �           2606    91418 O   social_socialpost_love social_socialpost_lo_socialpost_id_092cd8f8_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_love
    ADD CONSTRAINT social_socialpost_lo_socialpost_id_092cd8f8_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.social_socialpost_love DROP CONSTRAINT social_socialpost_lo_socialpost_id_092cd8f8_fk_social_so;
       public          dbrdsubuntume12    false    338    5195    328            �           2606    91423 N   social_socialpost_love social_socialpost_love_user_id_d93fa155_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_love
    ADD CONSTRAINT social_socialpost_love_user_id_d93fa155_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost_love DROP CONSTRAINT social_socialpost_love_user_id_d93fa155_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    338    213            �           2606    97612 Q   social_socialpost social_socialpost_privacy_id_69848425_fk_social_privacymodel_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_privacy_id_69848425_fk_social_privacymodel_id FOREIGN KEY (privacy_id) REFERENCES public.social_privacymodel(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_privacy_id_69848425_fk_social_privacymodel_id;
       public          dbrdsubuntume12    false    320    5172    328            �           2606    91432 N   social_socialpost_sad social_socialpost_sa_socialpost_id_48f65bbb_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_sad
    ADD CONSTRAINT social_socialpost_sa_socialpost_id_48f65bbb_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost_sad DROP CONSTRAINT social_socialpost_sa_socialpost_id_48f65bbb_fk_social_so;
       public          dbrdsubuntume12    false    328    5195    340            �           2606    91437 L   social_socialpost_sad social_socialpost_sad_user_id_91a2a088_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_sad
    ADD CONSTRAINT social_socialpost_sad_user_id_91a2a088_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.social_socialpost_sad DROP CONSTRAINT social_socialpost_sad_user_id_91a2a088_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    340    4901            �           2606    91446 P   social_socialpost_senti social_socialpost_se_socialpost_id_7579ab10_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_senti
    ADD CONSTRAINT social_socialpost_se_socialpost_id_7579ab10_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost_senti DROP CONSTRAINT social_socialpost_se_socialpost_id_7579ab10_fk_social_so;
       public          dbrdsubuntume12    false    328    342    5195            �           2606    91451 P   social_socialpost_senti social_socialpost_senti_user_id_53640180_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_senti
    ADD CONSTRAINT social_socialpost_senti_user_id_53640180_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_socialpost_senti DROP CONSTRAINT social_socialpost_senti_user_id_53640180_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    342    4901            �           2606    91460 T   social_socialpost_shared_by social_socialpost_sh_socialpost_id_c548b508_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_shared_by
    ADD CONSTRAINT social_socialpost_sh_socialpost_id_c548b508_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.social_socialpost_shared_by DROP CONSTRAINT social_socialpost_sh_socialpost_id_c548b508_fk_social_so;
       public          dbrdsubuntume12    false    5195    344    328            �           2606    91465 X   social_socialpost_shared_by social_socialpost_shared_by_user_id_0dc7f0c6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_shared_by
    ADD CONSTRAINT social_socialpost_shared_by_user_id_0dc7f0c6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.social_socialpost_shared_by DROP CONSTRAINT social_socialpost_shared_by_user_id_0dc7f0c6_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    344                       2606    91536 H   social_socialpost social_socialpost_subactivity_id_e4e0721f_fk_social_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_subactivity_id_e4e0721f_fk_social_su FOREIGN KEY (subactivity_id) REFERENCES public.social_subactivity(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_subactivity_id_e4e0721f_fk_social_su;
       public          dbrdsubuntume12    false    5184    324    328            �           2606    91541 I   social_socialpost social_socialpost_sublifeevent_id_aa0d2ed8_fk_social_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_sublifeevent_id_aa0d2ed8_fk_social_su FOREIGN KEY (sublifeevent_id) REFERENCES public.social_sublifeevent(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_sublifeevent_id_aa0d2ed8_fk_social_su;
       public          dbrdsubuntume12    false    5178    328    322            �           2606    91474 O   social_socialpost_tags social_socialpost_ta_socialpost_id_2ccfd25b_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_tags
    ADD CONSTRAINT social_socialpost_ta_socialpost_id_2ccfd25b_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.social_socialpost_tags DROP CONSTRAINT social_socialpost_ta_socialpost_id_2ccfd25b_fk_social_so;
       public          dbrdsubuntume12    false    328    5195    346            �           2606    91479 N   social_socialpost_tags social_socialpost_tags_user_id_1fd9cbe4_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_tags
    ADD CONSTRAINT social_socialpost_tags_user_id_1fd9cbe4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost_tags DROP CONSTRAINT social_socialpost_tags_user_id_1fd9cbe4_fk_auth_user_id;
       public          dbrdsubuntume12    false    346    4901    213            x           2606    91344 D   social_socialpost social_socialpost_user_id_bdc98344_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost
    ADD CONSTRAINT social_socialpost_user_id_bdc98344_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.social_socialpost DROP CONSTRAINT social_socialpost_user_id_bdc98344_fk_auth_user_id;
       public          dbrdsubuntume12    false    328    213    4901            �           2606    91488 N   social_socialpost_wow social_socialpost_wo_socialpost_id_3a0b05f0_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_wow
    ADD CONSTRAINT social_socialpost_wo_socialpost_id_3a0b05f0_fk_social_so FOREIGN KEY (socialpost_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.social_socialpost_wow DROP CONSTRAINT social_socialpost_wo_socialpost_id_3a0b05f0_fk_social_so;
       public          dbrdsubuntume12    false    328    5195    348            �           2606    91493 L   social_socialpost_wow social_socialpost_wow_user_id_4e3946d1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialpost_wow
    ADD CONSTRAINT social_socialpost_wow_user_id_4e3946d1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.social_socialpost_wow DROP CONSTRAINT social_socialpost_wow_user_id_4e3946d1_fk_auth_user_id;
       public          dbrdsubuntume12    false    348    213    4901            �           2606    91838 M   social_socialupdatehistory social_socialupdateh_post_id_4e4b3ad3_fk_social_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_socialupdatehistory
    ADD CONSTRAINT social_socialupdateh_post_id_4e4b3ad3_fk_social_so FOREIGN KEY (post_id) REFERENCES public.social_socialpost(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.social_socialupdatehistory DROP CONSTRAINT social_socialupdateh_post_id_4e4b3ad3_fk_social_so;
       public          dbrdsubuntume12    false    328    350    5195            w           2606    91185 P   social_subactivity social_subactivity_activity_id_4cff9bbe_fk_social_activity_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_subactivity
    ADD CONSTRAINT social_subactivity_activity_id_4cff9bbe_fk_social_activity_id FOREIGN KEY (activity_id) REFERENCES public.social_activity(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.social_subactivity DROP CONSTRAINT social_subactivity_activity_id_4cff9bbe_fk_social_activity_id;
       public          dbrdsubuntume12    false    324    306    5137            v           2606    91178 J   social_sublifeevent social_sublifeevent_lifeevent_id_039283d2_fk_social_li    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_sublifeevent
    ADD CONSTRAINT social_sublifeevent_lifeevent_id_039283d2_fk_social_li FOREIGN KEY (lifeevent_id) REFERENCES public.social_lifeevent(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.social_sublifeevent DROP CONSTRAINT social_sublifeevent_lifeevent_id_039283d2_fk_social_li;
       public          dbrdsubuntume12    false    5167    322    318            V           2606    122131 R   user_management_consumer user_management_consumer_city_id_249aeebf_fk_jobs_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_management_consumer
    ADD CONSTRAINT user_management_consumer_city_id_249aeebf_fk_jobs_city_id FOREIGN KEY (city_id) REFERENCES public.jobs_city(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.user_management_consumer DROP CONSTRAINT user_management_consumer_city_id_249aeebf_fk_jobs_city_id;
       public          dbrdsubuntume12    false    467    5522    250            W           2606    122136 X   user_management_consumer user_management_consumer_country_id_9a89b3be_fk_jobs_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_management_consumer
    ADD CONSTRAINT user_management_consumer_country_id_9a89b3be_fk_jobs_country_id FOREIGN KEY (country_id) REFERENCES public.jobs_country(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.user_management_consumer DROP CONSTRAINT user_management_consumer_country_id_9a89b3be_fk_jobs_country_id;
       public          dbrdsubuntume12    false    250    463    5516            U           2606    85514 R   user_management_consumer user_management_consumer_user_id_d36d2189_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_management_consumer
    ADD CONSTRAINT user_management_consumer_user_id_d36d2189_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.user_management_consumer DROP CONSTRAINT user_management_consumer_user_id_d36d2189_fk_auth_user_id;
       public          dbrdsubuntume12    false    213    4901    250            ]           2606    86483 P   userapp_coverphoto_tags userapp_coverphoto_t_coverphoto_id_5e1e3b85_fk_userapp_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.userapp_coverphoto_tags
    ADD CONSTRAINT userapp_coverphoto_t_coverphoto_id_5e1e3b85_fk_userapp_c FOREIGN KEY (coverphoto_id) REFERENCES public.userapp_coverphoto(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.userapp_coverphoto_tags DROP CONSTRAINT userapp_coverphoto_t_coverphoto_id_5e1e3b85_fk_userapp_c;
       public          dbrdsubuntume12    false    260    262    5010            ^           2606    86488 P   userapp_coverphoto_tags userapp_coverphoto_tags_user_id_dae097c6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userapp_coverphoto_tags
    ADD CONSTRAINT userapp_coverphoto_tags_user_id_dae097c6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.userapp_coverphoto_tags DROP CONSTRAINT userapp_coverphoto_tags_user_id_dae097c6_fk_auth_user_id;
       public          dbrdsubuntume12    false    4901    213    262            \           2606    86475 F   userapp_coverphoto userapp_coverphoto_user_id_50111c18_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userapp_coverphoto
    ADD CONSTRAINT userapp_coverphoto_user_id_50111c18_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.userapp_coverphoto DROP CONSTRAINT userapp_coverphoto_user_id_50111c18_fk_auth_user_id;
       public          dbrdsubuntume12    false    260    4901    213            Z           2606    86463 T   userapp_profilephoto_tags userapp_profilephoto_profilephoto_id_0a886f2e_fk_userapp_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.userapp_profilephoto_tags
    ADD CONSTRAINT userapp_profilephoto_profilephoto_id_0a886f2e_fk_userapp_p FOREIGN KEY (profilephoto_id) REFERENCES public.userapp_profilephoto(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.userapp_profilephoto_tags DROP CONSTRAINT userapp_profilephoto_profilephoto_id_0a886f2e_fk_userapp_p;
       public          dbrdsubuntume12    false    5001    256    258            [           2606    86468 T   userapp_profilephoto_tags userapp_profilephoto_tags_user_id_cccdd704_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userapp_profilephoto_tags
    ADD CONSTRAINT userapp_profilephoto_tags_user_id_cccdd704_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.userapp_profilephoto_tags DROP CONSTRAINT userapp_profilephoto_tags_user_id_cccdd704_fk_auth_user_id;
       public          dbrdsubuntume12    false    258    213    4901            Y           2606    86455 J   userapp_profilephoto userapp_profilephoto_user_id_f97ea345_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userapp_profilephoto
    ADD CONSTRAINT userapp_profilephoto_user_id_f97ea345_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.userapp_profilephoto DROP CONSTRAINT userapp_profilephoto_user_id_f97ea345_fk_auth_user_id;
       public          dbrdsubuntume12    false    256    213    4901            �      x������ � �      �      x������ � �      �      x����r㸒���S�	&L���z^a�ѡ�i��l�W��o��d"�I�껲~���&���O��ק��|}��^���?�X~�_����?�����R�!a���|',�lLد��7B��lK�^.���<��]H]*�7;�b�+#��/$�cF�kȥ�5A�����n���_�����L�`=�K��+�vJ!� C���~��ݘ�����#�F�K_�bO�~��^(�� ��vMN���6_���?���G�R$`�����
��y��`�s���9_��N��s��*J�Lpp3EA�(�4Q�y"ж���u~������S�y���d�Ϧ���R�A��Pu4*S�|����|����t~�t�4�Ҹ�m2�J �r��J#�q0�J��x����_���x���)��6���u�ɚ�>#vEh�,�fa]~<�D�{�DW����ئM��,���a�z�t#X��S�	6���⵿�<}|ܺ>�n݌d��D]�S���*�fN�\k��s�-݇��Ns��Ҳw�. k7��{ �[P�����,��t;�8}D������x_f[��W��fK��~
��YȚ��"C];���9�X;X���Kj���g9��p���ҩ���ZR�
�}CK�}D%3Oq�O�����s@�ߛ-��dF�o@R�]�8�R/�2o�tx��N��������x���|��fG��i4�����ƣ3i�Y=x�G��Ah�,[�G��|~��}	H�e����d(D$��>"!I��$cKLRr�{�WU<�}�����w0�������6�������!'����@7�I�� 2hq�9	���$� ���<�P{��T�09�a��t�C��a�'&P�,Y1��9c`�D�.g�<~}\~�8䈮�7�T�t��,I���KC.��B�,���t�t���Һ9��T�Tv�e+�Ud��eY�Ȋ�YZ�������G��M���1��Z��XXB�VId,;�i���������.p�ҖQ28Ok�Q@���y�z<w���n�Id�P;��H����m�S�AMm����ګ�S�kI���'#����|����K�����Yd���ґ}7t2�J��P�U��_v_�Kb��\0��3Yg�BBZ�I��W2�L�\ޟ�T�	9`ƆY�Cd�J�%�%V�,�,������F/�yJ�J&}�����2k�����2n�􆃕2�O󆚍�_/�_ݐ#f��eB���Z��ca=� �;
�U-�n�rj<XUS��PJ�����.�Q#⪨PJ��0WP�=}���������mi�lUIE����*�����)\e�R]5�,���n�1N~nz.(�>��d ��, `�eȬ��y������)rϥ��H:\��N:���i��p*�Y����Ul&SC���:���NG�tXpj��+ÿ�^�n���ҔZ"�
� �Չ�/�x*-�X�\y�W��c��d�� AC�[i�A4`���<�|Y�g99����`5f�ٞ�W�F͚�l��B~z|��x��nȑ�4D�sS$51��R�5)sRDsB
 �o���cs���\�AN紡�P���2�y&�����3&iݘ���p�CC�� ���`�afios|�:�wc��3"d^@I�$�P:g `�k����޺1������&dh�� 09�s�t�������w7�w�ψp�gTq6
r�g`�0
b�g����	��G����������(o;�,��-��V)Գ����*��a���d��dsXB���Q} ��i} L��� 䖮���~����wzյ)�;��K���⨰��_n��bm�d`Bq�9�b%�BTC��̹�afq�yi��o�x�Z�4D����R�3�,��R�3��P�A�'��x������D��\�������m0
R<��|�n���.���j%/Ղ�uJ^��J�]�1+����]���@d�9�;\eK���!@��D�m��!�,���!�U,���!�J 9sPy(�{;p��ꀜ�W��C�j��9��-a��ۑ2��W� ��B_Y��.s�Y�`�9�<,�}�-�C຃��!p�A ���p�B��÷;�Bp+�r�C�	��.s�K
F�C�j�������%F�x���to�u�6@��e�C��./ԊV���P�ZyN��B-��U�ۉcop��|��v ����� r��2S��s���*���&�)N��m�Fq|���X���.s\" ����2��EB]�V���a���j@X��B�֪�PU¶zz���s:���"�z,2�8մ��L��N5�Ò)��)������5�ڧ?O���w܅|LE�q;j=���q��Sнr�����	��yy_;T�ڍ8�R�*pA��<E1�f�*x
�b���8	���������s�ڗ6i�,X��$GZ��	H
���ӏh��������.��}��	\�(��A�l�@��H 0��G�5������z�w�)\�(vGI��Bb��{-�uL���˚�v�K��ōJ�7�4S}�A���h��Q)�fk���ksC^.�enp}��(X�뵼FG�\��y�;�c����'���Rq��+1�"'�&YI˽r©�[�[������5�5u�r�������Nڎ��!�xxp���y��,��[�'Z��v�����Z�	v�ݣ	�gjN;�y��E�(.�E�9e���S��I�'y���$ֆ� ��P)�\>���Ϲ����4,�#��"5E6�kF�j�l,���	�q�q>�������gDȻ %4�<	��;�k ��f�y�������.?7׊��JG���JG��˕���]>>.��H�^"F&J��`�A��� ����	྾�w�kx���Լ���R��0��P-����t~��$�я�Z��L��*ْ�ݴ�%yrB0��Lr)'�6G�ܡóX�I\�jh�ae�~mT"��e���D䆔%���i��&|:����)/x_�y�i���W����6����s�w�S�������tB�*4�O'Z��@�ubs]�=�6�0<�۴�p����[�������f�V�Zo�4�}�>�:K|���X�H�ô��YΡSf�4d�N�Si�4`�N����)�=eޱ���	���,9��\=�� �'ᷙ�'Ѫ@�$��s��P�>���������-4�mk�\lcV����Oµ�8��$8Wa5Oq:�~����0ؽ�C�l�\qk
�Z�JK^��}��ȕ|JS)k�+�y����x>�_�Е�ArF��ZȁKpM����%����(k-ݚ�4ʆV7\$7?L��Y�r.�!W�6��5 �oY�E �����Z\�?=W���y\�=)���S��'��u|��D����zȰ�d��άy�d�wϬY�2�+h�y�5�~���s��5D2�JW��v:O�s��*�������V�ih������t��JW�밢�P��r��EO���Cۢ����Cۢ����Cˢ��[4�Q�/S�;gp+��؎<Gt�5�#�������ăi��������5��� �mM�J<���i-�O�ۧ�}���>=�����>��v���٦Ã���[=�����[=ɣ�s��c��X�>��~2��O&���d2M��L�����d�?�������4=z2��g��?�_�G���;�Rs��^ԆJ���nԆPÝ�~Ԇ,�;/�/K���y�)1X?�ec�2��|�.���K���ʩ���J��T���Z����>�E�t�펩�4��"�D�VbJ~�P�����[0���eS�Q��46>�� �.3���F�%����B�p�8}qI>����<�����K�j����^Z�4�	��Q q'\�zֲ?����8�J?�t;ߌ,}T�v�'�S
VƤ�j-�R���]���VB�*�B��
׾&�r!�~�nǧ_1�-/X�}�Kϖ#x ��&�J�pCLV��8b���4�!4K�w��]|�2r�1��e�*�� l  �ˈ>���ս��'-[��WHݲ}��>�ϱ}i��M��� ��}��ĕH��o�4t�	U�������6�1��\�_�js�F���8w�ejN�)|-���$�_g������y�Ԕ^�\qs������0�+sǝ=�u����e2ʇ�Rk��\j��um�ޣ`��Jl& K>ޯ',���a�t���#�Ԛ�̝�-��,���XOk�$�;U�]~���תL��d�\\kʪщrX�)�щrl��tnt���_��}���V��ߑq�W+�W�tkW�,KW�����ɺU�0�=��Iv{D7�w�m�)�-�\~[�J~�2Jp+�$�,���}�q){^�J���{+�Մ�X�\�dN���7q߿�W��|N*����3��3��oƕf�*��-������j5�ߑ��%+X	�J����Z%��b��Ъ�Y��|�{�v�|/*���@��G9�"���r`C@�w;ʘ��{��L>���+ZJ߀%[!V�,�����J�㿺^>���x����C"x͈ZTH.��^��ⷾ���������p��*Pq�¹o|����m���\�
��%&iׅ�����&Op��9	y�����$�鯢����f�����*      �   
  x��XkO���<��o9�c;�J@��,h��#]M�=Ğ13v���wm;�i{��Uj�{�{���4��
D�N{��I�M����6���Y��V�y���������"�گ&/Q}�1���oO�������fǋ�ܿ���YƬxR˶,���'c��������{�|��hy�4z�yo�t2�}T�Q|��8�/�/O��N�����7/'��|fO�j9;?_������z=���ps*��/�o��� ��lDsߣ*�W��a|�a�!�>=����e{>f�;���"���x).�������䰨��̛=_�W�.:xE�}<4�7f�0�?}<��R�]��X"e'�9�7�4�ߋ�׉��WB���T��W3���ͣ�ܧ۽	�7�>\�[6���b�z��^]/���������C�Vg�������.�?e]����׳���j�6�f���ht~0���b?O�����K}�ሺC�>��lLeFl?ixS�6/^FKnl*��H�|�4��.�ʬ%�k�n�(իćD"y�7KS�ske���	Q��Zv��&��)��-Y-qk�Ϧ�]/Ŀ��<$�A���R�����]�3��4_����v��{�y�c��&Ӿ���k5/�@�+ɵ�'�P�w��k��jaW#��4-��2\�-�?����J�7����I٦J�G�U)\7B��R<��t�C�J
�54,�Τւ]��h�*�e]��T����&�F:�L��-�N�t�L�(�m�+��l�]Q�:8w��C&/\k%ϥ�V4����ʤ���O�\���8��ܼ�k��E�>�Ͻ�J	�4�؁5f%���5V��6C�{����wr�Y�S�0e�-�
Hښ���Ѓ7�T%���Vh���]_fDL�C��}����(`��Wvla�e���6�h-�Ji�W�������<S���^�
eS.Ҷy�_����! ��cX�<���eV��3��%;k���vB7�D{��I=Z���(��ؽT��u���{�\[ĦͲ-�צ���Q���_ $^:��TХ6|�JLB���������0��I$+��i;�N�J�g�4���Da�/0�������	i��I��BBq��)���E�[����/dӠ>��ɄxnM��uR�����"*���j-:�����@/�{���xˑ��0�̖2AK&ĭ�loC���;��)`b�>�t�V�˸Z�7��p�-��J*�@CXb�mӦ�
�c��� xK�å�MoGb��mK���=Z()��Q4�V�0V��>��5`�9���0@����:�7M��m���}��\`\Z�K��� �vY�za�j�l��@�6��hk�Q-�&��g ���ݞڴ�#�(�rh\�ӡ�BX�14F���C���]'J�*�v�;�ى�k���kc�V`�9No�>��)zQ8�@���- ���φ���k��zDf}�SƁw[�Ut�^�q��d7�öLY!K���߰�o:��E�Ae�E0.���F��*�d�u;��Mȿ#�>L�I � ���hs�r�R�?�_+� a����8��=�F���Ɯ^ɍ��ꋇ���p���\��N�U���c�D���Ɏ���cN�ؿN��G�����>�"ja썢��ӭ�~�<�si\�Q���Y?��]�LB|�iK�O98'��o6������Mc,�����J����-�-9������&�J';�w٥ Y��6��Jps%�F�O�)��:�@��q
�>|[q/�J"����0�a�2��l�*V�m��F.�ԃ}�P*j���JCk�H=���?����沥܁xcՊ헊��eR�)�r��;�G����~��]vN���s K;E��CK��[�

^��j�����rĻ��A�x��a�l=Y	TU�@
y}H�Hs��y��3!�j�$;�j;v�B��+�J~#��hh�N5��b;X�0�j��P��&���b��A	���~R<GjC?<|��si���@5����u�埨:����[a��tKl�J�z�d�j��ҙ�����<meN���_�N!�9n6��(�P�t��"��`�@�_Ԡ����,C�X�#Y�5H
��u���@ ��G�-;V�kN�MY�R��JB�����}|�� �����МoDo�8�<�zԊݽ)`�R��P.�7D�� �I��a�%k��юnuYB.H��Vm?��>R�)��ޱ��n�h��v���Xʦ � �Xm��,�����݀�B�%m`y_�����&��
�=��禠tQ|^㴡S�06\���]���o��C+IV�"�5�.���7���5�:u^R\��4���dJ��	I���ϐ���������:ҋ�h�Ά[�����M���-���#�ᜧ�Q/�pF_�s�>�4��e����x���Ae@F�y���1 �!�@,8ǉ?�$�}L�U����J��������C����}�N�b(�UO�v�L)�S�B�n`�T2(v(���S�i���ћ7o��M�      �      x������ � �      �      x������ � �      V   L   x���� �w�"���J�Z�A��K���~B�Mh�ٓ-ު3���c�q1�2!���bJ3��\���R�@�n      �   �   x�]��
�0��s���J�&��E<>���
�<��C�ݿ�G7����Ah($c4�(� ���CO]?�u�ń#dE����S�}(���G#�Di)�sv�1\^���k��6���G��YW��7������$���
o�{��d-�      �   �   x���1k1����+��I�-�c
ɖl��z�B�+����%9:t���;^��hvs�-�~��E�^2%T�`�N����)eN�P����c�?�s9ٷ2�m�.�Xo+�����4,�coW����43gTG�A|s���G�<h��]|t�u�|�ѥ�CSڕ���ݍ}�ʲR��o�+�}[�A|fq�
���a~ j�o0      �   :   x��� 1���X�"�s����X�3
�v�&�f�dU&[��r�m4�J�:�~[�	?      �   x   x���@cT���������D; 8VƎT�Gui5�v;�����:��Œ�	R.�9��\���M���/`�u�R8�Wٿ�,f�r�����yJ���\"4�b�X*ws�����J)      �     x�u�Kn1е������ɖC�1��I`FB�\?6	D2D��U�]��# \!��G�$�yCP�' T�x.��v�,} B�P[ k ��[9��ͦ�<@l:V�~)���-eL�a���zO�\����)]ڥĭ�_����E 5�8�A]9�V�\3[��`�Z��W[�@b�W��k$@jNk+B��\�C],�Zc����x\�%�#�����`2"�!b�$�Dj�b����N����1x���%0��el�����vy�O�In�l�0����      �   �   x�U�A� �59�S��^�S��h�3�8��MI7n�x?�|��/���ӳ͑*��#��1��>�TNXI�`�p�h�Z&zQ$�`�	�0��i���*���:���M�������e�s��m��	 ~�=v      v   �   x�m�AN�0E��)�G�l�N�l�,�8�2*j�B�R�4�':����l4ϓ! � wH(�^Y �d�|�B��3�
�X0��<�G����9�7�m�=]��Z?�#/��'� ��G+f��ޓ}B���66U�6�Z�Cu�Nj��*��q�Mf��<���G�G/�sҽ8����\�oN�Ϡxo�-����k!H�Ysz_�Vݥ_j귿1)m��X!�m��[k� {�\
      r   I   x�3�t/�/-0�4202�5��56T00�21�24�3����4�60�4�2�tK�HL�Tgb�gjfbaU���� #      t   -   x�ȱ  ��?w�,��s�F�J��c�h&[9Nln4o���      E   Q  x�}һj�0�Y~
�%�H���t꒥S!L�8��6�B���rq����'�����ej�B.�-�%B@�(�_ �)Ip�` �?'�Z
��8�$�}�j���e��L�3���1%�M��\��9��C%�_���7��!���kʠ�H�A�ϭ��8Sm ��w�ڧ#�gU��9m��DO9m9+��[��!�J^�m�⓹��n�ɾ��;o���	d'ު:�c+���)VIv4uW�é(���ی��禍�:w��wm}Z߯��������N]��XeY#�*���_w8��X|�}7���/�iM0�L��t00m�A�	�RY�����      G      x������ � �      I      x������ � �      K      x������ � �      M      x�3�4�4����� 	 `      O      x�3�4�4����� 	]      Q      x������ � �      S      x������ � �      U      x������ � �      n   \   x�]�;�  й�������<���Q`��;���' ��s�V���1 	kJZq�9b�"����1+n����y�c�����+\t      Z   �   x�]��n�0D��Wd_a��׏?�}%�ȁH�������6�Ι94�����q8��1������2�Sw���s��4uײ% V�(*�*��E�o��(�C
�@��n'��paCZCLH	�z����/O�	���6X��u�u�*���K-�ԕh���$�N�A�����KW��k%'�$��%���&��`Q0�.�mUU��'I'      \      x������ � �      ^      x������ � �      `      x������ � �      b      x������ � �      d      x�3�4�4����� �Y      f      x������ � �      h      x������ � �      j      x������ � �      l   8   x�3��H�)���4202�5��5�P00�22�26�3�06�4�60�4�4����� �=	4      �      x��}k�ɑ�g�W�aϋ�)���_Ҍ�w4Fc{�QMVw��&�Er4�b��Edf�����f��p�Xd3#"3#��t������W�]I�m�1���	���j1a����Wӻbq[�^]e���*���?_����:[���^�PD���<+f��\�^�����oN'�w,E����9Q�{��WU�Ha�G����cMN��L��o��y1+Ww 8�}��I��T|Z�w��p���p�+��e���������*N��9��s��YX��h�u:�\ӗZ�h���*�P/o�y9 � ��a�0�*&����r�.��"[^�f���: �4ۇ&h΍�͒|�	ve90�"CP2 ��Bâ|�ӻ�Ѵ?Z��2.�C�'?��t=:>�GF������c ����b]�:��Lʚ ��\Sn	E0r�n�Y��zBʙ ��\�D��]5�����Hʚ0��\��[F=����_��(��;� 93 ��0���2����r(BP��Trw@����v3/�?}���Nz%uN	 �\N&�줢ǑEn(�I'���C��A`=��s*r#5�^J�ɇ�?���$�b<' ��2 �|+Y�.��z�)�`AT#��.����rdW	B�q���,gʂ��J�?-�wH����ԉoe�6�C�����W��E��z�῜iAH�?�7e].��np�M�Ǿ抋�Z�M�09���_���}��d=~� 5��0�y
$e1������M5-�{�(�Y��dp����u��p� \���N���og�h��**<�Ν�fJy��Z�ռZ�{��Y���ب�yzN���:�F`��[����f�������I��I@�"t�G(¿�s�|<q��w�
����M�(i&;pV���uQ-���ո�C�ϣ�c>���6��^��ŧ�z3�+`�C&���L�H�1LWK&�λ)���x�'آ`��{M')1$����z�U���������4e0�����1�Zf�N�7�1�_a���.�1���լ5Y�̋���A�6�gĄ}���Vp���!�Q^	��e.���E��a3�`e��)`0�(��A8*X�y��� P��!	HJ֚���ۡ'���HA�X�h�u�+�!��1J`8ڍ�S��^"�[
�� V�`�i�l�̇Ly��@��p�é����n1M
��)&�s�tKaS��+u#�?�+e���I.�)	���f��:47S��x!rɵ�lP�� $8F���$
	���	�Q���鰐Px���C�e�`B�����uD)!S���Ic��r��ū�р� #�dx.$�H9�S�h�A�2}�Q��0y@��@�@qEy���b]�#����!F�aޙ	P�U&F��>��Q��9A�cP��P��8!0F���t�Σ�h�0P�����I ����F)ց-�^������lr_iPgT��Y9n3��v�����4�U��a��*CB��i���Rt�gW٘ZW.� P�\2���vw?�e����X]�uX7�D���Ѯ�T�v�#B"�D�S$u��x��I��t�1r \���'�%�8����\����!9|
%MR���\H�S�Q[����E���5WPz!�c�e��� ]��e�z&�C��<��;@���(ZPү��EYH�(pOr��\�-�6��.h��zb��Lh�j
�o���S�a`�*��:ٲ��ET�<�_(Y�R�G�~*��m����K� bh��n��	w�/]5��eN�Jɼ�ד7��ٿd�,vhH
�;>��8��| �d7�x~(�!,`a�Y�f�\�V$�z�*��c&�Q�sZp��|.��@(b�w!8F�D2H�ȁ5����w�E����;��R�Y�N���_�a��b�h'�+KJ������������zƤ ��[����'a�M�XԸ����gI�X�� ���5�p��s;g�p�_#���2�� W� �-��嗲�Rz�XcF���G���X�x
Y��4gA*�y1���5ŭH ��f$����v�Z/�w�#^�mT�@�}"�>�S��M9Qp�+%�RN<���G�y�#��c�\p�m"�Qݍ9jz0� 9�aO��
����g�r�!�8u])I��pm����3O\XJҳ$$��@K0FO^YJ҃����%5���c�qs���sgb�q�\t�D��f���9 �%ML�Ɂ�zy���j�N���L�1p�s��l熱�i� @u (�8g-����r$0�����U��1K�&9hn5r(4Ӂ���:"D�C�iX��k=`�}��$�	2��A��]lh.�mio�z��84�Bs�%�h��� �hg��� �ߏh"|�f/ ��x�����@$ 8F�r8��ʃ � C��(j�  *�-_6�h{S.8=������C�I��9h|ʢ��A\8��  ,�J�╔�p&�H �Y%^	EQ X��̌2vt��IF���V��H�;��$�-4��} ��.��o��"�+�T��,�0ѝ�G�z8_J�JA(�Z)��Pڂ�)����X��$ $��0݀6�� l
B`�]C՞�?fɣLD��������~�� -ʭD��K��@�`�c�ZEQ��@�2�(g	t�\7r����p<�@h��]���>5��V6=:>4s7FȸV
Mº���6�AP}��	wl�n$� 4g�~Ch�i�+��n.[��~�'�@���#i0�x��hM�=�g;�4���LQ+����(�s���3z��W�]p� �'�@��Ь�:~Bc�и�R�0�hEA����:RE��&�!1Qpy�/�u�]��nY��5���ba��X$\��X$5�EradF��#�����;.��3�����eo��`t�Z�a�|�l'T�4���
*ɝzI:���aA��#�i
�D4p��n���7e#[���8�!0K
W�k��#�`㶏�F�AjG�o��|�k�y�/3�%�QIp���,z'�&eWY�6�3z�����'�s�n��Wt�?>��F��|f\��k����	���.���9��P���br~�8t�`:��H.�U�MZ���٭���Ҥ�5��x�Mj]��KV<��v@��_�d��΄�_���3�"��3Ld��>����ȅ�(��	^���9�-��Y+A�'�v��W( ��e&de�)�c�����C����4��7�j��|�U��/��z�Z
?��?[�de�?3_N�q�0�O�&ϒ�3w��?x�cz;���N�f���	j�f�6�e�e��:�<%�р	m���t9�������lt5��j��莝�G�a�n:jk���� ǭ���A<`8�q#�x4���Z�Ȩ=OWj��fQjYg�9<O�n� �[��V�#R�I}����(F�����A$�)K}�iЙ<�J�W�d����w����ņ�����А!x&��;��ݲ^ϫպ!)��V�P�y�� I
#�u>�{[$q���.��|��UEP���e��JE���M$������U`�[1拀�r��{,��h�YK�`q���b�^ �}44E��s��'��$"�[�+:0X���2^��=�07�O`�m�-�J�(��v�`��׊a;D:�`��"?�#S0
}0+$k��?׷Ţ����0�i�M��Ѩ�K5��Qbz`�}��CYB���@;�X��;�|,�=@L'�� ����xt a@��2�D��]�VC%&�%) �d	&lw�v��b�Ya�ٺM@��hi�W� ?��:I�\ �b=x!Bf�pW��Ŵܬ�i1bp'��s�X��"r�p�l�XLޥ�Ѥ���9�u0�gB^�H�5�H�O̵P$sltb|ؙ�#/9��� )wS�M�ՑV�qby�P�����L
K!2tb�=@+��U���J�]l
�8�h���'(un[f�-�^�b�����k�������S��Y�o#�C��b    ��)�B���3�Mqh��Qʗ��"pQb,�����:e��sLO)p�v�H潊�I�;�bX!Ȩb>�p��ay�쀖)hWM!�ڒ9�l���.����=ѡd�GY�.��Z�`��ݷ)����B%���)�����hN9W!k�L�T|.��FW���1���	�c����E��֐�M'_�0�Q�(M!p�|�>�Bؙ��*�]�Ub!��������S\.'L1r�Wt6���7�7,i.�!
�	}3*���ː��/������� 	*	4�Ls;D�$����n;��F؎�avpŢ�!��d$Τ���hN�Wu����NՁ�&���p�7b�[����A&��3��u��?g�YYpֵ1`����R������b�����[���><0|5�&e!�u��ŘL�(L��
A����H�� -bA�6?qE-�g��Qh�G��x�jJ!�	iX̅� �蒟l����pU��s�0]n�)G�լ�iw��z��&�%��Ky���%���o�%	��i]=47?�Ŭ������X,�����k�=�1:�G&�#3�`��
����En@ʲ/pClgC�k��f�`�
�1N4��������i��>aAHʃ����j,H���[�'B�S4
g����4hD� e�X>���vʘ�u�ل�P}�v����W)��8�hj�-�I��u
X��?#C���T���},�*W�,�(��q��}/#l(�z��)��7Ş�L��VW.w�U]�'<l��h\M� O�h�%h��."�{�u��O�+����'�iЈ����er��;�LѸEՉ�|�J��da�w��v�t�D�����{�]�	8B2�}������2-Q�"�7cw�!�х'ي(eѣ�Kv9,էM��˯_���#(��E��aqpιJ� vޔ�\-�4�L�(��|X.V�kk���٬
�s�b^�m�����\�|�3̣�.�M�v����+k�Ǉ�5��eeT���T�~����l���)���I\͖u�vv%����S��˶�蚱��RͷqΕo�L�.����}�U�gQv��6���i��<�>���Z�'�Q�(��݇�a0n9��e�~� �R>>����|�_v�/k�� eqz��հqk�d��o����w���x*�w���}��2MX:>��C�����r�&6'Ƨߍ43dQb��/]��Pn��?����������,+�q��O�
VG�Ħ�X��l��i��S2�7�1��cJ�������~�\���]��Z�:A3�8_�\m��Ѿ}(3L�y'��P��Zܺ�M�����w ���<hg�e�Ȝ��(O#p�|P� WW\cx�i�d\N�[�mO�Q���# �Rm�=v��J+���ӏ�F��C��I��Ĉ1څq1�N���w��C��5�N�D���u�݀l-N��b�؟�5��q/9���_>���ǷG]�Dy�-\�z���up�av�ď��9����^�W�D��/~����N���	�	�X&B]��c�H�r?�q%#�=�>ڒ��C\_��]����/вq��RC�{����~��W�y��m�!����G�ς��-�,�&C4"{����%��0$��,ٴ�z�q��s���AP��%~�e
{���k
���wf@��َw	;4�[b��������Nd��"��ow7������k�M��5>�`1����E;�c	~����1��=X���O�>~;����K��&���8u�a|B��0�9��3�*���0wy =u��2d��	�P�e����W�oxh��'o޼ޱ=�4����h�I�E�{%z��6�e�����Sw1ܧ���O��["�h�f���֙=;�F���3�5ֽ���[�9yM��  ; @�E�i�*�zQ��`�q�#���Z�trW{� : D�r%��=����V=�� ��In5M/�����<���ܴ=K��{
D:��E�ri�H�Nlh�}��7�ܑm�����A��t {��+���`��@�N��Jw*E�?f�ר�����b�ǣ�SP-!kb7?��Q]/�$;�/oR/8�*^�s�����֢LN�w�����q�ܮ�:��X��k�0���x�|���	K��b�����'��L!Fa�a:����[p����ؔ�$q�o��d�~;l� `O�������3��� IAZU�iy��l@����cf��uh��C\�zbG0AL���v�M�.���{oף>���x��Gh�O��U�pd�:�)ƨ�!�]Lnn�߳���t������|�������M�D?�?X�ɡ�E�e������1����䟿E�W��~$^
P;�g���u嶃�� �M��'��k��E���z����6����%���3�a`;nx�-Qƌ�Y�Çx \q���۷�2s�܄5*�:$%���K�X�Z������,��h�R�
t���YY�e��`�0!&�kw��/N5L{�5g:����2��cAzr�Y,vg�FTc��"��9��i�E;��!�?��<Po�@1W�l'2tO/����k�a�i�*\XNb�(��ۃ�0��������bzZ:Gz�{�
��-��v�j��'�_���p��4f�J��s�ktq����c<��D��c��܋$:��#��ZB�n'n��1��2P��ͪ�U&X��`�@P�ֹ�-���p�:����Y΍��hwG�ۺx����t�\u�8�	bʝ(��ȃf���	�AgRt��S��̩�44͆]zD؄슍���<g��}��.$E�J.��$�O��06���ѣ��YKC����� '�.�)��U�G�^��V�,!֡*,�G	��-<E������R��rG��Q�pSv_�ܧ%hw��f�>.�/|�Bs9�������弚z�y�����_��c1/��#�"��:|���/o�(]@p�Q�nRE|/vL�;��Ay�@��8�����+d�����t���z�.�s���x��|��ǐ;3k�f�]|�6��^j=q������ۖ��Ͻ�lQN<�A�fH��}�P��ᗻ
�������3�ޞ$���0C[�a��v&��o��5��W�7��m�EoX1����U���!n4}�A��F� ��[��2o��Nn%��oC*F����� �8- �r�ƈ8�I �'�`���9U?�Ȣx1"{Ϻ�����2��9�$��{\�tp�{�.��P�����8c٧��I�'\�?��R����jI��x,E�r6���GJτ�w�J��
�p����������&��	�3�C�-�ޛ{���
���l���n�R�~y}ݼ �n�������r�x�
D��3��Bb`(��2����}����%�(X��h�:�
��A�5���"��$ �����!]�	"�q����8:1�o���r�����M���P)����I���J>1*��b��^����X�ʅQ�D
Q���x�{��'8ʡX�dT��[$�"��"q�amjN?;O�����uOE�j�VS��zF�{�.0_�u�U:�bY�y'h7�r\J)�B]�!���V�K�q )����dؚ��sܲ�c<��*:ͦ��K1���L ��5�t�c��$�	&��Ӷ���i��IhM�0������0���u s|t�c�(^�;��^+F�y
Y�BY�I[tp�DGD�A��1k4��ۿ3O�*�Kh�`�*\�b`	g;z.P}H�ܘ�:�hmH�) �E���Cx�d�k��x���:s	��S���i���uw�Yr�\�4��!}4�����!��tn�M�aA$)+�묇2�����C�1���@�I]	5xʷ�x�l�
&t��S�)2W���c�. �KB��캉���8�>[�u��~�ܝU�?D�	0�œaC+̓��L�q�R������Tw��Ӝ2A�٧G������(��V �1�MƤT��k���1T �  D�a�	6��*f�~Ԝ�8Q~g@����� ���QN("�:�U�&��T{���S�$v���C�d�vM8�@�}�g{������$�� f/oS�AW
���ݑz����s7�1R9ȣ�TOވ�gm�ѓz|^�O�ܴ�vtg7��9 I%L@'V:丌�y�Cw�ö�ʶ�L���(Q�+�r����EhaL��lZ$-,V41�r�2�ٴ��c���eܨZD��>�L&ф��R��&�q��Ro�.LK�s|���|v4}<�O��^ox+���>}ؼΘ�0�ie����y���Ba�	˧����
!B�ϥ�O'��΢�;���/�~�O��t@S�w���	}�gd@��-�.�~Q�<so��~�����@�'����%loT �a�k?N�A�/A:Ge-}[0s,���H�C���L1._���j,}C��)2�������'�����/M����@�k^��5)}د�D}	�AT�Hp]� R�3]�>F��1l2߼�{��e4!O:�ȨPAw�Ջn]s-�&g�H�<�yl�mUd�uu�&�R�݊���`�1�ڼ��xJ��w��6�^��E�>I�"R���]�e�?As�!��~�O p��^?���ct�1N_B���>}R�&C�%L̦���>�x�u_�>N���%�����8�Ӈ�5Q�=�˞��0�	_�1���x�)};PhMth�q�������p�k؋��\�铨?��/��TB�Ci��n�^>�'��4�f�$}&��`�"�v��}��\��k�䂵J�����3.��C�Bt
#�e�sÕxn�3F"MI�.�����Hd)�����~���#��Y�+f�3��%�NL�HHd.�b(��W���⩓	uܽN�1���M���hl_i]����)$�D�z�J���˓hR]@#X�$��O�MH�W�m��	/�^�D�U,܅N������6��Cg�]\Z8qM��؅��;*�����F�YXl��B���$�!!D>�՘Xe�-b1�=C�s{0c�);$��<�Z62�Ln��#z�o�it�W"��
8\Y&_!7���; ��{�Hb����T��(��1!_�@I���lo�9z/l<��{���؇�y���Q�W@�ޥ�J�p3��(i��]�IC��3�Lo��n3FSn΄�'()��y�h��>9J�����\)~���)JgJkI5gB�R�gi���L�AQ5�G���(��#}�hFiR��q,�Kz.Q`S�µ�6$�?=JMR��~4Q���}4MQ*��J�s�LEw���5L��}t*
�p�ѥ`�\�LEf�Rl,x6�SQ��[���"���e*
�/R���s�eW�X3�>2�ٙT��)J���r��yPF�g��K����^�u5���x�u�E��@.��dtK��y�6�Ίu[���3*֝��d>���d�^2�ǻ�7��	�&%��~O�|��rE�\����\2���6�)S�l��ؗy���Z�!���-�H�}�+e��{�-6}�o��[<@�M�s�V�
��?��ث,I���9V���l^P4�ҔXW��S^2�<L+��*d�3꒗\���X��u���ř-6U?@,�9!J�K��j#|%���>{N�~b�z�=��E.���V�ĹdBˉ�g
E��M������
ٷ�m�� ����;p�HB��b>%��)߸EMS�.QqE�=q�:�>�X]��ɨ�I���"^p�ԹDV�Z�������ܾӃ�Q�iK��Lv������J���D�K+ȥ�u�X�'V
�v]�E.�U'�"TO�D��/�/�M���F���1-f\�����#���e8�2�Ju$
�*A��KzH1�,!Qr�VS�ً��'zJ�*�6]�3��'|lESE$%��5��L>|�:U%�hKp��kC�TMH��52E����S����2'F��iO�9��ݾP�-?�N����u%�}�xu���rW��7�T���X*O�o̸d/�hH��0u�s)8��Z�c��P�����"�ǒ�>�k��6�/`eJ"Fg�����3?�G��f/WG�$�ǰ���߬a�D��H]�;���/���d�O��4��r8II��8G��T�����{�Z1������rv#:K�������g��.�*�x���l�S�:��'"*Ξ���c�Q4p�V�_6��S�]1ͻ�g<x�d�h�QFə���+���U�9�D�Giw���M���(��s��Q��Τ�(�����ӃU��i�"G���N�Ĳ�X�^�Ҩ�VF���b�!c��sb�	uXd�Q��}qU!��b=�?S�E�R�s5���&����:������+٢NՊ��X��T={���¤��p|�������i��A�����2U��^߄=�����L��t5.��<����Cx�H���X�����?Ll�W�X�6�����=��U*�n&�H�.�屇p�Ԃ�K^��Sb&f
��_��YV�P�5p<7B6�����~	��T�@��l:-��TI%��}�^nQ$%�8QG�6ք�= ������n?�HQ,%�bH�q����v��'����!F^�^e����p��2��E[��j\Uү��_��p��8�M�)�J��摪K�����k��U]��_yÇфx�k���פ�
�H���_��خV�צѿsÚ��G1�&�<\p{�T���S�S_1�e�%����:���D���S��u�V��������ޔ�zS7���Ze\X� c�=����O\�1"DB���U)AI�v��O��l��j]o��3���k�Kd��-^�\����bU]G/��,�����vK�y}W�Yټ����)��M�?�?�E����`��u8]n��|\�V��ݲ^wǾ�>/\���T�g���"yV�}�[��;�����xx��Y��ͪ@h�w_.����7U`���������)I.0����j!����	�A!���d�ݰ][��6]�A�m�k&�J2HM�^��X~3�>�~�\�ĸkq��lR���he�s���g2OۧӯA����OC\�n\�-A�h9��D[Q�jQܗ��W��������5���MU������-��~O����֎.�R�0F�)�H���%�կH�yu_�V�� ���ɖ��˳UD�?5���p#Ck����>��_z�T:�<�\C&��65'�X���sY_�=}����ы��9u�qW�NǇ�hw*������|���b=����<�. >ɂ��c�%��|]���0��M��|-�Uw���b����y��*k�+O�u4�-M�=���	'v��]��-(��`C��^a�� ������:����뛺X�L���@�d�r����n��h���VLv0�Ö�Ya�����U�t�mQ4P�3���0��j�8��ج�Љl���??�-�-(� �v�}B��ZEF�auX� @4,F��:N�*LAk��rW��j����,��7��C���#����8��C���������2      �     x�}Vْ�(}63e��_����8M�_�����;N������6\�J����Uv��N�t�\���qX����Z>P�BQ�h��W��{w�:6*Q�+I��|f4Ւm�?��J%8Y?_3
���	��e>hu�1�Sp����uUW�(xca+E�v�������ɍh+�qd:�E"_�Z��"�9��J1��D�f3z!�{Q��d�O ������Z�^y�t����l.趯�Ae\����x�ʔFU�H�C�s+�MF��.L;�M����]�W���t�>��w�������*��R5�П�]7f}���AW)����L�����	���S�oP]�yY���[�=2'�mL�I�!>���"���}���c�_[s��D���f��Q=�1������|�
��T'����'h��N&ܜu<.+)w��M{�e�L��M�6g�~�XRC��f|�@��|=h06sX,M�j�7����6�f���3#۠��)m�7�֕�ɄFm��]�6�6x3<�&f���>�=�,��1Fv͓$q]q��bhD�5�:�
Z�(/�u�3��r˩pi7&�� �/O��i��.A����3�.|ɳə�P���m�N
�q�QԷ� ��/��+���XL�
��G����A�~x%��ŅƝBC�?'���r�c�^��UL7:_h��m��ڻ�Y�&6�U�52[�Ӂ���Vp3����Lχ�қx�D�J8�k��V�aLDP�=���O� F�_O�d����}�}�����6o{��/��}��d�8���_�o��ݍ��ׯP=V���3�JJ��?d�[��/!�C��v¥7/�W�l��*\z��4��>p�0�@�J����&J�\��H��S����J]����v�s3�E��6[�}F�E�0%U`�,.���ц<��H�]H��?`]Th��P)��6D~&1�D^xP�Jf� W��sP���Q ��u�Kzg���Y|(��������      �   �  x����n�<���O��E��q�e��8�w��9��闔d[�8Mi���(�'6O��?�n����QJA;����7�~(��w���� ���x��R�p��o��IPC>x�E�6��0?��X�"z�vzaE/���?�������v��
C7J�Fff��`��{��c���^ڧ����Xc!i�HX��\8j�����i�ݡ_EYT�&�a��o��=���p��J"���}|�O���OAP~BQFݯ��?t���ӀG
V(a��"?�:��m�<�р`�v���d��ML?�����M7��N�h��bٺ���e2o�{+F[�x��`vO�5y��î��.׸���r����z�^V��6�X�.�h��U���ʶ!�|$�L�7(�B$��*�^.����(��;a����B}{���y/�q�<�!�Ӣ&g,�<\�jU����������o�$Rx>�h1��M8�O���Ob�YskT\=�Jl��?����>���,OrbX�첑�����tr+��[�W�L�I��a��a�IPo��4�H���g����.��t|�\�R!��Zn4}�Ϲ�u9j��k�U!Rt5��"V(q|��_�8�T
�j��
�}ڠ��Im�1:tG�����g�� �%A����ϥ�]!��7�py�/C|*��"�i��W^���I�8j�C_��r��l)4� >�fW���g�y� ��x��3̨���~yP$>������fsz�b�C�4'��[9����p�<����L�Q)�պqAs��WRFW-��{�V���J�ŗ�*!Q�eZ��L� �E�U�	6��{C+���� ���a�X��� V�Z "%�ɷsU�X�L�#$=��nb |W~Kz�U#�2�Q�+�Dc>��~8������DkY��A�xR5-!T���g�+��H�L�����}�y�ҧ�Z!BԃM
(��6K��D�`PY�.e���b��*�"E��n�r�Ƭ
;pN%E�R�/�dQe����a�1q�B�]��U�����4��Dѥ�rm�ײ����e(5 KW,a�m� �e��*n�Y�,�gޖ�l�Of鰠�� m	������n�0XԖ�(� }2�-�p��V�����DiktL���T�j�1����m�6��D`|AУ�ϗ�{z�>�؊H�:Gކ����B2˥x�+y?��j�V�����<r�)�&�DԒb��b��PȏmMz�
������{.���-��#a`s?�ѯ�����,�U\o�S)5X*Xaܞ*'� ��9.�D�gA>�u&�]���y_��x��v*��p[~��>Bo�4��6�*:�M��������D�3��H�ry����|��Ѷ܁�UM��Am�gl�VEM �E�T����0��0��ԁ�����F�A�/2�""�?b\��Yc�xb�x�~v�_+iN�*Va��p���ް�8��d�1����sk�Ť,��uff3�r�`x���.���.��RިZ>H�AI���yu�_�1�~�� ����IE�+����\)/�q8T��v�/���<'�Z^�76H!��/W`�����G���<ֱ��Ѥ�ǅ��t����[u���(|���&ūGYl�Gr�9�� �
��n7[��Z4ցO����~=�JJP��3��b �즯���f�8!J��E��C:�)�6ϧ���{M(�PM��t�טTdy]����I�ېX���S��[�}�.fwm��c����$8��� �[o��F��>!NwYWhB�$�o��-����}Ƥ�\�lO�$�޸Է��&]���_J�ġ�m�ӈ�x3 B=r����f&X!p�������� �?�
��&��s��@aI ����F�4=�H� ��=������Y@� � dLE�G�^!���:lE�G�_R�6Ʀ�\E��;d�3�}�X(n����g��\��{OǩJ��2�����Vi�I$��f�8�K���BÇK��P�K��K������4�V�s�����*q����-ئI�rM�rP,<�+狝��u�y5�sb�la�tB���:��uvDT��e�<ej0�v�qFĢ�M�L�	s�mY���b]�+/D;rQ9(V*#��y�=��R^n[��P����r���U.��bk�u�Sy��%A4c4�"��H�=�rd,հ"n�S�P�-�G]V�s3���*oE���%EK�Q鐼*�Ű�'"�@p����J(#*�%5����Kw��ʕx����<^�sK���XA������B�
#N�����_�ܗ�j��0gc?c�ΛU93Qya�̽��Rp!����Z.�M]I�6��E�fq��Ֆ�Hz�Y�O��Q��Ƚg㝳��=Qh���y����mޯñ�^�/��7��|?�AB�g٩��^<�ކ۝?��M�
��C��w|����5��Ȑ�A����K�T'�(^D�,��X� �6q�����X>3�("�Α�Y�i�P����b�r��Әs�|�T� �[&q��%cE���wR6�4���i���[`���Mf���z�J P?�F2ΛA{�@;�&$\�T��C�.cs8y7�7	��#�Q�XP�1\�䤁U������8�
�LZH4�᱊�d�#{��dO}��a㲙X�4WRӪl�K��uu�PA�w�X���}��WݗI6�>�[���	��H^�7m�Lɫ��6����2�g�:L�Ap��vvL���N�3(�	Z�M>�>����!��K|�bH��f�2*3��\d�3wYrѱ�rQ'�Xe�ά�U�����"�0Fqc��*@�kR�dL-Ffpu�2��m�l���\�rH~�9u8�G
T��\�q��9ҦM��R��K]8Z)��.�q�4 6�6]3���~��0�)Y�e�N��b���@(W@�F	��f��q���9�������{��y##>H�e��5�p���-�|"!�;}���.oC��ߵ?��	'=q��U��庮/��FD3�gz�@#�ۜ	u��`����q\f僨}﬌Xc��z���n���k�)H���+�iX%ڷN�QWF�q�r������e���%*���ӽ��x
�_����0y�rq���?�k/v��i�����.TJU�ǝ8� -��w�>w�rA5���<�/c28�>��î=�V�����7 W3P?��K�<A;�YɁ���kV�ͱ��<�D��8�$�B�"L��iU���Y[�2���]c~�L~�
W�'�+@ň)�x1���M�٨~��eP�����#<0pɐ�P^�3.�-hk�E|`������S��Z�����ҟO��;��󀕖���si�����K|IJrP_8�9i-���>��G��Dc��D1�rL��.�}�nm�e*��N9�� �OvJ������"
�-	n~��S�4?�rs|�F0(Clcㅲ�>]��u%�O�x�v��{�E��}Ɛ`t4i|_'Q|Ia�<^���/&��|�/�ci��r��8��|/6�*��]��`喋뮐7ǩ� �0���sw�.n�d5�O+���(�n�}��d0�      �      x�՛Ǯ�J�E�]_q�	��d�$��Q��{~}K�����P? @g|��;v#5q�X]���ֈ's�rMх�3�V���;����A�q��eCL��ֺP�w��������Ot����l�s�܁��cJ����9��Iu3UL��.��5�	�,��bCc�vr�?`��I��E�+��5�&�,��f��4/�l!�3��ݱX��Y��v�F��_}iNf�>�ܫ���]�ꂗ�=^�R�T=x���XM�]�  �@��C�@��_ ��O�a�{4F6.:�� p�6JZ!���+]籴��f,�>Q���G��6^u����ʽ*�;�W��"�D���� �8z#��P�U�;i�.]'km�b ��h:�5��p��2regz}Uml��8s�ȰF	n���=��m�=g��n�ӥ��2��\��p���|+�]��!�&�A�Xi�j2XG5/Uo�#wM�W���Ü�A0W�~�\�֖�H�o�[73��7�l�ݗ��Mh�л4���3H'w*�~��K�<��B`�"kK6�����d�!> �/��$���pBހ
j&e��A�l�z�aW�6�.�}���禕�،�*��6�jO�����۩]:.��WV`���!�BI���qʌ!*��Sf�4�ƪ2!)�l���f5�jhy��R�%�ҳ���[͞��z�X2��t�~JpN�Ct�!�݈ "�)�oB6�16��)�[;���5�!�M�j�7�h5���Z:��u:�1<^�x�j�l�;���6������A���L_��!�?"���EmQ����ns�L[���E���+� ;��0��2�	��o̬h[C0�q�G�>���mk�?� �	qIDCq?�Zl(!-i�כ�5��@3��Z�e ���D4��`��$�#n��ϑ<�l�?�^�F�y؛�5k�*�"Q�/Dl�EA������3�g�a�)�R?�Q��L��JS��f3I�w���+���t�V,��|��.4�
g�9F>O����!�@�("�w/*Z�cE�w�� �����lp�{��~%"��%anz�6h�c�T��8<��Ht�yF�4��Q��_��-�D�ѫA0��q�)���Lc9�Q^����,���p�_������6�����X��� O3�u�E�ܹow�$�sO���"�.4���pHE�E�(�P�[&x��84�.2�޶G(����z���h;�N��e5��N��e��h���fN|��Ȋ-R�a*�_��8������y`D�t���,�t���dq7s��j��`�^���]��-�$]��5>G�����a��A0?��w+�+�x�i'�@d�@�l�8�M�gR&l\��m,^����rn�jϔgߎ�4�f�m�B"�0$"@m�Aj��,�Z#W� &�%Zÿ�m��Jڥ�:�F�%u�x`wx�{*Q���q�i�ѡ�-��N�@�/ $�^*rF>���~�<b���i+�--1mB���}V}c�m��]�M���*�/��h=XȚk����N�{d&�b1
מg�yM2	�!��DIV`;13ת-����mվ��F	�^-Mt�ku��Z�R���f��x�L�޸����"o��*�ׂ�) �C(������9vR�3X!�t�V����;	u���&T��_��,��I�ǃ�:�W
��O��</��bC ��MȨ�&ѣ�7
�5��6zA��~Z�5��wꥴ[=��x�j�e�k��:�wWC�i���8/FW+��`2�o�C@��;a��q♖Qj��W��-�3"A����֏�$��r7�l�k�q��SckN��ө�hL���z�v�>���c|M2<$���z��W�nm7�G+֥b�&�]�)I��f����T���8r���/���v�v��dm+s�	����p���}of��]y�бE�E��^-HF�_(�=�+I(��o�Q������9O\K��ż����k��|���GB��	�]d	�w���腡ѦhBPZ �+��E�!�F�K]�h�ab,B��e�5¹z�\{�������E��dD���HB@�t0��,0�o�f��b��4̒�V����PCzi�s��EW-yVj���˾o�.����yB����/t�O@��0���$�@��5��xG�cA^h��za}����IE���(�ʮT�r���H�u��N��0��r\��~��Uf��N� [jB8>Ӿ�*?�l*��Q��Z�C�$��Sb4߉(���xA0S���`�t32���=�J؈�]V�jv?��Q^���"�B�Q�a��Xcf�2�8-m���=&��W��찕�z'������|?Y)ͮ����q0��h'ۇ��9���I%������Aj!��}+n[�)E/&��oDtz�W���C$�_v�-8'Qޚ����VL]�v��$�6���CE�W3�N�8@~&>l3I���7-�R�0�PPNZ�]�|#"��+IX��rKO���ʣ��~hU�����y?H��+g���n�2D�;��@`��CG���G�^3!|m�A(8aCK-��7":5���M�h2xc*���v�����
�F'��6����G������2���Ƚ�n|ZB��1�V��!��[��Wku^���r��4�� 4WS���pRMn���%�^6�;~T�!���?:�TD�n��ka@�B�w���Ȧ�<��'�=�R����\����?��*S������j+yA�I|�n9����-$������/t@�:�n��L���Gv���O��j�J�u�h��*���]C����ZL��f���nUΓ��DD%�		s�A�b���]���ł����p�9ԋ���Yu�k��alqy�-BM�v�193$�ܡy����l�{+zFMn\��x.i�i�Θv������@1�/��u������#�u}������n}/��-�y�_��i���l$N�~�Ļv79��+Y��h��'��Q��叕��g"��_^�u)���:x����s^��:&|�O}�� 1������4��C[C�f�(a�%GzL�o��Y>s�l�1q�i��pD� 0�2]�dQ !ߍM`��^K>����8�i@,q�5/a��_��4jCKq���[eĤ�6��`9[����(^s�U=olOq����|��¤�/2"���!�i����3�ߋQ@��m�Ӵ��W���B)+����ץ:��^]s&l�XrA���\��u}�4֛���_�}��2د5B�ɬ� "���^I_�n�:���:B¯���O�ۜ.I�J	=��^*N*��Ta���G���F��~	���^@ 2L���^eeY�/��g7ZO���|�Uz�1�+��,ݭ����S3er0��5<��GY5�P&Ģ��X9?���]#�~]d�ծ?q�}*�-��"u]���/ו�U�CW�FDW���.얇>+�|c���`.��e��.�?� �6"B�� �^*�
�j�¤b�[A5eb�:�ͪ*�%�+#�k��H��~�Y����Q���y��n��U,��=U�뀏����q���2F�
�c�|�Hj�:���Gn_�� ��7��7tR������`oȁ�ߕ˔Ҥ%�P�N�`�7�͹Y<��?	���$�!��@�<�N��q�c��́Qbdz��q���Է�,JH���A7*TG;�t�v��U�_������9��ϊ?#ѷ�f@��#��]�靗#r��B-�SZyۥ6���ݑ�H=o��A�*s0y��"�;���'�E��8yܮ�2�cK�i�|n�KHCD!�50��َg	��w��!�(���H�k_��{iq�7z�]������B�i��w��]s��S|���"K�'"��H{�k B�ADZ�a��	oz��(,���L�S�+�7��W;�\>P�����t�Exz�[�9՞��P�����tk�m������H�2R�κ@��$ʝ���+{��dF�Hw���]<�����kM5]f�9�M�a����'Pc��!$R��Em��Ao %  ��u�>������'mZD�Wf���Υ�0�f��\�fP����O��?�EY�����#��7㟙��_���(�!!��ؾi#��v�G��>��o&z 	4I���Nr��[�=�R��N���ݨ�������)��n�%3[?� b�φ��"�����MQ���1
��U�+rҗ��N�hpc&�dVE�y��Ԋ�}\<1���q��h��z�zh/��(D��{��|m�H���og}��Xo�m�����I�����@R����ɻ�vWv�ht*��C�Ns��]���
�x΢=�'����@F��-��y	�KF	G�~��3��4+�Y�"�Rjۇ����mϢ�%u����������c�Y����{���
B�BqƩ:^c���-$j䕓�I������K�:�g�+�V��XY���;:�D+t<7e5�C�>*��r>��V��Z`�f&hY,���� {�Ͽ��91	��r�tJ����r�AL'���N�. �t͞O��8��U�KEdȉHЧ[�T��_k�"N\�&f��	��T��D��,�v7Q�/9,�5)C?����\����G�9�P����k� C�$�SY�K���Y�|�D?�{Mw�:7~��+edMFR�-�8�����I��2]M�f� r�S*`T��;?�5��hH� ����y��%mi���꒵�ǫL��WcG/R�~���mu+��A:.`��Q��g�H9_��a�ڑ�P5O���i��!��F�O���-���F#��M3��.��I��� M����M�̥	y��uy;���éwș[���9|��g[E���OD�o���Q����tгPLĈSb{���,���X}�HsnI�E�����q`�*�Y�͉PqY�ײѢ�U��p�+�?
�s%����@�?#M�a+��nq�Z�[���ŽZl�s�� �XG{0+OS��dl�0i��?��%�����jS��;����6���)�6�CR���=��DiՊ��}�J�t�<5�v����x�U��N����En��2���-��HwN�,ţ{s�절g��g��o��� *�7%�@R�uN��v�F�6M�mS��k+��U�O/�-Na��o��;�`�.
J�m����H�vf�eb�<��<������!�rE��s�Ϸ}|Dj�0$S�q��f�&���-����P{����k�%�ӱ��2�0�5HN��'u��r�r�+]TMj�t��|`vi��������t��Ms�F~��ϣ>ߡ��Z��}ִ�(s�9����6Gy�meD�Y�����9q7\$��d�_FP9�E'�H7���)݈��vM����cq9]\8x�l��:�Q��Ee���Qy&�����({9j{)_�}<F�m���)�v��)���o�ש����>�	���2�**�0P���/o�Ia����k���sq�s���]�s%c�=���D�hVx��3���P�!�,�d!p�^�8�iA�@��+-۩���27�徶e���ur�����&T��tܮ���>n�D����4D����i������?���v      �   �   x�m��N�0�����=Z��I�\q��1ڍuҨx~�VC�[���c}9���iG���Qv"O�
"?!�`;@�r~��Z?��[w=LS bIjb�ژ$��(�|+��Ρ��^�qy�	�`��v��R�'���b�Q����P�sw�Ԗ]��y��m��ֱuĮ�b5cY~�[��)Œݪ��5J͖���lV�K�e�Ϙkt� ;4��pZ#��ى��!ٖ�\�k����鯪-7��Eu��}!|]�bc      �   �  x�}R�n�0=+_��c�I���e����^z�c�V+K�$�˾~�ӵ�� ,��{�'�D�;��rX���rn���wl�O��R��r�<e��s��J�!�l1M�T^�,k4�ƒB#�5*F����K����O`�~c�b)�]�2��}� �oQ&{�
e*{�o�� =_�j��M�ށ�u��ST�0�[[(̀�ŕ�-Ć��Z�j+�?���ju ?d
��b?$��]T����>�M��i� �r�c�P�x�	�#D�ۃ*��s������<�L�'�{�,{[&��/��4�a@#�l)���|��?�#O�-�u���T�5����M^\ͣ�|4��;�Z���+�P/��̷dG=������4K����b�����Xۺ�(�q�0*���CB�8޴A�ܢ�ȳ[2�n���X����\��\r?r����d(q]�g��z�̳4]1�ְ4��X܈��se�83�/�ق'�?'���~�      �      x�3�42�4�2�42�4����� F|      �      x�3�42�4����� <�      �   &  x���]o�� �k�W�r�TA_�c_����I�y�P �����X"����C�3������%�|�~�sHϦ�?�l٧+.�MsQ��d�Tu_�u��.��d6�f:�f:�;9L�ӓ����h�rz�8��e2I�����ˮ_����mVm��f�������<ϓ2雋��M���/�{UQ/������&k��E��y��J��vÞ4eY-�d����A����[uy4����j����8�m�W�"��Mr��}�m6���E�Ɵ�$�;3y��v�����6�G�>;Jf��w���}�߽}1�'u�iӦۘ���y��K��H�1��f����a(7���
�'+t�N�'�����x6;>>��
]f�&=o�"=�>o�"]7��dQ���h[�a�>y�'��]�Y2������a�e��������o�W?�~O�x��ͮ��Ζ�N�UUW������i�C�[�Ӧ.b��*K��O�>�.�b��?֛����N�v���u�~�9}�6u�Y��oVE�.���q�&Vm�^����Ⱥ�N��nX�4[.��>��	۪몦��	����Uz�6�EZ�i�E�V]�^���Ȅ<���<��-�M�Ic$я��'�vX?�MY�$��#��&.�AD_�6/�qz�nv�<�ta�F��Çm��Y;�n������"F��ɋ�"���2"${���o��|����<��^uYD�M���B�2���~j�o���2z֯w�mv���isU]��m���f��T��鿌Χ7��G���Y�jF�"�v��/��bn�o��xؗ��"�u��5e�E'�d���f�C����=|�&���w��^g��iqӛ����{�����(�~\�N��Χ�メEU�=)��?�q��W������rq�tñ����>*�!��<��e��]�y��,Vl+y�=���0��z2z�mʘ���?WK^���e�/�o�7	��'���s��:f ��!u�mܙ�b�]5m��0�q������p��ճ۟���|f�"�Ӌ���Zvw�:*�}�Γ��(|��sߍ��F�iU�Q.��mVg�����b�6qo|��׷5z��<t|� o�Q~�s8}��t�z�p3I'�q�<9XDx��͒�G����!���C����'���b:�-�����J�<&-��ez����*��]��/�������ǉp(�<���:����j�*W���v��g����9�$'F�6�wU��>{��d�ݴ�������u��� ��>�ux��c$�'g�Q����}�}��Jk&�lYm�ø��,��&m)9v��i�H���r�4D���s�öO�������ɯ�͈����?��i��|��'cH�����dv4����̚�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �^�'�u�^�?��&���x�$����ǲ��E2M�����<y���:���/ݿg�U��m���aa�d�U��uS7��K�;[&��N����,ϻ�,�/ݹg�U�ї��3�*�PF}���O�����y_Ū|�<��b�lS$�I2;��r��r֔�U��Y|��������0R�p:���6�9���w�/^���      �   *   x�34�42�44�243,�M@#c.CSN##NS�=... wg�      x      x�3�L�4�2�F\1z\\\ s      z      x�3�4�4�bNC�=... -      |      x�3�4�4�2�F\1z\\\ 	      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   H   x�E���0�3Lѻ)��@a'��s���w~FӉ�Ёl;\���}��r�͇��h,������m[�����      �   F   x�E��� �7T�?�sG�"R��ב_������U\5}�s�� 9�Pn��y�.�BF$�kS�P��g�      �   "   x�3�L�4�2�&\&�%�F\�@Ґ+F��� D�a      �   4   x�3�4202�5��50R00�2��25�313125�60����4�4����� ���      �   4   x�3�4202�5��50R00�2��25�3330���60����4�4����� ���      �      x������ � �      �   X  x�]X]��6|�ޯ��/}�m6�$uN��J�_ �`��R�_�R�\��^�3��Ӄ,�|���ٌF�L��7��+���>�Q���9<���U�u§�q��ӗ����Y�S]�����N�2CxJ�4+VY�J���"?����<��]�Q�i[u���o��T���/�ڿ͓��x��yc�0��ᚽ��\�jӹ��`+�ۖ�|�_���Pl�H�оV�m��W8̵����aj���[ݫN�n���՛��҃:H%����C�
ɨL^?�N�Fu&\�����[������>����Ucj�u�k[��:�d:�B�mVY���*��)�o�����66*֢�F���qp=�b�G;��s���ڋ�_ϴ�l�_��52Q�N����M�;�I�m[+��2O�Ew��'��M(�@�=l�§�����3'$5�I�i��jķqG��\��C��5#n�O�B����G[
uua�A�w�X?�K ��]o����i[	����*�T^��!���WWY��mP/�?�J��<�ߍ����t(�)A�oT�ʒ�쓏(
b�Sm�Q��ٽ���Ȇ;����½םm�GHSI�c e�BM[����X�L���0`�&?u
��E�SoM_�ۙ��ydB��6 7oq���@r�+����u5H���w�!���>䂮,K>,@��6��lzR���X�#�ug{� !������m��`��P����ʓg� �����omj��M���Sg��p�����8�u=��j�a�dg+H�@;+�u:�hV:0�YУrT��!"��Y�Tmd�B��;c���"�l��r����P
��2y8��!r�� y`�C^� ��}Avs7�ZR�6�"����φ�d��N�&h�*����@�4	�	r��B�Q�	v�'!b:|�G�bNsV�l�<`�'�"�Fhy/� %�O�d!�<�4L=�40��M~��JQ�5ɿ��ٖ���a'��ќ��:jn]\�mz����������5B��Dف��-�`+*�?��:vg���&"�幚1�Uh�Gkf�@K�&}����<A#�O(d��q�)z�C���Z9L@��
*v�U���J�=
۴�B6w����HT�lg͘��|?�Z��˰�6<'Mg�̡Rs��Yܾ�qt�@5����?��sS���7�<������i �j���C�f`gP�P6�,y%��8 ߬�Xl��d'��i����������3�s��8��'�Qu���v��,�6	�'�9�* ,g��C�8 >�c��yG/�㮦u�"<kV��y�<f��FN"��-~R�BP����
ʹh>���j���J^9����%@��@Ұ��l=�L�<�f�Hw��h{(v�V�`<�+��N�I]�2�ďA����gή^��5�����rT��[!D)~7��%�;�9�]O_��i��Q�]���j�Wj-�����lt U�l�8�K��t��=�&רּ�\�O&NB����8v_��d��Э8��!���c!���0�&3�6-I=
��P��w�ha���FsPM8 �9]]����oac�2��s�i�x���˳�{L4�b���S��f�G���h�����3M̋#�� /ùP� C��*I��b�RN��!})��X�QFϛ����I��,���Z�'�=�T�ZL2[lg�1B�µ�yʰ.���
7�ɋ�[*�c$��7�%�Um�8�����K�<hӨ/ �\G����+��gPׄ:(͟QGQ*u�F^-=�Ύ��^������L�aZ��^婰�b��Vu�64R,9� S(\�ƎBlh ՞�����o	�>��8d�n`)Q'ĕ���!�|�߅�-�HA�֚�;�48q�mî�`:BhE{�t�%v��!��z�D�
֟�(�o���F�Rq��`,�����Jı�i�V�OpWx��V2ð�C��� �, �+����ֱ�D}�5��&l�u�J�)���A�GY&t��M�X�@0
�o(��+Y�>���/�i�����8�R����9��t޺�w�b�0�8�E���u^�y�]b5u���!�*���'Ŋ�+Q�I,��$�2��1��2| gFs����R��4j$U���nU����e�m-'���1&��G�WĘ��gm�����^@zt�?*�W���C��r^�	�pb+����*���%@� �i��7��l션ޜu�}	!��4�#��<�({���q g�N�>ι8�{��/���Nl���X5(x+���H ð�h ~�.~��4/.q�mU�"o�������M�F�=By�T�Ġ,��$��Y����=���:.�qR�K�_{ޜ���Y��\���s]h�<zX�ޝ8�\�4]n�I���E��MO&�qHJ�=C6�mGț5�6��]UM>��x"a�2�q��DF�m�#��;�56<:t�G8C�\�s�o/c��5��o�޷�7�DGb�]��:x� 7��kk˻K}�B3��տ�Ú��5�Ww��h�(�>T@#P�m<7���W^c0xm|�R4�Ì\>mͯ;`q??�8����~��mZՎNSJK�$�L�"�����ʠ�Ek���g�����#�2�a܄K�<��ǣ3m|�{�@\0���G!��n���׎���cc]$�F�0�n͗��O:��������_���z����?��-3Ư�-H+����d�,5�-z��t]*#� [/y�D^`'?���	C綥t�r����D�'�d��@����0��ˬQ��Jk����WМшX��M�%;#�+��~yƣ����y�C���J�8��;����::�Gl�|)�B/¶�&���cH����A����W�ov�c>(��}��M�0$R���hGn��-�\s����I}��.�QS���>#���nc�Qv��Q���"�ɈK�H�� ��S9h��[I�D���2F���3��*�m���I�����|�ϰ~.�������ߝ�]u�]�N|r��zu�p�K#4�h̍��|yz���� MNx      �      x�MZɒ㸒<����L�"R˭���g�K���)��@$$��$� �*���  �+7K���G��싳Ӣ̫�T�/|��u�����O7�s��K�&�.��_�]g�v�g�&uq�]l�5��<ge��O���ث�>Tա��W��Tf_�;y���W�F-F������~��:t�wW��+l�F�N�?g�~�y*���Ryq(�C���U�yq���->?����+?�N��:�h;�Ov^d�����*���P��&���]pR<e�hqi=��ЯXEqv3/�j��Y��Am��f}2������g3��l$BE#��pϢ:l�u��tkk�`���h���~��Ţ���n]T�݅���q䧼Vyu(�+4�G�qQ�3�ɺa;ϫQ�7<ۂ��(oZw����1�����w��C@�˩����ML^?�ή�氩y�m��'�D�f���`8�Qg=�V�Wo���Y���Y�L�Û�����?+6%�N� �����kx]@*'�����o1�1�\� T��x��֭��<�O+v�gu�0�=�^�  �=��o��S��7���&�����WыZ��������{^v^��va���U�E�0���S���	,��!�!�<D��M�X�1�����H���`��ðn�W�E�u�e��'��u�|gL���0\p�������P
ԋ"�8��$b��m���C*�t��[���wR��9��Ō�8�� "�͡J)*J��ߎ��a9@�_�#o5Y�xıЉ|-�_g`i��wr �k+'�z:���y�n:KrKL�n��q�}���;�G@X�Rh�����?^�>����H�ቮBI�.
1���e.Lר|OXV�l��>��j� =�<��I�������2�����;�Cި�<l�r E��μ�k�S�I=\�����m���`F�z`��Qwr�E�W{��#�`��ځ��¢�x4®�&���B��h��`�O���Gꁴ��#�C�����,�v#��4���(z9����Fe4��@*P��T�� f�Ql�/R��%O6*�[�}�f���f2r�Jnv�Ғ��������c-85��h����gV��bH����!�ZE*���	X�g���f����-�n�0z���� �\�J�@L;�a �ݖ��mM%-�C!t[�ٿ&F7\��#��A.=z'��!2IAl|����'�gm�Z�I��M!�(R��PA��E�.W�M�E'7���X�G�:�'b��w�a����t���[f��Y�����"���F�:O�`OH�9!��*�-{V�qU�IY�B�d�*=5Vtb9��b�_q�U
���-q�� ��⟑|3*�d�!%Q E�ʝ���PA��r�}s�Ţg�p���љx��� �����bzp���;�j;�b���8�zX禍]��.C�������YJW�pJW�i �ϳ>�2[@X!-��2M�-��������K��z�r,"@s��=��705.�-��F�_�.��(��;�"Voe��IK+��jȝP���IIO�"�!mQ]��J�v#
%���A�/��N��e��d�q���%����&	D�z�<�JgZ5�̂K���ɘ�R$H������{Y1z0�e�sfՌ�]��3'3�\���2�	r�.HMrے�\���*���Ty��ҽ@&B���Ug�#݊�'�S`�����"� �f��*�H<kՂD0���)(ͼ������� ���r�G1F�=�2�{��>C"X���]R�����~w�L���,R=�Ű��M?�!dڞ1č�{$!�M(17�좵���7 ��y}�(3Z�+<��g�6*f���z�P1��4x�X��D!�Ր��U�T6ٻ���������CG�b�d
}J�*��a�����"���c@�X�[�U)�Tը�G�o/�Ȕ�ο��yJUr6�'q7����cT�"*�4�pw��i�d�y�h"��XOh�����j������?@	�KD=i�+�B2T� ջXH�VʃK�ú{�U�}�,{%64<=@�{/��6��l��`o6�:��.{�qH��@A���D�`��DY��}�P��g�=#��-Utd2�,*���������ա:i:�ohѢ��"d�w��[��P~��<��y��Pa!ر�P��	��j�x<Wmia��ߢ�In���=��&���B?Z�3�*o��ۂ+�� �����O�,������UGg��I�x�;�����}��V��2?��(��2����hK�+�>��I�Z6�}�,s����M k�}�ĦdSe��G�҇��p\a�Z��L>���E�t��mW2�w%����Mt�M�3%�(��;z�ϔ���6�0��w$�9�FnB��F�o��y��.����F���Rg�{C�9oI�]�G�T:��_h�pC�%҃��.�,
��8v�40�ٛ��n�w�n�/�M_��_�v��"&��o�k���C鮷4Q�B��0��IC%3������ %����T��A0g:
�{�j��C�B/,7"�m���{�A�����gb�I���-k����! ������T*�^��H��>�.�ڕ�we�;3�Z�_���k���=���#Cԅ{-�R��Xk��AM�LNh��j��9�.�JyrW%��t�������rSW~b�T�E��Ёn�����[	@�$�u	Ub�(Q���p&\�O1MwQ�eE�)DFs�J�@Û�o!E�Et��~=����t?'��1�*��i&8�6����K4�a��~!f0�h�X%�����R�M��a'�⽛�>$�΀��#��f+6b��2����D�Sי��4_��Ʃ]'$HE���2ѧ!�Q�Q�na�Z)��5ڶ��&�(g�̜,���*~�J3����Zz4{a��K�<
�'�5�m�m˒���f-���Q�Q�#3�Ј�5 ع�����Y�[�-S�JQ�:�e��!����f��bG�¹��t��~%n�.N4�2��Y7��?hLyK��D�1��3K��<���z2M��C�_�򘳄��ѡ�D���%8���h1��N��6H��%Pz�.�&vsؤ�w�����ߤgJ�q{C�{���R�	�@�J�)��B��O�绬ǁ|&�����N���>�E��L0��oa���=�9�D.�eM��j�7U��><�	�l4��Q]��(�{x�^�°�!��"���Ֆ�[�?z㍔� �Aa�Z��_���
F1�����L�N���}�����η�U�4�2�Z����4��X�-$�&,XnA顺��H��{����V�Q����bζ<���������2a�i�5�&7�V52���fʌ���1�r#�_�+�G(Z�#}�`4[���/y�4-,��w4���56T�I��ie�,�H	=c&�>���E݃A��5OeE��FA}�ϾЕ��g��W�!�7�$�w�G��4r�7���%���LTd.��<��Kx���=s���>���Yʗ���^9{����H�ަFB��+)�m�������ك`Z���׌�s̈����ύ�b%L�8%�tW�
�@v)�����R��h�ʃ��E����|�1�ʜ�T��o�V�g�48H���5��{�j�&o�H;B|��j���W:�����Gǒ|M�	ĵh���"�V�NFoB�[T$})_5����DZ��Hn*��"U��̦1BMCC��c%ni�����$��tȐ�d�!����(/-+�W��ުm�/ƱZ�C8Y ߉A󃯯pj��=LA��fCʓ���2����8���v|C�py�&�����0�n���|W?I��\o�za��\�v�}�g�[����M��[y��߳ӺO�G�jM�b�V�)n�\vy��@��Ɲ��4ߩ�P��ej	px��2�8PW.���t݅X͆<m��2w������{�2Aio�5�C�a�8L �   �:޸��5Ǳ�P����G)2j���5F}���gx6	�q��b����86�z�TM���(J�dbW�!7*�?�񊻈��3����x(ſ��V^�&�f�?p��k�p���it�����A��E^�z�璸�-���?�*M� ]y|x�s�ơ���NGG�(�j�;l��/{S�cP�g�?��P��+�7�J�qw>�[��Ǜ�2�3������C�q      �   "   x�3�t�O/-J�4�2�t�H�N�4����� YS�      �      x�3�t,�L�2�t,-.)J��c���� SdV      �   E   x�3�tJ�K�ILI-��t�H�N�4�2���K�L�t�����
s:��%� �SS�R+9��b���� nM      �   g   x�]�;
�0 �99��"�$5��Y�]�DJ��qs<���M��\�uݥ���
��F8�Feナ���}�+G1��Dӫ-�4���6gY�}�a����      �      x������ � �      �   V   x�3�����/-*�4202�5��56P02�25�22׳01675�60�2���L�H-RNM��KI,�D�`ned�gjab`d����� Ay�      �      x������ � �      �      x������ � �      �   @  x�UY]��F|�żV৾�6�c;�sFv�y�Ci"�����_U=��5`�w%j>����[Y�S�7�W�&�:��h����膕z������ä�n�J��]��Tk�n���A]:��Z<g�kk����*�v��!�<��Jw��اտ��]�|�fgoT�<�GD���`��`�J=zo�F�y�Qz�<;��v��ۭ�<ͳ��J��l��d�"y��x9J=w�j�AOF�F�r
�S����x���d�R��I���O\�z^b�{�҇|���>��3٢Lp��6\Rlg�����+�Ac�����}�L�.�Ow5�>d�C�Q)I�i�u��O�#����G|�1�ѾA��m�8!�-���� nr{�+-�J�=V�7\r�|/�F;��ℍ�yy-�����3{��
+�ӌ��S�(+3m��|��|��*�ʛ����=n�,=Gy�����C�t7��|<)Ӷ��V�3Np���!��S��#��"#J�BT��>M������]�JT|c�4���9�1��t7��CuDB.<��m��� !w�F�s�]�8��yp��4|��k_�mԉ�D�O������&x��Q���01K7�$W~�_~Ɲ}�T��\fÔ�;��N#L���BD��p��C��a�uX����<w`�*Kn�����;��dY�(g��0�Sx�#e@[l��8�~\��!Sv<!j�A��1�j�r�g�����gy���]��7�d�IO�Ōe�3�n2���?�َJ��4�T����-�d�c�NA-&D��G�Z�yؼH�2����.7���W-r�@ސ*�gD��#@j귈���u� �8��\�M��C�	��(NY�<��\����fXP��6�b�G=A�OT^0M�P�����f_	ϳ*y��G��#��{��C�5P� [p 
˺����ԥK���'�|��<�'��cc��:�9�H4�H(��wJsh�J�x��&y���R>�ۉ�������A�SܭeSk��,�`Ecx \�f�
��H�@'����B��}&��m�Gܻs�r�<ٍ"c'�K���~j�������H��yy�Ȫ��v=����H@�0� VT� պic@�΄rpq��JB���[fPj%�y��FՃ�x�\MM��8����\���-p�� Z��r�Oq�(�� JՅ��ƓG�B5��(�j'��&����cR:;�j.u2ep������$<ϓ��H����'�/�E�ِfI�ly�<{s<��&q�@6Nv������h��}(\D�У�/%�(�(�i˼L�����G3��7�B�&�
�]xOc�c��9�kGxs]��
ִ��	��C���q��P�<��m���P�V߰��,�=(��4��,��E<�����~��I'�u�,��YZ�g����:�d�!�.,�| �d�H��Шx�M�xT\|���>�&�W~�0@ڃ��ƻPDQ�%P�%�c�[�M~��Q)4�"0� �/�O�;�c�؆C���#j�@}-�,U��#ep�;����[`AYG���Be��Rb#q�Q�  ���u�������\�����A�����A`,J1�i���`!'��?�u�h]?C���^��Nr_��#���*1:8�)��5A���b���2P���y<�|1�N@HWCjT��a}���qw$�Ɗ&�z�c����TL_YD*9�&��Q�/�g�����X{{04#O��](+dv&�&ݝ!�����"����HiQD��8r	T��A�߉�u���ӃBւ��O(E��Qu��(XRnņ��Iǐrs���2`��:
CX=x�גd=�88��] �VOm�Z�Ё!�.�q���l�"v+1��#9�b�`mč�̉��t ��#{���=J.���\Dy�*��8pn��l��͑4��:�8a5�Dݕ��$����i4��]�6�o-�-鉰{�T`;����L�	4��)�:�w(	�(`\�}��J�5��.� t��I2qJh���ϡr����3)��ǒ�+�^�?�rI[:���ԅ�������5�cN��	=�J}���p�`�@/�͈2�g�@��h`j�6���ȥ(K���f"�e�|�5�� FO��ҋq"O8p0��I{�#��J��l��2���m�\�B�2�(��,��6��c	�g�$������6�*:+ 7�*T��{o{B5BP�����0=�M!>�x�A��Kc/;�A>z�y;��h���m�ؐ������F�By���KZ͉������c1�P����X��G�D$-��X/kثL>:�m�Im8�8xk➆;�:8��RY�:�d���f8c]�0��O������ThF&VB�PT�V24��������Ȳ�t�%��,Q&d�u���a���8{��ѻ>�"�'7- RO��,ny�4��œ I9GI��$
hF�X��]���ښs ��L�c
@s�X	K0K�еgjoo`�'�����1�j*'zR��LG2(���/��64�Wa�]�����	[zii��_���h��^,97�C��Z�@�O,2uG������D���Ti�9�*1�z�=�cWO~������എ�֡�P<��k4ۺ;b��@�ؽR�A]���UY�xhǋ�`d&��Z������/fi��L�0U�Uy�E�M�³��@Ӌ	��'����)%7Xت@��Qrp5I3��*z������	��2�=�X�C�`F@{��jb�N�B���$W%w�ӝ��%���l��*_~+���ϡ�`,M�Qz���Я����B�c�����8��X�A+��B�,].��	�Wf�� פ=Q'גZ{��]� �x�R�/ԫ�}v�N~���@�F������Ț��7�hn0r�񇹡ۖ�C"�<��=
��,���y��&�Q09�`�@�a��"[�"��&��&��*H����y*ʨ�6����F�AHՋw"�ϸ����q��xپ@PD*4�D�M[�Qa���ǹ��#��Xerm�z�N����X>�Xr�$M����0�XP�B���xK(;��"iF�z*-{����q�%n��L�Π��aă9r��X�ج#x�9!1�:�O�Y�S���ǦK�r�u� �x�e��Γ�=��˟�C,^�x>1��h�l�,ZCg�ց��q�ϑǶ�o@�lh�6�T��7������i8�-V�
Qu{�D�N"f�M�W���F��4�Gj�R�w2���h?l���en��E�-��ơ y%\��}L�1��TK��xڌ;�a8"�YW�G�퇯���k�e�}42��9��q���eRe�jWĘa�u�;1r���/V�w(�@���}D���=��
m���e�+�|3�Ԑihe��k^I�Ӫ�x Z��R��>t�7�{~���b0���e�M�b	{2@�`�E���F��m�(���י?9�r��������)6� ��QƄp��=���]�:�Cp�/�Y�Y/M���Yd�����h;Q*�����4�\�O�4�����.��5�n�?�쬤�}h[�@�$�~���c�s��#�4;9��k��ݻ��/��      �     x�MX]�۶|V~�/l��_oɦi{��E6�A���m��DU��Q��9���fc��c��&ѯ�Գ)��4N�M|ܤ�����8��6Ͳ"O������eme^L��`�z�~U�=�p�Pu��'ӹ�Z�ƹ���8���S���<;9�ˢ�nh*u�]��u0�婺j�W7(���<�3N��uO8�+?�U�7��F��o��&��N�S"����n�W��Խ6�M9��[�l(d3��n��������~4<��!�M���'����E�m�w�o4���2]3�rj�4���V�e+���㬼i���]�.�}�%v'�Jݩ�x3��Ck�*�z�\�I�MrT��ħ<���!�@�8[���+wQg7K�)�������K��O=T����k��{mD��]�J�,|����'�*uW|���m��w�d�#�Rw�"pF�nh"�ޣ��&A�v�"=%^}��q�b�uyS�Fq~B_���iD�q�����;ng2;��fL�HN���}2z`��S6�*?��5�-u������rƵ@�ձ��w���!�_�jB��^��2c��l�Wq|J�S���$��j�!�Z5�ѵ��B9��PK���R�u�ޘ�j�U���m�����$l��;lܖq��2I��޳dw�����q!*9NM�73�f�6�ęn;� ��yf��3�e�F`�]'T~T�|m��a���b�^`_ ��`��RLo&�d�'�+u��%y��O%���ƃ&�����ئ%ƮI=�c^�=�)��;׸�,�MRp�ps@q�G�G�^�)�����T��ػ�o�#��}���u�G%��x�rP��WD_�T�E��-B泫f�� 8.�ug ֽ��㜄/��#���bK�]\9�h�����x/�
f:���ELM�XEPHGn�8��x�|�wA�1jp���i]���R�1��~g~��%�;L���+�n������4�@ �&�FA�p�r0�B��!���J��<�E[�D"&y�Oi���_�4l�B׵)o� J���B5���O�(�.V���B��1�2�g���1a��~F���x�W��-���Z�8z_J�·z�b��z=���	�u�/0]����*�,��*%�3�e|��J)F�u���^��a5����R��V�lp=����~!q �b�cq�Hk�a&tS!�K:J���g��YI���Br̀4���Ht��x���"������vWd/�C�;p��1Y#@.�X#7I�մ�h��F�(h�p���q��.��v���~p��vx$�³��ѵ/�A�9c��rDji�f.��1L~-ԣ��^�RQ����"@o�~�u)?�<�9�%�4�cNE��*��؛A��圬��3�L�3�U;Ь�vn9j=Q��a�(�#fWxf0-��Y�E z�} �(3c���i�	�|���=�T�o�"qcKL�U��VN翩���p�?�nH�{�9�]������8�)�*�e+��Y�DD%���&�QMQ-��)��T�I{��.�p�Od�t�d�[!�CO�5���݂�-��]?5B�!+�IaA22A!�ɒ�7c�̦��U�H8����,���B��]���ƃ�:�#��M���}��N���JH�hyv\J�����_U��������Ud��4�j�á�`�Ϝ��u��e�p�*�@ �B��*Y����^d
|�z���f���b��b֎�{(S�Q�� �`�C�#�W�y���Բy𰮄oV��p��B��2a#`��"��M���%���VRL�@c\�(�p0�tOi��� |ɺG���t�����gj�cW�'/]�ӌR|��B�;�]t�0��_�0���O��y�|}�� Ј��`��;�:�F��;�op���Cn�� ZO%e�R�GzM�=	y����CG`ŕm!u�z#����V��d�8~/v$ˋ�Ux�og��3��\���EeG�������WR%��~�T�%� M*]mW�1��EI�2��U�����<��#x�
H˲H��dH�ZTEx<mD�ò�� �~3u���k_�j��E��-�e�-�<�UT�A4%���=�@9���/��%�A� ���5�lE\pF���qmA͝�	�b�J��At�-��.��W�xpnA9�k.dI��,z�6Ǔ�f�&��Q����ٻ��ۓ.I4�a�\,1�}� ;�n1y������t��bxh�=8��YZ>�8�A,ۑ��K�Ҭ�;r���B��p6i��	_��+.�c�k����H�n�'�<���{z}\S��Y��1��Bag����]���>X!K�%�P[��u\���E�eEz83|w}�H�C��0K^��&�l���6-P�*�ԄF)1���q���B�����IF0p��A�R�D�j��@tBV�x�Ok۲7�]�."$m �xi�Y_�6˕G�_"��a�O�#���-�P�Mbm؏��އ��L+���[?=t:(XJ�m#,�llɃ��P,��0�zqT�����B�1_LZ���<��C��d�*m�7��R��x�a�D�D�P��u8�=M�9��Xqnd�� S���"�`jل��V}�A��r�EMl�*��~'S!�x�rZ���%sj�RV8y�����^�]�8ɯV?�䋐s�]p��y�{/*5�:b��Y�#�H�ǰ��V��!��v�c�1�.�|Yp�"�E�w��p�	�����B|�p5��ia�z���ط'alɍ���q�a*[�]������i��7�KpB�e�0�hӲ�qL|?��Z-.h����"]��K^-{-+��A��t�R'�j?����e�H��,|�>�Y����҅*^&>-��I|���]��ޚR�<�7��K�b�v�{X��c��xmQe�]�W:��đ4��	%o6W�����O"��� |�:��Mh���k	��I�)��R����Y8C��� ��&z���A�;�V&5�,�Ɂ;[�n���ր|�;��B.����[�\0+��`���8>�k��ݻ�}F+      �   @  x�UX]�۶|V~�/�Ч�ޒ�I/дA� @_h����D��츿�3�ԦX�zm��9gf�f�;w[�<ͳ�����*=���\�w��ڗ���U�|p�+=M�C�g���y�����W5���Fݽ]�.�N��S��Ge�sQ����{�쨦^㻃�;o����5���w�g;���{���E/f0�z�5��c�<���)?��t�q�{��o+�;�h��{�m�U_��5�!<Z>�ǧt/a���U��55���n0�?y��zQW�o��|�9����zkMߨk������j�Ǘ�������?$'HH���*���!n�Oޮ�ꑗ����k�c���y���a�� oL���cc$F��/ڎ��$��Vu.�s%;�OW�✽�g5�o8܀�<"�s��׃��*��=f;��{'Y�['U�q���o/(9��8�i��|4�73Y��7��7l�����]_C9QD?���z;/f���n�~�r�����#��AO�U���xΊs&e>��]p�k�D��i:l�����7��5ތ��h��'|��sp�F��X!�6EP���,E`5�B���sǵ_�̪�Ym�کw�ũB�F_�m|Ar�#:�@q[9ʂ����gN�j���*��98s�ݳ�g����n�!�>�w@ݛ� ���A;`h\�(�ofˌ�X�*b�bzk�لgg��Ʃ�-�0��q���x�yy��mco�Y5���Eybo^���s������]�9�b�~��o�`�^P[�íݕ�a�(bg�=*� �x��)-�����x.�\� �ye9 ��^M ��"�Gh�wH�� -_��k�j�kC��%�ȹA~ ���\�A���=���O�}��C�f#�����0�e�k�X�:��JP�g�T����3�´Y�"��IR,��q�����=���A�B�?��dL�1�A �C��@�������q�����.3�2���c�~	Ucj;8ݑ<�"k� `FK6-�)�7;� �c�G˃�<KN\*a؏��f�;P8�;M������[��p#�Z��Lh}vR��\�Q;�S�խ
k �; ��P+�`��2�'�o^/���~����*E9a���&oS�����1S~5��~�;�P]4Sg���z�=6��3x5	ҍ�G��9�Y��<��S6��:�F��҄p~�P����z���4@�њ󽬉��D`���#�Ц%{ ʞ�㣧��H>:$��n��c�Bi��Ȍ��1��
��Wh,%�T�ف�!NnT�q뒳��π<�bE�H6wnp���� �QJ��ɜl�ke��0"e��/͔�H����R��D��m�C]�qkaf]�@��P�}��݂���x�?@�`�Q4όͺ�n�I!��tT�����!�>�m���oB��Gm���с�v���k�8��PC"�@��a�4�{3�ꈦ+�l�z{������F����J'ˏ�/��z7�I3��.�5����(���ѫ������ejqah�l;T��E@����u��:O>|��h	��d�Tyr�����̓D+��A�-���3�Qkp��B}-�K��]�m�8
��\�i%[dhBhԍXI|��K�%�P�+���E����+"<����wyܠ�ס���IW�Cæy�	j��F�l��J܈��s�h���DE�E�P��+
�j�."tԕ���
�gW��BO���;�*B���E��E�|я(ԑ{aZeh�Z ��?���Qd&�n��8A��~���ʸ9�#$�[��U��*rhh�ꕞ��P��� f�vspo�0V�޵𱠬�%�VL"��,�8�0�TK�,ĉ�K/*.���4_og��E&���Ti�ل�v�/�G5�C�\p-wϮ�Qa���E��3�y0�r�����t��l����5r��e"���ܭ�&��l~/���&�>�0���U��1�us��B����C���2���5t{4�!�   �4�1Np\_&8�R��������U����`Ok-x�bj�"ї�"�;��4��|�޹xV��%z2̃]��pl��H[$����%��K�כB�������	����^�E��8�e�|��c��+�ZYY[��A���O@��f�M��e�|���4��q6���AǇ1�κ��^V��}`1Ty��M,�]��HI��$�8`��a����&AR�Y�*=))F.4� P2����PH���oy��6X�#�>P�h�d<	�-K�Z9��QqΖo���A^d�q�&��s��"��
�����ˊ�)#�<Q��8pS����r�@� ��#�´k�?<u�#�����BD:�
s�H�!*�m͋i�IR�ؚ��V�.fU��|D��{�#if�1D%��D�aF�0���=�b��pD��:�2�ٹ��<��X�&TY�'C ma��D#S��O�S��S�����̫�x-BwnE���B��n��f���X���Ȳ	���T�ɇ�>Q>�!^$p���S���!���2��m�L�o!~#���C�v����v,h!�*�e�L�nCd�-����΋��e�k�^�q �?]��6�VD<
���v�UU��:=���_�s�;o�ơ����Fh�?�#\�p�̸:����Ջ8u�[�9��D��m��d���a91���8���apu>x=��(J%��t�*�ώ�=��/��I�P��m�D�c'��x�D�[[����̞�+������'�b�it������,4����m�M���,�,;rh�){�/0�l�ܩ�q�(B��t\c��05������9�K"��M�c�܀�������3�r��FjG���[�Z��6�]^@
���6"�޶b��b�n^ � ������o�S)�������ǡ�:%�E�y��<�g�(��,AX���Y�J�#�␞}���8�:^� �8ϴ���e����b�^8#�p�0b����~������m��g�o����43����z��B�=\^̃����8ү`0��l(73/}y#w��.�2�ꜳ�WY�ٟ�W�^���=f      �   l  x�mXۮ�8|V���c���[.3��䆙 ��BK�Ř5e��UM�v���[&���U�̒��bBkFu2:(=�֏6<��ՙ���m��pȞ��)۫�8V�1������䃞/��}|V+�a��c�v�>�+?>�;5]���o6I���SZ<���c�?V9�,�����ث��a�o^f��M[�O�l�{�u��ν�u4Fվ�l�@ζ�}m�Sz�f<���I����ތ1���)CH�f�b{LS�]&��sQ��oFٳ:s��NF�s�Ӛ�٨��i�QS�z�ToL#)����)C8HQv,e�*�u�=2b/�
k��&���ԽE�&�'߫��#�um��Z�@g����;쑰�S��<?��e�m��u�#��j�����LsA���=��}�B]�V;gz��ïJ;��',|�j����F]�DK���S~`tevLK�K��)Z�]zH�b���fL,�0n�dR��U=;5:ȤY�n�Ӄ/��!!�r�w��X	�����b�cMk��%s��������O����˨}V��
�ĝ�TqY�c=,j��f�n����j�o��������&�T�;Xx˅�4ygj~��C��>3^�5_��L78�@�l����م͢>��3R����`:�0��J�sAD�%����@�^�{l����T��:@�nn,����(*�H�.�f��=[��N�3H�r��)�$q���ny�1vr��ʣ��7㰢����񬁨A8�m+�X�*����d�|  ��yi�0�\�
�~"㜌��C�5�w�Pgt��ĿR�hE�J!��1-�c�u?��{�'`&��t ���?�%�}M 9��:D����2���R	(W��XT�,������,�#H?wlG�Z�[W@�.���I��Tx��1��l���;��[��j���H�6���v >ی�ĉ�t�� �)���Uw�sQ�Oz�Ө�%a"��ps,�c�O�I �����gҒ��G3��B�oul��� C�^u3ޏ��u�>�J�.���LvH>s�����}���ΐYMo	1���[��s�l'� #xdF�cF�J��=� G��4y�Zר^G^^�q<OJ�V�fB�u��΄���Z�ٲo���A!l�:�����r᝭Bƫâwy��1�nLO�lP�325��(��*آ0o��t�g� �#�$��F։Qٰ�+����L�������
������Z�� ~v�eS n;QE����v*M	�Bh./��Z��s����)����	j�z	D?Tc{*�w�A���H�w���0$���+��r��h�-�3a)*SYy,v�٪��9����^��1KoF�@Jt�$���;kz���:D.���,ܿ˄r��f�}�
}��NW`=H����� 4��p�b��vq��c�<x(���h
�ٍN@Z1�%����G{#F���B�DLPI����Bܜ����P��x�;4K"��>��]E��>�������7x|t�k,V��:$��ށ���r��U�G�v=ӳ��i`��Js�w!��?al_���kP���J�^ө�t�#�*�Qb��3�Q�C��ؤPl����4yM�$�&��#%�F�O��W��l0�n�'�ǝ�N�{3����{� Ɏ���.EUd�8'[ہ�P�D�	t)���oώ�)�IN�s��ϑ��b�<=e��<�BEWJ+����[���@����̅��+|���b�	3���l�%� `0�݁�p�#�)
���A��$=���!��T)%��.G���%,�
C�(�P�j{���Y���;���F� �Xg����'}�9ViS?� �z �����/��d��>�>�l��@��TT��;)�l�����A���!#
w�M~�����q� ]@g���C� 5l�/8���Ӕ�8�E���<��U)[o��9PO�K�Ym���Rbv(�4$�	�+qff ;����>��?�o.��')���a��/c�t�pS�Xi�=?�j�Ruk���2��8E,�!�:���a�.¤�ze�`���B�y{�Gz�*����X*I��x��e�����ɕdS6XD)�ݟ(�H��5�Ʌa����rIg�Uf��8�tL�l�����б��kp�2N��P�V��Hw�ΰ�����KѺ2O ��{>��zq�d��IGc��������|#�f~�\9�\pbY$������Nm4Ɛd51�,sv�"�S'� �]_��`W����H�q��d��2!@x���L�~&��̓hjG&�c��pFQ/�P.ڐnj"����/�l.C�@	�DIf	A�drX,J�e�th!�J�����[8���}4�s�:�0jN�6QELT!��e3A
��Tn����	�?���9�JE;6�����nK��,ϵO^MX�'�tF�$bA�>O�������ВX��3�b�y��z��p�~Y'c�Be��B��!y�7\;�t��eh�Y#l����e����d'���=M�[�i�4�EL�J|�j5ff��~�ȫ��1��j�1�D�?�C��ihI`�ăo�F�����29�,��Lo�g���@�������z/���TT�)��9>�v�c(x�N�X��Z�P��i����9XZ4��\���KњUE�,%�$H�d쎼��5@����`�X�%��%����^��W�(�+$%�rU��W/��N�]�z��b����Mö%�k= �}���31 ���_%�'FFl���x�4��G��[~b�Vʽ_�ǬEE�^\�$m��R0i�Τ�.�_K��y�'��F����&��ȵ�Xx ��}�_�>[Q�E���K��H�x.؆Y:?V����(4����T��$�b����n���ˌ^퓿�\U��N �e�;O���s�d~�ȓ� ���PE��ȇ�������(���T<G��S��o�*�eˁ�S��pH�n��hǎ��GK4Oq�?��26g2Y!��m��c��=m?�w��e�cC6�V��K�+��2qq�!�K�;ͅ��Y��S4#��$��l�+�C��6���T��|(C˶��gJ����P�}ۼz�꿪�j      �      x�]��j�@���)�ѝ]�ګ&�Th)iһ�l�M]wM��wM�����������,f,a	PBq�d�9�8N0���O��ҹ�>D�ٶM�]��F�~�"�%?9�����J�MZ@X,A��@�VB�~|B1@��i�
Xg9Aʲ_K
�3Fs��x�EXZ7�����}�;�o?�u��ܪq�m�,/���PדCe�H��������[宼����h��p-m���)F IiZ`� %��ߝ�%z�v0�xU�z��/�����U�ns�a'Pt|�A|�MoR      �      x�3�44�4����� >�      �      x�3�44�4����� )�      �   �   x�mλj�@��z�)�/s��^:#�.p�F�Ũ�l��cg]��?��� �LL����1�����1����9��Д�0�(6OA�{�N�;J�+=�֔�y�K��V���Œ�_cgp�����ٛJ��_����c��Kh�h��\ǝt|�����Kp���o]�z�ڔ1��)6L_c/e)u}׬�e��A܏w���>T"      �   �  x�UXɒ�8<�_��D)�j��מ���aWO�D�"A-����d��O��rG�PV���˗�I����M{�>�~�u9��Di�&O��)MU�;&�1�n��n�l��o�蹜��Nw�پR�m;U;��JӶ����^��]}���N�K����lg6Qr����T���1Ϲn=c	[�OK��F9ֽ�KO���6+�4�S�`J[�R�fa�7��h�ޘ��lpx�S\A%�c�����?��x3N��LFw���z�k�~���l�����x��nv�����\80�c�?�p}Y9��v��^�y�<��{}ƪ��ɴ��� ��p��ف<Ͻϟb�۪8?�ٱ8p�m�'��ިq�k�u�R�K��lԿ�S[�yh�5WZ�ܴ�Q�-�jp0o�u�6QI~��c�����4W%����-כt{XS�l�o�*�V�*QL�Z�����%�ss�09�B�}����3�Ҹy� 9�d
��������j�o����5��p�[����1��7���Y7����z"*@�kp�Rϸ��(�F}�����.Ƕ�lT���n���� {*�o�y�m�8�^�ޚqT�̀C���)�͝�,3���y&~��[sW�w�\�gh������Z��W��u��)-���#I�w�\����6�w��`|��Q�s#�5O�3�P���64X��Oi�E��1.d�U1+3�ޞ R�H���vd#��	�l���f���)ݫ$h�I����
�3�͸�Q�������4�=(>ڿ@�/�����[��77�ར-=!�X-~�w�A
:�`��G/��/�<�����*?�U���D�)����рh��i�|�CXj�� �k{�T�Uƅ�dQ>_�꣉YkJ���w*��D2w8�캍>R#O�t.l�
�Q�I�݇���&1^�Z�=�(�D}�q����xP�j�I�fO�*��`v�e79�������X�w����=���3D�5i+kD� ������4�a<��/u+�Nك-;�}D�2��s��˲�����>o�蟇��o���2�H�����@�A�3JY&�L���p�AL��m�>q�yDߡ�iE����B��ٓ�R ����R��x���-l�/�a/�y���,�W�a��;�P�բ$8��p\��rU��vnRC�q�A:f��@�`�K��qHe)�
��<k�3q�4��[ ;ڑ�H����WE��F����-�y���ǉr�y�=\���D�t�"V۞o�r�@ ��[-ZR�<z���<z��,䔩���L	Y�"��T�Ph}���J����W� $֢�љ��+�Wk���o_l�F�z&d'�R�$�F_��P���!*�H|p)�4�~B�n���^^������>;V�n�Z�7�E�ڋ��=��û2�v̻�a=������u�l��m)�O��Cʉ����>�B�k{&�P-I����^��)�Vk@�S�K��DW �����PNb���蹗@2�J� �������9O}�ۏ���;�����95�7B��ލndӌB2N$�Eɇ���QPz99����(�bJfe��Fw���ѳ$�L56?�V�_4�B�%���Z�y�W�B������մt� 1g��Hd^�D#a�@��l�F_�g'{F����V�R/�sZ���\�����/إ��r�,-�K�E�RvP�����LX H�膣#�(F$�_�4
6oz�x}:Hᓘ)�e�<��A��)j8+��0�RY����}ܨ���9����DvѾ�������-Y��dE�V0"W΃�}�f�!e�>�HF=f�.�՚LV&Dav��R�-��)����)�H� ��H<Gl��_�ǇYĘh�����g�%�o��W���m�4/;����ե1�GJ�A�$���B��L�Se+�ܣG���	�P�,����_�#Hn)ʰ��L�(pqxȄr,AFtq�k2�Qcg�GV p;�X���{��b�,��E�|��<E�Z�|�,K��yᦘ��XF�8��؀v�$��d�(K/f2����^X3WHSP|���}	�g-�r���&�y�g�d�<��
���V�"J��f]2�oԻ�0�:Va�[GPv���4�'��#ڠl�}��3����7�d9̃����U�f�p�3@�A:xR��u]���O���`J��,� = ���Z�[3�l�����`)B��9���%���G��P�Z�4LY�"+��3���/��G�9���d�\��Y��\�B���c�y�Ņ�w�@��N&�y\���VBn �[0UL���`�܋�=��yo9x/���� =����|��K`4�'�uJ2I��Q͏�@O:�ٻǭUa��
=f��P�Vʇ),� ��ş�]�����O���C�vvB�	a��	���Qb	�FGq�D�|=/Y^L	G�nY�%z�#�3�$�Zݼei��T��=!�zҫ�ʔց����$�5 T� ��ިk�G`8O�	����헱�f�F�U�2����8V�O�a�"�8�Dtu���b|��G��d����Mt?�8Y6�>Ѯc���V��A��	�������#"��F�s�#f��%0��O����Y�*�g<�Ĕ��q\�^*&�$��m�F/�[�U���a]JcD+w>�0���؏R~�����$2ө����E������f�i)4L��m&�K$n�>
�G��J��W_��t�.9����>@ ����lF�2��ۥ��\��sU�㳑$�Í��`��h�HA��@Yu/�d�?��f�����stN`�Ӹ����Qy� ��`w/�8��h�u/V�
��=;��^�Pȝ2�,��w@L�4=�i�aeQ˰������#��|��;S�4�X1��in��hԋR��'�"�Z�G���oe~!��K�L6�K$�'�Axq���~�U{��1��u�N�I�(��O�����\��� 
�G���̔����	Q�8`N	�
�$p�۹�q։��>K�`��,�A�]ڎaJd�� M�I���!i!�y�u
��~��N޴����$~���=�,\Y�Cԥ��jIH����p�m��X�h��+;���/�jx@
kڠ(ˠ��Mm_'hƨ�����^��Ӳ�����͛7o�x{��      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   L  x�MX˒�8]��~�2x$�`Wn�g<1�Tt9ƛ�P�\�h���~ι��#:\]v����U�ˍF5�-�]g+�J;�^��9�9<N/���FuzU�m������Eͭ���ٮW�6ZU�����!J���C||H�*͊�T����[-^Mf�����7�e4C���w��v2��ճr���7��+�����j�n��嘳��C��I��i��H�E�s�,�&+6N���4��fm9���<���{Q����s��Ƽ��wC���C|yH�*�YVc�p�~3ü�t���Πnaup�K�oĩJ�"��|#�����0�R��zP��~PX�;�ϱ�7�ǅq�Z�F�^��n������!IU�ɥ8���)zl�P����:5�w�Q,{SzXѧ����f�{�F<�C���X�R�t��ap�A�/`����+�`�IM����Wp�qf5{�;u��8*��l����mk����f���"ϋL�{�ޛWV��d���h��eP������;��톖`}��_��ޮ�`i�Ҹȳ"I��5z�5?����/��q8gi+_L~�	wO�LI=���������5�+���D�A���q�ѫe����6�h�)=����N�nn�V�EȀ����&	��Fe��[jT����:��QP�Q��F9۽!^a����J���JW���p�s�� ���	�G6�W�F�^�W�oQكz2���u+�4�Q���+{Hq�����uj�W���Y,�K�Q�?C�[�YC7*`��	N�cdg���,�T|.�K�d��1z��$	Ψ����Z\&���S�:�A��A�nvj	����(A<���	.���+�*9�N�1t'����{��꣭Z8�f����A}�LG������@�N����	.xӊ,�@Z��fAsV������ �M�T���#�v(��\<�fAgө����Ұ���Ņ(��v��;����o�ld[���Z8-V� �P��W!߬u5���_E*�K�k�b"�J���w���
�A��Ub0?f�s�	����;SF��<c����@ӳp�k��0"9j¹�����$���?���gcf��+iN�� .%E JI^wH����$����4sӆlX�2��@,��5���p���Q���6M����hD�:A�b�	���bU�L�жԀ�8hwA�!�ԝ�?�>0V��-�SpV0�<������֮� ��_���J`������>�@�$as�3O�Ϣ߭A�{���e�N �o̧m���0�l��:7�+�Y��Z�t�u6�F��Cz��A �p�c��ʹD� t|�%�b���� ���4�п��� ����:����7S�X�΋�"[�ѿ])��diZ+��I��1Yz�A!�  �m��ԁ�H6/B�B�NEu���h>HЃ`�ƚ׍_o��/�8����M̡�Y���=W��f47��,j��o�`�7AGM���rP�%�%��:!bAY{� koV�[	�[1� 7�J/�c�4]�`o�}�
bө�#TT�,�`1� �*������k������ �H�~���+ Rȗ(���z�	@�
Duȣ��H��8��Ove¸5D^0�����J�1�6������5��̸CW����~�%�!��'����$~�%=~f/�%\d[K}|��;b���%߀D���vB{�Er����Y
=ٔkw�= ��El��`*�s)A������	�����L@�3�3���e�`^A\����%goB�xF̰�+y��
���6#=�$i�L�����U�-�K��q@�?oE�2F�2ƥ�Z(Fb����G9�*HKz*�P��b��Oa��dɈ�[In4E3b��w�H}10k����%.�~�;)3RL�o����'��P܌�O�������~<y�H��$�L\4:�O��r��IO�x�	��$;GOn���
�Wv���_S�z���"�ޖ;hø-�g�O�m�ho��L�T�P�6�9ђ����J�+��(bîpÐ������Ӿ:!&�/�7�̮���@Ǌp���ӈ)JB¾�w�-ڷ�=Y��9�-�c�c}�$Y!|�*�cz�{���������.��du�|(K�2�0ǣű$�#r���zM������T'�&��U5� �E	
�4��b��9�̥t7�۴2�h��d�0Y��yX*�����B ��̴�������""U�&�K��)���"D2l.b�+�0#�t�!�Ā���t<BP�tx����V#:C̗��Q��:I��Wj��Qo���XwL��Zǲ�,H�C�G�I�� �(��O���<(�,�$	6m8�ذs�)�f��W=��G&��b��O����Z2u��庝����^�8	�Z����S�}3����YR,D�#��Oz�L�l!�x���(���u-�m=�4�ռ�!�J|
�<�-@�I ��)h�L�h�B���ő�`�0Q���jvy:��˰&C��%�e�n�p�l�E�3��~���a��No����N���e��Qm���DidwAB�^YI�`��^��+x�r���=�6�6L�u����_�9��d{X��RD�-y=ֵ��e�H1�� �I�?[S���l�42"���TIߏ�cxi�'O�ߑ�8����q��z���y���>�q����o0�U֗��oD'�!�ʳ������K�5��d_goأg�٦��D��sq*�ʏ�{�bC&�Y�q�J�1�"n���n	��J\p{�[�-�Y̆"a��)����T���?�V��%�CFQ�9Ԩ�^����L�g �O&/f�=�Hԓdς�)����g�@Q'x�2��;�+���)�I�7bo�N��aw����	ݐ��ѧA�!ݡ6MG[$'�h�����"1�k'��d�K�̱�7��R�X��2�,c����	!�,��6I��^'��ŏ���x{�ɯ�#>�=�����?y�
@b�,I������I&��4��2M���pvf�� "ц���:Tx��l�y�E�%���/hC�'��%=�M��|����[���X޽{�վB*      �   T  x�UX˒�6]�_��T���k׶�U��v&��l "�&	@��|��sA�=���-�q�y]dɟfR�	���٨I�z��.�My=卮���<��kg>7u��F}ЃQs0���O0�dݨ�x�$y����CzP��W�|��4}�'�/f�~zP��\�o���k�f����Ǟ����hC�F�v�҇t�uU�?��1�q�"�8\���8�ˌ�_z��v�v����|��Բfm_l�I�þ|H��<Siz�!�����W=�F5&�ޞp��M=O<ߋ�g��;�*�+w1��&Tk�>9��������Ѿ�ލ��[��\e��ʏY�-�����#���4�Ϫ7��m�Ɏ�:�ڡ�nd�7���j��ī�X�!+T�;��c%u�&��l�υ���y�������-7y�Y�ƍ{�QGټ��5�}���c�\�C�=�[�§أ������p�qt��!<³E�t�����ş���8�A�s?�^��
ke'l0�fcc".\Lm��^�R5��HU
��"���任��7������R�i���{��k�v���պ":����X�q���UH�;h�|�3�B\��3��v �BF��8��i��g�lp��:G�Ha���e����C���'�2K�f\q��gl8���	G؋�I+�r���A��%�8�ܠ�!���W7����nP�'���<<��yl�R@�~V:�epA8��R��ʲc��e�<�Uד󪖻�����SokT�bJ�-塙�x�:֒�s�Zd"�Z�lQ$������$���L
-W��hI�#�=	/X����t����w#�o�����|�;�B �W�Ž=�r�4xhF�#R
Q�T 雺��[���=�.`%TR��g$8
����2n]%�+t�Wd���{q�vT�u�E<k4��'݋V�z�C���X�k÷ɷ�m)ށ��a�_�m^a_�����]{ӀS�,���݂���_(��-Ҕ����2n�K~3q�����Ջw���L�ñ{ ����h'؅�:x?�~�XHР�O޵^һ�|�w*-ٻ<�]��{�㖧9@b �/�/(��J	�����$O���쮠~�ʔ���"v�<-0�Y W�k�=hW�������<p�f�ɋ[���/<��l�%K��0�r�<Mޢ"�'��w�ʢI=����)�g�a߆$��QQ)��Ů�,y"'<���4�<�4�/�n�q��ϐ���r��yN�K�c%����w?�,;(%��>�"�� �*4�)H%��[�Z<	,��B�hT E�����~|f��pb��B!�@YP+��������	�� ���(�$z8p*֐���Q�EGn���o4>�}�~����k���soΓz�r2G�?�pǵ�[����ȫ�s�Ժ�.�ian�p�\��d�Z���#V�d?�@�!�EYh C���vAi�M>��ł܀��?�����/���?�v�;/�s2�e�����:�w�R
>����!I���!j���*og�7"�8-:�L:
��PI5�+��������"#��"��}�󽜥�����!�`pc ��C���1�� ���X����C&� z#A~H��K�!�ת�UjI@�������j�=�� p��X&
Qu�Ԉ6�nHۋ4y\b��ks��jlJ.�3<��2@�ph���Lo���;��b��5R�6�c/�[��lDrz�R�1�\A�ýC��_I�w�[d���(��]O9���9�I����Nq�B>z�G큡�y`�MC|+��8,C'm��ļD��XI�-��w�{�3���sLP���U醷���gp16�J�H�h��"�.)��
Ӣd�׆��Y�ڛ�a�E2�(t��*J��N�(p%�,���D�io�K�kt�toZG�'=�]�K�D���7����SIƃ��m��Ď8��<���#p7����}�~���g0]ؚ��%o��+�Kk�	J~�~z��8),�`ȅ���8�}�V0T#�<���!� 솰Jm�ً���*��ܬ�Wj�h+��9�H�4�18Q��t�d`�䄇������ bJ�$����XI",���1Z���~Su�� P"�a�	�r���CZ"<�9��wfG����&ޔ�:Ȕ���,�D��	M�=�c0�Gx����=��e ��I�2�d�lIyq̪�Ny�o�h'����}C���qU�P&N� �(�� �P\���c��-#$Ri/�t�IY$Vk�2�S�;p�e+�3x�B���c�%���>8�g-}@�ϰae$cܚ�L�DW�-�YV�g�U�3�Kc�21,R�����C�dzq)i)%Me�^�Ub��$Wzf����k`�	q��S;�)2ؿa@�y"���2ae(��<�z�|>�Y�uX���0���-�?�8( p�`H��z�,�'G1�1�aG�p��/#B��'T{&�:�
P�"�!O�Ís&ß����u�^��)�K	͎e��&%sA���ئ��K*���G��	�n�{>D ��S�~��^�Ė���"T)2%��N�U���S����Q�)�����_D0�/}�Kn�t���ʒ���B�˱���r l��I8��DX�UŪ<��8�p �HD���p���-p	�q�kI�lA���LU�΄R^C�^*pi%�nU!�33�F}`����m�^����N��`�;���8//�4:�Ò�(S�q���|8۠<烳�O�g@�5����C8���^�q>�������!��-��Vt��&B�j�c���)��7u���cBe��~��4L��/��9fK�Ul�F�浰3 ��II�_m����W/J<��G�a��w �qI �����n��g67��HtW�]���m�v�{�ˈ�-�'~Ӹ�����}l!����FI�O52���U�{���Q�_t��V�;YԸ���(��Y�7��C�b���0�U��K���^��<���4
��JuH>�����u�Gx��J�]�u��>`$[�L�ߓ���97����䇫�A�P��e<����'^y	�`06+�s�7N�^E�f����[�{��]Q��js��� o~m޼y�?aqH      �   ;   x�3�J�*�H���4�2�t�H�N����y��E@�	�o~FbQbqIQ>�W� ���      �      x������ � �      �   v   x��1
1F���)� "I$j����,X��fS$A���>����-|��p����ƵfY@\��"-�ڔW̉We�<�j�qC#�B�C�t����HJd͸kO��m�{c�VS!h      �   4   x�3�4202�54�5�P04�20�26�3�465��60����4�4����� ���      �   K   x�mʱ� D�ڞ"}��-b<��]���}��؈fya��,{>9��Q?9�_$
Q�Μ#�y�s�]U_��      �     x����n�0Dϓ��T`Jz%iEZ	z@�		m��8v�8������T����{X�9vl *Y�`��SȥUd4ޤ���&��:���t7x<�t$�d��J��/ȝ<�pmG����'�n]>�K�u�/NۀR�F�t���ȴ0��x7t8�Ϟ�:��LhN��u%f���^#�wi�G-��%����Z�n�=MuKJ����j/��,ٞ?�s�������`r�m�|�N���t6n>F�3��l�g�+�He7I��w���      �      x�3�4�4�2�4�44�2R�\1z\\\ &`      �      x�3�4�4�2�4�4������ IH      �      x�3�4�4����� �[      �      x������ � �      �      x�3�4�4�24�4�44����� Gt      �      x�3�4�4��2Q\1z\\\ �I      �      x�3�4�4����� �[      �   (   x�3�4426165133�����K�L18K8��b���� ��      p   �   x�]�?� �����@Y]��c��&ƘK����b{o��k�t�)Nq �h�줶��ke=[���� A�'$���z��W�A�e�eɖ����L��k�@����Z
d�bC�5C�����\�2��(�/Q�VYZn�<b�r?�����Y���LZ4+rD���/�+!��H-      X   �   x�m���0���S����Jb��+��e��c|z职[����� F4L�º��@�����z���KqJT���g��"�@.�.2������ʚ�nB+���'Wp�U��6����S�H}G�δ��+�%.T(�`r��t����_��T[˧��$<��o�X.�ܯnZ      �     x����J1�s�)r��/�$�MO�l���⡶B�޴���{���3�G�i����~����n5�~���mX��~p��u���{�ȴ \z�"��@��7�ny?�mǍ�R	bF�.\=�����T�s�jJ����(ʜ]�2X�,2s���R���WO;���.����с%��Bnw)�$���i]�VW�"h@N6�R��u�8�~���m�DEc��R�sz�;ݗ�Zq�� 2�`SX~������5n���"�Jń[���P�h�8�M�K���� <s?�      �   =   x�3�44��,�V��˩�4202�54�50S04�25�21�37�411�60�4��=... Zp#      �   J   x�Eʱ	�0�Z��}���������\}�0A�dY�%�ZX`�6���H�7f1
�Ș@~��{����'      �      x�3�O,I������� }�      �   }   x�3�LK�HL)V�/�I��uH�K�����46BN���ҢD0����-N��I*��OIM�I-*�/��K�MM�5ҵ40�037�OJ1�����+�K�,�LBC.#�����in��3jg� P�D�      �   r   x���1�@�z��6�g.abcc��.\oOK�� O�<]���4r���'�k����ee/�5;=x��_RQT@%Cz�����D P	������S�����!��0R      �   �   x����
�0 �s�}I��z��]�Qp4�ןU�1c%!�}	!
���sw�L�b�n!AA�X�a~u�"$� /�,�@�� 
eK�c���9Y�#�,:�	�|#�x�W������v�Q� �J6o�2>Q����������Z�ar���|�OY�%�X�^��3U �x ʟ�e      �      x�3�44�4����� �      �      x������ � �      �   G   x�3��H,Q�,V(�HU((�LN��4202�54�50S04�2��25ѳ�0355�60�44�4�,����� 
�+      �   �   x���1O�0����Q���g;�Z��"-��RD���rR��N��L(�m7|�S�X��!ۤ�9׃b}�qw�Z��цq�T�����}��+	s���"��\5��I�/�t|e?��@y�^Z�N�`ے!2d�9\X>���/AA�Yc�a=ܮbz��?0y@J8W�2װ�~\ݯ��f�i��P�Z��9��Y�����Y�$Lت��"������O���      �      x������ � �      �      x������ � �      �   �   x�=��
�0D�ɿ4/����EA7RMr[����	��ۅ:̙�I@�����y�� .��Ce�PRh��ܖR	�O#ܪ+{L��.��y�����	����X/�g��S�s�/l�Y���V~�HOz�2J��n,�            x�3��M,*�LLO������� 6��         e   x�E���  �7�Rp '01V�
q}����Z0���1�x��c�^��փ�#L��'r\�/�$cm��% �ԥUl�e7f������D��z����%�         $   x�3��O�L̉/�/.���2���O��b���� ё
X            x�3�t��K�*(-������� 7��         g   x��A�  �3��$~c/^M6]h�J����3�m��q,X�f=���41Vʌ�I���U�>-��� ��>�p������}CX�u��t���}���<${         I   x�3�t+�˫���MLO-�O�L+�7I353�0�465ILI4H362�L54K�0O��06���*H������� }��      !      x�3��M,*�LLO������� 6��      �      x�3��I���K������� 0�t         R   x�3�t�IL����MLO-�O�Ӌ�K�R���St��3stsSS2u3���u*�M��,�u�,,̌��
�9c��b���� �u�            x�3��O�L̉/�/.������� O�             x�3�t��K�*(-������� 7��         E   x�3�t��K�*(-���MLO-�O�������u�72024072�7�0542��*H�,*I���4����� J�         P   x�3�t��K�*(-���MLO-�O�L+�O���/�-��K�-)J�+.H,J�+�-N-�74�0ѵ�46��*H������� ��]      	      x�3��M,*�LLO�4����� /�Q            x�3�(�,K,I������� 1P{      �   �   x�����0E�ׯx������h\�@b�>�P)�:�����qv�9g8W��պ�g���<;2.�l7��0u��'á������E��\�"%2�,�d����TSFZ���/�]g�����}%)�
]�2���>��hm����Z�
!�O.Rd      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �      �   !   x�3�4�4�2��\ƜF@�	�4����� 4is      �      x������ � �            x������ � �            x������ � �      #   �   x�m��
�0�ϛ��'��"
�B"xIҵ�]ij��V��i�f���8x(�guk�*��
F"̚|jM;e։�%���eio���Y�p{��U,cF�)0�uL8�rlj8	g<T�38��.��Iq��േ�xN������f������E�      )   S   x��m
�  ��z�)3�C�b��E~������f�}F*eV?��R�]�=	=P�I�)��
h��F�O�b�����ᬵ?lz*      C   �   x�}��J�@����)��L�̙3�n����%�(B�͵�����w��}�ߟ�v��?7~�=�u9nRh��F�c_3)$$�&R� ��[A\	�F�����u!{,����W$�f���ERW$9ܿ����Q! Β]�^wʽ��HRqNi3K:H���pP�J�{O�����r�-���P�6�T�!�m��!�������i!-�����_LzʲC(��(H����E ca������s F�<�����      +   �   x����
�0���Sx�$�5�!<��e�֢G���W�8�0��%��mqH�4�i�A� %a��I�U(�. �kUTx
�}Q�v*dT��aN!��<��bX�m}�r���ߢ��Bk�����?�o���9��wt� �=��A�u��
ٶ~���X{`c]c��c;��~�F      -      x�3�4�4�2�4�4����� �      /      x�3�4�4����� �\      1      x�3�4�4����� �\      3      x�3�4�4����� �]      5      x�3�4�4�2��\1z\\\ a      7      x�3�4�4����� �\      9      x�3�4�4����� �\      ;      x�3�4�4�2�4�&��@2F��� "E�      =      x�3�4�4�2�4�4����� �      ?      x�3�4�4����� �\      A   �   x���;n!��z8�e��X�*��x)]`�Nn�V�c)����
b������X3\/��JTg�ψ\�`l��@t��IJ�pIw����gHI�"�6�#�!�z�j	����h�pf6�o��3C�U긤m?k�T�ZKdH��r�-����3���}���i�$�)���[aiN5����|���vAG�����,v��_AyZ�      '      x�3�tI�K��K���4����� 7��      %      x�3���K�I���4����� 2<      �   >  x���MO�0����}[e'mJ{c��v�uKM׌~LI;���Hp (�����8I8���v�-ņk.���C����6&>��`���q@y��P�d>un�1`}�-���nl�|��}h�ÆӲx�y��i�V\�º��؅'�{g�ytK��o6$�l�*[�`m<�/��c�Z��:��+���fJ%ʠb����P+y�S�@�T����8Q�a6�W3�!"H9�D�J���i����jxag��ګ�&�����G��G��vg.Ɖ-;gM���h����$V(u��e��"�"McL0��RRX�8��w��      �      x������ � �      �   �   x�3���MLO-�O�/K-
��/����u�72024072�7�0542��H��H�0��*H�tJLQHʯT j�TH�p8]2���2J�8c�8A&�X�Z(�Y[�Y[X�j��pr��qqq �X$�      �      x�3�4�4�2��\1z\\\ #      �   v  x���[O�@���_�{Ų3{߷�"'A��
	9�s#ԹY��]����O����9s�Ѵ��,�]���t���b_\to�W�ܠy� �k_�-�}�\�Z�iv6.>Z?��[z���źܶ^n[՟ι={Ƶ��+dAs����iڨ�Ч$���IP��0i- FP��|3��b^c��|�W�K�,H�L�d�]�U����".���F��x?����/6~fI/��cJr�T<2Nf�e���/��l������%��}D #9_���H�+���5�HF^_>�auR�V#"�#G�x�8�Ր��`Y����B�`���j$��䌓u}Ն�� 6�d�3/��=�b}מWdߗ5Ҹ����+-,��L�<$��L:�1kvPz�����(Ȝ��۝�B�BV�P�5IF��<_l鍬��R�P����OE��e���s�!��9	P[2���VY�H�L�aј��Cb}t�L����T�q}c�Bl]�d�z�o�xe�v�3"���!�;��
�`��D�f3����~⡟j��Wn��8}�H+�d:�R2�,��d�~Lg'}뀗�h�U�B��⵻*�s
xu�������ٻm���m��Y���@za�v�E
ݖ      �   �   x����0�ަ�c�qzI�u�����:׬yV���+0�+��H�oe�_Yq����I��J3�Ȋb�x�ę�+qr��$N����]�
xK�p���8a��'q��3[VK?7G�}�%N�}�J�<ߛ'q��{������Y�����m-      �      x������ � �     