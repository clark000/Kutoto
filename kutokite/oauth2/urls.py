from django.conf.urls import patterns, include, url
from kutokite.settings import STATIC_ROOT

urlpatterns = patterns('oauth2.views',
	url(r'^login/$','login'),
	url(r'^login/\w+/$','callback'),
	)
urlpatterns +=patterns('django.views.static',
	url(r'^login/images/(?P<path>.*)$','serve',{'document_root':STATIC_ROOT+'/images/'}),
	)