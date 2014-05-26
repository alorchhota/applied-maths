function [ ticks ] = time2tick(t)
% TIME2TICK converts time to second ticks (as if ticking starts from
% 0001:01:01 00:00:00
%
% input:
%   t: an array of 6 numbers [yyyy mm dd hh mm secs]
% output:
%   ticks: #seconds since 0001:01:01 00:00:00
 
  %% number of days in a month. it will be required to calculate how many
  % days are there before a date.
  numDaysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
  daysBeforeMonth = [0 cumsum( numDaysInMonth)];

  %% calculating number of extra days due to leap-year
  % if year is multiple of 400, leap year
  % elseif year is multiple of 100, normal year
  % elseif year is multiple of 4, leap year
  numLeapYears = floor(t(1)/4) - floor(t(1)/100) + floor(t(1)/400);
  
  % current year would not have extra days if month is jan or feb even
  % after being a leap year.
  isCurrentYearLeapYear = mod(t(1),4)==0 && ((mod(t(1), 100)~=0 || mod(t(1),400)==0));
  if(isCurrentYearLeapYear && t(2)<=2)
    numLeapYears = numLeapYears - 1;
  end

  %% convert months to days, as different months have different number of days
  t(3) = daysBeforeMonth(t(2)) + t(3) + numLeapYears;
  t(2) = 0;
  
  %% convert to second ticks
  % multiplier to convert YYYY:MM:DD hh:mm:ss. month multiplier is 0, as 
  % it would be converted to days before multiplication.
  multiplier = [365*24*60*60 0 24*60*60 60*60 60 1];
  startTime = [1 1 1 0 0 0];
  ticks = sum((t-startTime) .* multiplier);

end

