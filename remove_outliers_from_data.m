clear all
close all

PLOT_ERRORS = false;

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




all_data = {
            {radfet35converted, 'radfet35'}
            };
        
        
for i = 1:numel(all_data)
  radfet = all_data{i}{1};

    for j=1:10
        p = polyfit(radfet.Vth0, radfet.Vdiode, 2);
        y1 = polyval(p, radfet.Vth0);
        error = radfet.Vdiode - y1;
        abs_error = abs(error);

        if max(abs_error./radfet.Vdiode) < 1e-3
            break
        end

        std_error = std(error);

        radfet(abs_error > std_error, :) = [];

        if PLOT_ERRORS
            figure();
            plot(abs_error, '*-');
            hold on;
            plot([0, 120], [std_error, std_error], '-')
        end

    end

    assignin('base', strcat(all_data{i}{2}, 'converted'), radfet)
    save(strcat('parsed_data\wo_outliers\', all_data{i}{2}, '.mat'), strcat(all_data{i}{2}, 'converted'));
    figure();
    plot(radfet.Vth0, radfet.Vdiode, '*');
    hold on;
    plot(radfet.Vth0, polyval(p, radfet.Vth0), '-');

end
