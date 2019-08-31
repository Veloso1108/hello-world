set n;
set m;
set p;
set x;

param Dit{n, p} binary>=0; #Disponib. prof. i en slot t
param Eie{n, x} binary>=0; #Si el profesor i tiene la especialidad e
param EPje{m, x} binary>=0; #Si el proyecto j tiene especialidad e
param St{p} >=0; #Cantidad de salas disponibles en slot t 
var Xijt{n, m, p} binary>=0; #Si profe i asiste al proy. j en slot t
var Yjt{m, p} binary>=0; #El proyecto j esta en el slot t

maximize xd: sum{i in n, j in m, t in p} Xijt[i,j,t];


s.t. 

#Disponibilidad y no omnipresencia
	DyNO {i in n, t in p}: 

		sum {j in m} Xijt[i,j,t]<=Dit[i,t];

#Minimo un profesor por especialidad	
	MUPE {j in m, e in x, t in p}:
	
		sum{i in n} Xijt[i,j,t]*Eie[i,e] >= EPje[j,e];
		
#Tres profesores por comision	
	#TPC {j in m, t in p}:
	
	#	sum{i in n} Xijt[i,j,t] = 3;

#Disponibilidad de salas	
	DdS {t in p}:
	
		sum{i in n, j in m} Xijt[i,j,t] <= St[t]*3 ;
		

	XDX {i in n}:
	
		sum{j in m, t in p} Xijt[i,j,t]>=2;
		
	R {j in m}:
		
		sum{t in p} Yjt[j,t] = 1;
		
	I {j in m, t in p}:
	
		sum{i in n} Xijt[i,j,t] = Yjt[j,t]*3;

	
