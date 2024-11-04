clear;

%% initial definition
frequencySampling = 2^6;
frequencyFundamental = 2*pi;

tEnd = 4;
t = linspace(0,tEnd,frequencySampling-1);

signal1 = sin(t*frequencyFundamental).*(t<1);
signal2 = sin(t*frequencyFundamental+pi).*(t>0.5 & t<1.5);

%% solution

byXcorr = xcorr(signal1(1:0.5*frequencySampling),signal2(1:0.5*frequencySampling));
byFxcorr = fxcorr(signal1(1:0.5*frequencySampling),signal2(1:0.5*frequencySampling));

%% figure
figure;
subplot(4,1,1)
plot(t,signal1,'k','LineWidth',1.5);grid on
ylabel('signal_1')

subplot(4,1,2)
plot(t,signal2,'k','LineWidth',1.5);grid on
ylabel('signal_2');

subplot(4,1,3)
plot(t,byXcorr,'k','LineWidth',1.5);grid on
ylabel('Xcorr');

subplot(4,1,4)
plot(t,byFxcorr,'k','LineWidth',1.5);grid on
ylabel('FFT+conj');
xlabel('t')