# DateParse [![AutoHotkey2](https://img.shields.io/badge/Language-AutoHotkey2-red.svg)](https://autohotkey.com/)
Converts almost any date format to a YYYYMMDDHH24MISS value.

This library uses *AutoHotkey Version 2*.

## Usage 

Include `DateParse.ahk`from the `lib` folder into your project using standard AutoHotkey-include methods.

```autohotkey
#include <DateParse.ahk>
 dt := DateParse("2:35 PM, 27 November, 2007") ; -> "200711271435"
```

For usage examples have a look at the UnitTest-files in `t` folder or at the library module itself

## Hint

This is development environment for Dateparse - for Releases please see https://github.com/AutoHotkey-V2/DateParse