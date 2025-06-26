proc princomp data=Tarea2.Euro n=7 plots=ALL  OUTSTAT=ESTEJ1
 out=PROEJE1;
 var CO2_Agri--P_HgconRuido;
 Run; 
proc princomp data=Tarea2.Euro n=6 plots=ALL  OUTSTAT=ESTEJ1
 out=PROEJE1;
 var CO2_Agri--P_HgconRuido;
 Run; 


proc princomp data=Tarea2.Euro n=6 plots=ALL OUTSTAT=ESTEJ1
out=PROEJE1;
var CO2_Agri--P_HgconRuido;
ID Pais;
Run;

proc factor data=Tarea2.Euro CORR OUTSTAT=ESTEJ1F out=PROEJ1F
RESIDUALS NFACT=6 MSA; 
var CO2_Agri--P_HgconRuido;
run;


proc factor data=Tarea2.Euro (Drop=Transporte_carretera Mort_Inf)CORR OUTSTAT=ESTEJ1F out=PROEJ1F
RESIDUALS NFACT=4 MSA; 
var CO2_Agri--P_HgconRuido;
run;





  PROC FACTOR DATA=Tarea2.Euro(Drop=Transporte_carretera Mort_Inf) CORR 
OUTSTAT=ESTEJ2F out=PRO1F
 RESIDUALS SCORE NFACT=4 MSA ROTATE=VARIMAX PLOTS=ALL;
 var CO2_Agri--P_HgconRuido;
pathdiagram fuzz=0.50 scale=1.2 factorsize=0.8;
 RUN;
 PROC FACTOR DATA=Tarea2.Euro(Drop=Transporte_carretera Mort_Inf) CORR 
OUTSTAT=ESTEJ2F out=PRO1F
 RESIDUALS SCORE NFACT=4 MSA ROTATE=QUARTIMAX PLOTS=ALL;
var CO2_Agri--P_HgconRuido;
pathdiagram fuzz=0.50 scale=1.2 factorsize=0.8;
 RUN;


proc print data=PROEJ1F;
   var Pais Factor1 Factor2 Factor3 Factor4 ;
 run;



 goptions reset=all border; 
title1 "Impacto Ambiental";
 proc gmap map=MAPS.EUROPE data=PROEJ1F all; 
id id; 
choro Factor1 / ; 
run;
 quit;

  goptions reset=all border; 
title1 "Demografia";
 proc gmap map=MAPS.EUROPE data=PROEJ1F all; 
id id; 
choro Factor2 / ; 
run;
 quit;

   goptions reset=all border; 
title1 "Salud";
 proc gmap map=MAPS.EUROPE data=PROEJ1F all; 
id id; 
choro Factor3 / ; 
run;
 quit;

   goptions reset=all border; 
title1 "Socioeconomica";
 proc gmap map=MAPS.EUROPE data=PROEJ1F all; 
id id; 
choro Factor4 / ; 
run;
 quit;





proc cluster data=Tarea2.Euro method=ward STANDARD RSQUARE 
PSEUDO PRINT=15 SIMPLE outtree=Tarea2.salida plots=all;
var CO2_Agri--P_HgconRuido;
 ID Pais;
 Copy Pais id;
 run;


 proc tree data=Tarea2.salida out=arbolward n=7;
 copy CO2_Agri--P_HgconRuido Pais id;
 run;
proc sort data=arbolward;
by cluster;
run;
proc print data = arbolward;
 var Pais;
 by cluster;
 run;




  proc stdize data= Tarea2.Euro 
method=std out=seriestan;
var CO2_Agri--P_HgconRuido;
run;
proc fastclus data=seriestan maxc=7 out=solo5     
OUTSTAT=ESTADISTICOS distance ;
var CO2_Agri--P_HgconRuido;
 run;
proc sort data=solo5;
by cluster;
run;

proc print data = solo5;
 var Pais;
 by cluster;
 run;



proc gmap map=maps.europe
 		   data=arbolward all;
	id id;
	choro cluster / discrete;
run;
quit;



 PROC CLUSTER  data=Tarea2.Euro  method=ward STANDARD RSQUARE
PSEUDO PRINT=15 SIMPLE outtree=tarea2.salida2 plots=all;
var CO2_Agri--P_HgconRuido;
ID PAIS;
COPY PAIS id;
RUN;
proc tree data=tarea2.salida2 out=arbolward n=5;
 copy CO2_Agri--P_HgconRuido PAIS id;
run; 

proc cluster data=PRO1F method=ward STANDARD RSQUARE 
             PSEUDO PRINT=15 SIMPLE outtree=SalidaPRO1F plots=all;
    var Factor1 Factor2 Factor3 Factor4;
    ID Pais;
    Copy Pais id;
run;








proc fastclus data=PRO1F maxc=5 out=solo10 OUTSTAT=ESTADISTICOS distance;
   var Factor1 Factor2 Factor3 Factor4;
run;

proc sort data=solo10;
   by cluster;
run;

proc print data=solo10;
   var Pais;
   by cluster;
run;











title1 "Distribución de Impacto Ambiental e Demografía por cluster";
proc sgpanel data=solo10;
 panelby Cluster / ;
 hbox Factor1;
 hbox Factor2;
run;
title1;


title1 "Distribución de Impacto Ambiental y Salud por cluster";
proc sgpanel data=solo10;
 panelby Cluster / ;
 hbox Factor1;
 hbox Factor3;
run;
title1;

title1 "Distribución de Impacto Ambiental y Socioeconómica por cluster";
proc sgpanel data=solo10;
 panelby Cluster /;
 hbox Factor1;
 hbox Factor4;
run;
title1;


title1 "Distribución de Demografía y Salud";
proc sgpanel data=solo10;
 panelby Cluster / ;
 hbox Factor2;
 hbox Factor3;
run;
title1;



title1 "Distribución de Demografía y Socioeconómica	 por cluster";
proc sgpanel data=solo10;
 panelby Cluster / ;
 hbox Factor2;
 hbox Factor4;
run;
title1;


title1 "Distribución de Salud y  Socioeconómica ";
proc sgpanel data=solo10;
 panelby Cluster / ;
 hbox Factor3;
 hbox Factor4;
run;
title1;

