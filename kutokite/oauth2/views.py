# -*- coding: utf-8 -*-
from django.shortcuts import render,render_to_response
from socialoauth import SocialSites, SocialAPIError
from oauth2.oauthset import SOCIALOAUTH_SITES
from django.http import HttpResponse,Http404

def login(request):
    site_object=[]
    socialsites = SocialSites(SOCIALOAUTH_SITES)
    for site_class in socialsites.list_sites_class():
        _s = socialsites.get_site_object_by_class(site_class)
        site_object.append(_s)
    return render_to_response('oauth2/login.html', {'items':site_object,})
def callback(request):
    code=request.GET('code')
    if not code:
        return HttpResponse(u'登陆失败！')
    socialsites=SocialSites(SOCIALOAUTH_SITES)
    s = socialsites.get_site_object_by_name(sitename)
    try:
        s.get_access_token(code)
    except SocialAPIError as e:
        return HttpResponse('<p>%s</p><p>%s</p><p>%s</p>' % (e.site_name,e.url,e.error_msg))
    return render_to_response('oauth2/account.html',{'item':s,})