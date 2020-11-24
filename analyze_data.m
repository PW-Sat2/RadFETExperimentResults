close all;
clear all;

% Earth-calibration data
load('parsed_data\komora_24h-6-4_radfet.mat');

% Data from orbit
load('parsed_data\wo_outliers\radfet1.mat');
load('parsed_data\wo_outliers\radfet2.mat');
load('parsed_data\wo_outliers\radfet3.mat');
load('parsed_data\wo_outliers\radfet4.mat');
load('parsed_data\wo_outliers\radfet5.mat');
load('parsed_data\wo_outliers\radfet6.mat');
load('parsed_data\wo_outliers\radfet7.mat');
load('parsed_data\wo_outliers\radfet8.mat');
load('parsed_data\selected\radfet9.mat');
load('parsed_data\wo_outliers\radfet10.mat');
load('parsed_data\wo_outliers\radfet11.mat');
load('parsed_data\selected\radfet12.mat');
load('parsed_data\wo_outliers\radfet13.mat');
load('parsed_data\selected\radfet14.mat');
load('parsed_data\wo_outliers\radfet15.mat');
load('parsed_data\wo_outliers\radfet16.mat');
load('parsed_data\wo_outliers\radfet17.mat');
load('parsed_data\wo_outliers\radfet18.mat');
load('parsed_data\wo_outliers\radfet19.mat');
load('parsed_data\wo_outliers\radfet20.mat');
load('parsed_data\wo_outliers\radfet21.mat');
load('parsed_data\wo_outliers\radfet22.mat');
load('parsed_data\wo_outliers\radfet23.mat');
load('parsed_data\selected\radfet24.mat');
load('parsed_data\wo_outliers\radfet25.mat');
load('parsed_data\wo_outliers\radfet26.mat');
load('parsed_data\selected\radfet27.mat');
load('parsed_data\wo_outliers\radfet28.mat');
load('parsed_data\wo_outliers\radfet29.mat');
load('parsed_data\wo_outliers\radfet30.mat');
load('parsed_data\wo_outliers\radfet31.mat');
load('parsed_data\wo_outliers\radfet32.mat');
load('parsed_data\wo_outliers\radfet33.mat');
load('parsed_data\wo_outliers\radfet34.mat');
load('parsed_data\wo_outliers\radfet35.mat');
load('parsed_data\wo_outliers\radfet36.mat');
load('parsed_data\wo_outliers\radfet37.mat');
load('parsed_data\wo_outliers\radfet38.mat');
load('parsed_data\wo_outliers\radfet39.mat');
load('parsed_data\wo_outliers\radfet40.mat');
load('parsed_data\wo_outliers\radfet41.mat');
load('parsed_data\wo_outliers\radfet42.mat');
load('parsed_data\wo_outliers\radfet43.mat');
load('parsed_data\wo_outliers\radfet44.mat');
load('parsed_data\wo_outliers\radfet45.mat');
load('parsed_data\wo_outliers\radfet46.mat');
load('parsed_data\wo_outliers\radfet47.mat');
load('parsed_data\wo_outliers\radfet48.mat');
load('parsed_data\wo_outliers\radfet49.mat');
load('parsed_data\wo_outliers\radfet50.mat');
load('parsed_data\wo_outliers\radfet51.mat');

