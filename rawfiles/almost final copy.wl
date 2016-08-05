(* ::Package:: *)

(*Definitions*)
BigNum = 1000000000

VenusInitialPositionXYZ = AstronomicalData["Venus",{"Position", DateList[]}];
VenusInitialPositionX = QuantityMagnitude[Part[VenusInitialPositionXYZ, 1]];
VenusInitialPositionY = QuantityMagnitude[Part[VenusInitialPositionXYZ, 2]];

EarthInitialPositionXYZ = AstronomicalData["Earth",{"Position", DateList[]}];
EarthInitialPositionX = QuantityMagnitude[Part[EarthInitialPositionXYZ, 1]];
EarthInitialPositionY = QuantityMagnitude[Part[EarthInitialPositionXYZ, 2]];

MarsInitialPositionXYZ = AstronomicalData["Mars",{"Position", DateList[]}];
MarsInitialPositionX = QuantityMagnitude[Part[MarsInitialPositionXYZ, 1]];
MarsInitialPositionY = QuantityMagnitude[Part[MarsInitialPositionXYZ, 2]];

JupiterInitialPositionXYZ = AstronomicalData["Jupiter",{"Position", DateList[]}];
JupiterInitialPositionX = QuantityMagnitude[Part[JupiterInitialPositionXYZ, 1]];
JupiterInitialPositionY = QuantityMagnitude[Part[JupiterInitialPositionXYZ, 2]];

SaturnInitialPositionXYZ = AstronomicalData["Saturn",{"Position", DateList[]}];
SaturnInitialPositionX = QuantityMagnitude[Part[SaturnInitialPositionXYZ, 1]];
SaturnInitialPositionY = QuantityMagnitude[Part[SaturnInitialPositionXYZ, 2]];

UranusInitialPositionXYZ = AstronomicalData["Uranus",{"Position", DateList[]}];
UranusInitialPositionX = QuantityMagnitude[Part[UranusInitialPositionXYZ, 1]];
UranusInitialPositionY = QuantityMagnitude[Part[UranusInitialPositionXYZ, 2]];

NeptuneInitialPositionXYZ = AstronomicalData["Neptune",{"Position", DateList[]}];
NeptuneInitialPositionX = QuantityMagnitude[Part[NeptuneInitialPositionXYZ, 1]];
NeptuneInitialPositionY = QuantityMagnitude[Part[NeptuneInitialPositionXYZ, 2]];

Vtan = ArcTan[VenusInitialPositionX,VenusInitialPositionY];
Etan = ArcTan[EarthInitialPositionX,EarthInitialPositionY];
Mtan = ArcTan[MarsInitialPositionX,MarsInitialPositionY];
Jtan = ArcTan[JupiterInitialPositionX,JupiterInitialPositionY];
Stan = ArcTan[SaturnInitialPositionX,SaturnInitialPositionY];
Utan = ArcTan[UranusInitialPositionX,UranusInitialPositionY];
Ntan = ArcTan[NeptuneInitialPositionX,NeptuneInitialPositionY];


