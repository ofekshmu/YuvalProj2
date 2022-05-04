library(igraph)

#' Initialize weights of graph with the rexp function (exp(teta))
#' as stated in the task info
#' teta = 0.02
InitWeights <- function(g){
  n = length(E(g))
  E(g)$weight <- rexp(n,0.02)
  return(g)
}

#' generates vector X as explained.
#' The vector will indicate functionality of each edge after 10 days.
Get_X_vector <- function(g){
  edges <- E(g)$weight
  print(edges)
  x_vec <- seq(from=0,to=0,length=10)
  for( i in 1:length(edges)){
    if (edges[i] >= 10){
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
                 

g <- InitWeights(g)
x <- Get_X_vector(g)
print(x)

