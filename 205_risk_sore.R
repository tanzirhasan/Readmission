# Function for scoring
#risk_score
riskcalculation <-function(){
  risk_score = 0
  if tot_len_of_stay >= 5{
    risk_score <- risk_score +2
  } else{
  if dx_group %in% c("digestive system","circulatory system","circulatory and respiratory systems","respiratory system","skin and subcutaneous tissue"){
    risk_score = risk_score +2
  } else{
  if Hb < 12 {
    risk_score = risk_score +1
  } else{
  if Na < 135{ 
  risk_score = risk_score +1
  } else{
  if homelessness == "homeless"{
    risk_score <- risk_score +3
  } else{
  if AdmitCount >5 {
    risk_score = risk_score +5
  } else {
  if AdmitCount %in% c(1:4) {
    risk_score = risk_score +2
                      }
                   }
              }
           }
        }
     }
  }

}
  

