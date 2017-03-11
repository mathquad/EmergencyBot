from flask import Flask, request
from twilio.rest import TwilioRestClient
 
app = Flask(__name__)
 
# put your own credentials here
ACCOUNT_SID = 'SID' #ACCOUNT_SID = 'SID'

AUTH_TOKEN = 'TOKEN' #AUTH_TOKEN = 'TOKEN' 
 
client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
 
@app.route('/sms', methods=['POST'])
def send_sms():
    message = client.messages.create(
        to=request.form['To'], 
        from_='PHONE#', #from_='PHONE#',
        body=request.form['Body'],
    )
 
    return message.sid
 
if __name__ == '__main__':
        app.run()
