# pushnotification
PushNotification Service

This Project is intended to be used along other applications in which each user represent unique process in the backend. Just pass the payload to be sent and the list of the users.

#Example

Payload = #{msg => hello} 
It can be of any format depending on the application,
Participants = [<0.12.0>, <0.65.0>]
List of pids
Just add, 
send_notification ! {send_message, Payload, Participants}
from your application to send push to the users.


