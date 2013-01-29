
#import <Foundation/Foundation.h>

@protocol DTCITimeline

/*
 *	Translates a millisecond Date into an index along this timeline.
 */
- (long long) toTimelineValueWithMilliSecond: (long long) aMillisecond;

/*
 *	Translates a date into a value on this timeline.
 */
- (long long) toTimelineValueWithDate: (NSDate *) aDate;

/*
 *	Translates a value relative to this timeline into a domain value. The domain value obtained by this method is not always
 *	the same domain value that could have been supplied to translateDomainValueToTimelineValue(domainValue).
 *	This is because the original tranformation may not be complete reversable.
 */
- (long long) toMillisecondWithTimelineValue: (long long) aTimelineValue;

/*
 *	Returns true if a value is contained in the timeline values.
 */
- (BOOL) containsDomainValueWithMilliSecond: (long long) aMillisecond;

/*
 *	Returns true if a date is contained in the timeline values.
 */
- (BOOL) containsDomainValueWithDate: (NSDate *) aDate;

/*
 *	Returns true if a range of values are contained in the timeline.
 */
- (BOOL) containsDomainRangeWithMilliSecond: (long long) aFromMillisecond to: (long long) aToMillisecond;

/*
 *	Returns true if a range of dates are contained in the timeline.
 */
- (BOOL) containsDomainRangeWithDate: (NSDate *) aFromDate to: (NSDate *) aToDate;

@end

