# what-a-great-movie
Objective
The goal of this project is to have a simple web service that stores a list of movies and a set of favorite movies per user.
- Users will be able to see the list of movies and favorite movies from an Android app and an iOS app.
- Admins will be able to to see the list of movies and manage movies (add, edit, delete) from a web browser. They should be able to see what movies each of the existing users have favorited.
Requirements per platform
All platforms
- For each of you, all the code you create for this test has to be made available in a github public repository. It can be in your personal github account. Please give access to user https://github.com/diegopau​ ​to your repository.
Server + Admin pages
- The server must be developed using Ruby on Rails framework. The database must be PostgreSQL or MySQL.
- A simple RESTful API will allow the iOS and Android app to download the list of movies and communicate the server what are the favorite movies of a given user. Designing the API and communicating it to the iOS and Android developers will be the first needed task.
There is a chat room available at ​https://tlk.io/scissorboyteama-j5ls22a0​ to communicate with the other developers. From our team Diego will be also on that room following up with the discussion.
- The server will be hosted on DigitalOcean, in a Ubuntu 16.04 machine. Here is the information for first time access (it will ask you to change root password after the first access):
- Droplet Name: TeamA-ubuntu-s-1vcpu-1gb-fra1-01
- IP Address: 46.101.218.241
- Username: root

- Password: c20aecc8c21b0fe8b60c2d9767
- For the admin pages we don’t require any kind of specific design, it can be as simple as needed, the design won’t be evaluated, we just need it to work.
- We don’t need to setup a domain, the admin pages should be accessible at
http://46.101.218.241/admin
iOS
- Developed on either Swift or Objective-C.
- When all is done, please send us a video of the app being launched from Xcode and how it is working on the iOS simulator to ​diego@scissorboy.com​ and grant@scissorboy.com​. An overview of all the app functionality will be enough.
- The interface design will be chosen by you. Doesn’t have to match the design chosen for the Android app. While we would love to see a decent design, it is much more important to us that the main functionality works and is bug-free. We don’t need a complicated design, just something simple and functional that doesn’t add much development time.
- There will be an API available to get the movie data and to communicate the user’s favorite movies to the server. You will need to communicate with the server developer, you can do it on this chat room: ​https://tlk.io/scissorboyteama-j5ls22a0​. From our team Diego will be also on that room following up with the discussion.
Android
- Developed on either Java or Kotlin or a combination of both.
- When all is done it has to be delivered as an APK to ​diego@scissorboy.com
- The interface design will be chosen by you. Doesn’t have to match the design chosen for the Android app. While we would love to see a decent design, it is much more important to us that the main functionality works and is bug-free. We don’t need a complicated design, just something simple and functional that doesn’t add much development time
- There will be an API available to get the movie data and to communicate the user’s favorite movies to the server. You will need to communicate with the server developer,

you can do it on this chat room: ​https://tlk.io/scissorboyteama-j5ls22a0​. From our team Diego will be also on that room following up with the discussion.
Specifications
Data and functionality
1. We need to build a database of movies on our server. All the movies in the database will be introduced manually by the admin on the admins pages.
a. From the admin pages the movies can be created, edited and deleted. There will be also an admin page to list all the existing movies. There will be also pages to view the detail of a movie and to edit the movie info.
b. From the apps the movies can only be viewed. We will be able to see:
i. The full list of movies from which movies can be favorited/unfavorited
ii. A page with details of a single movie
iii. A list of favorite movies. The movies favorited by the user
This is the data that a movie can have:
Name
Mandatory / Optional
Details
Name
Mandatory
80 characters limit, any unicode character is accepted
Genres
Mandatory
At least 1 genre is mandatory. New genres can’t be added, there will be a set of predefined genres to choose from. Multiple genres can be selected.
Year
Mandatory
A year with 4 digit format (ex. 1982)
Thumbnail
Optional
An image in either PNG, JPEG or JPG, a maximum of 1MB size and the following restrictions for its dimensions:
- The height is always 1000 pixels

- The width is anything between 600 and 800 pixels
The image will be stored as it is, no changes on size, format or aspect ratio.
Director
Optional
60 characters limit, any unicode character is accepted
Main star
Optional
60 characters limit, any unicode character is accepted
Description
Optional
400 characters limit, any unicode character is accepted
Favorited
Mandatory
This is not a field the admins will fill up. Its an integer field that defaults to 0 and will show the total number of users that favorited the movie
This is the list of possible genres:
- Action
- Adventure
- Animation
- Biography
- Comedy
- Crime
- Documentary - Drama
- Fantasy
- History
- Horror
- Musical
- Mystery
- Romance
- Sci-Fi
- Thriller
- War
- Western

2. We need also a database of users and the list of favorite movies for each user. There will be a single field for each user:
3. We won’t have a full login/authentication system to identify users. It will be the most simple approach possible:
- Only the username will be used to identify a user. No passwords will be used
- Users can be created only from the apps
- First time the app is opened it will ask for a username. If the username exists then it will assign that user and load the that user list of favorite movies. If the username does not exist it will ask “Do you want to create a new user with username: {username}?” with options “Yes”, “No”. If “Yes” is chosen then a new user is created for that username.
- Each user will have a different set of favorited movies. Movies can only be favorited from the apps.
- There will be a very simple way of switching to a different user from the apps.
Server + Admin pages
1. Please allow access to the admin pages on this URL ​http://46.101.218.241/admin​, we don’t need several admin users, just one. Once all is setup and completed please deliver the credentials to access the admin pages to ​diego@scissorboy.com​ and grant@scissorboy.com​, together with anything else we need to know about the admin pages and the server implementation.
Please also deliver in that email a short documentation documentation showing all the API calls available for the apps.
2. The images (the movie thumbnails) must be stored in the Digital Ocean server.
3. We will need the following 2 main sections on the admin pages:
username
mandatory
20 characters limit, only alphanumeric characters and the underscore “_” are allowed

