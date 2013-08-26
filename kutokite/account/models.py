#coding:utf-8
from django.db import models
from django.contrib.auth.models import AbstractUser, update_last_login
from django.contrib.auth.signals import user_logged_in, user_logged_out
from django.utils import timezone
from datetime import date
from pilot.config import *

# Create your models here.
