//
//  NSConcurrentQueue.m
//
//  Created by Jeromy Stroh on 1/29/15.
//

#import "NSConcurrentQueue.h"

@interface NSConcurrentQueue ()
{
    NSMutableArray *_array;
}
@end

@implementation NSConcurrentQueue

- (instancetype)init
{
    if (!(self = [super init]))
        return nil;
    
    _array = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)add:(id)object;
{
    @synchronized(self) {
        [_array addObject:object];
    }
}

- (id)remove
{
    @synchronized(self) {
        if ([_array count] > 0) {
            id object = [self peek];
            [_array removeObjectAtIndex:0];
            return object;
        }
    }
    
    return nil;
}

- (id)peek
{
    @synchronized(self) {
        if ([_array count] > 0) {
            return [_array objectAtIndex:0];
        }
    }
    
    return nil;
}

- (NSInteger)count
{
    @synchronized(self) {
        return [_array count];
    }
}

- (void)clear
{
    @synchronized(self) {
        [_array removeAllObjects];
    }
}

@end
