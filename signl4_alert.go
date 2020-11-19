package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
)

// Send SIGNL4 alert from Go

func main() {
	// Your SIGNL4 team secret
	teamSecret := "team-secret"
	url := "https://connect.signl4.com/webhook/" + teamSecret

	// Alert data
	var jsonStr = []byte(`{
		"Title":"Alert",
		"Message": "SIGNL4 alert from Go"}`)
	req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonStr))
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		// Error
		fmt.Println("Error")
		panic(err)
	}
	defer resp.Body.Close()

	if resp.StatusCode == 201 {
		// Success
		fmt.Println("Success")
	} else {
		// Error
		fmt.Println("Error: " + resp.Status)
	}

	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Println("response Body:", string(body))
}
