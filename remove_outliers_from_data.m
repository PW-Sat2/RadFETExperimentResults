clear all
close all

PLOT_ERRORS = true;

% Data from orbit
load('parsed_data\radfet_1_converted.mat');
load('parsed_data\radfet_2_converted.mat');
load('parsed_data\radfet_3_converted.mat');
load('parsed_data\radfet_4_converted.mat');
load('parsed_data\radfet_5_converted.mat');
load('parsed_data\radfet_6_converted.mat');
load('parsed_data\radfet_7_converted.mat');
load('parsed_data\radfet_8_converted.mat');
%load('parsed_data\radfet_9_converted.mat');
load('parsed_data\radfet_10_converted.mat');
load('parsed_data\radfet_11_converted.mat');
%load('parsed_data\radfet_12_converted.mat');
load('parsed_data\radfet_13_converted.mat');
%load('parsed_data\radfet_14_converted.mat');
load('parsed_data\radfet_15_converted.mat');
load('parsed_data\radfet_16_converted.mat');
load('parsed_data\radfet_17_converted.mat');
load('parsed_data\radfet_18_converted.mat');
load('parsed_data\radfet_19_converted.mat');
load('parsed_data\radfet_20_converted.mat');
load('parsed_data\radfet_21_converted.mat');
load('parsed_data\radfet_22_converted.mat');
load('parsed_data\radfet_23_converted.mat');
%load('parsed_data\radfet_24_converted.mat');
load('parsed_data\radfet_25_converted.mat');
load('parsed_data\radfet_26_converted.mat');
%load('parsed_data\radfet_27_converted.mat');
load('parsed_data\radfet_28_converted.mat');
load('parsed_data\radfet_29_converted.mat');
load('parsed_data\radfet_30_converted.mat');
load('parsed_data\radfet_31_converted.mat');
load('parsed_data\radfet_32_converted.mat');
load('parsed_data\radfet_33_converted.mat');
load('parsed_data\radfet_34_converted.mat');
load('parsed_data\radfet_35_converted.mat');
load('parsed_data\radfet_36_converted.mat');
load('parsed_data\radfet_37_converted.mat');
load('parsed_data\radfet_38_converted.mat');
load('parsed_data\radfet_39_converted.mat');
load('parsed_data\radfet_40_converted.mat');
load('parsed_data\radfet_41_converted.mat');
load('parsed_data\radfet_42_converted.mat');
load('parsed_data\radfet_45_converted.mat');
load('parsed_data\radfet_46_converted.mat');
load('parsed_data\radfet_47_converted.mat');
load('parsed_data\radfet_48_converted.mat');


all_data = {
%     {radfet1converted, 'radfet1'},...
%     {radfet2converted, 'radfet2'},...
%     {radfet3converted, 'radfet3'},...
%     {radfet4converted, 'radfet4'},...
%     {radfet5converted, 'radfet5'},...
%     {radfet6converted, 'radfet6'},...
%     {radfet7converted, 'radfet7'},...
%     {radfet8converted, 'radfet8'},...
%     {radfet10converted, 'radfet10'},...
%     {radfet11converted, 'radfet11'},...
%     {radfet13converted, 'radfet13'},...
%     {radfet15converted, 'radfet15'},...
%     {radfet16converted, 'radfet16'},...
%     {radfet17converted, 'radfet17'},...
%     {radfet18converted, 'radfet18'},...
%     {radfet19converted, 'radfet19'},...
%     {radfet20converted, 'radfet20'},...
%     {radfet21converted, 'radfet21'},...
%     {radfet22converted, 'radfet22'},...
%     {radfet23converted, 'radfet23'},...
%     {radfet25converted, 'radfet25'},...
%     {radfet26converted, 'radfet26'},...
%     {radfet28converted, 'radfet28'},...
%     {radfet29converted, 'radfet29'},...
%     {radfet30converted, 'radfet30'},...
%     {radfet31converted, 'radfet31'},...
%     {radfet32converted, 'radfet32'},...
%     {radfet33converted, 'radfet33'},...
%     {radfet34converted, 'radfet34'},...
%     {radfet35converted, 'radfet35'},...
%     {radfet36converted, 'radfet36'},...
%     {radfet37converted, 'radfet37'},...
%     {radfet38converted, 'radfet38'},...
%     {radfet39converted, 'radfet39'},...
%     {radfet40converted, 'radfet40'},...
%     {radfet41converted, 'radfet41'},...
%     {radfet45converted, 'radfet45'},...
%    {radfet46converted, 'radfet46'},...
%    {radfet47converted, 'radfet47'},...
    {radfet48converted, 'radfet48'}
    };
        
        
for i = 1:numel(all_data)
  radfet = all_data{i}{1};

    for j=1:10
        p = polyfit(radfet.Vth0, radfet.Vdiode, 2);
        y1 = polyval(p, radfet.Vth0);
        error = radfet.Vdiode - y1;
        abs_error = abs(error);

        if max(abs_error./radfet.Vdiode) < 3e-3
            break
        end

        std_error = std(error);

        radfet(abs_error > std_error, :) = [];

        if PLOT_ERRORS
            figure();
            plot(abs_error, '*-');
            hold on;
            plot([0, 120], [std_error, std_error], '-')
            size(radfet)
        end

    end

    assignin('base', strcat(all_data{i}{2}, 'converted'), radfet)
    save(strcat('parsed_data\wo_outliers\', all_data{i}{2}, '.mat'), strcat(all_data{i}{2}, 'converted'));
    figure();
    plot(radfet.Vth0, radfet.Vdiode, '*');
    hold on;
    plot(radfet.Vth0, polyval(p, radfet.Vth0), '-');

end
