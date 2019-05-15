//
//  webRequest.m
//  约我出行
//
//  Created by ywcx on 2018/5/30.
//  Copyright © 2018年 ammmi. All rights reserved.
//
#import "webRequest.h"
#import "Requestheader.h"
@implementation webRequest
static webRequest *_sharedIn = nil;
+ (instancetype)Manager
{
    @synchronized(self){
        if(_sharedIn == nil)
        {
            _sharedIn = [[self alloc] init];
        }
    }
    return _sharedIn;
}
#pragma mark 这里是专车下单；
-(void)postRequestSpeOderCreatWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/orderCreate",deyiUrl];
    
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}

#pragma mark这里是共享车的下单

-(void)postRequrstShareOderCreatWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/createManyOrder",deyiUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是微信支付
-(void)postpostRequrstWXpayWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/payForPassenger",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是支付宝支付
-(void)postpostRequrstALpayWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/payForPassenger",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是我的行程
-(void)postpostRequrstmyTripWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/getPassengerOrder",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }]; 
}
#pragma mark 这里是删除我的行程
-(void)postpostRequrstDeleTemyTripWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/delOrder",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
-(void)postpostRequrstInVoceWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/invoice",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }]; 
}
#pragma mark 这里是发票历史
-(void)postpostRequrstHisteryInVoceWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/invoiceHistory",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是提交发票
-(void)postpostRequrstSubmissionInVoceWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/addInvoice",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是乘客自己取消订单
-(void)postpostRequrstCancelOrderWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/cancelOrder",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是搜索附近司机
-(void)postpostRequrstSearChDriverWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/searchNearWhether",deyiUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是邀请最近的司机来接我
-(void)postpostRequrstInvitationDriverWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/specifiedDriver",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是获取最近的一条订单
-(void)postpostRequrstgetBestNewOrderWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/getNewOrder",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是登陆
-(void)postpostRequrstLogINWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/registerOrLogin",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark 这里是获取验证码
-(void)postpostRequrstGetCodeBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    
    NSString *url=[NSString stringWithFormat:@"%@passengers/sendClientLoginCode",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}
#pragma mark 这里是获取Token
-(void)postpostRequrstGetTokenBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/checkPassengerToken",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}
#pragma mark 这里是获取即使通讯的IM
-(void)postpostRequrstGetIMuserSigBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    
    NSString *url=[NSString stringWithFormat:@"%@Common/getTencentUserSig",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}

#pragma mark 这里是评论的接口
-(void)postpostRequrstEvaBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    
    NSString *url=[NSString stringWithFormat:@"%@passengers/commitOrder",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是检查新版本 
-(void)postRequrstCheakNewVersionBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    
    NSString *url=[NSString stringWithFormat:@"%@Common/checkVersion",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
    
}

#pragma mark这里是删除紧急联系人
-(void)postRequrstDeleContactBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/delContact",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是添加紧急联系人
-(void)postRequrstAddContactBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/addContact",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是获取紧急联系人
-(void)postRequrstGetContactBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    
    NSString *url=[NSString stringWithFormat:@"%@passengers/contactList",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是退出登陆
-(void)postRequrstLogOutBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/loginOut",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是检查已经存在的订单的接口
-(void)postRequrstCheakHasOrderBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/hasOrdersTwoType",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}

#pragma mark这里是计算专车价格
-(void)postRequrstGetSelfMoneyBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/getPrice",deyiUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}
#pragma mark这里是计算顺风车价格
-(void)postRequrstGetSHareMoneyBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/getManyPrice",deyiUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
#pragma mark这里是改变新的电话号码获取验证码
-(void)postRequrstChageAcoutgetCodeBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/sendEditMobileCode",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}
#pragma mark这里是改变新的电话号码
-(void)postRequrstSendNewAcoutBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/editMobile",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}

#pragma mark 这里是获取行程费用明细的接口

-(void)postRequrstGetBillFeeBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@passengers/getAllFees",YWUrl];
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}
/////deyi
#pragma mark 这里是打电话
-(void)postpostRequrstPhoneWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=deyiphoneUrl;
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
    
}

@end
