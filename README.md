<h1 align="center"> Crave </h1> <br>
<p align="center">
<img alt="Crave" title="Crave Logo" src="https://user-images.githubusercontent.com/58575080/205465011-2f0fbe29-4cde-437b-a708-a2d6c050a3e7.png" height="200" width="200">
  <p align="center"> A Crowd-Sourced Menu Item Rating Application. </p>
</p>

## Table of Contents

- [Intro](#introduction)
- [Tech Stack](#tech-stack)
- [App Features](#features)
- [Environment Setup](#setup-development-environment)
- [Run the Application](#run-the-application)

## Introduction

[![Current Version](https://img.shields.io/badge/version-1.8.0-green.svg)](https://github.com/jruiz50/CS4360-Project)

Crave is a crowd-sourced app that focuses on getting ratings on specific food and drink menu items from restaurants, bars/breweries, and fast food chains.  Figure out where you want to eat by searching what you are craving!

## Tech Stack

The technology infrastructure of this application currently features:

- Mobile Application via [Flutter](https://flutter.dev/multi-platform/mobile) for Android + iOS support
- [Firebase](https://firebase.google.com/docs) management programmed in [Typescript](https://reactjs.org/docs/static-type-checking.html#typescript)
- [Cloud Functions](https://firebase.google.com/docs/functions/) Backend Server
- NoSQL Google [Firestore](https://firebase.google.com/docs/firestore/) Database
- [Google Maps](https://developers.google.com/maps/documentation/) API integration

## Features

A few of the things that the Crave mobile app is capable of:

- Scan your favorite local menu items, contributing to our crowd sourced database
- Satisfy your cravings by searching for particular food items
- Discover popular food items that are nearby your current location

## Setup Development Environment

First, you will need to clone or download this code onto your local machine. At your desired location, run the following command in your terminal:

```zsh
git clone https://github.com/jruiz50/CS4360-Project.git
```

### Install Flutter SDK

This project uses `flutter`. Instructions on how to install and get started can be found [here](https://docs.flutter.dev/get-started/install). 

Once you have completed the installation, ensure to update your path to use Flutter command line tools. 

Links to update path on [Windows](https://docs.flutter.dev/get-started/install/windows#update-your-path) or [MacOS](https://docs.flutter.dev/get-started/install/macos#update-your-path).

### Install App Dependencies

From inside the project root directory, run

```zsh
cd Spread

flutter pub get
```

### Select an Operating System

The Crave mobile application can be run under two different operating systems, each via a physical or simulated device. 

If you have an Android device or would like to simulate the application on a Android device, we suggest you [install Android Studio](https://developer.android.com/studio/install).

If you have an iOS device or would like to simulate the application on an iOS device, we suggest you [install Xcode](https://developer.apple.com/xcode/resources/) (requires a MacOS device). 


## Run the Application

### Via Android Studio

> > The first by installing the app on a physical device.
> >
> > > Enure that installation from unknown sources is enabled, then connect your phone to your computer, and drag the apk from the APK folder onto your device.
> > > Find the Apk on your device, install and explore it's features.
>
### Setting up Android Studio

> Setting up Android Studio is more involved process, as it will require the creation of a virtual device, grabbing the project
> from version control, and installation of required packages.

> Grab the project
>
> > The first step is to open Android Studio and select File -> New -> Project from Version Control.
> > Then copy and paste in this url: https://github.com/jruiz50/CS4360-Project.git
> > and clone the project.

> > Note: If you don't have current project in progress in Android Studio, Select new Flutter Project -> Empty Project -> Modules
> > Now repete the steps above to clone the project

> > A popup in the lower right of the window will prompt you to configure the android framework. Go ahead and click configure,
> > then make sure that both of the boxes are checked.

> > In the upper left corner of the window, under the project name, slect the dropdown that says Android with the android symbol,
> > and select Project.

> > Expand "CS4360-Project" to show Spread -> lib
> > lib contains all of the source code the project.

> Create a virtual device
>
> > Select the phone icon with the android symbol in the upper right corner.
> > Then select Create device.
> > The select a recent phone of your choice then click next.
> > Select Release "S" with an API Level of 31.
> > Give it a name then hit finish. The device should then boot.
> > The following link provides these examples with pictures. https://docs.google.com/document/d/18utPt8JRgeznJ03VnGtQyhzohHgloZkBHBaF5gla2lo/edit?usp=sharing

> > Please refer to this link for more in depth information regarding the creation of a virual device. https://developer.android.com/studio/run/managing-avds

> Running the project
>
> > Open the terminal by selecting the Terminal tab at the bottom of the screen and use "cd Spread".
> > Then enter "dart pub get", this will ensure that all dependancies that are required in the pubspec.yaml will be installed.
> > Finally ensure that your virtual device is running.
> > Then in the terminal type "Flutter run" (Note your terminal must be "in" Spread)
> > Note first run commpilation can take several minutes. The virtual device will eventually open up the app after installation.

> Closing the App
>
> > To stop to app from running, in the terminal hit "crtl-c" or "cmd-c". Then type "y" to terminate. The virual device can
> > can now be exited.
> > Note: On Windows the emulator will continue to run in the background. To terminate this process, open up another terminal
> > and paste this command in to terminate the process.
> >
> > taskkill /F /IM "qemu-system-x86_64.exe" /T


### Via Xcode

Once installed, open the `Runner.xcworkspace` file, which can be found via the following directory navigation:

`Spread > ios > Runner.xcworkspace`

> Note: There are two Runner.xc\* files. Be sure to open the correct one!

### Installing Application Pods

In order for your build to succeed, it is required that you install the pods (dependencies) for the project. In your terminal from the project root:

```zsh

cd Spread/ios

pod install

pod update

```

Once complete, you can build the application in Xcode with `Cmd + B`. Sometimes the application will auto-build before you are able to complete the steps above. If you are still seeing errors, clean your build folder with `Cmd + Shift + K`, then retry your build.

### Emulating the Application

Once the application has been successfully built,

> To run the application on your iOS device:

Ensure that your iOS device is connected to your MacBook via USB-C to lightning cable.

> The following steps are the same for users running the application on an emulator:

At the top of the Xcode menu, select the following:

`Product > Destination`

Here you will find a list of iOS simulators, including your own physical device if it is connected. Select the device which you wish to run the application on.

Finally, run the application by selecting the Play symbol on the top left of the Xcode editor, or by running `Cmd + R`.

### Closing the Application

To quit the application, you can simply exit out of the simulator by closing its window (or by exiting the application on your physical device). The best way to ensure the application will quit is to either press the Stop symbol on the top left of the Xcode editor, or by running `Cmd + .`
