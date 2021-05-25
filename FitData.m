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
%Plot the figure with all the boxplots of the hypotheses 
%from the research question 
%The order is random, as more data has been added later during the research
%The resulting figure gives an orderly representation 

%YEAR 2019
%OMRON DATA BOXPLOT

x1= table2array(parents2019(:,5))
y1 = table2array(alonepeers2019(:,5))
group = [ ones(size(x1)); 2 * ones(size(y1))];

figure(2)
subplot(5,2,3);
boxplot([x1; y1],group)
title('c. Steps Distribution OMRON 2019 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');
%THIS BOXPLOT RESEMBLED NORMAL DISTRIBUTION
[h1,p1,ci1,stats1] = ttest2(x1,y1)


%%
%APP DATA BOXPLOT 
x2= table2array(parents2019(:,4))
y2 = table2array(alonepeers2019(:,4))

%BOXPLOTS
group = [ ones(size(x2)); 2 * ones(size(y2))];

subplot(5,2,1);
boxplot([x2; y2],group)
title('a. Steps Distribution App 2019 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

%Omron Stepcount value test 2019 pars alone
[h2,p2,ci2,stats2] = ttest2(x2,y2)

%%
%IPAQ2 DATA 2019
x3= table2array(parents2019(:,6))
y3 = table2array(alonepeers2019(:,6))

group = [ ones(size(x3)); 2 * ones(size(y3))];

subplot(5,2,7);
boxplot([x3; y3],group)
title('g. IPAQ2 Score Distribution 2019 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');
%ipaq2 value test 2019 and 2020
%BOXPLOT SKEWED FROM NORMAL DISTRIBUTION
MEANparentsipaq2mean2019 = nanmean(x3)
MEANaloneipaq2mean2019 = nanmean(y3)
[p3,h3,stats3] = ranksum(x3,y3)


%% 
%IPAQ1 2019
x7= table2array(parents2019(:,7))
y7 = table2array(alonepeers2019(:,7))

group = [ ones(size(x7)); 2 * ones(size(y7))];

subplot(5,2,5);
boxplot([x7; y7],group)
title('e. IPAQ1 Score Distribution 2019 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');
%ipaq2 value test 2019 and 2020
MEANparentsipaq1mean2019 = nanmean(x7)
MEANaloneipaq1mean2019 = nanmean(y7)
[p7,h7,stats7] = ranksum(x7,y7)

%%
%YEAR 2020
%Smartphone App Steps 2020

x4= table2array(parents2020(:,5))
y4 = table2array(alonepeers2020(:,5))


group = [ ones(size(x4)); 2 * ones(size(y4))];

subplot(5,2,4);
boxplot([x4; y4],group)
title('d. Steps Distribution OMRON 2020')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

% NO NORMAL DISTIBUTION FROM BOXPLOT 
[p4,h4,stats4] = ranksum(x4,y4)

%%
% OMRON STEPS 2020
x5= table2array(parents2020(:,4))
y5 = table2array(alonepeers2020(:,4))

group = [ ones(size(x5)); 2 * ones(size(y5))];

subplot(5,2,2);
boxplot([x5; y5],group)
title('b. Steps Distribution App 2020')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

%NO NORMAL DISTIBUTION FROM BOXPLOT
[p5,h5,stats5] = ranksum(x5,y5)
%%

%IPAQ2 Distribution 2020
x6= table2array(parents2020(:,6))
y6 = table2array(alonepeers2020(:,6))
group = [ ones(size(x6)); 2 * ones(size(y6))];

subplot(5,2,8);
boxplot([x6; y6],group)
title('h. IPAQ2 Score Distribution 2020 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

YYYparentsipaq2mean2020 = nanmean(x6)
YYYaloneipaq2mean2020 = nanmean(y6)
[p6,h6,stats6] = ranksum(x6,y6)

%%
%IPAQ1 Distribution 2020
x8 = table2array(parents2020(:,7))
y8 = table2array(alonepeers2020(:,7))
group = [ ones(size(x8)); 2 * ones(size(y8))];

subplot(5,2,6);
boxplot([x8; y8],group)
title('f. IPAQ1 Score Distribution 2020 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

IPAQ1parentsmean2020 = nanmean(x8)
IPAQ1alonemean2020 = nanmean(y8)
[p8,h8,stats8] = ranksum(x8,y8)


%BMI Distribution 2020
x9 = table2array(parents2020(:,8))
y9 = table2array(alonepeers2020(:,8))
group = [ ones(size(x9)); 2 * ones(size(y9))];

subplot(5,2,10);
boxplot([x9; y9],group)
title('j. BMI Score Distribution 2020 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

MEANparentsipaq2mean2020 = nanmean(x9)
MEANaloneipaq2mean2020 = nanmean(y9)
[p9,h9,stats9] = ranksum(x9,y9)

%bmi Distribution 2019
x10 = table2array(parents2019(:,8))
y10 = table2array(alonepeers2019(:,8))
group = [ ones(size(x10)); 2 * ones(size(y10))];

subplot(5,2,9);
boxplot([x10; y10],group)
title('i. BMI Score Distribution 2019 ')
set(gca,'XTickLabel',{'Living with parents','Living alone/with peers'})
set(gcf,'color','w');

MEANparentsipaq2mean2020 = nanmean(x10)
MEANaloneipaq2mean2020 = nanmean(y10)
[p10,h10,stats10] = ranksum(x10,y10)

%%
%Comparing years
