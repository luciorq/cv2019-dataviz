library(circlize) 

set.seed(123)
mat = matrix(rnorm(100*10), nrow = 10, ncol = 100)
col_fun = colorRamp2(c(-2, 0, 2), c("green", "black", "red"))
factors = rep(letters[1:2], times = c(30, 70))
mat_list = list(a = mat[, factors == "a"],
                b = mat[, factors == "b"])
dend_list = list(a = as.dendrogram(hclust(dist(t(mat_list[["a"]])))),
                 b = as.dendrogram(hclust(dist(t(mat_list[["b"]])))))

circos.par(cell.padding = c(0, 0, 0, 0), gap.degree = 5)
circos.initialize(factors, xlim = cbind(c(0, 0), table(factors)))
circos.track(ylim = c(0, 10), bg.border = NA, panel.fun = function(x, y) {
  sector.index = CELL_META$sector.index
  m = mat_list[[sector.index]]
  dend = dend_list[[sector.index]]
  
  m2 = m[, order.dendrogram(dend)]
  col_mat = col_fun(m2)
  nr = nrow(m2)
  nc = ncol(m2)
  for(i in 1:nr) {
    circos.rect(1:nc - 1, rep(nr - i, nc), 
                1:nc, rep(nr - i + 1, nc), 
                border = col_mat[i, ], col = col_mat[i, ])
  }
})

max_height = max(sapply(dend_list, function(x) attr(x, "height")))
circos.track(ylim = c(0, max_height), bg.border = NA, track.height = 0.3, 
             panel.fun = function(x, y) {
               
               sector.index = get.cell.meta.data("sector.index")
               dend = dend_list[[sector.index]]
               circos.dendrogram(dend, max_height = max_height)
             })
circos.clear()