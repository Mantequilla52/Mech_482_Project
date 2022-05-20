
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
    
<img src="photos/CSU_Chico_seal.svg.png">
    
    
</p>
<p align="center">   
    California State University, Chico Department of Mechanical and Mechatronic Engineering and<br/>
    Advanced Manufacturing Chico, Ca 95929.
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
  
## 2. Modeling
The system is comprised of 2 masses, the rotary arm in the horiontal plane and the pendulum in the vertical plane. The rotary arm and the pendulum are limked. A DC motor is applying torque to the rotary arm that controls the swaying of the pendulum to remain in an upright position. The torque is used the feedback control system. The angles of both the rotary arm and the pendulum are 0 when in the upright position. It is assumed postive when rotating counter-clockwise. The system is stable when the pendulum is allowed to hang down.

## 2. Controller Design and Simulations

## 3. References
Inverted pendulum: System modeling. Control Tutorials for MATLAB and Simulink - Inverted Pendulum: System Modeling. (n.d.). Retrieved May 19, 2022, from https://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum§ion=SystemModeling 

Wen, J., Shi, Y., &amp; Lu, X. (2017, February 27). Stabilizing a rotary inverted pendulum based on logarithmic Lyapunov function. Journal of Control Science and Engineering. Retrieved May 19, 2022, from https://www.hindawi.com/journals/jcse/2017/4091302/ 
    
Fantoni, I., &amp; Lozano, R. (2017, May 19). Stabilization of the Furuta pendulum around its homoclinic orbit. IFAC Proceedings Volumes. Retrieved May 19, 2022, from https://www.sciencedirect.com/science/article/pii/S1474667017352783 
