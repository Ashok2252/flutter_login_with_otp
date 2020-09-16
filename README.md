# Flutter Login With Mobile Authentication

## What you have to do :

1. Simply Clone or Download this Repository and put it in some folder say "X"
2. Create a new folder and then simply open that folder in terminal.
3. Type command : flutter create firebase_user_login  (Write this command as it is !)
4. After executing that type another command : code .   
5. It will open your VS Code Terminal.
6. Now open your File Explorer/File Manager and copy all the data from folder "X" and replace it with the files of newly created flutter project.

## Till here the application is setup on your native device

6. Now Open https://console.firebase.google.com/ in your Browser.
7. In Firebase create a new project and name it anything
8. Now open that project 
9. On the left side click on Authentication
10.Then click on Sign-In Methods and in that Enable Phone Tile and save it.
11.Now click on Project Overview on left hand side which is located above the Authentication & Develop
12.Clicking on that on the center of your screen there might be 3 icons for iOS , Android & Web
13.Click on Android Icon.
14.Enter Packagename for example : 1) com.example.firebaselogin 2) com.example.firebaseloginotp
15.Enter a nickname anything
16.Here you need an sha key which is the 3rd field how will you get this ?

Simply open your Flutter project in VS Code and navigate to the android folder in Terminal 
And Type

.\gradlew signingReport

17.After some sort of time it will show all the key fields and from ther copy the SHA-1 key.
18.Paste it in the firebase console opened in web & click next
19.Download the JSON File & store it in the >>Your_Flutter_Project>>android>>app
20.Store it in the App Folder there will be an JSON File already while cloning this repository replace it with your's
21.Then Simply click the next button and skip the last step in Firebase.

## Firebase is Set 😁😁

Few More Steps Only

22.Please note the Package which you have entered in the step 15
23.Copy that package name 
24.In VS Code >>YourFlutterProject>>Android>>App>build.gradle
25.Open build.gradle file
26. On that line No. 37 there is an applicationId . Now Paste your package name in that double quotes
27.That's it All done

# Pro Tip 

If any error occured just check once your pubspec.yaml file

#### I have wasted almost 2-3 days in this.Hope so someone can get benefit of this.

# Screeshots
