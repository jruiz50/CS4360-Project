# Crave

A mobile application that focuses on helping the user to find their next meal. 

### Getting Started
> There are two options for acessing the app in it's current state.
>> The first by installing the app on a physical device.
>>> Enure that installation from unknown sources is enabled, then connect your phone to your computer, and drag the apk from the APK folder onto your device.
Find the Apk on your device, install and explore it's features.
>
>
>> The second option is to use Android Studio to run a virtual device. This will also allow for exploration of the codebase. 
This process is outlined in detail below. 


### Installing Android Studio
Our application is currently being built using the Android Studio IDE.
Which provides a host of features, such as debugging, language support, and for testing purposes
the ability to run mobile emulators. 

>Specific mobile platform emulation is based on the operating system
of the machine running the project. If your using Windows or Linux then an Android device will be used.
For machines running macOS the choice for either mobile platform exists. This guides will use
an android emulator. 

>The first step is to install Android Studio by following the steps as outlined for your machine,
from the link below. 

>https://developer.android.com/studio/install

### Installing Flutter SDK
>Flutter is an open source user interface development kit that was created by google. 
It is used for cross platform development for applications that run on,
Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web.
While utilizing a single codebase. 

>The steps for installing Flutter on your machine choice can be found below.
The most important step after installation of the sdk, is to ensure that *flutter*
is added to your machines path.

>Note: The steps involving flutter doctor are way to ensure that flutter is installed, but can be disregarded if your
confident in the installation. 

>Note: While Flutter uses the Dart language, installation of the Dart SDK is not required as it is included
with the Flutter SDK.

>https://docs.flutter.dev/get-started/install

### Setting up Android Studio
>Setting up Android Studio is more involved process, as it will require the creation of a virtual device, grabbing the project
from version control, and installation of required packages.

>Grab the project
>>The first step is to open Android Studio and select File -> New -> Project from Version Control.
Then copy and paste in this url: https://github.com/jruiz50/CS4360-Project.git
and clone the project. 

>>Note: If you don't have current project in progress in Android Studio, Select new Flutter Project -> Empty Project -> Modules
>>Now repete the steps above to clone the project

>> A popup in the lower right of the window will prompt you to configure the android framework. Go ahead and click configure,
>> then make sure that both of the boxes are checked. 

>>In the upper left corner of the window, under the project name, slect the dropdown that says Android with the android symbol,
and select Project.

>>Expand "CS4360-Project" to show Spread -> lib
lib contains all of the source code the project.

> Create a virtual device
>> Select the phone icon with the android symbol in the upper right corner.
Then select Create device.
The select a recent phone of your choice the click nect.
Select Release "S" with an API Level of 31.
Give it a name then hit finish. The device should then boot.

>> Please refer to this link for more in depth information regarding the creation of a virual device. https://developer.android.com/studio/run/managing-avds

> Running the project
>> Open the terminal by selecting the Terminal tab at the bottom of the screen and use "cd Spread".
>> Then enter "dart pub get", this will ensure that all dependancies that are required in the pubspec.yaml will be installed.
>> Finally ensure that your virtual device is running.
>> Then in the terminal type "Flutter run" (Note your terminal must be "in" Spread)
>>Note first run commpilation can take several minutes. The virtual device will eventually open up the app after installation. 

> Closing the App
>> To stop to app from running, in the terminal hit "crtl-c" or "cmd-c". Then type "y" to terminate. The virual device can
can now be exited. 
>> Note: On Windows the emulator will continue to run in the background. To terminate this process, open up another terminal
and paste this command in to terminate the process.
>>    
>> taskkill /F /IM "qemu-system-x86_64.exe" /T




