from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('kutokite.views',
<<<<<<< HEAD
    # Examples:
    url(r'^$', 'home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^oauth2/',include('oauth2.urls') )
=======
>>>>>>> 1bc1a3998f38537f0bf686622bbc5207afe0830d
)
urlpatterns += patterns('',
)