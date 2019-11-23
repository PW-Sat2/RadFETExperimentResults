close all;
clear all;

% Earth-calibration data
load('parsed_data\komora_24h-6-4_radfet.mat');

% Data from orbit
load('parsed_data\selected\radfet1.mat');
load('parsed_data\selected\radfet2.mat');
load('parsed_data\selected\radfet3.mat');
load('parsed_data\selected\radfet4.mat');
load('parsed_data\selected\radfet5.mat');
load('parsed_data\selected\radfet6.mat');
load('parsed_data\selected\radfet7.mat');
load('parsed_data\selected\radfet8.mat');
load('parsed_data\selected\radfet9.mat');
load('parsed_data\selected\radfet10.mat');
load('parsed_data\selected\radfet11.mat');
load('parsed_data\selected\radfet12.mat');
load('parsed_data\selected\radfet13.mat');
load('parsed_data\selected\radfet14.mat');
load('parsed_data\selected\radfet15.mat');
load('parsed_data\selected\radfet16.mat');
load('parsed_data\selected\radfet17.mat');
load('parsed_data\selected\radfet18.mat');
load('parsed_data\selected\radfet19.mat');
load('parsed_data\selected\radfet20.mat');
load('parsed_data\selected\radfet21.mat');
load('parsed_data\selected\radfet22.mat');
load('parsed_data\selected\radfet23.mat');
load('parsed_data\selected\radfet24.mat');
load('parsed_data\selected\radfet25.mat');
load('parsed_data\selected\radfet26.mat');


all_data = {radfet1converted,...
            radfet2converted,...
            radfet3converted,...
            radfet4converted,...
            radfet5converted,...
            radfet6converted,...
            radfet7converted,...
            radfet8converted,...
            radfet9converted,...
            radfet10converted,...
            radfet11converted,...
            radfet12converted,...
            radfet13converted,...
            radfet14converted,...
            radfet15converted,...
            radfet16converted,...
            radfet17converted,...            
            radfet18converted,...
            radfet19converted,...
            radfet20converted,...
            radfet21converted,...
            radfet22converted,...
            radfet23converted,...
            radfet24converted,...
            radfet25converted,...
            radfet26converted};

readout_dates = {"2018-12-04 00:00:00",...
                 "2018-12-11 09:03:00",...
                 "2018-12-15 09:26:09",...
                 "2018-12-17 09:37:43",...
                 "2018-12-19 09:49:15",...
                 "2018-12-20 20:49:42",...
                 "2018-12-23 10:12:17",...
                 "2018-12-24 19:38:54",...
                 "2019-02-21 10:40:03",...
                 "2019-03-02 11:20:32",...
                 "2019-04-06 09:52:24",...
                 "2019-04-20 10:36:13",...
                 "2019-05-04 22:08:01",...
                 "2019-05-18 10:13:01",...
                 "2019-06-01 12:14:26",...
                 "2019-06-15 12:36:10",...
                 "2019-06-29 12:53:16",...
                 "2019-07-13 20:50:00",...
                 "2019-07-27 20:58:59",...
                 "2019-08-10 10:11:24",...
                 "2019-08-24 10:12:38",...
                 "2019-09-07 11:45:29",...
                 "2019-09-20 20:55:47",...
                 "2019-10-05 11:24:33",...
                 "2019-10-26 21:43:58",...
                 "2019-11-08 21:48:57",...
                 "2019-11-22 21:12:37",...
                 };


polynomials = struct('vth0', [-3.29685E-4, 0.48969, 1872.79214],...
                     'vth1', [-3.24006E-4, 0.4812, 1868.10494],...
                     'vth2', [-3.30617E-4, 0.49363, 1873.65098]);
             
parse_date_string = @(x) datetime(x, 'InputFormat','yyyy-MM-dd HH:mm:ss');
radfet_vdiode = @(x) x/2*2500.0/(2^24);
radfet_vth = @(x) x*2500.0/(2^24);
to_dose = @(x) x/5*1000;