all_data = {{komora24h64radfet, "2018-12-04 00:00:00"},...
            {radfet1converted, "2018-12-11 09:03:00"},...
            {radfet2converted, "2018-12-15 09:26:09"},...
            {radfet3converted, "2018-12-17 09:37:43"},...
            {radfet4converted, "2018-12-19 09:49:15"},...
            {radfet5converted, "2018-12-20 20:49:42"},...
            {radfet6converted, "2018-12-23 10:12:17"},...
            {radfet7converted, "2018-12-24 19:38:54"},...
            {radfet8converted, "2019-02-21 10:40:03"},...
            {radfet9converted, "2019-03-02 11:20:32"},...
            {radfet10converted, "2019-04-06 09:52:24"},...
            {radfet11converted, "2019-04-20 10:36:13"},...
            {radfet12converted, "2019-05-04 22:08:01"},...
            {radfet13converted, "2019-05-18 10:13:01"},...
            {radfet14converted, "2019-06-01 12:14:26"},...
            {radfet15converted, "2019-06-15 12:36:10"},...
            {radfet16converted, "2019-06-29 12:53:16"},...
            {radfet17converted, "2019-07-13 20:50:00"},...
            {radfet18converted, "2019-07-27 20:58:59"},...
            {radfet19converted, "2019-08-10 10:11:24"},...
            {radfet20converted, "2019-08-24 10:12:38"},...
            {radfet21converted, "2019-09-07 11:45:29"},...
            {radfet22converted, "2019-09-20 20:55:47"},...
            {radfet23converted, "2019-10-05 11:24:33"},...
            {radfet24converted, "2019-10-26 21:43:58"},...
            {radfet25converted, "2019-11-08 21:48:57"},...
            {radfet26converted, "2019-11-22 21:12:37"},...
            {radfet27converted, "2019-12-06 20:28:20"},...
            {radfet28converted, "2019-12-21 13:34:32"},...
            {radfet29converted, "2020-01-04 20:12:10"},...
            {radfet30converted, "2020-01-18 11:27:14"},...
            {radfet31converted, "2020-01-31 21:12:30"},...
            {radfet32converted, "2020-02-15 12:11:36"},...
            {radfet33converted, "2020-02-29 21:38:46"},...
            {radfet34converted, "2020-03-13 21:49:15"},...
            {radfet35converted, "2020-03-28 20:17:26"},...
            {radfet36converted, "2020-04-11 11:40:23"},...
            {radfet37converted, "2020-04-25 12:53:05"},...
            {radfet38converted, "2020-05-16 11:16:50"},...
            {radfet39converted, "2020-05-30 10:36:00"},...
            {radfet40converted, "2020-06-13 11:18:30"},...
            {radfet41converted, "2020-06-27 13:27:54"},...
            {radfet42converted, "2020-07-11 12:21:55"},...
            {radfet43converted, "2020-07-25 12:42:15"},...
            {radfet44converted, "2020-08-08 11:21:07"},...
            {radfet45converted, "2020-08-22 11:23:40"},...
            {radfet46converted, "2020-09-05 11:18:06"},...
            {radfet47converted, "2020-09-19 23:17:51"},...
            {radfet48converted, "2020-10-04 22:31:23"},...
            {radfet49converted, "2020-11-07 11:34:14"},...
            {radfet50converted, "2020-11-14 23:01:56"},...
            {radfet51converted, "2020-11-21 11:22:57"},...
            };


polynomials = struct('vth0', [-3.29685E-4, 0.48969, 1872.79214],...
                     'vth1', [-3.24006E-4, 0.4812, 1868.10494],...
                     'vth2', [-3.30617E-4, 0.49363, 1873.65098]);
             
parse_date_string = @(x) datetime(x, 'InputFormat','yyyy-MM-dd HH:mm:ss');
radfet_vdiode = @(x) x/2*2500.0/(2^24);
radfet_vth = @(x) x*2500.0/(2^24);
to_dose = @(x) x/5*1000;

outfilename = websave('altitude.json', 'https://sail.pw-sat.pl/altitude.json');
altitude_json = fileread(outfilename);
altitude = jsondecode(altitude_json);

altitude_timedelta = [];

for i = 1:numel(altitude.data.meanAltitude_km_)
    altitude.data.meanAltitude_km_(i).datetime = datetime(altitude.data.meanAltitude_km_(i).timestamp,'ConvertFrom','epochtime','TicksPerSecond',1,'Format','dd-MMM-yyyy HH:mm:ss');
    altitude_timedelta(i) = days(altitude.data.meanAltitude_km_(i).datetime - parse_date_string(all_data{1}{2}));
end

experiment_time = duration();
experiment_days = [];
altitute_exp_days = [];

for i = 1:numel(all_data)
    experiment_dates{i} = parse_date_string(all_data{i}{2});
end

for i = 2:numel(all_data)
  timedelta = parse_date_string(all_data{i}{2}) - parse_date_string(all_data{1}{2});
  experiment_time(i) = timedelta;
  experiment_days(i) = days(timedelta);
  legend_items{i} = strcat(num2str(days(timedelta)), " days");
  [v, dayindex] = min(abs(altitude_timedelta-experiment_days(i)));
  altitute_exp_days(i) = altitude.data.meanAltitude_km_(dayindex).value;
end

% all data but the first - on ground
all_data_from_space = all_data(2:end);

%%%%%%%%%%%%%%%%%
% Vdiode vs. Vth0
%%%%%%%%%%%%%%%%%

f = figure;
plot(radfet_vdiode(komora24h64radfet.Temperature(30:end)), radfet_vth(komora24h64radfet.Vth0(30:end)));
hold on;

for i = 1:numel(all_data_from_space)
  data = all_data_from_space{i}{1};
  plot(data.Vdiode, data.Vth0);
end

%legend(legend_items, 'Location', 'Best');
xlabel('Vdiode [mV]');
ylabel('Vth [mV]');
title('Vth0 vs. Vdiode');
grid on;
saveas(f, 'outputs/Vth0 vs Vdiode.png');

%%%%%%%%%%%%%%%%%
% Vdiode vs. Vth1
%%%%%%%%%%%%%%%%%

f = figure;
plot(radfet_vdiode(komora24h64radfet.Temperature(30:end)), radfet_vth(komora24h64radfet.Vth1(30:end)));
hold on;

