% Potential analysis for Nexp

% Initialization of the workspace
clear;

close all;

addpath pot

% Load data file

load('Data_positions_Fig9_1P4_S.mat');

%Vx=Vx*Sdx;

kb=1.38064852e-23;
P=100; %number of bins of the histogram, if not set default is 50
subs=1; %use a subsampled data set

%linear fit
[k_pot_lf, Ek_pot_lf, x_alpha_lf, mrho_lf, delta_rho_lf, mU_lf, delta_Ulf, rho0_lf, x_eq_lf]=pot_lfit(x(1:subs:size(x,1),:),T,P);

%non-linear fit
[k_potnnl, Ek_potmnl, x_alpha_nf, mrho_nl, delta_rho_nl, mU_nl, delta_U_nl, rho0_nl, x_eq_nl]=pot_nlfit(x(1:subs:size(x,1),:),T,P);

