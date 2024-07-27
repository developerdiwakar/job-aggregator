package main

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	// Echo instance
	app := echo.New()

	// Middle
	app.Use(middleware.Logger())
	app.Use(middleware.Recover())

	// Route => Handler
	app.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Welcome to the Job Aggregator app.")
	})

	// Route => Handler
	app.GET("/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, Job Seekers.")
	})

	// start server
	var port string = "3031"
	log.Println("App Listening on :", port)
	app.Logger.Fatal(app.Start(":" + port))
}