for i = 1:numel(all_data_from_space)
  data = all_data_from_space{i}{1};
  plot(data.Vdiode, data.Vth1);
end

%legend(legend_items, 'Location', 'Best');
xlabel('Vdiode [mV]');
ylabel('Vth [mV]');
title('Vth1 vs. Vdiode');
grid on;
saveas(f, 'outputs/Vth1 vs Vdiode.png');

%%%%%%%%%%%%%%%%%
% Vdiode vs. Vth2
%%%%%%%%%%%%%%%%%

f = figure;
plot(radfet_vdiode(komora24h64radfet.Temperature(30:end)), radfet_vth(komora24h64radfet.Vth2(30:end)));
hold on;

for i = 1:numel(all_data_from_space)
  data = all_data_from_space{i}{1};
  plot(data.Vdiode, data.Vth2 );
end

%legend(legend_items, 'Location', 'Best');
xlabel('Vdiode [mV]');
ylabel('Vth [mV]');
title('Vth2 vs. Vdiode');
grid on;
saveas(f, 'outputs/Vth2 vs Vdiode.png');


%%%%%%%%%%%%%%%%%
% Compute results
%%%%%%%%%%%%%%%%%

f = figure;

res_vth0 = radfet_vth(komora24h64radfet.Vth0(30:end)) - polyval(polynomials.vth0, radfet_vdiode(komora24h64radfet.Temperature(30:end)));
mean_vth0 = mean(res_vth0);
std_vth0 = std(res_vth0);

plot(res_vth0);
hold on;

res_dose_vth0 = to_dose(res_vth0);
mean_dose_vth0 = mean(res_dose_vth0);
std_dose_vth0 = std(res_dose_vth0);

for i = 1:numel(all_data_from_space)
    res_vth0 = all_data_from_space{i}{1}.Vth0 - polyval(polynomials.vth0, all_data_from_space{i}{1}.Vdiode);
    mean_vth0(i+1) = mean(res_vth0);
    std_vth0(i+1) = std(res_vth0);
    plot(res_vth0);
    
    res_dose_vth0 = to_dose(res_vth0);
    mean_dose_vth0(i+1) = mean(res_dose_vth0);
    std_dose_vth0(i+1) =  std(res_dose_vth0);
end

xlabel('Sample no.');
ylabel('Vth0 (mV)');
grid on;
title('Vth0 vs. sample - temperature compensated');
saveas(f, 'outputs/Vth0 vs. sample - temperature compensated.png');

%%%%%%%%%%%%%%%%%%%%%

f = figure;

res_vth1 = radfet_vth(komora24h64radfet.Vth1(30:end)) - polyval(polynomials.vth1, radfet_vdiode(komora24h64radfet.Temperature(30:end)));
mean_vth1 = mean(res_vth1);
std_vth1 = std(res_vth1);

plot(res_vth1);
hold on;

res_dose_vth1 = to_dose(res_vth1);
mean_dose_vth1 = mean(res_dose_vth1);
std_dose_vth1 = std(res_dose_vth1);

for i = 1:numel(all_data_from_space)
    res_vth1 = all_data_from_space{i}{1}.Vth1 - polyval(polynomials.vth1, all_data_from_space{i}{1}.Vdiode);
    mean_vth1(i+1) = mean(res_vth1);
    std_vth1(i+1) = std(res_vth1);
    
    plot(res_vth1);
    
    res_dose_vth1 = to_dose(res_vth1);
    mean_dose_vth1(i+1) = mean(res_dose_vth1);
    std_dose_vth1(i+1) =  std(res_dose_vth1);
end

xlabel('Sample no.');
ylabel('Vth1 (mV)');
grid on;
title('Vth1 vs. sample - temperature compensated');
saveas(f, 'outputs/Vth1 vs. sample - temperature compensated.png');

%%%%%%%%%%%%%%%%%

f = figure;

res_vth2 = radfet_vth(komora24h64radfet.Vth2(30:end)) - polyval(polynomials.vth2, radfet_vdiode(komora24h64radfet.Temperature(30:end)));
mean_vth2 = mean(res_vth2);
std_vth2 = std(res_vth2);

plot(res_vth2);
hold on;

res_dose_vth2 = to_dose(res_vth2);
mean_dose_vth2 = mean(res_dose_vth2);
std_dose_vth2 = std(res_dose_vth2);

for i = 1:numel(all_data_from_space)
    res_vth2 = all_data_from_space{i}{1}.Vth2 - polyval(polynomials.vth2, all_data_from_space{i}{1}.Vdiode);
    mean_vth2(i+1) = mean(res_vth2);
    std_vth2(i+1) = std(res_vth2);
    
    plot(res_vth2);
    
    res_dose_vth2 = to_dose(res_vth2);
    mean_dose_vth2(i+1) = mean(res_dose_vth2);
    std_dose_vth2(i+1) =  std(res_dose_vth2);
