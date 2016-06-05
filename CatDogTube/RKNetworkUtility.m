//
//  RKNetworkUtility.m
//
//  Copyright 2012 SONORAN BLUE. All rights reserved.
//

#import "RKNetworkUtility.h"


/* Network */
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>
#import <net/if_dl.h>
#import <net/ethernet.h>
#import <netinet/in.h>
#import <sys/socket.h>

#if !defined(IFT_ETHER)
  #define IFT_ETHER             0x6
#endif

#pragma mark - Getting Network Information


NSString *checkReachability(NSString *ipAddress)
{
    if (!ipAddress) {
        return @"error";
    }
    
    struct sockaddr_in callAddress;
    callAddress.sin_len = sizeof(callAddress);
    callAddress.sin_family = AF_INET;
    callAddress.sin_port = htons(24);
    callAddress.sin_addr.s_addr = inet_addr([ipAddress UTF8String]);
    
    return @"success";
}


NSString * RKNetworkGetLocalIPAddressString(void)
{
    uint32_t ip;
    char str[INET_ADDRSTRLEN];
    const char *c;

    if (!RKNetworkGetLocalIPAddressAndNetmask(&ip, NULL))
        return nil;

    ip = htonl(ip);

    c = inet_ntop(AF_INET, &ip, str, sizeof(str));
    if (c == NULL)
        return nil;

    return [[NSString alloc] initWithCString:str encoding:NSASCIIStringEncoding];
}

NSString * RKNetworkGetLocalIPAddressStringIPv6(void)
{
    struct in6_addr ip;
    char str[INET6_ADDRSTRLEN];
    const char *c;
    
    if (!RKNetworkGetLocalIPAddressAndNetmaskIPv6(&ip, NULL))
        return nil;
    
    c = inet_ntop(AF_INET6, &ip, str, INET6_ADDRSTRLEN);
    if (c == NULL)
        return nil;
    
    return [[NSString alloc] initWithCString:str encoding:NSASCIIStringEncoding];
}

BOOL RKNetworkGetLocalIPAddressAndNetmask(uint32_t *outIP, uint32_t *outNetmask)
{
    return RKNetworkGetActiveInterfaceInfo(NULL, outIP, outNetmask);
}

BOOL RKNetworkGetLocalIPAddressAndNetmaskIPv6(struct in6_addr *outIP, struct in6_addr *outNetmask)
{
    return RKNetworkGetActiveInterfaceInfoIPv6(NULL, outIP, outNetmask);
}

BOOL RKNetworkGetActiveInterfaceInfo(NSString **outInterfaceName, uint32_t *outIP, uint32_t *outNetmask)
{
    NSString *name;
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    int retval;
    BOOL success = NO;

    addrs = NULL;
    retval = getifaddrs(&addrs);
    if ((retval != 0) || (addrs == NULL))
    {
        //RKLog(@"error: getifaddr() failed\n");
        return NO;
    }

    cursor = addrs;
    while (cursor != NULL)
    {
        /*
            3つの条件
            1. loopback は除外するので ifa_name は 'lo' で始まらないこと
            2. AF_INET であること
            3. アドレスの構造体のサイズが適切であること
                iPhone OS 3.1.3 で確認したところ
                ifa_addr は sa_len が 16 で返ってくるので問題ないが
                ifa_netmask は sa_len が 7 で返ってくる
                そのため netmask についてはサイズチェックを行わない
         */
        if ( (!((cursor->ifa_name[0] == 'l') && (cursor->ifa_name[1] == 'o'))) )
        {
            if (cursor->ifa_addr->sa_family == AF_INET && (sizeof(struct sockaddr_in) <= cursor->ifa_addr->sa_len))
            {
                const struct sockaddr_in *addr;
                uint32_t ip, netmask;
                
                addr = (const struct sockaddr_in *)(cursor->ifa_addr);
                ip = ntohl(addr->sin_addr.s_addr);
                addr = (const struct sockaddr_in *)(cursor->ifa_netmask);
                netmask = ntohl(addr->sin_addr.s_addr);
                
                if (netmask != 0xffffffff)
                {
                    name = [[NSString alloc] initWithCString:cursor->ifa_name encoding:NSUTF8StringEncoding];
                    
                    if (outInterfaceName != NULL)
                    {
                        *outInterfaceName = name;
                    }
                    
                    if (outIP != NULL)
                    {
                        *outIP = ip;
                    }
                    
                    if (outNetmask != NULL)
                    {
                        *outNetmask = netmask;
                    }
                    
                    success = YES;
                    break;
                }
            }
        }
        cursor = cursor->ifa_next;
    }

    freeifaddrs(addrs);

    return success;
}

