// eyad73xx_dylib.m
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

__attribute__((constructor))
static void eyad73xx_init() {
    // ننتظر حتى تحميل التطبيق بالكامل
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        // ننشئ UIView للعرض
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        if (!keyWindow) return;
        
        UIView *overlayView = [[UIView alloc] initWithFrame:keyWindow.bounds];
        overlayView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        overlayView.userInteractionEnabled = NO;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
        label.center = CGPointMake(overlayView.bounds.size.width / 2, overlayView.bounds.size.height / 2);
        label.text = @"eyad73xx";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:42];
        label.textAlignment = NSTextAlignmentCenter;
        label.shadowColor = [UIColor blackColor];
        label.shadowOffset = CGSizeMake(2, 2);
        
        [overlayView addSubview:label];
        [keyWindow addSubview:overlayView];
        
        // نزيلها بعد 5 ثواني
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [overlayView removeFromSuperview];
        });
    });
}
