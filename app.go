package main

import (
	"github.com/gin-gonic/gin"
	"github.com/suryatresna/gogql-boilerplate/src/handler"
	"github.com/suryatresna/gogql-boilerplate/src/middleware"
)

func main() {
	r := gin.Default()

	authorized := r.Group("/")
	authorized.Use(middleware.Auth())
	{
		authorized.GET("/graphql", handler.GraphqlHandler)
	}

	r.GET("/ping", handler.PingHandler)
	r.Run() // listen and serve on 0.0.0.0:8080
}
