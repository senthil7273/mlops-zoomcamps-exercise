import pickle
from flask import Flask, jsonify, request

with open("models/model.bin", 'rb') as f_in:
    (dv, model) = pickle.load(f_in)

def predict(features):
    X = dv.transform(features)
    preds = model.predict(X)
    return preds[0]

def prepare_features(ride):
    features = {}
    features['PU_DO']  = '%s_%s' % (ride['PULocationID'], ride['DOLocationID'])
    features['duration'] = ride['duration']
    return features

app = Flask('duration-prediction')

@app.route('/predict', methods=["POST"])
def predict_endpoint():
    ride = request.get_json()
    features = prepare_features(ride)
    pred = predict(features)
    result = {
        "duration": pred
    }
    return jsonify(result)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port='9696')