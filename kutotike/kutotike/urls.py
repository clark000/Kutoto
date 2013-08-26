from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('kutotike.views',

    # Examples:
    url(r'^$', 'home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
urlpatterns += patterns('tucao.views',
	url(r'^tucao/$','tucao')
)

