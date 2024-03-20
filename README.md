# Sound Share
A project developed for the *Building the Internet of Things with P2P and Cloud Computing* course.
The outcome of the project is a mobile application allowing for simultaneous and synchronized playback of the same audio source on multiple devices. Possible use cases include:
- a low-cost solution providing synchronized music in different rooms
- a silent disco
- a replacement for a portable Bluetooth speaker

For more detailed information about the project, please refer to the [Project Report](ProjectReport.pdf).  
A video presenting the final result can be watched [here](https://drive.google.com/file/d/1TbBRSu0EmLWqXTYEgXrc0xKV2LceFNJx/view?usp=sharing).  

## Tech Stack
The app is developed in Flutter. 
The communication between connected devices is accomplished with a custom-made P2P network, implemented with TCP sockets.

## Application Architecture

| Layers       |                                                                                    |
|--------------|------------------------------------------------------------------------------------|
| UI layer     | Rendering of the UI                                                                |
| Domain layer | Logic of the application, handling user inputs, interacting with the P2P network.  |
| P2P layer    | Communication between the devices via a P2P network                                |
| Link layer   | Direct communication between the devices with TCP protocol                         |

## Screenshots

![Screenshot](screenshots.png)