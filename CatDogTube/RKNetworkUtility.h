//
//  RKNetworkUtility.h
//
//  Copyright 2012 SONORAN BLUE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/CaptiveNetwork.h>

extern
NSString *checkReachability(NSString *ipAddress);

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

/* Getting Network Information */

extern NSString *
RKNetworkGetLocalIPAddressString(void);
extern NSString *
RKNetworkGetLocalIPAddressStringIPv6(void);

extern BOOL
RKNetworkGetLocalIPAddressAndNetmask(uint32_t *outIP, uint32_t *outNetmask);
extern BOOL
RKNetworkGetLocalIPAddressAndNetmaskIPv6(struct in6_addr *outIP, struct in6_addr *outNetmask);

/**
    ネットマスク が 0xffffffff ではない、インターフェースの情報を取得する
    @param outInterfaceName     en0 などのインターフェース名.
    @param outIP                IPv4 アドレス
    @param outNetmask           IPv4 ネットマスク
 */
extern BOOL
RKNetworkGetActiveInterfaceInfo(NSString **outInterfaceName, uint32_t *outIP, uint32_t *outNetmask);
extern BOOL
RKNetworkGetActiveInterfaceInfoIPv6(NSString **outInterfaceName, struct in6_addr *outIP, struct in6_addr *outNetmask);

/**
    MAC アドレスを取得する
 */
#if (0)
extern NSString *
RKNetworkGetMACAddress(NSString *separator);
#endif

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

/* IP Address */

/**
    アドレスデータから IP アドレスの文字列に変換する
 */
extern NSString *
RKNetworkIPAddressStringFromData(NSData *addressData);

/**
    アドレスデータから IP アドレスの文字列に変換する
 */
extern NSString *
RKNetworkIPAddressStringFromBytes(const void *bytes, NSUInteger length);

/**
    指定したホスト名から IP アドレスをバイト形式にして返す
 */
extern BOOL
RKNetworkGetIPAddressFromHost(NSString *host, uint32_t *outAddress);
extern BOOL
RKNetworkGetIPAddressFromHostIPv6(NSString *host, struct in6_addr *outAddress);

/**
    指定したアドレスがローカルネットワーク上のアドレスならば YES を返す
 */
extern BOOL
RKNetworkIsLocalIPAddress(uint32_t address);
extern BOOL
RKNetworkIsLocalIPAddressIPv6(struct in6_addr *address);

/**
    指定した URL がローカルネットワーク上の URL ならば YES を返す
 */
extern BOOL
RKNetworkIsLocalURL(NSURL *URL);

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

/* CFNetwork Error */


extern NSString * const RKCFStreamErrorDomain;
extern NSError * RKNetworkGetErrorFromCFStreamError(CFStreamError error);
extern NSInteger RKNetworkGetPortFromSocket(CFSocketRef s);
extern NSInteger RKNetworkGetPortFromSocketIPv6(CFSocketRef s);
extern NSString * RKNetworkGetStreamEventTypeDescription(CFStreamEventType type);
extern NSInteger RKNetworkAddressProtocoolFamily(NSString *address);
