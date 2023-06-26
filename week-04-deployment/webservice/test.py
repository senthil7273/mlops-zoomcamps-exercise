import predict
import requests

ride = {
    'PULocationID': 10, 
    'DOLocationID': 50,
    'duration': 40
}

# features = predict.prepare_features(ride)
# pred = predict.predict(features)
# print(pred)


if __name__ == "__main__":
    url = "http://127.0.0.1:9696/predict"
    response = requests.post(url, json=ride)
    print(response.json())
    print(response.text)