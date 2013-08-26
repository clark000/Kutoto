# -*- coding: utf-8 -*-

SOCIALOAUTH_SITES = (
    ('renren', 'socialoauth.sites.renren.RenRen', '人人',
        {
         'redirect_uri': r'http://test.kutokite.org/oauth2/renren',
         'client_id': 'b12a44bb3e734adb9dcad01edcf6859a',
         'client_secret': 'de8e7af7d1ca489daf710f1223c26b43',
        }
    ),
    ('baidu', 'socialoauth.sites.baidu.Baidu', '百度',
        {
         'redirect_uri': r'http://openapi.baidu.com/oauth/2.0/login_success#expires_in=86400&access_token=1.79b233866fb427d6bb7f0651947b5591.86400.1311151425.3238112329-131640&session_secret=1c07e054952628711b61228f44f46332&session_key=9XMZMoWRoE6Or%2BHLlFGhB1%2FBH2l3Jzi2CLOxIVVbcAMnUT8tyKeNiyF6oPQESDa9UTcD0uYuYtULwe3LbqKNvc90wOkY&scope=basic',
         'client_id': 'pXMfDdhdGhrlNUUxz2cwtvYG',
         'client_secret': 'McE0YK4MAMZq9QfrczPA2ocE1m4L3x6F ',
        }
    ),
    ('weibo', 'socialoauth.sites.weibo.Weibo', '新浪微博',
        {
          'redirect_uri': r'http://test.kutokite.org/oauth2/weibo',
          'client_id': 'YOUR ID',
          'client_secret': 'YOUR SECRET',
        }
    ),

    ('qq', 'socialoauth.sites.qq.QQ', 'QQ',
        {
          'redirect_uri': r'http://test.kutokite.org/oauth2/qq',
          'client_id': 'YOUR ID',
          'client_secret': 'YOUR SECRET',
        }
    ),

    ('douban', 'socialoauth.sites.douban.DouBan', '豆瓣',
        {
          'redirect_uri': r'http://test.kutokite.org/oauth2/douban',
          'client_id': 'YOUR ID',
          'client_secret': 'YOUR SECRET',
          'scope': ['douban_basic_common']
        }
    ),
)
