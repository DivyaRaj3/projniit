a = load 'file:///home/divya/Documents/project/h1bs1' using PigStorage (',') as (id,cs,empname,socname,soccode,jobtitle,ftpos,wage,year,loc,lat,long);

b= filter a by cs=='CERTIFIED';

c= foreach b generate loc, cs,year; 

split c into res1 if (year==2011) , res2 if (year==2012),  res3 if (year==2013),  res4 if (year==2014),  res5 if (year==2015);

d= group res1 by ($0,$2); 

e= foreach d generate group, COUNT(res1.$1);

f= group res2 by ($0,$2); 

g= foreach f generate group, COUNT(res2.$1);

h= group res3 by ($0,$2);

i= foreach h generate group, COUNT(res3.$1); 

j= group res4 by ($0,$2);

 k= foreach j generate group, COUNT(res4.$1);  

 l= group res5 by ($0,$2);

 m= foreach l generate group, COUNT(res5.$1);  

 n = order e by $1 desc; 

o = order g by $1 desc; 

p = order i by $1 desc;

q = order k by $1 desc;

r = order m by $1 desc;

s = limit n 5;

t = limit o 5;

u = limit p 5;

v = limit q 5;

w = limit r 5;

aa= union s,t;

bb= union aa,u;

cc= union bb,v;

dd= union cc,w;

dump dd;
