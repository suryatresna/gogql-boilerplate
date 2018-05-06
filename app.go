package main

import (
	"github.com/gin-gonic/gin"
	"github.com/suryatresna/gogql-boilerplate/src/handler"
)

func main() {
	r := gin.Default()
	r.GET("/ping", handler.PingHandler)
	r.Run() // listen and serve on 0.0.0.0:8080
}
