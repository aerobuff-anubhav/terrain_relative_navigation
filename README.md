# Project: Terrain Relative Navigation
_By: Anubhav Gupta | Created: Mar 19, 2021 | Updated: Mar 31, 2021_
***
___
### Project Description
The project is a visualization animation for Terrain Relative Navigation (TRN). For the purpose of investigation, the terrain features are defined apriori as made available to the flying agent (quadcopter) for detection. In application, the flying agent would rely on visual aid by the on-board camera. The relative coordinates of the terrain features are used to determine its relative elevation and azimuth angle. These parameters are intended to be inputs to the particle filter. The package has been developed in MATLAB R2020a.

### How to use?
In command window, type "Run.m" and press enter. The program will create a visual animation showing a quadcopter and fov of it's on-board camera. The details of the detected feature are displayed on the command window of MATLAB.

### Package Details
- **agent.m:** Assigns and stores the physical parameters. (Needs to be matured)
- **drawAgent.m:** This is the main function file to draw the quadcopter, fov, and terrain features.
- **detection.m:** Takes the database of terrain vertices as input and check it's presence in the fov. If true, this function sends a trigger and the local coordinates of the feature (relative to the quadcopter center).
- **DefineAgent.m:** Defines the quadcopter, field of view (fov) of the on-board camera, and terrain features. The vertices are relative to the quadcopter instead of the reverse relation. Quadcopter drawing relative to fov makes px, py,pz of the one side of fov as the default state parameter, so the computation needs to address it accordingly if changed.
- **Dynamics.m:** Computes the forces and moments on the body due to - aerodynamics, propulsion, and gravity. The output may be fed to the aerospace toolbox or the in-house built Equation_of_Motion function.
- **Equation_of_Motion.m:** (Needs to be matured)
- **PlotStateVariables.m:** will be used later (Needs to be matured)
- **Run.m:** Main file to coordinate the drawing and simulation of the agent.
- **S_Dynamics.m:** Intermediate function calling the Dynamics function; stacks forces and moments in a dynamics vector.

---
