
#import <Foundation/Foundation.h>

#import "DTCSeries.h"
#import "DTCTask.h"

@interface DTCTaskSeries : DTCSeries {
@private
	NSMutableArray *tasks;
}

- (id) initWithName: (NSString *) aName;

/*
 *	Adds a task to the series
 */
- (void) addWithTask: (DTCTask *) aTask;

/*
 *	Removes a task from the series
 */
- (void) removeWithTask: (DTCTask *) aTask;

/*
 *	Removes all tasks from the series
 */
- (void) removeAll;

/*
 *	Returns the number of items in the series.
 */
- (int) getItemCount;

/*
 *	Returns a task from the series.
 */
- (DTCTask *) getWithIndex: (int) anIndex;

/*
 *	Returns the task in the series that has the specified description.
 */
- (DTCTask *) getWithDescription: (NSString *) aDescription;

/*
 * Returns an unmodifialble list of the tasks in the series.
 */
- (NSMutableArray *) getTasks;

@end
