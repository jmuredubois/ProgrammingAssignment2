source("cachematrix.R")

testMat <- rbind( c(1, 0.2, 0.1, 0.3), c(0.4, 1, 0.5, 0.6), c(0.15, 0.25, 1, 0.35), c(0.45, 0.55, 0.65, 1) )

## Measure time for standard inverse
t0 <- system.time(solve(testMat))


## create cacheMatrix creator
tm <- makeCacheMatrix(testMat)

t1 <- system.time(cacheSolve(tm))
t2 <- system.time(cacheSolve(tm))