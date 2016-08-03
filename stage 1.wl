(* ::Package:: *)

GConstant = 6.67408 * 10^-11;
SolarMass = 1.989 * 10^30;
MercuryOrbitTimeInSeconds = 7.600544*10^6;
VenusOrbitDistance = 1.0820893*10^11;
VenusOrbitTimeInSeconds = 1.9414149*10^7;

MercuryInitialSpeedXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,0}}] - AstronomicalData["Mercury",{"Position", {2016,8,2,0,0,1}}];
MercuryInitialPositionXYZ = AstronomicalData["Mercury",{"Position", {2016,8,2}}];

MercuryInitialSpeedX = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 1]];
MercuryInitialSpeedY = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 2]];
MercuryInitialPositionX = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 1]];
MercuryInitialPositionY = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 2]];

sol1=x[t]/.NDSolve[{x''[t]==(-GConstant*SolarMass*x[t])/Norm[x[t]]^3,x[0]=={MercuryInitialPositionX,MercuryInitialPositionY},x'[0]=={MercuryInitialSpeedX,MercuryInitialSpeedY}},x[t],{t,0,90000000}][[1]]

Manipulate[
Show[
(*ParametricPlot[VenusOrbitDistance*{Cos[2Pi*(t/VenusOrbitTimeInSeconds)],Sin[2Pi*(t/VenusOrbitTimeInSeconds)]},{t,0.01,a}],*)
ParametricPlot[sol1,{t,0,90000000},PlotRange->{-1.5 VenusOrbitDistance,1.5 VenusOrbitDistance},Epilog->{Arrow[{sol1/.t->a,0.5 sol1/.t->a}],Red,PointSize[Large],Point[(*2{MercuryInitialPositionX,MercuryInitialPositionY},*){0,0}],Black,PointSize[Medium],Dynamic@Point[sol1/.t->a]}],ParametricPlot[VenusOrbitDistance*{Cos[2Pi*(t/VenusOrbitTimeInSeconds)],-Sin[2Pi*(t/VenusOrbitTimeInSeconds)]},{t,0.01,a}]],{{a,0,"Mercury"},0,9000000}]

(*ParametricPlot[-VenusOrbitDistance*{Cos[2Pi*(t/VenusOrbitTimeInSeconds)],Sin[2Pi*(t/VenusOrbitTimeInSeconds)]},{t,0,7.600544*10^6}]*)





Manipulate[ParametricPlot[sol2,{t,0,90000000},PlotRange->Full,Epilog->{Red,PointSize[Large],Point[{2{MercuryInitialPositionX,MercuryInitialPositionY},{0,0}}],Black,PointSize[Medium],Dynamic@Point[sol2/.t->a]}],{{a,0,"Mercury"},0,90000000}]

sol2={x[t],y[t]}/.NDSolve[{{x''[t],y''[t]}==(-GConstant*SolarMass*{x[t],y[t]})/Norm[{x[t],y[t]}]^3+(-GConstant*0.01*SolarMass*{x[t]-VenusOrbitDistance*Cos[2Pi*(t/VenusOrbitTimeInSeconds)],y[t]+VenusOrbitDistance*Sin[2Pi*(t/VenusOrbitTimeInSeconds)]})/Norm[{x[t]-VenusOrbitDistance*Cos[2Pi*(t/VenusOrbitTimeInSeconds)],y[t]+VenusOrbitDistance*Sin[2Pi*(t/VenusOrbitTimeInSeconds)]}]^3,{x[0],y[0]}=={MercuryInitialPositionX,MercuryInitialPositionY},{x'[0],y'[0]}=={MercuryInitialSpeedX,MercuryInitialSpeedY}},{x[t],y[t]},{t,0,9000000000}][[1]]
(*gr=Graphics[Disk[sol2,1000000000]];
*)Manipulate[
(*Show[gr;*)
ParametricPlot[sol2,{t,0,a},Epilog->{Point[{2{MercuryInitialPositionX,MercuryInitialPositionY},{0,0}}]}](*]*),{a,1,900000000}]


Manipulate[ParametricPlot[{Cos[a],-Sin[a]},{a,0,b}],{b,0,2Pi}]