BOOL RKNetworkGetActiveInterfaceInfoIPv6(NSString **outInterfaceName, struct in6_addr *outIP, struct in6_addr *outNetmask)
{
    NSString *name;
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    int retval;
    BOOL success = NO;
    
    addrs = NULL;
    retval = getifaddrs(&addrs);
    if ((retval != 0) || (addrs == NULL))
    {
        //RKLog(@"error: getifaddr() failed\n");
        return NO;
    }
    
    cursor = addrs;
    while (cursor != NULL)
    {
        /*
         3つの条件
         1. loopback は除外するので ifa_name は 'lo' で始まらないこと
         2. AF_INET であること
         3. アドレスの構造体のサイズが適切であること
         iPhone OS 3.1.3 で確認したところ
         ifa_addr は sa_len が 16 で返ってくるので問題ないが
         ifa_netmask は sa_len が 7 で返ってくる
         そのため netmask についてはサイズチェックを行わない
         */
        if ( (!((cursor->ifa_name[0] == 'l') && (cursor->ifa_name[1] == 'o'))) )
        {
            if (cursor->ifa_addr->sa_family == AF_INET6 && (sizeof(struct sockaddr_in6) <= cursor->ifa_addr->sa_len))
            {
                const struct sockaddr_in6 *addr;
                struct in6_addr ip, netmask;
                
                addr = (const struct sockaddr_in6 *)(cursor->ifa_addr);
                ip = addr->sin6_addr;
                addr = (const struct sockaddr_in6 *)(cursor->ifa_netmask);
                netmask = addr->sin6_addr;
                
                name = [[NSString alloc] initWithCString:cursor->ifa_name encoding:NSUTF8StringEncoding];
                
                if (outInterfaceName != NULL)
                {
                    *outInterfaceName = name;
                }
                
                if (outIP != NULL)
                {
                    *outIP = ip;
                }
                
                if (outNetmask != NULL)
                {
                    *outNetmask = netmask;
                }
                
                success = YES;
                break;
            }
        }
        cursor = cursor->ifa_next;
    }
    
    freeifaddrs(addrs);
    
    return success;
}

#if (0)
NSString * RKNetworkGetMACAddress(NSString *separator)
{
    NSArray *interfaceNames;
    NSString *name;
    NSString *address;
    NSString *result;
    NSString *candidate;
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    const struct sockaddr_dl *dladdr;
    const uint8_t *base;
    BOOL success;

    result = nil;
    candidate = nil;

    success = (getifaddrs(&addrs) == 0);
    if (!success)
    {
        return nil;
    }

    if (&CNCopySupportedInterfaces != NULL)
    {
        interfaceNames = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    }
    else
    {
        interfaceNames = nil;
    }

    cursor = addrs;
    while (cursor != NULL)
    {
        do {
            if (cursor->ifa_name == NULL)
                break;

            // Ignore loopback
            if ((cursor->ifa_name[0] == 'l') && (cursor->ifa_name[1] == 'o'))
                break;

            if (cursor->ifa_addr->sa_family != AF_LINK)
                break;

            if (((const struct sockaddr_dl*)cursor->ifa_addr)->sdl_type != IFT_ETHER)
                break;

            dladdr = (const struct sockaddr_dl*)cursor->ifa_addr;
            if (dladdr->sdl_alen != ETHER_ADDR_LEN)
                break;

            base = (const uint8_t*)&dladdr->sdl_data[dladdr->sdl_nlen];
            address = [NSString stringWithFormat:
                @"%02x%@%02x%@%02x%@%02x%@%02x%@%02x",
                (int)base[0], separator,
                (int)base[1], separator,
                (int)base[2], separator,
                (int)base[3], separator,
                (int)base[4], separator,
                (int)base[5]];

            if (interfaceNames != nil)
            {
                name = [NSString stringWithCString:cursor->ifa_name encoding:NSUTF8StringEncoding];
                if ((name != nil) && ([interfaceNames containsObject:name]))
                {
                    result = address;
                    break;
                }
            }

            if (candidate == nil)
            {
                candidate = address;
            }

        } while (0);

        if (result != nil)
            break;

        cursor = cursor->ifa_next;
    }

    freeifaddrs(addrs);

    if (result == nil)
    {
        result = candidate;
    }

    return result;
}
#endif

