//
//  PIONotificationCategories.h
//  PushIOManager
//
//  Copyright (c) 2018 Oracle Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
//plist contating the list of default categories.
//Structure: Dictionary{CategoryID:[Dictionary:{Action(identifier:String value, title:String value, authorizationRequired: BOOL value, destructive:BOOL value, foreground:BOOL value)}]}
#define Default_Category_plist @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"><plist version=\"1.0\"> <dict><key>orcl_rsys_accept_decline</key><array><dict><key>identifier</key><string>accept</string><key>title</key><string>ACCEPT</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict>    <dict><key>identifier</key><string>decline</string><key>title</key><string>DECLINE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><false/></dict></array><key>orcl_rsys_yes_no</key><array><dict><key>identifier</key><string>yes</string><key>title</key><string>YES</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>no</string><key>title</key><string>NO</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><false/></dict></array><key>orcl_rsys_buy</key><array><dict><key>identifier</key><string>buy</string><key>title</key><string>BUY NOW</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array><key>orcl_rsys_wishlist</key><array><dict><key>identifier</key><string>wishlist</string><key>title</key><string>ADD TO WISHLIST</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_buy_wishlist</key><array><dict><key>identifier</key><string>buy</string><key>title</key><string>BUY NOW</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>wishlist</string><key>title</key><string>ADD TO WISHLIST</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_rate</key><array><dict><key>identifier</key><string>rate</string><key>title</key><string>RATE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_accept_decline_fg</key><array><dict><key>identifier</key><string>accept</string><key>title</key><string>ACCEPT</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>decline</string><key>title</key><string>DECLINE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_yes_no_fg</key><array><dict><key>identifier</key><string>yes</string><key>title</key><string>YES</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>no</string><key>title</key><string>NO</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_opt_in_out</key><array><dict><key>identifier</key><string>optin</string><key>title</key><string>OPT IN</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>optout</string><key>title</key><string>OPT OUT</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><false/></dict></array>\
<key>orcl_rsys_opt_in_out_fg</key><array><dict><key>identifier</key><string>optin</string><key>title</key><string>OPT IN</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>optout</string><key>title</key><string>OPT OUT</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_buy_more</key><array><dict><key>identifier</key><string>buy</string><key>title</key><string>BUY NOW</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>similar</string><key>title</key><string>MORE LIKE THIS</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_buy_share</key><array><dict><key>identifier</key><string>buy</string><key>title</key><string>BUY NOW</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>share</string><key>title</key><string>SHARE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_wishlist_more</key><array><dict><key>identifier</key><string>wishlist</string><key>title</key><string>ADD TO WISHLIST</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>similar</string><key>title</key><string>MORE LIKE THIS</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_wishlist_share</key><array><dict><key>identifier</key><string>wishlist</string><key>title</key><string>ADD TO WISHLIST</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>share</string><key>title</key><string>SHARE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_cart</key><array><dict><key>identifier</key><string>cart</string><key>title</key><string>ADD TO CART</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_cart_wishlist</key><array><dict><key>identifier</key><string>cart</string><key>title</key><string>ADD TO CART</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>wishlist</string><key>title</key><string>ADD TO WISHLIST</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_cart_more</key><array><dict><key>identifier</key><string>cart</string><key>title</key><string>ADD TO CART</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>similar</string><key>title</key><string>MORE LIKE THIS</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_cart_share</key><array><dict><key>identifier</key><string>cart</string><key>title</key><string>ADD TO CART</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>share</string><key>title</key><string>SHARE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_more</key><array><dict><key>identifier</key><string>similar</string><key>title</key><string>MORE LIKE THIS</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_share</key><array><dict><key>identifier</key><string>share</string><key>title</key><string>SHARE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_follow</key><array><dict><key>identifier</key><string>follow</string><key>title</key><string>FOLLOW</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_store</key><array><dict><key>identifier</key><string>store</string><key>title</key><string>GO TO STORE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array>\
<key>orcl_rsys_store_follow</key><array><dict><key>identifier</key><string>store</string><key>title</key><string>GO TO STORE</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict><dict><key>identifier</key><string>follow</string><key>title</key><string>FOLLOW</string><key>authorizationRequired</key><false/><key>destructive</key><false/><key>foreground</key><true/></dict></array></dict></plist>";

@interface PIONotificationCategories : NSObject

/**
 Class level method to parse the default categories list from `Default_Category_plist` and return the unique list (NSSet) of categories.

 @return unique list of PIOCategory list.
 */
+(NSSet *)defaultCategories;

@end
