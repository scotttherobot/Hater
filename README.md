## Hater!

This is like Yo, but instead of saying 'yo', you send people hate. Aka insults.
Insults are stored in the database, so it's up to you to decide how raunchy you want to go.

This is just a backend API. Nothing more.

Features:
* User registration endpoints
* Push notification support for Android and IOS
* Login endpoints
* Versioned API (only `0.1` currently implemented)
* Manage a list of your enemies (think: buddy list)
* Manage the database of insults
* Send hate to other users

Basically, with a client, you log in and then you POST to an endpoint with a user id and
it takes care of the rest. The target user gets a push notification.