GConstant = 6.67408 * 10^-11;
SolarMass = 1.989 * 10^30;
MercuryOrbitTimeInSeconds = 7.600544*10^6;
(*Venusinfo*)
VenusOrbitDistance = 1.0820893*10^11;
VenusOrbitTimeInSeconds = 1.9414149*10^7;
VenusX:=VenusOrbitDistance*Cos[Vtan+2Pi*(t/VenusOrbitTimeInSeconds)];
VenusY:=VenusOrbitDistance*Sin[-Vtan-2Pi*(t/VenusOrbitTimeInSeconds)];
VenusMass=4.867*10^24;
VenusEffect:=(-GConstant*VenusMass*{x[t]-VenusX,y[t]-VenusY})/(Norm[{x[t]-VenusX,y[t]-VenusY}]^3);
(*EarthInfo*)
EarthOrbitDistance=AU;
EarthOrbitTimeInSeconds=31557600;
EarthX:=EarthOrbitDistance*Cos[Etan+2Pi*(t/EarthOrbitTimeInSeconds)];
EarthY:=EarthOrbitDistance*Sin[-Etan-2Pi*(t/EarthOrbitTimeInSeconds)];
EarthMass=5.972*10^24;
EarthEffect:=(-GConstant*EarthMass*{x[t]-EarthX,y[t]-EarthY})/(Norm[{x[t]-EarthX,y[t]-EarthY}]^3)
(*Mars*)
MarsOrbitDistance=1.524 AU;
MarsOrbitTimeInSeconds=59355036;
MarsX:=MarsOrbitDistance*Cos[Mtan+2Pi*(t/MarsOrbitTimeInSeconds)];
MarsY:=MarsOrbitDistance*Sin[-Mtan-2Pi*(t/MarsOrbitTimeInSeconds)];
MarsMass=6.39*10^23;
MarsEffect:=(-GConstant*MarsMass*{x[t]-MarsX,y[t]-MarsY})/(Norm[{x[t]-MarsX,y[t]-MarsY}]^3);
(*Jupiter*)
JupiterOrbitDistance=5.2 AU;
JupiterOrbitTimeInSeconds=374355660;
JupiterX:=JupiterOrbitDistance*Cos[Jtan+2Pi*(t/JupiterOrbitTimeInSeconds)];
JupiterY:=JupiterOrbitDistance*Sin[-Jtan-2Pi*(t/JupiterOrbitTimeInSeconds)];
JupiterMass= 1.8988*10^27;
JupiterEffect:=(-GConstant*JupiterMass*{x[t]-JupiterX,y[t]-JupiterY})/(Norm[{x[t]-JupiterX,y[t]-JupiterY}]^3);
(*Saturn*)
SaturnOrbitDistance=9.5370 AU;
SaturnOrbitTimeInSeconds=929292360;
SaturnX:=SaturnOrbitDistance*Cos[Stan+2Pi*(t/SaturnOrbitTimeInSeconds)];
SaturnY:=SaturnOrbitDistance*Sin[-Stan-2Pi*(t/SaturnOrbitTimeInSeconds)];
SaturnMass= 5.683*10^26;
SaturnEffect:=(-GConstant*SaturnMass*{x[t]-SaturnX,y[t]-SaturnY})/(Norm[{x[t]-SaturnX,y[t]-SaturnY}]^3);
(*Uranus*)
UranusOrbitDistance=19.96 AU;
UranusOrbitTimeInSeconds=2651370000;
UranusX:=UranusOrbitDistance*Cos[Utan+2Pi*(t/UranusOrbitTimeInSeconds)];
UranusY:=UranusOrbitDistance*Sin[-Utan-2Pi*(t/UranusOrbitTimeInSeconds)];
UranusMass= 8.681*10^25;
UranusEffect:=(-GConstant*UranusMass*{x[t]-UranusX,y[t]-UranusY})/(Norm[{x[t]-UranusX,y[t]-UranusY}]^3);
(*Neptune*)
NeptuneOrbitDistance=29.95 AU;
NeptuneOrbitTimeInSeconds=5200418600;
NeptuneX:=NeptuneOrbitDistance*Cos[Ntan+2Pi*(t/NeptuneOrbitTimeInSeconds)];
NeptuneY:=NeptuneOrbitDistance*Sin[-Ntan-2Pi*(t/NeptuneOrbitTimeInSeconds)];
NeptuneMass= 1.024*10^26;
NeptuneEffect:=(-GConstant*NeptuneMass*{x[t]-NeptuneX,y[t]-NeptuneY})/(Norm[{x[t]-NeptuneX,y[t]-NeptuneY}]^3);

AU=149597870700

MercuryInitialSpeedXYZ = AstronomicalData["Mercury",{"Position", DateList[]}] - AstronomicalData["Mercury",{"Position", DatePlus[DateList[],{1,"Second"}]}];
MercuryInitialPositionXYZ = AstronomicalData["Mercury",{"Position", DateList[]}];

MercuryInitialSpeedX = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 1]];
MercuryInitialSpeedY = QuantityMagnitude[Part[MercuryInitialSpeedXYZ, 2]];
MercuryInitialPositionX = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 1]];
MercuryInitialPositionY = QuantityMagnitude[Part[MercuryInitialPositionXYZ, 2]];

