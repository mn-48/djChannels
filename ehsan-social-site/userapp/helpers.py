import datetime
from typing import Dict, Tuple

from django.conf import settings

import jwt

from django.contrib.auth.models import User


def create_access_token_data(user: User) -> Dict:
    data = {
        'first_name': user.first_name,
        'last_name': user.last_name,
        'username': user.username,
        'is_active': user.is_active,
        'is_superuser': user.is_superuser,
        'is_staff': user.is_staff,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=6),
        'token_type': 'access'
    }
    return data


def create_refresh_token_data(user: User) -> Dict:
    data = {
        'username': user.username,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(weeks=1),
        'token_type': 'refresh'
    }
    return data


def prepare_tokens(user: User) -> Tuple[str, str]:
    # prepare access token
    access_token_data = create_access_token_data(user=user)
    raw_access_token = jwt.encode(payload=access_token_data, key=settings.SECRET_KEY, algorithm='HS256')
    access_token = raw_access_token
    # prepare refresh token
    refresh_token_data = create_refresh_token_data(user=user)
    raw_refresh_token = jwt.encode(payload=refresh_token_data, key=settings.SECRET_KEY, algorithm='HS256')
    refresh_token = raw_refresh_token
    return access_token, refresh_token