#coding:utf-8
from django.shortcuts import render,render_to_response
from django.http import HttpResponse,Http404
def home(reuqest):
	return HttpResponse(u'Home page.<a href="/oauth2/login"><input type="button" value="第三方登录" class="btn" /></a>')