a. Movies
i. We need to be able to see a list of all existing movies in a table. The table only needs to show the name of the movie “Name”, the year of the movie “Year” and the number of users that favorited the movie “# times favorited”. Also, for each row of the table there has to be a “Delete” link that will remove the movie from the database.
ii. At the top of the list there will be a button “Add Movie” that will open the
form to create a new movie. The form will have these components:
- A text field for the movie name
- A dropdown or any of the type of field that allow multiple selection for the movie genres
- A year selection field. Could be a calendar or a dropdown as long as allows to select a year ranging from at least 1900 to 2019
- A file picker for the image. Under the file picker please place the text “Only PNG, JPEG and JPG images 1000 pixels tall and between 600 and 800 pixels wide. 1MB max.”
- A text field for the Director
- A text field for the Main star
- A textarea field for the description
At the bottom of the page we should have 2 buttons: “Create movie” to create the movie record and “Back” to go back to the movie list without making changes.
iii. The name of the movie in the list should be clickable and it will open the edit page. From the edit page all the fields of the movie can viewed and modified (except “Favorited”) which is a read-only field that doesn’t need to be shown on the edit page. For the thumbnail field we don’t need to see a preview of the picture, but we should have a way of opening/download the uploaded picture that could be just a link labeled “View thumbnail” and a way of replacing that picture for a new picture.
There should be at the bottom of the edit page 2 buttons: “Update” to update the movie record with the changes done on the edit page and “Back” to go back to the movie list without making changes.
b. Users

i. We need to be able to see a list of all the existing users. It will be a table with the username “username”, the number of favorited movies for that user “# favorited movies”, and a “Delete” link that will remove the user from the database.
ii. There will not be a way of creating users from this page. Users are only created from the app
iii. In the list of users the “username” can be clicked. It will open a new page that shows:
- The user name
- The list of movies favorited by the user, only the name of the movies must be shown.
- A “Back” button to go back to the user list page.
4. Please add a logout button to end the admin session
iOS and Android
We will have 3 possible screens:
1. First time the app is opened it will show the “Login screen”. It’s a super simple screen that asks for a username. It has a text field for the user name with a “Go!” button and it will only allow to enter 20 characters.
After tapping on “Go!”:
a. If the username contains characters not allowed please show a “Please only introduce numbers, letters and underscore.” error message.
b. If the username already exists in the server then it will assign that user and open the “Main screen”.
c. If the username does not exist it will show a popup asking “Do you want to create a new user with username: {username}?” with options “Yes”, “No”.
d. If “Yes” is chosen then a new user is created in the server for that username and the “Main screen” will open.
e. If “No” is chosen then the popup will close allowing to introduce a different username

2. The “Main screen” will have the following elements:
a. A top bar that shows “Welcome {username}” at the left and “Logout” at the right. Tapping on the “Logout” button/link will take the user back to the “Login screen”
b. A tab bar that can either be at the top of the screen or at the bottom of the screen with only 2 tabs: “Movies” and “Favorites”. The default tab is “Movies”, it’s the one opening after the Login screen.
The 2 tabs will show a list of movies with identical layout. The only difference is that “Movies” lists all the movies and “Favorites” lists only the user favorited movies. Each item (movie) of the list will show:
- The thumbnail at the left. If not thumbnail is available for the movie then a gray rectangle, proportional (same aspect ratio) to a 800x1000 pixels rectangle, will be shown instead of the thumbnail.
- The name of the movie at the right
- A button or link to favorite the movie if the movie has not been favorited by the user. A button or link to unfavorite the movie if the movie has been already favorited by the user
- Tapping anywhere in the item (except the favorite/unfavorite button/link) will open the “Movie detail” screen. See point 3.
The way the images are presented/aligned in this list, the size of the thumbnails, and the way the favorite/unfavorite button/link is presented is your choice, as well as any other design decision not specified here. The same goes for the way we scroll through the list of movies (what happens with the top bar and the tab bar while scrolling can be decided for you, any option is valid as long as it works)
If the user taps on the favorite/unfavorite button/link the action must have effect in real time (so for example if the user is browsing the “Favorites” tab and unfavorites a movie, the item will disappear immediately from the list).
3. The “Movie detail” screen will be opened when the user taps on a movie inside the “Movies” tab or the “Favorites” tab. This will hide the tab bar and will change the top bar so it only shows a “Back” button or “<” button at the left side of the top bar. In this screen we can see all the information related to the movie:
- The movie name
- The thumbnail of the movie. If not thumbnail is available for the movie then a gray rectangle, proportional (same aspect ratio) to a 800x1000 pixels rectangle, will be shown instead of the thumbnail.

- The list of genres for the movie
- The year of the movie
- The Director
- The Main star
- The description
- The number of times the movie has been favorited. We don’t need to allow the user to favorite / unfavorite the movie from here, that’s only needed from the “Main screen”.
Please keep in mind that some of those fields are optional so they might be empty, in that case we should not shown the field or the label related to that field.
The way this page is designed is your choice.
There is the possibility that the same user that is browsing the movie list is deleted from the server while the user is still browsing the movies. If this happens the app has to go back to the “Login screen”.
In case of no connectivity whenever the user requests data from the server we will show a “Please check your internet connection and try again.” message.
