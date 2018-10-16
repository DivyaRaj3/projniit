a = load 'file:///home/divya/Documents/project/h1bs1' using PigStorage (',') as (id,cs,empname,socname,soccode,jobtitle,ftpos,wage,year,loc,lat,long);

c= foreach a generate cs,year; 

split c into res1 if (year==2011) , res2 if (year==2012),  res3 if (year==2013),  res4 if (year==2014),  res5 if (year==2015);

d= group res1 by ($0,$1); 

e= foreach d generate group, COUNT(res1.$0);

f= group res2 by ($0,$1); 

g= foreach f generate group, COUNT(res2.$0);

h= group res3 by ($0,$1);

i= foreach h generate group, COUNT(res3.$0); 

j= group res4 by ($0,$1);

 k= foreach j generate group, COUNT(res4.$0);  

 l= group res5 by ($0,$1);

 m= foreach l generate group, COUNT(res5.$0);  

n= union e,g;
o= union n,i;
p= union o,k;
q= union p,m;

dump q;
