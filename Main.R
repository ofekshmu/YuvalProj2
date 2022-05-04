library(igraph)

#' Creates a vector of size n with values determined using
#' the rexp function and variable teta.
Generate_DownTime <- function(n=22, teta=0.02){
  return(rexp(n, teta))
}

#' generates vector X as explained.
#' The vector will indicate functionality of each edge after 10 days.
GetXVector <- function(downTime){
  x_vec <- seq(from=0,to=0,length=10)
  for( i in 1:length(downTime)){
    if (downTime[i] >= 10){
      x_vec[i] = 1
    } 
    else{
      x_vec[i] = 0
    }
  }
  return(x_vec)
}



g <- graph_from_literal( A -+ E , B -+ F , C -+ F ,
                         A -+ D , B -+ C , C -+ G ,
                         A -+ C , E -+ I , C -+ D ,
                         A -+ B , F -+ G , C -+ H ,
                         D -+ G , F -+ J , H -+ J , 
                         D -+ H , G -+ J , H -+ I ,
                         D -+ I , G -+ H , I -+ J ,
                         D -+ E)
                         
paths <- all_simple_paths(g,
                 'A',
                 'J', mode = c("out"))
                 
downTime_vec <- Generate_DownTime(teta = 0.02)
x_vec <- GetXVector(downTime_vec)

#Now, We should try to determine if our graph system is working properly -
# meaning... there is a simple path from A to J with the weight of 0!
#Let's use x_vec as the graph weights

E(g)$weight <- x_vec
paths <- all_simple_paths(g,
                          'A',
                          'J', mode = c("out"))

paths[[2]]
edges <- E(g)
E(g)$weight
edge_attr(g, index = paths[[2]])
