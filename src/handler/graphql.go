package handler

import (
	"github.com/gin-gonic/gin"
)

// Response json struct
type Response struct {
	Data interface{} `json:"data"`
}

// GraphqlHandler handling graphql request
func GraphqlHandler(c *gin.Context) {

	c.JSON(200, gin.H{
		"message": "pong pons",
	})
}
