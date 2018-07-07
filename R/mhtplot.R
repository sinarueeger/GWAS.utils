

## some handcrafted MHT plot
## -----------------------------

mhtplot <- function(X, Y, COL = NULL, GROUP = NULL, h.delta = 0, CUTOFF = 0, xlab = "", ylab =
                        "", main = NULL, col.pal = brewer.pal(9, "Set1"), size = unit(0.5, "char"),
                      shrink = TRUE, ylim = NULL, ...)
{

  ## ---------------------------------------------------
  ## X: position of snp
  ## Y: p-value (has to be -log10 by yourself)
  ## COL: vector length(x) with variable defining the color (e.g. genes or chromosomes)
  ## GROUP: vector length(x) with variable defining the vertical clustering in the plot (usually
  ## chromosomes)
  ## h.delta: space between the clusters (in x units, therefore quite large, e.g. 1e5)
  ## CUTOFF: horizontal line of cutoff (again here the -log10 is set manually)
  ## xlab, ylab, main, strings
  ## col.pal: giving a palette
  ## ---------------------------------------------------

  if(is.null(COL))
    COL <- GROUP

  ## h.delta: same scale as x
  n <- length(table(GROUP))

  COL <- as.factor(COL)
  levels(COL) <- rep(col.pal, length.out = nlevels(COL))
  COL <- as.character(COL)

  GROUP.unique <- unique(GROUP)
  tmp <- as.numeric(tapply(X, GROUP, function(f) diff(range(f))))

  xdelta <-  c(-1e4, 1e4)

  ## shrink = TRUE (no space inbetween, no real positions)
  if(shrink)
  {
    for(b in GROUP.unique)
      X[which(GROUP == b)] <- rank(X[GROUP == b], na.last = TRUE)

    xdelta <- c(-1e1, 1e1)
  }


  ## >> here
  tot <- (sum(tmp) + (n-1) * h.delta)
  X.0 <- cumsum(c(0, tmp + h.delta)/tot)
  X.delta <- tmp/tot

  X.0.center <- X.0[-length(X.0)] + X.delta / 2
  #    X.0.center <- X.0 + abs(X.0[-length(X.0)] - X.end)/2# + diff(c(X.0, 1))/2


  ## try
  ## -----------------------------
  grid.newpage()
  if(is.null(ylim)) ylim <- range(Y)

  vp <- viewport(x = unit(4, "lines"),
                 y = unit(4, "lines"),
                 width = unit(1, "npc") - unit(5, "lines"),
                 height = unit(1, "npc") - unit(6, "lines"),
                 just = c("left", "bottom"),
                 yscale = ylim + c(-1, 1) * 0.1 * diff(ylim),
                 name = "parent") # , xscale = n + c(-0.05, 0.05),

  pushViewport(vp)

  ## all
  grid.rect()
  # grid.rect(x = unit(0, "npc"), y = unit(0, "npc"), height = unit(1.05, "npc"), width = unit(1.005,
  # "npc"), just = c("left", "bottom"), vjust = unit(0.01, "npc"), hjust = unit(0.01, "npc"))
  grid.yaxis()
  grid.abline(intercept = CUTOFF, slope = 0, gp = gpar(lty = 3, col = gray(0.2)))
  # grid.text("-log10(p)", y = unit() , x = unit(-3, "lines"), rot = 90)

  ## new viewport to allow more space at bottom and top
  #vp <- viewport(x = unit(4, "lines"),
  #          y = unit(4, "lines"),
  #           width = unit(1, "npc") - unit(5, "lines"),
  #            height = unit(1, "npc") - unit(6, "lines"),
  #             just = c("left", "bottom"),
  #              yscale = ylim, #+ c(-1, 1) * 0.3 * diff(ylim),
  #               name = "parent") # , xscale = n + c(-0.05, 0.05),

  #pushViewport(vp)


  ## through all
  k <- 1
  #tot.width <- (n + h.delta * n)

  for (j in sort(GROUP.unique))
  {
    X.sub <- X[GROUP == j]
    Y.sub <- Y[GROUP == j]
    COL.sub <- COL[GROUP == j]

    vp.sub <- viewport(x = unit(X.0[k], "npc"), #unit((k-1)/n, "npc"),
                       y = unit(0, "npc"),
                       height = unit(1, "npc"),
                       width = unit(X.delta[k], "npc"),  #unit(1/tot.width, "npc"),
                       just = c("left", "bottom"), xscale = range(X.sub) + xdelta, yscale = vp$yscale)
    pushViewport(vp.sub)

    grid.points(X.sub, Y.sub, pch = 16, size = size, gp = gpar(col = COL.sub))

    #grid.rect()
    seekViewport(name = "parent")
    cat(j, "\n")
    k <- k + 1
  }

  # AXIS
  grid.text(GROUP.unique, x = X.0.center, y = unit(0, "npc"), just = "center", vjust = 2)
  grid.text(xlab, x = unit(0.5, "npc"), y = unit(0, "npc"), just = "center", vjust = 4)
  grid.text(ylab, x = unit(0, "npc"), y = unit(0.5, "npc"), just = "center", vjust = -4, rot = 90)
  grid.text(main, x = unit(0.5, "npc"), y = unit(1, "npc"), just = "center", vjust = -1, gp =
              gpar(fontsize = 16))






}


## for testing
## data <- mhtdata
## x <- data$pos
## y <- -log10(data$p)


## group <- data$chr
## cutoff <- -log10(5e-8)
## col <- data$gene


#f.mhtplot(X = x, Y = y, COL = col, GROUP = group, CUTOFF = cutoff, h.delta = 3e7, main = "sdlkfj",
#         xlab = "sdfj", ylab = "-log10(P)")

#f.mhtplot(X = x, Y = y, COL = group, GROUP = group, CUTOFF = cutoff, h.delta = 3e7, main = "sdlkfj",
#          xlab = "sdfj", ylab = "-log10(P)",col.pal = c(gray(0.4), gray(0.8)), size = unit(0.3, "char"))

