# -*- coding: utf-8 -*-
from oauth2_error  import SocialAPIError
import urllib2
from functools import wraps

def singleton(cls):
    instance = {}
    def get_instance(*args, **kwargs):
        if cls not in instance:
            instance[cls] = cls(*args, **kwargs)
        return instance[cls]
    return get_instance


def _http_error_handler(func):
    @wraps(func)
    def deco(self, *args, **kwargs):
        try:
            res = func(self, *args, **kwargs)
        except urllib2.HTTPError as e:
            raise SocialAPIError(self.site_name, e.url, e.read())
        except urllib2.URLError as e:
            raise SocialAPIError(self.site_name, args[0], e.reason)
        
        error_key = getattr(self, 'RESPONSE_ERROR_KEY', None)
        if error_key is not None and error_key in res:
            raise SocialAPIError(self.site_name, args[0], res)
        
        return res
    return deco