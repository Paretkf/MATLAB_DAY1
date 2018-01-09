% Convert to Celcius, then plot

%% Convert data format
OATC = 5/9 * (OATF - 32);
tstamp = datenum(Timestamp);

%% Plot and decorate graph
plot(tstamp, OATC);
datetick;
title('Outside Air Temperature');
ylabel('deg C');