sol1=x[t]/.NDSolve[{x''[t]==(-GConstant*SolarMass*x[t])/Norm[x[t]]^3,x[0]=={MercuryInitialPositionX,MercuryInitialPositionY},x'[0]=={MercuryInitialSpeedX,MercuryInitialSpeedY}},x[t],{t,0,90000000}][[1]]

dequation:=NDSolve[{{x''[t],y''[t]}==(-GConstant*SolarMass*{x[t],y[t]})/Norm[{x[t],y[t]}]^3+VenusEffect+EarthEffect+MarsEffect+JupiterEffect+SaturnEffect+UranusEffect+NeptuneEffect,{x[0],y[0]}=={MercuryInitialPositionX,MercuryInitialPositionY},{x'[0],y'[0]}=={MercuryInitialSpeedX,MercuryInitialSpeedY}},{x[t],y[t]},{t,0,BigNum}][[1]];
(*End Definitions*)

Manipulate[
Show[

ParametricPlot[sol1,{t,0,90000000},PlotRange->{-1.5 VenusOrbitDistance,1.5 VenusOrbitDistance},Epilog->{Arrow[{sol1/.t->a,0.5 sol1/.t->a}],Red,PointSize[Large],Point[{0,0}],Black,PointSize[Medium],Dynamic@Point[sol1/.t->a]}],ParametricPlot[VenusOrbitDistance*{Cos[2Pi*(t/VenusOrbitTimeInSeconds)],-Sin[2Pi*(t/VenusOrbitTimeInSeconds)]},{t,0.01,a}]],{{a,0,"Mercury"},0,17000000}]

Manipulate[
Show[
ParametricPlot[sol2,{t,0.1,a},PlotRange->{{-c AU,c AU},{-c AU,c AU}},Epilog->{Red,PointSize[Large],Point[{{1,1},{0,0}}],Black,PointSize[Medium],Dynamic@Point[sol2/.t->a]}],
(*Venus*)ParametricPlot[{VenusX,VenusY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[1,0.8,0.32]},Epilog->{PointSize[Large],Yellow,Point[{VenusX,VenusY}]}],
(*Earth*)ParametricPlot[{EarthX,EarthY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[0,0,1]}],
(*Mars*) ParametricPlot[{MarsX,MarsY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[1,0.3,0]}],
(*Jupiter*) ParametricPlot[{JupiterX,JupiterY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[0.88,0.7,0]}],
(*Saturn*) ParametricPlot[{SaturnX,SaturnY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[1,0.5,0.24]}],
(*Uranus*) ParametricPlot[{UranusX,UranusY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[0.5,0.86,0.79]}],
(*Neptune*) ParametricPlot[{NeptuneX,NeptuneY},{t,0.01,a},PlotStyle->{Thick,Dashed,RGBColor[0,0.55,1]}]],
{{a,0,"Time /seconds"},0,2000000000}(*{{b,1000000,"solution length"},1,100000000}*),{{c,1,"PlotRange /m"},0.5,31}]

sol2={x[t],y[t]}/.dequation;
distance=Norm[sol2];

NMaximize[{distance,0<t<90000000},t];
sol3=(Sqrt[x[t]^2+y[t]^2])/.dequation;

distance=Interpolation[Table[{i,sol3/.t->i},{i,0,700000000,1000000}]]; (*Not really that important but still 100000000*)
distancelist=Table[sol3,{t,0,BigNum,10000}]; (*calculate for this amount of seconds*)
peaks = FindPeaks[distancelist];
Plot[distance[t],{t,0,BigNum}]
ListPlot[distancelist,AxesLabel->{"Time /10ks","Distance from sun /m"}]

PeakTimes = 10000 * Table[(peaks[[n]])[[1]],{n,2,Length[peaks]}];
coordwithtime:=Table[sol2[t]/.t->PeakTimes[[n]],{n,1,Length[PeakTimes]}];
coordwithtime[[1]]

coordwithtime:=Table[sol2[t]/.t->PeakTimes[[n]],{n,1,Length[PeakTimes]}];
coordwithtime[[1]][[0]];
precessiondata=Table[(180/Pi) ArcTan[coordwithtime[[n]][[0]][[2]]/coordwithtime[[n]][[0]][[1]]],{n,1,Length[PeakTimes]}];
finalgraph=ListLinePlot[Table[(180/Pi) ArcTan[coordwithtime[[n]][[0]][[2]]/coordwithtime[[n]][[0]][[1]]],{n,1,Length[PeakTimes]}]];

line = Fit[precessiondata, {1, x}, x]
Show[finalgraph,

Plot[line,{x,0,(BigNum/(3600*24*87.969))}]]




