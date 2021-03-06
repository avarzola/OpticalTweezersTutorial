function [k_acf, sigma_k_acf, D_acf, sigma_D_acf, gamma_acf, sigma_gamma_acf, tau, mc, Ec, indc, tau0_acf, sigma_tau0_acf, c0_exp]=acf_nlfit(Vx,T,dt)
%function [k_acf, Ek_acf, D_acf, ED_acf, tau, mc, Ec]=acf_nlfit(Vx,T,dt)
% ACF_NLFIT   1D implementation of the AUTOCORRELATION ANALYSIS METHOD
% USING NON LINEAR FITTING

Vx = Vx - repmat(mean(Vx),size(Vx,1),1);

kb=1.38064852e-23;

[N,Nexp]=size(Vx);

tau=(0:N-1)*dt;

for j=1:Nexp 
    x=Vx(:,j);
    c=xcorr(x,'Unbiased');
    c=c(N:end);
    acf(j,:)=c;
end

mc=mean(acf,1);

Ec=std(acf,[],1);

% first approximation to define the starting points and the significative
% points in the fitting

c0_exp=mc(1); %amplitude

ctau=c0_exp*exp(-1); 

dc=mc-ctau;

%find the characteristic time

ind=find(dc(1:end-1).*dc(2:end)<0);

tau0=tau(ind(1));

ntaus=2.5;

indc=ntaus*ind; % consider only ntaus times the characteristic time in the fitting

tau_cut=tau(1:indc);

mc_cut=mc(1:indc);

Ec_cut=Ec(1:indc);
acf_cut=acf(:, 1:indc);

max_tau=max(tau_cut);

max_mc=max(mc_cut);



guess=[c0_exp/max_mc,tau0/max_tau];
[params, sigma, ~, ~] = wlsice(tau_cut/max_tau, abs(acf_cut/max_mc), guess, 2);

tau0_acf=params(2)*max_tau;
sigma_tau0_acf=sigma(2)*max_tau;

c0_exp=params(1)*max_mc;
sigma_c0_exp=sigma(1)*max_mc;

k_acf=(kb*T)/c0_exp;
sigma_k_acf=(kb*T/(c0_exp^2))*sigma_c0_exp;

gamma_acf=k_acf*tau0_acf;
sigma_gamma_acf=k_acf*sigma_tau0_acf+sigma_k_acf*tau0_acf;

D_acf=kb*T/gamma_acf;
sigma_D_acf=(kb*T/(gamma_acf^2))*sigma_gamma_acf;


end

