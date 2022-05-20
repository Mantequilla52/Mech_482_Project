
# MECH_482_Furuta_Pendulum_Project
<p align="center">
    Control System Design<br/>
    482-01<br/>
    by<br/>
    Steve Adams<br/>
    Ricardo Parra<br/>
    Anothony Rink<br/>
    Jose Varela<br/>
    Spencer Weed
</p>
<p align="center">    
    
    
</p>
<p align="center">   
    California State University, Chico Department of Mechanical and Mechatronic Engineering and<br/>
    Advanced Manufacturing Chico, CA 95929.
</p>

#### Table Of Contents
- [1. Introduction](#1-introduction)
- [2. Modeling](#2-modeling)
- [3. Controller Design and Simulations](#3-controller-design-and-simulations)
- [4. References](#4-references)

## 1. Introduction
The Furuta Pendulum is driven by an arm which rotates in the horizontal plane and a pendulum attached to that arm which rotates in the vertical plane. 
It was invented by a man named Katsuhisa Furuta at the Tokyo Institute of Technology in 1922. The pendulum must exihibt the following traits:
It must stay up right and when it is knocked down it must reurn to the upright position.
    <p align="center">
    ![image](https://user-images.githubusercontent.com/105890564/169443204-9e3a9f59-0557-42bb-a754-14f128b2bf52.png)
</p>
  
## 2. Modeling
The system is comprised of 2 masses, the rotary arm in the horiontal plane and the pendulum in the vertical plane. The rotary arm and the pendulum are limked. A DC motor is applying torque to the rotary arm that controls the swaying of the pendulum to remain in an upright position. The torque is used the feedback control system. The angles of both the rotary arm and the pendulum are 0 when in the upright position. It is assumed postive when rotating counter-clockwise. The system is stable when the pendulum is allowed to hang down.
      <p align="center"> 
    ![image](https://user-images.githubusercontent.com/105890564/169442750-d0dda77b-68c5-478a-b063-23c1a2b1a7ad.png)
  </p>


## 2. Controller Design and Simulations
```
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
```
## 3. Appendix
## 4. References
Inverted pendulum: System modeling. Control Tutorials for MATLAB and Simulink - Inverted Pendulum: System Modeling. (n.d.). Retrieved May 19, 2022, from https://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum§ion=SystemModeling 

Wen, J., Shi, Y., &amp; Lu, X. (2017, February 27). Stabilizing a rotary inverted pendulum based on logarithmic Lyapunov function. Journal of Control Science and Engineering. Retrieved May 19, 2022, from https://www.hindawi.com/journals/jcse/2017/4091302/ 
    
Fantoni, I., &amp; Lozano, R. (2017, May 19). Stabilization of the Furuta pendulum around its homoclinic orbit. IFAC Proceedings Volumes. Retrieved May 19, 2022, from https://www.sciencedirect.com/science/article/pii/S1474667017352783 

Rotary inverted pendulum. Quanser. (2021, April 20). Retrieved May 19, 2022, from https://www.quanser.com/products/rotary-inverted-pendulum/#productdetails 
    
    
