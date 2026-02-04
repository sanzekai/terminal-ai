package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"strings"
)


type RequestBox struct {
	Contents []struct {
		Parts []struct {
			Text string `json:"text"`
		} `json:"parts"`
	} `json:"contents"`
}

type ResponseBox struct {
	Candidates []struct {
		Content struct {
			Parts []struct {
				Text string `json:"text"`
			} `json:"parts"`
		} `json:"content"`
	} `json:"candidates"`
}


func main() {
	apiKey := os.Getenv("GEMINI_API_KEY")

	if apiKey == "" {
		fmt.Println("Error: API not detected!")
		fmt.Println("Make sure to read the README from github.com/sanzekai/terminal-ai/README.md")
		return
	}

	arguments := os.Args[1:]
	if len(arguments) == 0 {
		fmt.Println("Use: ask <your question>")
		return
	}

	var question string

	if strings.HasPrefix(arguments[0], "--") {
		if arguments[0] == "--install" {
			if len(arguments) < 2 {
				fmt.Println("ask --install <app>")
				return
			}
			appName := strings.Join(arguments[1:], " ")
			question = fmt.Sprintf("Command to install %s. Format: [command] //[os]. Use a new line for each OS. No talk, just commands. If no result say <No App found>", appName)
		} else {
			fmt.Printf("Unknown command: %s\n", arguments[0])
			return
		}
	} else {
		question = strings.Join(arguments, " ")
	}
	respon, err := askGemini(question, apiKey)
	if err != nil {
		fmt.Println("Error!")
		return
	}

	fmt.Println("===SANZEKAI ANSWER===")
	fmt.Println(strings.TrimSpace(respon)) 
	fmt.Println("=====================")
}

// API

func askGemini(userInput string, key string) (string, error) {
	url := "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=" + key


		var req RequestBox
		req.Contents = append(req.Contents, struct {
			Parts []struct {
				Text string `json:"text"`
			} `json:"parts"`

		}{
			Parts: []struct {
				Text string `json:"text"`
			
			}{

				{Text: userInput},
			},
		})

	jsonData, err := json.Marshal(req)
	if err != nil {
		return "", err
	}


	resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()


	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}


	if resp.StatusCode != http.StatusOK {
		return "", fmt.Errorf("API Error (Status %d): %s", resp.StatusCode, string(body))
	}


	var result ResponseBox
	err = json.Unmarshal(body, &result)
	if err != nil {
		return "", err
	}


	if len(result.Candidates) > 0 && len(result.Candidates[0].Content.Parts) > 0 {
		return result.Candidates[0].Content.Parts[0].Text, nil
	}

	return "AI is busy right now.", nil
}