#pragma mark - IP Address

NSString * RKNetworkIPAddressStringFromData(NSData *addressData)
{
    return RKNetworkIPAddressStringFromBytes([addressData bytes], [addressData length]);
}

NSString * RKNetworkIPAddressStringFromBytes(const void *bytes, NSUInteger length)
{
    NSString *result;
    const struct sockaddr *addr;
    const char *c;
    char str[64]; /* INET_ADDRSTRLEN(16)、INET6_ADDRSTRLEN(46) より余裕を持っている */

    do {
        /* サイズをチェック */
        //RKBreakIf(length < sizeof(struct sockaddr));

        addr = (const struct sockaddr *)bytes;
        //RKBreakIf(addr == NULL);

        if (addr->sa_family == AF_INET)
        {
            c = inet_ntop(AF_INET, &((const struct sockaddr_in *)addr)->sin_addr, str, sizeof(str));
            //RKBreakIf(c == NULL);
        }
        else if (addr->sa_family == AF_INET6)
        {
            c = inet_ntop(AF_INET6, &((const struct sockaddr_in6 *)addr)->sin6_addr, str, sizeof(str));
           // RKBreakIf(c == NULL);
        }
        else
        {
            //RKLog(@"error: not support address family\n");
            break;
        }

        /* NSStringを生成 */
        result = [[NSString alloc] initWithCString:str encoding:NSUTF8StringEncoding];
        //RKBreakIf(result == nil);

    } while (false);

    return result;
}

BOOL RKNetworkGetIPAddressFromHost(NSString *host, uint32_t *outAddress)
{
    struct in_addr addr;
    int retval;

    if (host == nil)
    {
        return NO;
    }

    retval = inet_pton(AF_INET, [host UTF8String], &addr);
    if (retval == 0)
    {
        return NO;
    }

    if (outAddress != NULL)
    {
        *outAddress = ntohl(addr.s_addr);
    }

    return YES;
}

BOOL RKNetworkGetIPAddressFromHostIPv6(NSString *host, struct in6_addr *outAddress)
{
    struct in6_addr addr;
    int retval;
    
    if (host == nil)
    {
        return NO;
    }
    
    retval = inet_pton(AF_INET6, [host UTF8String], &addr);
    if (retval == 0)
    {
        return NO;
    }
    
    if (outAddress != NULL)
    {
        *outAddress = addr;
    }
    
    return YES;
}

BOOL RKNetworkIsLocalIPAddress(uint32_t address)
{
    uint32_t myAddress, myNetmask;

    if (!RKNetworkGetLocalIPAddressAndNetmask(&myAddress, &myNetmask))
    {
        //RKLog(@"error: did fail get address\n");
        return NO;
    }

    return ((myAddress & myNetmask) == (address & myNetmask));
}

BOOL RKNetworkIsLocalIPAddressIPv6(struct in6_addr *address)
{
    struct in6_addr myAddress, myNetmask;
    
    if (!RKNetworkGetLocalIPAddressAndNetmaskIPv6(&myAddress, &myNetmask))
    {
        //RKLog(@"error: did fail get address\n");
        return NO;
    }
    
    for (NSInteger i=0 ; i<4 ; i++)
    {
        if ( (myAddress.__u6_addr.__u6_addr32[i] & myNetmask.__u6_addr.__u6_addr32[i]) != (address->__u6_addr.__u6_addr32[i] & myNetmask.__u6_addr.__u6_addr32[i]) )
        {
            return NO;
        }
    }
    return YES;
}

