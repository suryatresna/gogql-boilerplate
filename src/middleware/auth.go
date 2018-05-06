package middleware

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Auth middleware authentication basic
func Auth() gin.HandlerFunc {
	return func(c *gin.Context) {
		auth := true
		if auth {
			c.Next()
		} else {
			c.Abort()
			c.JSON(http.StatusUnauthorized, gin.H{"status": "unauthorized"})
		}
	}
}
