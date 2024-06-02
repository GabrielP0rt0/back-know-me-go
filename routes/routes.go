package routes

import (
	"back-know-me-go/controllers"

	"github.com/gin-gonic/gin"
)

func HandleRequest() {
	r := gin.Default()
	r.GET("/", controllers.Run)
	r.Run()
}
