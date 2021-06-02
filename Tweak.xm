#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook NSNotificationCenter
- (void)addObserver:(id)arg1 selector:(SEL)arg2 name:(id)arg3 object:(id)arg4 {
    NSString *data = arg3;
    if([data isEqual: @"UIApplicationUserDidTakeScreenshotNotification"]) return;
    if([data isEqual: @"SCUserDidScreenRecordContentNotification"]) return;
    %orig;
}
%end

//SCUserDidScreenRecordContentNotification
//UIApplicationUserDidTakeScreenshotNotification

/*
-(void)log2file: (NSString)data {
    NSArray *allPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [allPaths objectAtIndex:0];
    NSString *pathForLog = [documentsDirectory stringByAppendingPathComponent:@"logfile.txt"];
    NSString* contents = [NSString stringWithContentsOfFile:pathForLog encoding:NSUTF8StringEncoding error:nil];
    NSString *complete = [NSString stringWithFormat:@"%@%@", contents,data];
    [complete writeToFile:pathForLog atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
*/
