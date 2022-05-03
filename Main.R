library(igraph)

g <- graph_from_literal( A -+ E , B -+ F , C -+ F ,
                         A -+ D , B -+ C , C -+ G ,
                         A -+ C , E -+ I , C -+ D ,
                         A -+ B , F -+ G , C -+ H ,
                         D -+ G , F -+ J , H -+ J , 
                         D -+ H , G -+ J , H -+ I ,
                         D -+ I , G -+ H , I -+ J ,
                         D -+ E)
                         
all_simple_paths(g,
                 'A',
                 'J', mode = c("out"))
                 


