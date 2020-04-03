 
 # Create the QuoteCharts table to keep stock symbol and 1 day, 3 months, and
 # 1 year filename information for the charts

 create table QuoteCharts (Symbol varchar2(5), DayFile varchar2(12),
 MonthFile varchar2(12), YearFile varchar2(12));

 # Insert the table info

 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('ORCL', 'ORCLDAY.GIF', 'ORCLMONT.GIF', 'ORCLYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('SUNW', 'SUNWDAY.GIF', 'SUNWMONT.GIF', 'SUNWYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('CSCO', 'CSCODAY.GIF', 'CSCOMONT.GIF', 'CSCOYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('IBM', 'IBMDAY.GIF', 'IBMMONT.GIF', 'IBMYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('HWP', 'HWPDAY.GIF', 'HWPMONT.GIF', 'HWPYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('COMS', 'COMSDAY.GIF', 'COMSMONT.GIF', 'COMSYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('NSCP', 'NSCPDAY.GIF', 'NSCPMONT.GIF', 'NSCPYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('INTC', 'INTCDAY.GIF', 'INTCMONT.GIF', 'INTCYEAR.GIF');
 insert into QuoteCharts (Symbol, DayFile, MonthFile, YearFile)
 values ('DELL', 'DELLDAY.GIF', 'DELLMONT.GIF', 'DELLYEAR.GIF');