BOOL RKNetworkIsLocalURL(NSURL *URL)
{
    NSInteger res = RKNetworkAddressProtocoolFamily([URL host]);
    if (res == AF_INET6)
    {
        struct in6_addr addressIPv6;
        if (!RKNetworkGetIPAddressFromHostIPv6([URL host], &addressIPv6))
        {
            // 文字表記の場合は NO で返す
            return NO;
        }
        return RKNetworkIsLocalIPAddressIPv6(&addressIPv6);
    }
    else if (res == AF_INET)
    {
        uint32_t address;
        if (!RKNetworkGetIPAddressFromHost([URL host], &address))
        {
            // 文字表記の場合は NO で返す
            return NO;
        }
        return RKNetworkIsLocalIPAddress(address);
    }
    return NO;
}

#pragma mark - CFNetwork Error

NSString * const RKCFStreamErrorDomain = @"RKCFStreamErrorDomain";

NSError * RKNetworkGetErrorFromCFStreamError(CFStreamError error)
{
    NSDictionary *info;
    NSString *string;

    string = [NSString stringWithFormat:@"CFStreamError { %d, %d }", (int)error.domain, (int)error.error];
    //RKAssert(string != nil);

    info = [NSDictionary dictionaryWithObject:string forKey:NSLocalizedDescriptionKey];
    //RKAssert(info != nil);

    return [NSError errorWithDomain:RKCFStreamErrorDomain code:0 userInfo:info];
}

NSInteger RKNetworkGetPortFromSocket(CFSocketRef s)
{
    CFDataRef data = NULL;
    NSInteger port = -1;

    do {
        data = CFSocketCopyAddress(s);
        //RKBreakIf(data == NULL);
        //RKBreakIf(CFDataGetLength(data) < sizeof(struct sockaddr_in));

        port = ntohs(((struct sockaddr_in*)CFDataGetBytePtr(data))->sin_port);

    } while (false);

    if (data != NULL)
    {
        CFRelease(data);
    }

    return port;
}

NSInteger RKNetworkGetPortFromSocketIPv6(CFSocketRef s)
{
    CFDataRef data = NULL;
    NSInteger port = -1;
    
    do {
        data = CFSocketCopyAddress(s);
        //RKBreakIf(data == NULL);
        //RKBreakIf(CFDataGetLength(data) < sizeof(struct sockaddr_in6));
        
        port = ntohs(((struct sockaddr_in6*)CFDataGetBytePtr(data))->sin6_port);
        
    } while (false);
    
    if (data != NULL)
    {
        CFRelease(data);
    }
    
    return port;
}

NSString * RKNetworkGetStreamEventTypeDescription(CFStreamEventType type)
{
    return ((type == kCFStreamEventNone)              ? @"none" :
            (type == kCFStreamEventErrorOccurred)     ? @"error occurred" :
            (type == kCFStreamEventOpenCompleted)     ? @"open completed" :
            (type == kCFStreamEventCanAcceptBytes)    ? @"can accept bytes" :
            (type == kCFStreamEventEndEncountered)    ? @"end encountered" :
            (type == kCFStreamEventHasBytesAvailable) ? @"has bytes available" :
            [NSString stringWithFormat:@"unknown (%u)", (unsigned int)type]);
}

NSInteger RKNetworkAddressProtocoolFamily(NSString *address)
{
    if (address == nil) {
        return AF_UNSPEC;
    }
    
    struct in6_addr addr6;
    if (inet_pton(AF_INET6, [address UTF8String], &addr6) == 1)
    {
        return AF_INET6;
    }
    struct in_addr addr4;
    if (inet_pton(AF_INET, [address UTF8String], &addr4) == 1)
    {
        return AF_INET;
    }
    return AF_UNSPEC;
}
