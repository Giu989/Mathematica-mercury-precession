(* ::Package:: *)

GConstant = 6.67408 * 10^-11
SolarMass = 1.989 * 10^30
MercuryInitialSpeedXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,0}}] - AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,1}}]
MercuryInitialPositionXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2}}]

MercuryInitialSpeedX = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 1]]
MercuryInitialSpeedY = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 2]]
MercuryInitialPositionX = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 1]]
MercuryInitialPositionY = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 2]]

sol=x[t]/.NDSolve[{x''[t]==(-GConstant*SolarMass*x[t])/Norm[x[t]]^3,x[0]=={MercuryInitialPositionX,MercuryInitialPositionY},x'[0]=={MercuryInitialSpeedX,MercuryInitialSpeedY}},x[t],{t,0,90000000}][[1]]
(*gr=Graphics[Disk[sol,1000000000]];
*)Manipulate[
(*Show[gr;*)
ParametricPlot[sol,{t,0,a}](*]*),{a,1,9000000}]


Manipulate[ParametricPlot[sol,{t,0,90000000},PlotRange->Full,Epilog->{Red,PointSize[Large],Point[{2{MercuryInitialPositionX,MercuryInitialPositionY},{0,0}}],Black,PointSize[Medium],Dynamic@Point[sol/.t->a]}],{{a,0,"Mercury"},0,90000000}]


(* ::InheritFromParent:: *)
(*Manipulate[Graphics[{Circle[{0, 0}, r], Point[twoddata], Point[{0, 0}]}], *)
(*  {r, 0, 10}]*)


(* ::InheritFromParent:: *)
(*Manipulate[Graphics[{Circle[{0, 0}, r], Point[twoddata], Point[{0, 0}]}], *)
(*  {{r, 8.56}, 0, 10}]*)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(*Manipulate[Graphics[{Circle[{0, 0}, r], Point[twoddata], Point[{0, 0}]}], *)
(*  {r, 0, 10}]*)


(* ::InheritFromParent:: *)
(**)


GConstant = 6.67408 * 10^-11
SolarMass = 1.989 * 10^30
MercuryInitialSpeedXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,0}}] - AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,1}}]
MercuryInitialPositionXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2}}]

MercuryInitialSpeedX = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 1]]
MercuryInitialSpeedY = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 2]]
MercuryInitialPositionX = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 1]]
MercuryInitialPositionY = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 2]]

sol={x[t],y[t]}/.NDSolve[{{x''[t],y''[t]}==(-GConstant*SolarMass*{x[t],y[t]})/Norm[{x[t],y[t]}]^3+(-GConstant*SolarMass*{x[t]-2MercuryInitialPositionX,y[t]-2MercuryInitialPositionY})/Norm[{x[t]-2MercuryInitialPositionX,y[t]-2MercuryInitialPositionY}]^3,{x[0],y[0]}=={MercuryInitialPositionX,MercuryInitialPositionY},{x'[0],y'[0]}=={MercuryInitialSpeedX,MercuryInitialSpeedY}},{x[t],y[t]},{t,0,9000000000}][[1]]
(*gr=Graphics[Disk[sol,1000000000]];
*)Manipulate[
(*Show[gr;*)
ParametricPlot[sol,{t,0,a},Epilog->{Point[{2{MercuryInitialPositionX,MercuryInitialPositionY},{0,0}}]}](*]*),{a,1,900000000}]


?sol








