from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('kutotike.views',

    url(r'^$', 'home', name='home'),
	url(r'^oauth2/',include('oauth2.urls') ),
)
urlpatterns += patterns('',
)

