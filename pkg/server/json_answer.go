package serverHTTP

import (
	"encoding/json"
	"net/http"
)

type Response struct {
	Status  int    `json:"status"`
	Message string `json:"message"`
}

func JsonResponce(resp interface{}, w http.ResponseWriter) {
	_, err := json.Marshal(resp)
	if err != nil {
		http.Error(w, "Failed to encode response", http.StatusInternalServerError)
		return
	}

	var indentedJSON []byte
	indentedJSON, err = json.MarshalIndent(resp, "", "  ")
	if err != nil {
		http.Error(w, "Failed to indent response", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

	w.Write(indentedJSON)
}
