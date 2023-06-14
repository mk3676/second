from flask import Flask, request

app = Flask(__name__)


@app.route('/sensor', methods=['POST'])
def handle_post_request():
    data = request.get_json()  # Get the JSON data from the request
    print(data)
    # Extract the required values from the JSON data
    api_key = data.get('api_key')
    sensor = data.get('sensor')
    temp = data.get('temp')
    humi = data.get('humi')

    # Process the data as needed
    # 예: 데이터베이스에 저장하거나 다른 작업 수행

    return 'Success'  # Return a response indicating the request was processed successfully


if __name__ == '__main__':
    app.run(host="0.0.0.0")
