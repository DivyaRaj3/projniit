#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************APP MENU***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} HIVE ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} PIG ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} MAPREDUCE ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} SQOOP ${NORMAL}"
    
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

function getpinCodeBank(){
	echo "in getPinCodebank"
	echo $1
	echo $2
	#hive -e "Select * from apphb where PinCode = $1 AND Bank = '$2'"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
               echo -e "${MENU}**${NUMBER} 1)${MENU} 1a ${NORMAL}"
	       echo -e "${MENU}**${NUMBER} 2)${MENU} 1b ${NORMAL}"
               echo -e "${MENU}**${NUMBER} 3)${MENU} 8 ${NORMAL}"
               echo -e "${MENU}**${NUMBER} 4)${MENU} 9 ${NORMAL}"
               echo -e "${MENU}**${NUMBER} 5)${MENU} 10 ${NORMAL}"
                read ques
             case $ques in
                    
                  
          1) clear;
            hive -e "select job_title,year,count(case_status) from h1ba where job_title='DATA ENGINEER' group by year,job_title"
                       ;;

 	  2) clear;
            hive -e "select job_title,count(job_title) as c ,year from h1ba  group by year,job_title order by c desc limit 5"
                       ;;
            
          3) clear;
            hive -e "select avg(prevailing_wage),job_title,year from h1ba group by job_title,year"
                          ;;


          4) clear;
             hive -e "select employer_name,ROUND((count(*)*100/3002048),2)  as c1 from h1ba where case_status='CERTIFIED-WITHDRAWN' or  case_status='CERTIFIED' group by employer_name order by c1 desc limit 10"
                   
;;
          5) clear; 
             hive -e "select job_title,ROUND((count(*)*100/3002048),2)  as c1 from h1ba where case_status='CERTIFIED-WITHDRAWN' or  case_status='CERTIFIED' group by job_title order by c1 desc limit 10"
                       ;;         
                    
          *) clear;
                   echo "DEFAULT"
  esac                
show_menu;
;;


          2) clear;
              echo -e "${MENU}**${NUMBER} 1)${MENU} 2a ${NORMAL}"
               echo -e "${MENU}**${NUMBER} 2)${MENU} 2b ${NORMAL}"
               echo -e "${MENU}**${NUMBER} 3)${MENU} 4 ${NORMAL}"
               echo -e "${MENU}**${NUMBER} 4)${MENU} 7 ${NORMAL}"
                read ques1
             case $ques1 in
                       
           1) clear;
                     pig -x local /home/divya/Documents/project/pigprojop/pig2a.pig
                       ;;
          2) clear;
                    pig -x local /home/divya/Documents/project/pigprojop/pig2b.pig

                        ;;
                   3) clear;        
                   pig -x local /home/divya/Documents/project/pigprojop/pig4.pig
          
                              ;; 
                     
                   4) clear;     
                   pig -x local /home/divya/Documents/project/pigprojop/pig7.pig
		sudo -H xdg-open "/home/divya/Documents/project/q11yearcount.ods"
          
                              ;; 
                    
          *) clear;
                   echo "DEFAULT"
  esac                
show_menu;
;;                  
            
        
                        3) clear;
                              echo -e "${MENU}**${NUMBER} 1)${MENU} q3 ${NORMAL}"
                              echo -e "${MENU}**${NUMBER} 2)${MENU} q4 ${NORMAL}"
                              echo -e "${MENU}**${NUMBER} 3)${MENU} q5 ${NORMAL}"
                              echo -e "${MENU}**${NUMBER} 4)${MENU} q6 ${NORMAL}"
                read ques2
             case $ques2 in
                                    
                             1) clear;
                                 hadoop jar /home/divya/Desktop/proj3jar.jar  file:///home/divya/Documents/project/h1bs1 \ao1
                                 hadoop fs -cat /user/hduser/ao1/p*
                                  ;;
                             2) clear;
                                 hadoop jar /home/divya/Desktop/proj4jar.jar proj4 file:///home/divya/Documents/project/h1bs1 \proj4out8   
           			hadoop fs -cat /user/hduser/proj4out8/p*
                                  ;; 
                             3) clear;
                                 hadoop jar /home/divya/Desktop/proj5jar.jar proj5 file:///home/divya/Documents/project/h1bs1 \proj5out15
				hadoop fs -cat /user/hduser/proj5out15/p*
                                  ;;
                             4) clear;
                                 hadoop jar /home/divya/Desktop/proj6jar.jar proj6 file:///home/divya/Documents/project/h1bs1 \proj6out3
				hadoop fs -cat /user/hduser/proj6out3/p*
                                      ;;
                             *) clear;
                                      echo "DEFAULT"
esac
show_menu;
;;
  

                             4) clear;
					 echo -e "${MENU}**${NUMBER} 1)${MENU} q11 ${NORMAL}"
    				
				hive -e "insert overwrite local directory '/hanoi' row format delimited fields terminated by ','select job_title, ROUND((count(*) * 100/3002048),2) as c1 from h1b where case_status = 'CERTIFIED' or case_status= 'CERTIFIED-WITHDRAWN' group by job_title order by c1 desc limit 10;"


				sqoop export --connect jdbc:mysql://localhost/db1 --username root --password 'root' --table h --export-dir /hanoi/000000_0 --input-fields-terminated-by ',' ;
             

show_menu;
;;                              
           
                \n) exit;
        ;;

        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi



done