end

xlabel('Sample no.');
ylabel('Vth1 (mV)');
grid on;
title('Vth2 vs. sample - temperature compensated');
saveas(f, 'outputs/Vth2 vs. sample - temperature compensated.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_dose_vth0, 3*std_dose_vth0, 'o');
lf_vth0 = fit(experiment_days', mean_dose_vth0', 'poly3', 'Lower', [-Inf 0], 'Upper', [Inf 0]);
hold on;
plot(lf_vth0, 'b--');
xlabel('Days in orbit');
ylabel('Vth0 dose [mGy]');
legend("Vth0 Measurement", "Vth0 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth0 dose vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_dose_vth1, 3*std_dose_vth1, 'o');
lf_vth1 = fit(experiment_days', mean_dose_vth1', 'poly3', 'Lower', [-Inf 0], 'Upper', [Inf 0]);
hold on;
plot(lf_vth1, 'b--');
xlabel('Days in orbit');
ylabel('Vth1 dose [mGy]');
legend("Vth1 Measurement", "Vth1 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth1 dose vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_dose_vth2, 3*std_dose_vth2, 'o');
lf_vth2 = fit(experiment_days', mean_dose_vth2', 'poly3', 'Lower', [-Inf 0], 'Upper', [Inf 0]);
hold on;
plot(lf_vth2, 'b--');
xlabel('Days in orbit');
ylabel('Vth2 dose [mGy]');
legend("Vth2 Measurement", "Vth2 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth2 dose vs. time in orbit.png');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_dose_vth0, 3*std_dose_vth0, '.');
hold on;
plot(lf_vth0, 'b--');

errorbar(experiment_days, mean_dose_vth1, 3*std_dose_vth1, '.');
plot(lf_vth1, 'r--');

errorbar(experiment_days, mean_dose_vth2, 3*std_dose_vth2, 'm.');
plot(lf_vth2, 'm--');

xlabel('Days in orbit');
ylabel('Dose [mGy]');
legend("Vth0 Measurement", "Vth0 poly3 fit", "Vth2 Measurement", "Vth1 poly3 fit", "Vth1 Measurement", "Vth2 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/All doses vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth0, 3*std_vth0, 'o');
lf_vth0 = fit(experiment_days', mean_vth0', 'poly3', 'Lower', [-Inf 0], 'Upper', [Inf 0]);
hold on;
plot(lf_vth0, 'b--');
xlabel('Days in orbit');
ylabel('Vth0 change [mV]');
legend("Vth0 Measurement", "Vth0 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth0 vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth1, 3*std_vth1, 'o');
lf_vth1 = fit(experiment_days', mean_vth1', 'poly3', 'Lower', [-Inf 0], 'Upper', [Inf 0]);
hold on;
plot(lf_vth1, 'b--');
xlabel('Days in orbit');
ylabel('Vth1 change [mV]');
legend("Vth1 Measurement", "Vth1 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth1 vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth2, 3*std_vth2, 'o');
lf_vth2 = fit(experiment_days', mean_vth2', 'poly3', 'Lower', [-Inf 0], 'Upper', [Inf 0]);
hold on;
plot(lf_vth2, 'b--');
xlabel('Days in orbit');
ylabel('Vth2 change [mV]');
legend("Vth2 Measurement", "Vth2 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth2 vs. time in orbit.png');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth0, 3*std_vth0, '.');
hold on;
plot(lf_vth0, 'b--');

errorbar(experiment_days, mean_vth1, 3*std_vth1, '.');
plot(lf_vth1, 'r--');

errorbar(experiment_days, mean_vth2, 3*std_vth2, 'm.');
plot(lf_vth2, 'm--');

xlabel('Days in orbit');
ylabel('Vth change [mV]');
legend("Vth0 Measurement", "Vth0 poly3 fit", "Vth2 Measurement", "Vth1 poly3 fit", "Vth1 Measurement", "Vth2 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/All Vth changes vs. time in orbit.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(altitute_exp_days, mean_vth0, 3*std_vth0, '.');
hold on;
plot(lf_vth0, 'b--');

errorbar(altitute_exp_days, mean_vth1, 3*std_vth1, '.');
plot(lf_vth1, 'r--');

errorbar(altitute_exp_days, mean_vth2, 3*std_vth2, 'm.');
plot(lf_vth2, 'm--');

xlabel('Days in orbit');
ylabel('Vth change [mV]');
legend("Vth0 Measurement", "Vth0 poly3 fit", "Vth2 Measurement", "Vth1 poly3 fit", "Vth1 Measurement", "Vth2 poly3 fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/All Vth changes vs. time in orbit.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

