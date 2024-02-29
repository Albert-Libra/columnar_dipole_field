;+
; :Description:
;    Calculate the outer field of the columnar dipole model.
;
; :Params:
;    r            1x3 array, unit: [RE]
;
; :Keywords:
;    r0           the distance between the symmetry axis of the field to the Y axis, unit: [RE]
;    b0           ajustment factor for the model
;    tau1         tilt angle 1, unit: [DEG]
;    tau2         tilt angle 2, unit: [DEG]
;
; :Output:        magnetic field, 1x3 array, unit: [nT]
;
; :History:
; 17:38:34 2024-2-29 | Zhekai Luo | Describe the change
;-
function columnar_dipole_field,r,r0=r0,b0=b0,tau1=tau1,tau2=tau2
  
  if undefined(r0) then r0 = 11d
  if undefined(b0) then b0 = 18000d
  if undefined(tau1) then tau1 = 1d
  if undefined(tau2) then tau2 = 22d
  
  trans_matrix1 = [[cosd(tau1),0d,sind(tau1)],[0d,1d,0d],[-sind(tau1),0d,cosd(tau1)]]
  inverse_matrix1 = [[cosd(tau1),0d,-sind(tau1)],[0d,1d,0d],[sind(tau1),0d,cosd(tau1)]]
  r_trans1 = r#trans_matrix1

  trans_matrix2 = [[cosd(tau2),0d,sind(tau2)],[0d,1d,0d],[-sind(tau2),0d,cosd(tau2)]]
  inverse_matrix2 = [[cosd(tau2),0d,-sind(tau2)],[0d,1d,0d],[sind(tau2),0d,cosd(tau2)]]
  r_trans2 = (r_trans1-[[r0],[0d],[0d]])#trans_matrix2

  x=r_trans2[0]
  y=r_trans2[1]
  z=r_trans2[2]

  rho = sqrt(x^2d + z^2d)
  theta = acos(z/rho)*(x lt 0d) + (2d*!pi - acos(z/rho))*(x ge 0d)

  e_rho = [[-sin(theta)],[0d],[cos(theta)]]
  e_theta = [[-cos(theta)],[0d],[-sin(theta)]]

  b_out = -b0*sin(theta)/rho^2d*(sin(theta)*e_theta + 2d*cos(theta)*e_rho)

  bvec = (b_out#inverse_matrix2)#inverse_matrix1
  return,bvec

end