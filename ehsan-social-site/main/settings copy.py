
import os
from decouple import (
    config, 
    Csv
)
from pathlib import Path
from dj_database_url import parse as db_url
BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = config('SECRET_KEY')

DEBUG = config('DEBUG', default=False, cast=bool)

ALLOWED_HOSTS = config('ALLOWED_HOSTS', cast=Csv())



LOCAL_APPS = [
    'userapp',
    'user_management',
    'metrimony',
    'jobs',
    'employer',
]

THIRD_PARTY = [
    'rest_framework',
    # 'rest_framework.authtoken',
    'corsheaders',  
    'rest_framework_simplejwt', 
    # 'multiselectfield',
]

DJANGO_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
]

INSTALLED_APPS = LOCAL_APPS + THIRD_PARTY + DJANGO_APPS

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'corsheaders.middleware.CorsMiddleware',
]

ROOT_URLCONF = 'main.urls'
# AUTH_USER_MODEL = 'userapp.User'
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'build')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'main.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases


DATABASES = {

    # 'default': {},
    # 'auth_db': {
    #     'ENGINE': 'django.db.backends.postgresql',
    #     'NAME': 'emrds_bkp',
    #     'USER': 'dbrdsubuntume12',
    #     'PASSWORD': 'zkf!%uW_?&UG%4',
    #     'HOST':'emrdsaws.czlz2b677ytu.ap-south-1.rds.amazonaws.com',
    #     'PORT': '5432',
    # },
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'dbsocial',
        'USER': 'dbrdsubuntume12',
        'PASSWORD': 'zkf!%uW_?&UG%4',
        'HOST':'emrdsaws.czlz2b677ytu.ap-south-1.rds.amazonaws.com',
        'PORT': '5432',
    },
    # 'default': {
    #     'ENGINE': 'django.db.backends.sqlite3',
    #     'NAME': BASE_DIR / 'db.sqlite3',
    # }
}

# DATABASES = {

#     'default': {},
#     'auth_db': config(
#                 'AUTH_DATABASE_URL',
#                 cast=db_url
#             ),
#     'social_db':  config(
#                 'SOCIAL_DATABASE_URL',
#                 cast=db_url
#             ),

# }
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
        'rest_framework_simplejwt.authentication.JWTAuthentication',
        # 'rest_framework.authentication.BasicAuthentication',
        # 'rest_framework.authentication.SessionAuthentication',
    )
 
}

# DATABASES = {
#     'default': config(
#         'DATABASE_URL',
#         default='sqlite:///' + str(BASE_DIR / 'db.sqlite3'),
#         cast=db_url
#     )
# }

# DATABASE_ROUTERS=['routers.db_routers.SocialRouter']

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


STATIC_URL = '/static/'
MEDIA_URL = '/media/'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'build/','static')]
STATIC_ROOT = os.path.join(BASE_DIR,'build/', 'staticroot/')
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'



CORS_ORIGIN_WHITELIST = (
    'http://localhost:3000',
)
CORS_ALLOWED_ORIGINS = [
    'http://localhost:3000',
]
CORS_URLS_REGEX = r'^/api.*'
