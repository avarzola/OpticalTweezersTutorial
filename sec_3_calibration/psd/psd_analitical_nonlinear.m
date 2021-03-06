% PSD analysis for Nexp

% Initialization of the workspace
clear all;

close all;

addpath ../data/
addpath ../statistics_func/


% Load data file


load('Data_x_positions_Exp_I.mat')

gamma=6*pi*eta*a;

kb=1.38064852e-23;

D0=kb*T/gamma;

subs=1; %use a subsampled data set

nw=round(size(x(1:subs:end,:),1)/500);
%%ANALITICAL FIT

[fc_psd,D_psd,sigma_fc_psd,sigma_D_psd,f,XX,fw_mean,Pk,fcut,h]=psdfit_analytic(x(1:subs:end,:),dt*subs,nw,1/4);
%%

Dm_psd=mean(D_psd);
sigma_Dm_psd=std(D_psd);

gamma_psd=kb*T./Dm_psd;
sigma_gamma_psd=kb*T./(Dm_psd^2)*sigma_Dm_psd;
fcm_psd=mean(fc_psd);
sigma_fcm_psd=std(fc_psd);
% estimation of k using the estimated gamma
k_psd=2*pi*gamma_psd*fcm_psd;

sigma_k_psd=2*pi*(gamma_psd*sigma_fcm_psd+fcm_psd*sigma_gamma_psd);

disp('................')
disp('PSD analitycal solution')



disp(['k_psd: ' num2str(k_psd*1e6) '+-' num2str(sigma_k_psd*1e6) 'pN/um'])
[v1, dv1, sig]=round_significance(k_psd*1e6, sigma_k_psd*1e6);



disp(['gamma_psd:' num2str(gamma_psd*1e9) '+-'  num2str(sigma_gamma_psd*1e9) ' pN ms/um ']);
[v1, dv1, sig]=round_significance(gamma_psd*1e9, sigma_gamma_psd*1e9);



disp(['D_psd: ' num2str(mean(Dm_psd)*1e12) '+-' num2str(mean(Dm_psd)*1e12) ' um^2/s'])
[v1, dv1, sig]=round_significance(mean(Dm_psd)*1e12, sigma_Dm_psd*1e12);



[v1, dv1, sig]=round_significance(fcm_psd, sigma_fcm_psd);




%%


load('Data_x_positions_Exp_II.mat')

gamma=6*pi*eta*a;

kb=1.38064852e-23;

D0=kb*T/gamma;

subs=1; %use a subsampled data set

nw=round(size(x(1:subs:end,:),1)/500);
%%ANALITICAL FIT

[fc_psd,D_psd,sigma_fc_psd,sigma_D_psd,f,XX,fw_mean,Pk,fcut,h]=psdfit_analytic(x(1:subs:end,:),dt*subs,nw,1/4);
%%

Dm_psd=mean(D_psd);
sigma_Dm_psd=std(D_psd);

gamma_psd=kb*T./Dm_psd;
sigma_gamma_psd=kb*T./(Dm_psd^2)*sigma_Dm_psd;
fcm_psd=mean(fc_psd);
sigma_fcm_psd=std(fc_psd);
% estimation of k using the estimated gamma
k_psd=2*pi*gamma_psd*fcm_psd;

sigma_k_psd=2*pi*(gamma_psd*sigma_fcm_psd+fcm_psd*sigma_gamma_psd);

disp('................')
disp('PSD analitycal solution')


disp(['k_psd: ' num2str(k_psd*1e6) '+-' num2str(sigma_k_psd*1e6) 'pN/um'])
[v1, dv1, sig]=round_significance(k_psd*1e6, sigma_k_psd*1e6);



disp(['gamma_psd:' num2str(gamma_psd*1e9) '+-'  num2str(sigma_gamma_psd*1e9) ' pN ms/um ']);
[v1, dv1, sig]=round_significance(gamma_psd*1e9, sigma_gamma_psd*1e9);



disp(['D_psd: ' num2str(mean(Dm_psd)*1e12) '+-' num2str(mean(Dm_psd)*1e12) ' um^2/s'])
[v1, dv1, sig]=round_significance(mean(Dm_psd)*1e12, sigma_Dm_psd*1e12);




[v1, dv1, sig]=round_significance(fcm_psd, sigma_fcm_psd);



%%

load('Data_x_positions_Exp_III.mat')

gamma=6*pi*eta*a;

kb=1.38064852e-23;

D0=kb*T/gamma;

subs=1; %use a subsampled data set

nw=round(size(x(1:subs:end,:),1)/500);
%%ANALITICAL FIT

[fc_psd,D_psd,sigma_fc_psd,sigma_D_psd,f,XX,fw_mean,Pk,fcut,h]=psdfit_analytic(x(1:subs:end,:),dt*subs,nw,1/4);
%%

Dm_psd=mean(D_psd);
sigma_Dm_psd=std(D_psd);

gamma_psd=kb*T./Dm_psd;
sigma_gamma_psd=kb*T./(Dm_psd^2)*sigma_Dm_psd;
fcm_psd=mean(fc_psd);
sigma_fcm_psd=std(fc_psd);
% estimation of k using the estimated gamma
k_psd=2*pi*gamma_psd*fcm_psd;

sigma_k_psd=2*pi*(gamma_psd*sigma_fcm_psd+fcm_psd*sigma_gamma_psd);

disp('................')
disp('PSD analitycal solution')



disp(['k_psd: ' num2str(k_psd*1e6) '+-' num2str(sigma_k_psd*1e6) 'pN/um'])
[v1, dv1, sig]=round_significance(k_psd*1e6, sigma_k_psd*1e6);



disp(['gamma_psd:' num2str(gamma_psd*1e9) '+-'  num2str(sigma_gamma_psd*1e9) ' pN ms/um ']);
[v1, dv1, sig]=round_significance(gamma_psd*1e9, sigma_gamma_psd*1e9);



disp(['D_psd: ' num2str(mean(Dm_psd)*1e12) '+-' num2str(mean(Dm_psd)*1e12) ' um^2/s'])
[v1, dv1, sig]=round_significance(mean(Dm_psd)*1e12, sigma_Dm_psd*1e12);




[v1, dv1, sig]=round_significance(fcm_psd, sigma_fcm_psd);



