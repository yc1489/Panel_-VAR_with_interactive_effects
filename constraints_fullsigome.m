function [c,ceq]=constraints_fullsigome(theta_ML_j)

%m=1;
Phi=[theta_ML_j(1,1),theta_ML_j(2,1) ;theta_ML_j(3,1),theta_ML_j(4,1) ];
c1= max(abs(eig(Phi)))-0.999; 

 

omega1=[theta_ML_j(5,1), theta_ML_j(7,1); theta_ML_j(7,1), theta_ML_j(6,1)];
Sigmae1=[theta_ML_j(8,1), theta_ML_j(10,1); theta_ML_j(10,1), theta_ML_j(9,1)];

c2=0.0001-min(eig(Sigmae1));      % sig2
c3=0.0001-min(eig(omega1));  
%c3= 0.001-min(eig(pinv(Sigmae1)*omega1-eye(m+1) ));   % ome
%psi1=((Sigmae1)^(-1))*omega1;
%c3= 0.001-min(eig(psi1-eye(m+1) ));   % ome



%T1=6;
%m=1;
%Omega=2*eye(T1+1)+diag(-1*ones((T1),1),1)+diag(-1*ones((T1),1),-1);
%BigOmega=kron(Omega,eye(m+1));
%BigOmega(1:m+1,1:m+1)=psi1;
%c4=0.001-min(eig(BigOmega));
%SigmaE=kron(Omega,Sigmae1);
%SigmaE(1:m+1,1:m+1)=Psi ;
%c5=min(eig(SigmaE))-0.999;  

c=[c1,c2,c3];

ceq=[];