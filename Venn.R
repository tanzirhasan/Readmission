
library(venneuler)
install.packages("rJava",type='source')library(dplyr)
library(ggplot2)
library(scales)
make_plot <-function(filename){
  library(venneuler)
  library(dplyr)  
  data_set <- read.csv("output_1314.csv", header = TRUE)
  # "EDActivity"         (names(data_set)[[2]])
  # "InpatientActivity"  (names(data_set)[[3]])
  # "OutpatientActivity" (names(data_set)[[4]])
  # "OutPatients and ED" paste((names(data_set)[[4]]),"&",(names(data_set)[[2]]))
  # "InPatients and ED"  paste((names(data_set)[[3]]),"&",(names(data_set)[[2]]))
  # "InPatients and OutPatient" paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]))
  # "InPatients,OutPatient & ED" paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]), "&",(names(data_set)[[2]]),sep = "")
  

  data_set$visit.Type <- factor(rep((names(data_set)[[4]]),nrow(data_set) ), levels = c((names(data_set)[[4]]), (names(data_set)[[3]]), (names(data_set)[[2]]),paste((names(data_set)[[4]]),"&",(names(data_set)[[2]]),sep = ""), paste((names(data_set)[[3]]),"&",(names(data_set)[[2]]),sep = ""), paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]),sep = ""),paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]), "&",(names(data_set)[[2]]),sep = "") ))
  
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "N" & data_set[,(names(data_set)[[3]])] == "N" & data_set[,(names(data_set)[[4]])]  == "Y",(names(data_set)[[4]]) ,data_set$visit.Type)
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "N" & data_set[,(names(data_set)[[3]])] == "Y" & data_set[,(names(data_set)[[4]])]  == "N",(names(data_set)[[3]]) ,data_set$visit.Type)
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "N" & data_set[,(names(data_set)[[3]])] == "Y" & data_set[,(names(data_set)[[4]])]  == "Y",paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]),sep = "") ,data_set$visit.Type)
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "Y" & data_set[,(names(data_set)[[3]])] == "N" & data_set[,(names(data_set)[[4]])]  == "N",(names(data_set)[[2]]) ,data_set$visit.Type)
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "Y" & data_set[,(names(data_set)[[3]])] == "N" & data_set[,(names(data_set)[[4]])]  == "Y",paste((names(data_set)[[4]]),"&",(names(data_set)[[2]]),sep = "") ,data_set$visit.Type)
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "Y" & data_set[,(names(data_set)[[3]])] == "Y" & data_set[,(names(data_set)[[4]])]  == "N",paste((names(data_set)[[3]]),"&",(names(data_set)[[2]]),sep = "") ,data_set$visit.Type)
  data_set$visit.Type <- ifelse(data_set[,(names(data_set)[[2]])] == "Y" & data_set[,(names(data_set)[[3]])] == "Y" & data_set[,(names(data_set)[[4]])]  == "Y",paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]), "&",(names(data_set)[[2]]),sep = "") ,data_set$visit.Type)
  
  
  
  data_set <- mutate(data_set, percentage =paste(round( data_set[,(names(data_set)[[5]])]/sum( data_set[,(names(data_set)[[5]])]) * 100,1),"%"))
  
  
  noquote((names(data_set)[[2]]))
  
  
  
  V <- venneuler(c( names(data_set)[[2]] = data_set[4,(names(data_set)[[5]])], 
                   names(data_set)[[3]] = data_set[2,(names(data_set)[[5]])], 
                   names(data_set)[[4]] = data_set[1,(names(data_set)[[5]])], 
                   paste((names(data_set)[[3]]),"&",(names(data_set)[[2]]),sep = "") = data_set[6,(names(data_set)[[5]])], 
                   paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]),sep = "") = data_set[3,(names(data_set)[[5]])], 
                   paste((names(data_set)[[4]]),"&",(names(data_set)[[2]]),sep = "") = data_set[5,(names(data_set)[[5]])],
                   paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]), "&",(names(data_set)[[2]]),sep = "") = data_set[7,(names(data_set)[[5]])]))
  
  
test <- setNames( c(data_set[4,(names(data_set)[[5]])],data_set[2,(names(data_set)[[5]])],data_set[1,(names(data_set)[[5]])],data_set[6,(names(data_set)[[5]])],data_set[3,(names(data_set)[[5]])],data_set[5,(names(data_set)[[5]])],data_set[7,(names(data_set)[[5]])]), c( names(data_set)[[2]],names(data_set)[[3]],names(data_set)[[4]],paste((names(data_set)[[3]]),"&",(names(data_set)[[2]]),sep = ""),paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]),sep = ""),paste((names(data_set)[[4]]),"&",(names(data_set)[[2]]),sep = ""),paste((names(data_set)[[3]]),"&",(names(data_set)[[4]]), "&",(names(data_set)[[2]]),sep = "")))
  
V <- venneuler(test)
  
  V <- venneuler(c(ED= data_set$N_Pts[4], 
                   INPT= data_set$N_Pts[2], 
                   OUTPT= data_set$N_Pts[1], 
                   "ED&INPT"= data_set$N_Pts[6], 
                   "INPT&OUTPT"= data_set$N_Pts[3], 
                   "ED&OUTPT"= data_set$N_Pts[5],
                   "ED&INPT&OUTPT"=data_set$N_Pts[7] ))
  
  data_set$N_Pts[4]
  data_set[4,(names(data_set)[[5]])]
  
  V$labels <- rep("",length(V$labels))
  V$colors <- c(0.1, 0.44, 0.3) 
  plot(V, main = 'Venn Diagram of Invision Patient Data- FY 15/16')
  text(0.59,0.52,data_set$percentage[5])                          #ED and Outpt
  text(0.44,0.55,data_set$percentage[7])                          #All 
  text(0.60,0.33,paste(data_set$percentage[1]))         #Outpt
  text(0.30,0.53,paste(data_set$percentage[2]))          #Inpt
  text(0.53,0.68,paste(data_set$percentage[4]))            #ED
  text(0.37,0.60,data_set$percentage[6])                          #ED and Inpt
  text(0.38,0.47,data_set$percentage[3])                          #Inpt and Outpt
  
}
make_plot("output_new.csv")
