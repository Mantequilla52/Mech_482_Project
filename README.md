
# MECH_482_Furuta_Pendulum_Project
<p align="center">
    Control System Design<br/>
    482-01<br/>
    by<br/>
    Steve Adams<br/>
    Ricardo Parra<br/>
    Anothony Rink<br/>
    Spencer Weed<br/>
    Jose Varela
</p>
<p align="center">    
    
    
</p>
<p align="center">   
    California State University, Chico Department of Mechanical and Mechatronic Engineering and<br/>
    Advanced Manufacturing Chico, Ca 95929.
</p>

#### Table Of Contents
- [1. Introduction](#1-introduction)
- [2. Modeling](#2-modeling)
- [3. Controller Design and Simulations](#3-controller-design-and-simulations)
- [4. Results](#4-results)
- [5. Reference](#5-references)

## 1. Introduction
The Furuta Pendulum is driven by an arm which rotates in the horizontal plane and a pendulum attached to that arm which rotates in the vertical plane. 
It was invented by a man named Katsuhisa Furuta at the Tokyo Institute of Technology in 1922. The pendulum must exihibt the following traits:
It must stay up right and when it is knocked down it must reurn to the upright position
<p align="center">  
  
## 3. Modeling
The system consists of 2 masses, arm 1 m in the horizontal plane, and arm 2 the pendulum, which rotates freely in the vertical plane . In addition to a link connecting arm 1 and the pendulum, that is fixed. Figure 2 depicts a DC motor applying torque to arm 1 m, which moves horizontally then controlling the pendulum so it may remain in the upright position. The torque t is a critical component used in the feedback control system, which is done using a state-space model. The angular rotation from arm 1, 0is measured in the horizontal plane, where it is assumed that the counter clockwise direction is considered to be positive. The angular rotation from the pendulum 1is measured in the vertical plane, where it is also to be assumed that the counter clockwise direction is positive. The system is stable when the pendulum arm is hanging down in a stable position 1=0.
