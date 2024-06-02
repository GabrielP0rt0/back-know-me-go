package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func Run(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"Sucesso": "Api Rodando",
	})
}
