package handler

import (
	"github.com/gin-gonic/gin"
)

func GraphqlHandler(c *gin.Context) {

	c.JSON(200, gin.H{
		"message": "pong",
	})
}
