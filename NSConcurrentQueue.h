//
//  NSConcurrentQueue.h
//
//  Created by Jeromy Stroh on 1/29/15.
//

#import <Foundation/Foundation.h>

@interface NSConcurrentQueue : NSObject

- (instancetype)init;
- (void)add:(id)object;
- (id)remove;
- (id)peek;
- (NSInteger)count;
- (void)clear;

@end
