# Columnar Dipole Field
This is a mathematical model for the approximate calculation of the external field of the magnetosphere. The model is constructed in a Cartisian coordinates system (see the blue axes in the following figure) located at the $+X$ direction from the original coordinates, with a distance of $r_0$ and an elevation angle $\tau_1$. The coordinates system has a $y$ axis parallel to the $Y$ axis of the original coordinates system and has an elevation angle $\tau_2$ from its origin's direction.
<img width="988" alt="image" src="https://github.com/LuoZhekai/columnar_dipole_field/assets/28833193/c9a6a5df-125f-4375-8cfb-73393b0ae835">

The magnetic field is expressed in the Euler potential $$\vec B=\nabla\alpha\times\nabla\beta$$ where $$\alpha=\frac{b_0\cos^2\theta}{\rho}$$ and $$\beta=y$$ The $\rho$ is the distance to the $y$ axis, the $\theta$ is the elevation angle from the $-x$ direction, and the $b_0$ is an adjustment factor. 

The IDL program `columnar_dipole_field.pro` gives the magnetic field of the outer field. The following are the parameter, the keywords and the output.

Parameter:
- `r`: the displacement vector in the original coordinates system, 1x3 array, unit: R<sub>E</sub>

Keywords:
- `r0`: the distance between two coordinates system, unit: R<sub>E</sub>
- `b0`: adjustment factor for the outer field, unit: nT·R<sub>E</sub><sup>2</sup>
- `tau1`: elevation angle 1, unit: degree
- `tau2`: elevation angle 2, unit: degree

Output: the outer magnetic field, 1x3 array, unit: nT 

This is an example code: 
`outer_b = columnar_dipole_field([[5],[3],[4]], r0=11, b0=18000, tau1=1, tau2=22)`