experiment_time = duration();
experiment_days = [];
legend_items = {};
for i = 1:numel(readout_dates)
  timedelta = parse_date_string(readout_dates{i}) - parse_date_string(readout_dates{1});
  experiment_time(i) = timedelta;
  experiment_days(i) = days(timedelta);
  legend_items{i} = strcat(num2str(days(timedelta)), " days");
end


%%%%%%%%%%%%%%%%%
% Vdiode vs. Vth0
%%%%%%%%%%%%%%%%%

f = figure;
plot(radfet_vdiode(komora24h64radfet.Temperature(30:end)), radfet_vth(komora24h64radfet.Vth0(30:end)));
hold on;

for i = 1:numel(all_data)
  data = all_data{i};
  plot(data.Vdiode, data.Vth0);
end

legend(legend_items, 'Location', 'Best');
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

for i = 1:numel(all_data)
  data = all_data{i};
  plot(data.Vdiode, data.Vth1);
end

legend(legend_items, 'Location', 'Best');
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

for i = 1:numel(all_data)
  data = all_data{i};
  plot(data.Vdiode, data.Vth2 );
end

legend(legend_items, 'Location', 'Best');
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

for i = 1:numel(all_data)
    res_vth0 = all_data{i}.Vth0 - polyval(polynomials.vth0, all_data{i}.Vdiode);
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

for i = 1:numel(all_data)
    res_vth1 = all_data{i}.Vth1 - polyval(polynomials.vth1, all_data{i}.Vdiode);
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

for i = 1:numel(all_data)
    res_vth2 = all_data{i}.Vth2 - polyval(polynomials.vth2, all_data{i}.Vdiode);
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
lf_vth0 = fit(experiment_days', mean_dose_vth0', 'poly1');
hold on;
plot(lf_vth0, 'b--');
xlabel('Days in orbit');
ylabel('Vth0 dose [mGy]');
legend("Vth0 Measurement", "Vth0 Linear fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth0 dose vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_dose_vth1, 3*std_dose_vth1, 'o');
lf_vth1 = fit(experiment_days', mean_dose_vth1', 'poly1');
hold on;
plot(lf_vth1, 'b--');
xlabel('Days in orbit');
ylabel('Vth1 dose [mGy]');
legend("Vth1 Measurement", "Vth1 Linear fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth1 dose vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_dose_vth2, 3*std_dose_vth2, 'o');
lf_vth2 = fit(experiment_days', mean_dose_vth2', 'poly1');
hold on;
plot(lf_vth2, 'b--');
xlabel('Days in orbit');
ylabel('Vth2 dose [mGy]');
legend("Vth2 Measurement", "Vth2 Linear fit", 'Location', 'Best');
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
legend("Vth0 Measurement", "Vth0 Linear fit", "Vth2 Measurement", "Vth1 Linear fit", "Vth1 Measurement", "Vth2 Linear fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/All doses vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth0, 3*std_vth0, 'o');
lf_vth0 = fit(experiment_days', mean_vth0', 'poly1');
hold on;
plot(lf_vth0, 'b--');
xlabel('Days in orbit');
ylabel('Vth0 change [mV]');
legend("Vth0 Measurement", "Vth0 Linear fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth0 vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth1, 3*std_vth1, 'o');
lf_vth1 = fit(experiment_days', mean_vth1', 'poly1');
hold on;
plot(lf_vth1, 'b--');
xlabel('Days in orbit');
ylabel('Vth1 change [mV]');
legend("Vth1 Measurement", "Vth1 Linear fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/Vth1 vs. time in orbit.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vth change vs. days in orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = figure;
errorbar(experiment_days, mean_vth2, 3*std_vth2, 'o');
lf_vth2 = fit(experiment_days', mean_vth2', 'poly1');
hold on;
plot(lf_vth2, 'b--');
xlabel('Days in orbit');
ylabel('Vth2 change [mV]');
legend("Vth2 Measurement", "Vth2 Linear fit", 'Location', 'Best');
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
legend("Vth0 Measurement", "Vth0 Linear fit", "Vth2 Measurement", "Vth1 Linear fit", "Vth1 Measurement", "Vth2 Linear fit", 'Location', 'Best');
grid on;
saveas(f, 'outputs/All Vth changes vs. time in orbit.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


