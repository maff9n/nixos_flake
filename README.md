## Collection of nixOS configurations

This repository holds all necessary configuration files for multiple nixOS machines.  
Please feel free to check them out.  
The way to go is: `nixos-rebuild switch --use-remote-sudo --flake <PATH_TO_DIRECTORY>#<NIXOS_CONFIGURATION_NAME>`


### Prerequisits

None.  
Flakes are standalone in contrast to channels.  
Check out [this blog](https://www.tweag.io/blog/2020-05-25-flakes/) to learn more about the topic.


### Goal of this repo

In case you get a new machine, a machine is stolen or broken, you can have the entire operating system and all user configurations built within minutes.
Eliminate all reliance on the individual machine's state.  
Have all your shortcuts and favorite tools at hand, anywhere.
