
a = load 'file:///home/divya/Documents/project/h1bs1' using PigStorage (',') as (id,cs,empname,socname,soccode,jobtitle,ftpos,wage,year,loc,lat,long);

b= filter a by jobtitle=='DATA ENGINEER';

c= foreach b generate jobtitle,year,loc; 

split c into res1 if (year==2011) , res2 if (year==2012),  res3 if (year==2013),  res4 if (year==2014),  res5 if (year==2015);

d= group res1 by ($1,$2); 

e= foreach d generate group, COUNT(res1.$0);

f= group res2 by ($1,$2); 

g= foreach f generate group, COUNT(res2.$0);

h= group res3 by ($1,$2);

i= foreach h generate group, COUNT(res3.$0); 

j= group res4 by ($1,$2);

 k= foreach j generate group, COUNT(res4.$0);  

 l= group res5 by ($1,$2);

 m= foreach l generate group, COUNT(res5.$0);  

 n = order e by $1 desc; 

o = order g by $1 desc; 

p = order i by $1 desc;

q = order k by $1 desc;

r = order m by $1 desc;

s = limit n 1;

t = limit o 1;

u = limit p 1;

v = limit q 1;

w = limit r 1;

aa= union s,t;

bb= union aa,u;

cc= union bb,v;

dd= union cc,w;

dump dd;
