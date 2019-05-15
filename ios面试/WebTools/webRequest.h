//
//  webRequest.h
//  约我出行
//
//  Created by ywcx on 2018/5/30.
//  Copyright © 2018年 ammmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
typedef void(^completed) (NSDictionary *postdic);

@interface webRequest : NSObject

+ (webRequest *)Manager;

-(void)postRequestSpeOderCreatWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstShareOderCreatWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstWXpayWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstALpayWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstPhoneWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstmyTripWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstDeleTemyTripWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstInVoceWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstHisteryInVoceWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstSubmissionInVoceWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstCancelOrderWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstSearChDriverWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstgetBestNewOrderWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstInvitationDriverWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstLogINWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstGetCodeBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstGetTokenBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstGetIMuserSigBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postpostRequrstEvaBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstCheakNewVersionBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstDeleContactBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstAddContactBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstGetContactBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstLogOutBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstCheakHasOrderBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstGetSelfMoneyBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstGetSHareMoneyBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstChageAcoutgetCodeBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstSendNewAcoutBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)postRequrstGetBillFeeBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;



@end
