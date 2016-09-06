# Never forget your name!
[See this in action on Heroku!](http://cryptic-wildwood-57006.herokuapp.com/)

## Todos
- use nginx for concurrent connections

## Function
Allows users to enter their name and phone number, and sends an hourly message
in 'day hours' to their phone containing their name.
Logs the message activity and allows users to view the logs.

Uses Twilio to send messages. Can only send messages to *verified numbers*.

## Instructions to run
- Install docker, docker-compose
- create a file ```.env``` exporting the following variables:
```
export SECRET_KEY=mysecretkey
export REDIS_URL=redis://
export DATABASE_URL=postgresql:///
export PORT=8000
export twilio_account_sid=foo
export twilio_auth_token=bar
export twilio_phone_number=baz
```
- In the root directory, run the following:
```
docker-compose build
docker-compose up
```

Now you can access the server at localhost:8000 (or PORT if set)!

## Storage
Sessions maintained on Redis. For celery, broker and messege queue on Redis.
Logs and user data stored on PostgreSQL.

## Retries
We ensure that the message is re-scheduled in case Twilio returns "failed" or "un" status through it's StatusCallback. Since the status arrives asynchronously, at a later time, the message retries can occur any time after the initial message is scheduled depending on when Twilio replies.

## Local time
Local time zone is determined using the browser's time zone. It is stored the
first time a user creates an account.
We could have determined the time zone using the Phone number of the user as
well. But that seemed like an unnecessary step for this task.

## Packages used:
See requirements.txt

- Flask
- celery
- postgresql
- redis
