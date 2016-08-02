(* ::Package:: *)

GConstant = 6.67408 * 10^-11
SolarMass = 1.989 * 10^30
MercuryInitialSpeedXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,0}}] - AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,1}}]
MercuryInitialPositionXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2}}]

MercuryInitialSpeedX = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 1]]
MercuryInitialSpeedY = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 2]]
MercuryInitialPositionX = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 1]]
MercuryInitialPositionY = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 2]]

sol=x[t]/.NDSolve[{x''[t]==(-GConstant*SolarMass*x[t])/Norm[x[t]]^3,x[0]=={MercuryInitialPositionX,MercuryInitialPositionY},x'[0]=={MercuryInitialSpeedX,MercuryInitialSpeedY}},x[t],{t,0,9000000}][[1]]
ParametricPlot[sol,{t,0,9000000}]

Manipulate[Module[{xo={a,0},u0={0,2.37},sol},sol=x[t]/.NDSolve[{x''[t]==(-g x[t])/Norm[x[t]]^3,x[0]==xo,x'[0]==u0},x[t],{t,0,100}][[1]];ParametricPlot[sol,{t,0,100},PlotRange->3]],{g,3,10},{a,1,5}]
Manipulate[Graphics[{Circle[{0,0},r],Point[twoddata],Point[{0,0}]}],{r,0,10}]


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(*Manipulate[Graphics[{Circle[{0, 0}, r], Point[twoddata], Point[{0, 0}]}], *)
(*  {r, 0, 10}]*)
