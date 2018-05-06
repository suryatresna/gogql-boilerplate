package handler

import (
	"github.com/gin-gonic/gin"
)

// GraphqlHandler handling graphql request
func GraphqlHandler(c *gin.Context) {

	c.JSON(200, gin.H{
		"message": "pong",
	})
}
