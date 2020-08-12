% FIGURE8.M
% Gold Prices
clear;

trivar

% Compute structural shocks Ehat
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,:); q1=[(q1(1,1)+q1(1,2))/2 q1];
q2=Ehat(2,:); q2=[(q2(1,1)+q2(1,2))/2 q2];
q3=Ehat(3,:); q3=[(q3(1,1)+q3(1,2))/2 q3];

% Average monthly shocks by quarter
time=1979+1/4:1/4:2007+4/4;
for i=1:length(time)
   q1q(i)=(q1(3*(i-1)+1)+q1(3*(i-1)+2)+q1(3*(i-1)+3))/3;
   q2q(i)=(q2(3*(i-1)+1)+q2(3*(i-1)+2)+q2(3*(i-1)+3))/3;
   q3q(i)=(q3(3*(i-1)+1)+q3(3*(i-1)+2)+q3(3*(i-1)+3))/3;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Source: BEA website for real chained 2000 dollar GDP,74.IV-07.IV
load goldprices.txt; gold=goldprices(:,3); y=dif(log(gold))*400;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:12;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irf(y,q1q');
subplot(3,1,1)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-'); axis([0 12 -50 100])
ylabel('Gold Prices')
title('Crude Oil Supply Shock')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irf(y,q2q');
subplot(3,1,2)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); axis([0 12 -50 100])
ylabel('Gold Prices')
title('Aggregate Demand Shock')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irf(y,q3q');
subplot(3,1,3)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-'); axis([0 12 -50 100])
ylabel('Gold Prices')
title('Oil-Market Specific Demand Shock')
xlabel('Quarters')

