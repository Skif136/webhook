import urllib3
import json
import os
import time
import cryptography
from flask import Flask, request, abort, send_from_directory
import requests
#from urllib3.exceptions import InsecureRequestWarning  # for insecure https warnings
#urllib3.disable_warnings(InsecureRequestWarning)  # disable insecure https warnings
#from config import WEBHOOK_USERNAME, WEBHOOK_PASSWORD
#os.remove("all_webhooks_detailed.json")
save_webhook_output_file = "all_webhooks_detailed.json"

app = Flask(__name__)
#os.remove("all_webhooks_detailed.json")
@app.route('/webhook', methods=['POST'])  # create a route for /webhook, method POST
def webhook():
    if request.method == 'POST':
        print('Webhook Received')
        request_json = request.json

        print('Payload: ')
        print(json.dumps(request_json,indent=4))

        with open(save_webhook_output_file, 'w') as filehandle:
            filehandle.write('%s\n' % json.dumps(request_json,indent=4))
#            filehandle.write('= - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - \n')

        return  os.system("bash 2.sh")
    else:
        return 'POST Method not supported', 405


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5443, debug=True)

