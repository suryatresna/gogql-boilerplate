package handler

import (
	"github.com/gin-gonic/gin"
)

// PingHandler test api
func PingHandler(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "pong pong pong",
	})
}
