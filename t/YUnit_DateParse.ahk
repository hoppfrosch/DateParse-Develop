#SingleInstance force

#Include %A_ScriptDir%\Yunit\Yunit.ahk
#Include %A_ScriptDir%\Yunit\Window.ahk
#Include %A_ScriptDir%\Yunit\OutputDebug.ahk

#include %A_ScriptDir%\..\lib\DateParse.ahk

; #Warn All
#Warn LocalSameAsGlobal, Off

debug := 1

OutputDebug "DBGVIEWCLEAR"

;Yunit.Use(YunitStdOut, YunitWindow).Test(ExpMonyTestSuite)
Yunit.Use(YunitOutputDebug, YunitWindow).Test(DateParseTestSuite)
Return

class DateParseTestSuite {
	Begin() {
		Global debug	
	}
	
	MonthTextualYear() {
		date_input := "May1960"
		dt_expected := "19600501"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	YearMonth() {
		date_input := "201710"
		dt_expected := "20171001"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Hour_Minute_PM_Day_MonthTextual_Year() {
		date_input := "2:35 PM, 27 November 2007"
		dt_expected := "200711271435"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Hour_Minute_PM_MonthTextual_Day_Year() {
		date_input := "4:55 am Feb 27, 2004"
		dt_expected := "200402270455"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Hour_Minute() {
		date_input := "11:26"
		dt_expected := "YYYYMMDD1126"
		today := A_YYYY A_MM A_DD
		dt_expected := StrReplace(dt_expected, "YYYYMMDD", today)
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	HourMinute() {
		date_input := "1532"
		dt_expected := "YYYYMMDD1532"
		today := A_YYYY A_MM A_DD
		dt_expected := StrReplace(dt_expected, "YYYYMMDD", today)
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Hour_Minute_PM() {
		date_input := "2:35 PM"
		dt_expected := "YYYYMMDD1435"
		today := A_YYYY A_MM A_DD
		dt_expected := StrReplace(dt_expected, "YYYYMMDD", today)
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Hour_Minute_Second_PM() {
		date_input := "11:22:24 AM"
		dt_expected := "YYYYMMDD112224"
		today := A_YYYY A_MM A_DD
		dt_expected := StrReplace(dt_expected, "YYYYMMDD", today)
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	MonthTextual_Day_Year_DashSeparated() {
		date_input := "Dec-31-13"
		dt_expected := "20131231"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	DayMonthTextualYear() {
		date_input := "25May1960"
		dt_expected := "19600525"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Month_Day_Year_SlashSep() {
		date_input := "3/15/2009"
		dt_expected := "20090315"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Day_Month_Year_SlashSep() {
		date_input := "19/2/05"
		dt_expected := "20050219"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Day_MonthTextual_Year_DashSep() {
		date_input := "05-Jan-00"
		dt_expected := "20000105"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	MonthTextual_Day_Year_SlashSep() {
		date_input := "Jan-05-00"
		dt_expected := "20000105"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Year_Month_DayT_Hour_Minute_SecondZ() {
		date_input := "2007-06-26T14:09:12Z"
		dt_expected := "20070626140912"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Year_Month_Day_Hour_Minute() {
		date_input := "2007-06-25 18:52"
		dt_expected := "200706251852"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Weekday_Day_MonthTextual_Year_Hour_Minute_Second_Timezone() {
		date_input := "Mon, 17 Aug 2009 13:23:33 GMT"
		dt_expected := "20090817132333"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Day_MonthTextual_Year_Hour_Minute_Second() {
		date_input := "07 Mar 2009 13:43:58"
		dt_expected := "20090307134358"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	Weekday_Month_Day_Year() {
		date_input := "Wed 6/27/2007"
		dt_expected := "20070627"
		dt := DateParse(date_input)
		Yunit.assert(dt == dt_expected)
	}

	End()  {
	}
	
}