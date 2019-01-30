# what-a-great-movie
Objective
The goal of this project is to have a simple web service that stores a list of movies and a set of favorite movies per user.
- Users will be able to see the list of movies and favorite movies from an Android app and an iOS app.
- Admins will be able to to see the list of movies and manage movies (add, edit, delete) from a web browser. They should be able to see what movies each of the existing users have favorited.
Requirements per platform
All platforms
- For each of you, all the code you create for this test has to be made available in a github public repository. It can be in your personal github account. Please give access to user https://github.com/diegopau​ ​to your repository.


iOS
- Developed on either Swift or Objective-C.
- When all is done, please send us a video of the app being launched from Xcode and how it is working on the iOS simulator to ​diego@scissorboy.com​ and grant@scissorboy.com​. An overview of all the app functionality will be enough.
- The interface design will be chosen by you. Doesn’t have to match the design chosen for the Android app. While we would love to see a decent design, it is much more important to us that the main functionality works and is bug-free. We don’t need a complicated design, just something simple and functional that doesn’t add much development time.
- There will be an API available to get the movie data and to communicate the user’s favorite movies to the server. You will need to communicate with the server developer, you can do it on this chat room: ​https://tlk.io/scissorboyteama-j5ls22a0​. From our team Diego will be also on that room following up with the discussion.

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
