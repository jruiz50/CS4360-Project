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
- [Logging into the Application](#logging-into-the-application)

## Introduction

[![Current Version](https://img.shields.io/badge/version-1.8.0-green.svg)](https://github.com/jruiz50/CS4360-Project)

Crave is a crowd-sourced app that focuses on getting ratings on specific food and drink menu items from restaurants, bars/breweries, and fast food chains. Figure out where you want to eat by searching what you are craving!

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

This project uses [Flutter](https://flutter.dev). Instructions on how to install and get started can be found [here](https://docs.flutter.dev/get-started/install).

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

### Via Xcode

Open the `Runner.xcworkspace` file in Xcode, which can be found via the following directory navigation:

`Spread > ios > Runner.xcworkspace`

> Note: There are two Runner.xc\* files. Be sure to open the correct one!

#### Installing Application Pods

It is required that you install the pods (dependencies) for the project. In your terminal from the project root:

```zsh

cd Spread/ios

pod install

pod update

```

#### Running the Application

At the top of the Xcode menu, select the following:

`Product > Destination`

Here you will find a list of iOS simulators that will be able to run our application. If you would like to run the application on your physical iOS device, simply connect it to your MacOS device and you will see it pop up in the list of simulators.

Finally, run the application by selecting the Play symbol on the top left of the Xcode editor, or by running `Cmd + R`.

Once the app is running, you can follow [these instructions](#logging-into-the-application) for signing in.

#### Closing the Application

To quit the application, you can simply exit out of the simulator by closing its window (or by exiting the application on your physical device). The best way to ensure the application will quit is to either press the Stop symbol on the top left of the Xcode editor, or by running `Cmd + .`

### Via Android Studio

Open the project code in Android Studio, particularly the `Spread` directory.
Ensure your terminal is also located in the Spread directory.

#### Running the Application

To run the application on your physical Android device:

In your device settings, ensure that `Installation from Unknown Sources` is enabled, then connect your phone to your computer. From there, you can simply drag the APK from the APK folder onto your device. This initiates the app download, at which point you can run it on your device.

To run the application on a simulated Android device:

You must first create/install a virtual device.
Detailed instructions with images on how to create a virtual device that supports our application on Android Studio can be found [here](https://docs.google.com/document/d/18utPt8JRgeznJ03VnGtQyhzohHgloZkBHBaF5gla2lo/edit?usp=sharing).

Once your device is installed, ensure to run it by selecting the "Play" symbol in the Device Manager.
With the simulator running, write the following command in your terminal at the Spread directory to run the app:

`flutter run`

Once the app is running, you can follow [these instructions](#logging-into-the-application) for signing in.

#### Closing the Application

To stop to app from running, in the terminal type `q`. This closes the application and stops the simulator.

> Note: On Windows the emulator may continue to run in the background. To terminate this process, type the following command in a new terminal

> taskkill /F /IM "qemu-system-x86_64.exe" /T

## Logging into the Application

You can either create an account or sign in using our testing credentials.

Testing Credentials (case-sensitive):
- Email: test@test.com
- Password: password


