clear;clc;
%Inital conditions 
%The pedulum arm is made from aluminum
% pendulum arm: r=0.0125m
%               h=0.125m
%               w=0.16567kg
Lr = 0.2;
Lp = 0.125;
Lpc = Lp/2;
mp = 0.16567;
mr = 0.26507; 
g = 9.81;
Jp = (1/12)*mp*0.0125^2; 
Jr = (1/12)*mr*0.0125^2;
Vm = 0;
% Reference Quanser SRV02 User Manual
% motor back-emf constant
km = 7.68e-3;
% motor current-torque constant
kt = 7.68e-3;
Br = 0;
Bp = 0;
rm=2.6;
Jt = Jr*Jp + mp*Lpc^2*Jr +Jp*mp*Lr^2;
%Input Matrix

A = [0 0 1 0;
     0 0 0 1;
     0 mp^2*Lpc^2*Lr*g/Jt -0.025*(Jp+mp*Lpc^2)/Jt -mp*Lpc*Lr*0.025/Jt;
     0 mp*g*Lpc*(Jr+mp*Lr^2)/Jt -mp*Lpc*Lr*0.025/Jt -0.025*(Jr+mp*Lr^2)/Jt]

B = [0;
     0;
     (Jp+mp*Lpc^2)/Jt;
     mp*Lpc*Lr/Jt];

kg = 70;
B = kg.*kt.*B./rm;

C = [1 0 0 0;
     0 1 0 0];

D = [0;0];
disp('Open Loop Poles of the System Are')
eig(A)

system = ss(A,B,C,D);

damp = 0.7;
omega = 4;
sigma = damp*omega; 
omegad = omega*(1-damp^2)^(-1/2);

p1 = -sigma+(omegad*sqrt(-1))
p2 = -sigma-(omegad*sqrt(-1))

a = poly(A);

AC = [ 0 1 0 0;
0 0 1 0;
0 0 0 1;
-a(5) -a(4) -a(3) -a(2)];

BC = [0;0;0;1];

T=ctrb(A,B);
Tc=ctrb(AC,BC);
W = T*inv(Tc)

K=[47054.78 9464.864 1631.21 75.65]
Gain=K*inv(W)

eig(A-B*K)

zeta = 0.7;
sigma2 = zeta*omega;
wd = omega*sqrt(1-zeta^2);
DP = [-sigma2+j*wd, -sigma2-j*wd, -30, -40];
K = acker(A,B,DP)