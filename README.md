# Quick Chat
## Description
- A chat app made by Flutter and Firebase(Firebase Cloud Firestore) having beautiful splash screen.
- Support login with google account, chat with any user, send text, emojis.
- Firebase Cloud Firestore as well as the Firebase authentication package is used to equip the chat app with a cloud based NoSQL database and secure authentication methods.

## Documentation and References
### Animations

For further documentation:
[Link](https://docs.flutter.dev/development/ui/animations/tutorial)


```
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  get isLoaded => null;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 7), vsync: this);
    animation = Tween<double>(begin: 60, end: 150).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 150);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

```

```
@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
```

## animated_text_kit 4.2.2
[Link](https://pub.dev/packages/animated_text_kit)
A flutter package which contains a collection of some cool and awesome text animations.
## Installation:

#### Use this package as a library
#### Depend on it
#### Run this command:
#### With Flutter:

```
flutter pub add animated_text_kit
```

#### This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```
dependencies:
  animated_text_kit: ^4.2.2
```

#### Import it
#### Now in your Dart code, you can use:

```
import 'package:animated_text_kit/animated_text_kit.dart';
```

## firebase_core 2.7.1
[Link](https://pub.dev/packages/firebase_core)
A Flutter plugin to use the Firebase Core API, which enables connecting to multiple Firebase apps.
## Installation:

#### Use this package as a library
#### Depend on it
#### Run this command:
#### With Flutter:

```
flutter pub add firebase_core
```

#### This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```
dependencies:
  firebase_core: ^2.7.1
```

#### Import it
#### Now in your Dart code, you can use:

```
import 'package:firebase_core/firebase_core.dart';
```


## firebase_auth 4.2.10
[Link](https://pub.dev/packages/firebase_auth)
A Flutter plugin to use the Firebase Authentication API.
## Installation:

#### Use this package as a library
#### Depend on it
#### Run this command:
#### With Flutter:

```
flutter pub add firebase_auth
```

#### This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```
dependencies:
  firebase_auth: ^4.2.10
```

#### Import it
#### Now in your Dart code, you can use:

```
import 'package:firebase_auth/firebase_auth.dart';
```


## cloud_firestore 4.4.4
[Link](https://pub.dev/packages/cloud_firestore)
A Flutter plugin to use the Cloud Firestore API.
## Installation:

#### Use this package as a library
#### Depend on it
#### Run this command:
#### With Flutter:

```
flutter pub add cloud_firestore
```

#### This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```
dependencies:
  cloud_firestore: ^4.4.4
```

#### Import it
#### Now in your Dart code, you can use:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```

## modal_progress_hud_nsn 0.3.0
[Link](https://pub.dev/packages/modal_progress_hud_nsn)
A simple widget wrapper to enable modal progress HUD (a modal progress indicator, HUD = Heads Up Display)
## Installation:

#### Use this package as a library
#### Depend on it
#### Run this command:
#### With Flutter:

```
flutter pub add modal_progress_hud_nsn
```

#### This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```
dependencies:
  modal_progress_hud_nsn: ^0.3.0
```

#### Import it
#### Now in your Dart code, you can use:

```
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
```

## Authenticate with Firebase using Password-Based Accounts on Flutter

[Link](https://firebase.flutter.dev/docs/auth/password-auth/)


## Before you begin

If you haven't already, follow the steps in the Get started guide.

Enable Email/Password sign-in:

In the Firebase console's Authentication section, open the Sign in method page.
From the Sign in method page, enable the Email/password sign-in method and click Save.


### Create a password-based account
```
onPressed: () async {
                   
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (credential != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                        
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
```

### Sign in a user with an email address and password

```
onPressed: () async {
                    
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);
                      if (credential != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                        
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
```

### For SignOut
```
await FirebaseAuth.instance.signOut();
```

### Login with Current User
```
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

```

## Get data from firestore to flutter app using the StreamBuilder

For references :
[Link](https://stackoverflow.com/questions/50542771/stream-builder-from-firestore-to-flutter)

```
class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('sender', descending: false)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs;

        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: loggedInUser.email == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        List<MessageBubble> finalmessages = [];
        finalmessages = messageBubbles.reversed.toList();
        return Expanded(
          child: ListView(
            reverse: true,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

```

## Get the Message Bubble
```
class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  var sender;
  var text;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 3.5),
          Container(
            decoration: BoxDecoration(
              color: isMe ? Color(0xFFe81cff) : Color(0xFF40c9ff),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
            ),
            margin: isMe
                ? EdgeInsets.only(left: 45.0)
                : EdgeInsets.only(right: 45.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: isMe ? Colors.white : Color(0xFF103783),
                fontStyle: FontStyle.normal,
              ),
              textAlign: isMe ? TextAlign.right : TextAlign.right,
            ),
            padding: EdgeInsets.all(18.0),
          ),
          SizedBox(height: 18.0),
        ],
      ),
    );
  }
}

```
## Data/chats are shown in ListView

## Get started with Cloud Firestore Security Rules

[Link](https://firebase.google.com/docs/firestore/security/get-started#auth-required)

### Security rules version 2
As of May 2019, version 2 of the Cloud Firestore security rules is now available. Version 2 of the rules changes the behavior of recursive wildcards {name=**}. You must use version 2 if you plan to use collection group queries. You must opt-in to version 2 by making rules_version = '2'; the first line in your security rules:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
```


### Writing rules
#### Auth required

```
// Allow read/write access on all documents to any user signed in to the application
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

# Screenshots
## Splash Screen
![WhatsApp Image 2023-03-11 at 12 19 05 AM](https://user-images.githubusercontent.com/91545371/224400616-49e7578e-cef8-4fb8-b79f-f63209c3bc06.jpeg)

## Home Screen
![WhatsApp Image 2023-03-11 at 12 19 05 AM (1)](https://user-images.githubusercontent.com/91545371/224400704-fc820cd2-30ca-4a2c-b0a6-b15f11d1c8c5.jpeg)

## Login Page
![WhatsApp Image 2023-03-11 at 12 19 06 AM](https://user-images.githubusercontent.com/91545371/224400838-f067a85d-37af-4150-9f07-c4d0faa29020.jpeg)

## Chat Screen
![WhatsApp Image 2023-03-11 at 12 19 06 AM (1)](https://user-images.githubusercontent.com/91545371/224400905-bece1765-78fd-4c5a-b5e0-47fae7fdc407.jpeg)

# Video

https://user-images.githubusercontent.com/91545371/224401376-7b8a572d-e5b0-4a78-92ee-26e432cc04f9.mp4

