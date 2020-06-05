# README
This is an API application for playlist and video engagement data.

## Authentication
Data access requires authentication.

Locally, post the credentials to:
```
curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:3000/authenticate
```

Next, get the resource using the auth token that is returned:
```
curl -H "Authorization: token-goes-here" http://localhost:3000/playlists
```

## For deploy
- Need to load environment variables in `config/application.yml`.
- Need to load `credentials.yml.enc` and `master.key`
- Need to run task to create admin.
- Need to start redis server
- Sidekiq
