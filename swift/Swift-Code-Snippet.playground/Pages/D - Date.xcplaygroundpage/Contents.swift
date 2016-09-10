
import UIKit

let YearUnit = NSCalendarUnit.Year
let MonthUnit = NSCalendarUnit.Month
let WeekUnit = NSCalendarUnit.WeekOfMonth
let WeekdayUnit = NSCalendarUnit.Weekday
let DayUnit = NSCalendarUnit.Day
let AllUnits = YearUnit.union(MonthUnit).union(WeekUnit).union(WeekdayUnit).union(DayUnit)


var calendar: NSCalendar = NSCalendar.currentCalendar()

var currentDate: NSDate = NSDate()

let dateFormatter = NSDateFormatter()

var components: NSDateComponents


//: ### Today

components = calendar.components(MonthUnit.union(DayUnit), fromDate: currentDate)

//: ### Distance Between Two Days

let start = "2010-09-01"

dateFormatter.dateFormat = "yyyy-MM-dd"

let startDate:NSDate = dateFormatter.dateFromString(start)!

components = calendar.components(YearUnit.union(WeekUnit).union(DayUnit), fromDate: startDate, toDate: currentDate, options: NSCalendarOptions.WrapComponents)

print("The distance of two dates \(components)")

//: ### Current Month Range

let componentsMonthRange = calendar.components(AllUnits, fromDate: currentDate)

// Start of the month.
componentsMonthRange.day = 1
let monthStartDate = calendar.dateFromComponents(componentsMonthRange)!

// End of the month.
componentsMonthRange.month += 1
componentsMonthRange.day -= 1
let monthEndDate = calendar.dateFromComponents(componentsMonthRange)!

// Range of the month.
let range = calendar.rangeOfUnit(WeekUnit, inUnit: MonthUnit, forDate: currentDate)
let countOfWeeks = range.length


//: ### Current Day Range

let componentsDayRange = NSCalendar.currentCalendar().components(AllUnits, fromDate: currentDate)

let year = componentsDayRange.year
let month = componentsDayRange.month
let weekOfMonth = componentsDayRange.weekOfMonth 
let weekDay = Int(componentsDayRange.weekday)
let day = componentsDayRange.day


//: ### Two Dates Comparison 


extension NSDate{
  
  func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
    
    if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {
      return true
    }
    return false
  }
  
  
  func isLessThanDate(dateToCompare: NSDate) -> Bool {
    
    if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {
      return true
    }
    return false
  }

  func equalToDate(dateToCompare: NSDate) -> Bool {
   
    if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
      return true
    }
    
    return false
  }
  
  
}



