package main

import (
	"fmt"
	"net/http"
)

var version = "dev"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from app %s\n", version)
	})
	http.ListenAndServe(":8080", nil)
}
