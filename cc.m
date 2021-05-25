DataTable = readtable('Data_IER.csv');  %Read the provided table data
stepapp = DataTable(:, [29:35])         %Steps data from smartphone app
stepomron = DataTable(:, [43 47 51 55 59 63 67])  %Steps data from OMRON 
ipaq1 = DataTable(:, 19)        %IPAQ data prior to measurement
ipaq2 = DataTable(:, 94)        %IPAQ data after the measurement
bmi = DataTable(:,4)            %BMI data
stepapp = table2array(stepapp)     %Changing Tables to arrays to make them
stepomron = table2array(stepomron) %readable for statistical test functions
ipaq1 = table2array(ipaq1)
ipaq1 = ipaq1.'
ipaq2 = table2array(ipaq2)
ipaq2 = ipaq2.'
bmi = table2array(bmi)
bmi = bmi.'
stepappavg = nanmean(stepapp.')    %7-day avarage of the App Step Data 
stepomronavg = nanmean(stepomron.') %7-day avarage of OMRON Step Data 

%Make a reduced table with the relevant variables
relevant = [DataTable(:, [1 2 5]) array2table([stepappavg.' stepomronavg.' ipaq2.' ipaq1.' bmi.'])]

%Make sorted data lists for further analysis
data2019= relevant(1:94,:)         %Separate the data from 2019
data2020 = relevant(95:193,:)       %Separate the data from 2020
living2019 = sortrows(data2019,3)   %Sort rows for each year by living situation
living2020 = sortrows(data2020,3)   

parents2019 = living2019(1:50,:)    %list of students living with parants in 2019
alonepeers2019 = living2019(51:94,:)%list of students living alone/with peers in 2019
parents2020 = living2020(1:58,:)    %list of students living with parants in 2020
alonepeers2020 = living2020(59:99,:)%list of students living alone/with peers in 2019


%% 
%Plot the figure with tesing the hypotheses of the overall decrease from
%before to during the lockdown
figure(1)
%OMRON

u1= table2array(living2019(:,5))
v1 = table2array(living2020(:,5))
group = [ ones(size(v1)); 2 * ones(size(u1))];
subplot(5,1,1);
boxplot([u1; v1],group)
title('a. Overall Steps Distribution OMRON')
set(gca,'XTickLabel',{'2019','2020'})
set(gcf,'color','w');
%THIS BOXPLOT RESEMBLED NORMAL DISTRIBUTION
[h1,p1,ci1,stats1] = ttest2(u1,v1)
meanOMRON19 = mean(u1,'omitnan')
stdOMRON19 = std(u1,'omitnan')
meanOMRON20 = mean(v1,'omitnan')
stdOMRON20 = std(v1,'omitnan')
%APP
u2= table2array(living2019(:,4))
v2 = table2array(living2020(:,4))
group = [ ones(size(v2)); 2 * ones(size(u2))];
subplot(5,1,2);
boxplot([u2; v2],group)
title('b. Overall Steps Distribution APP')
set(gca,'XTickLabel',{'2019','2020'})
set(gcf,'color','w');
%THIS BOXPLOT RESEMBLED NORMAL DISTRIBUTION
[h2,p2,ci2,stats2] = ttest2(u2,v2)
meanAPP19 = mean(u2,'omitnan')
stdAPP19 = std(u2,'omitnan')
meanAPP20 = mean(v2,'omitnan')
stdAPP20 = std(v2,'omitnan')
%IPAQ1
u3= table2array(living2019(:,7))
v3 = table2array(living2020(:,7))
group = [ ones(size(v3)); 2 * ones(size(u3))];
subplot(5,1,3);
boxplot([u3; v3],group)
title('c. Overall Distribution IPAQ1')
set(gca,'XTickLabel',{'2019','2020'})
set(gcf,'color','w');
%THIS BOXPLOT RESEMBLED NORMAL DISTRIBUTION
[h3,p3,ci3,stats3] = ttest2(u3,v3)
meanIPAQ119 = mean(u3,'omitnan')
stdIPAQ119 = std(u3,'omitnan')
meanIPAQ120 = mean(v3,'omitnan')
stdIPAQ120 = std(v3,'omitnan')

%IPAQ2
u4= table2array(living2019(:,6))
v4 = table2array(living2020(:,6))
group = [ ones(size(v4)); 2 * ones(size(u4))];
subplot(5,1,4);
boxplot([u4; v4],group)
title('d. Overall Distribution IPAQ2')
set(gca,'XTickLabel',{'2019','2020'})
set(gcf,'color','w');
%THIS BOXPLOT RESEMBLED NORMAL DISTRIBUTION
[h4,p4,ci4,stats4] = ttest2(u4,v4)
meanIPAQ219 = mean(u4,'omitnan')
stdIPAQ219 = std(u4,'omitnan')
meanIPAQ220 = mean(v4,'omitnan')
stdIPAQ220 = std(v4,'omitnan')

%BMI
u5= table2array(living2019(:,8))
v5 = table2array(living2020(:,8))
group = [ ones(size(v5)); 2 * ones(size(u5))];
subplot(5,1,5);
boxplot([u5; v5],group)
title('d. Overall Distribution BMI')
set(gca,'XTickLabel',{'2019','2020'})
set(gcf,'color','w');
%THIS BOXPLOT RESEMBLED NORMAL DISTRIBUTION
[h5,p5,ci5,stats5] = ttest2(u5,v5)
meanBMI19 = mean(u5,'omitnan')
stdBMI19 = std(u5,'omitnan')
meanBMI20 = mean(v5,'omitnan')
stdBMI20 = std(v5,'omitnan')
