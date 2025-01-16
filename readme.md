Welcome to UE Build Tool Helper!
Easy powershell scripts to build automate building and other processes of your game on your machine!

## Where to put this plugin
- Typically I paste this plugin into the hierarchy like this:
    - RepositoryRoot/Uproject directory/scripts/...
    - In the scrips folder all of this repository is placed

## Getting Started
To make a build you will use <this repo>/UnrealEngine/Build/UE-Build.ps1
arguments:
- ProjectName - needs to match your uproject name so that we find the actual uproject
- Platform - if you are on windows just uses Win64, but we use this param for other confidential platforms and it works as well
- Configuration - This is set between all UE build configurations: DebugGame, Development, Shipping

## Commandlet support:
You can support any commandlets you create or just use the built-in commandlets from UE.
Run <this repo>/UnrealEngine/Commandlet/UE-RunCommandlet.ps1 to run any commandlet as a wrapper, where you specify arguments:
- commandletName - this needs to be module.commandletname and commandlet names need to end with word "commandlet" so something like "DoYourStuffCommandlet" for UE to find it properly
- ProjectName - same as build - needs to match your uproject name
- AdditionalArgs - if your used commandlet uses arguments this is where you can specify them into a string array

Hope you will find joy in automating your UE processes with this tool!