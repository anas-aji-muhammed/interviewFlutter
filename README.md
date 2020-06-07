# interview

A new Flutter application.

## Getting Started

This project is a starting point as flutter app developer journey.

Added the following to my main.dart code.
1. 2 classes(both expanding stateless widget) for home page and second page.
2. Page1 - 2 Textfields and and a flatbutton for login screen.
3. Page 2 -A text widget for displaying name and 3 containers aligned in rows for showing 3 colors that'll be returned from remote server.
4. Made request to remote server via POST method.
5. The response is from api call is a json string. I used jsonDecode from dart:convert library to convert the json string to an object form.
6. Then the json objest is assigned to a Map. This map is passed to the second page as argument.
7. Name and 3 colours are extracted from the Map used to update the ui.
