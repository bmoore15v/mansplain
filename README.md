# MANSPLAIN

Mansplain is a simple script that allows you to create a searchable dropdown list of manual pages and convert them to PDF for easier formatting, to save for future use. This script (and catchy name) was shared by [Luke Smith](https://github.com/LukeSmithxyz) on his [YouTube page](https://www.youtube.com/watch?v=8E8sUNHdzG8&t=4s) originally and I am making the process available here for additional accessibility. If you want a detailed explanation of all of the elements in this script, I encourage you to check out Like’s thorough explanation.

## Use Case

While getting use to being in the terminal is essential, it isn't always helpful for study. A variety of limitations arise when studying text from the terminal and sometimes you want to be able to print a sheet off to annotate or have it accessible in a variety of locations. Having a PDF version is helpful for that reason. This is also helpful for someone transitioning to learning Linux and the various commands available to them by giving them a formant they are use to.

## Dependencies

You will nee several programs installed in order for this script to run properly. I am using ```yay``` as the package manager in the examples below, but you should be able to do this with any package manager on any distribution.

First you will need man:

```
yay -S man 
```

Second you will need dmenu:

```
yay -S dmenu
```

Thirdly you will need zathura and zathura pdf:

```
yay -S zathura 
```

```
yay -S zathura-pdf-mudf
```

## Enable mandb
If you are installing ```man``` for the first time you will need to enable ```mandb```. This will index all of the manuals you have on your system; this may take a while. Additionally, you will want to run this command whenever you add new programs so that the manuals are updated. You will need root permission in order to run the command.
```
# mandb
```
## Make a Script Directory

Once all of the above is done, you are ready to create your script. You will start by deciding where you will save your script. I chose to place it in a hidden directory in my ```/home``` directory called ```.scripts```. 
```
mkdir .scripts
```
Making a directory where you store scripts is optional, but it is a good idea. You can place this file anywhere you want. Just remember where you put your script.

## Creating the file

In the scrips folder, open a new file in your editor of choice called ```mansplain``` (or call it anything you want). I will use nano for this example.

```
nano mansplain
```

In the file you will need to add this line of code:

```
#!/bin/sh
man -k . | dmenu -l 30 | awk ‘{print $1}’ | xargs -r man -Tpdf | zathura –
```
Save and exit.

## Make it Executable
Next you will need to make the file executable by typing this command:

```
chmod +x mansplain 
```
If you gave your file a different name you will need to insert it after the x.

```
chmod +x <*file_name_here*>
```

## Run your script
Once you’ve done all that you will be able to run your script by typing in 

```
~/.scripts/./mansplain
```

If you did not name your folder and file the same, you will run it by this structure:

```
~/<*folder_name*>/./<*file_name*>
```
# Saving Your PDF

Once you run your script and select your file, zathura will create a temporary file. You should see the file path in the bottom of on the window – look around for it if you don’t see it there, it could also be in the window boarder if you have that enabled in your terminal. 

The structure will be something like ```/tmp/zathura.stdin…```. In the screenshot above, the temporary file path is ```/tmp/zathura.stdin.NLQH50```. In order to save this PDF you will need to copy that temp file (while it is still open) to a location of your choosing. In the example below (showing the ```ls``` command manual), I chose to save the file in a directory in the ```/Documents``` directory called ```Linux Manuals``` So I run this command:

```
cp /tmp/zathura.stdin.NLQH50 ~/Documents/Linux\ Manuals/lsmanual
```
Now you have a saved PDF of the ls manual that you can print out, or email or send to your favorite tablet. I hope it proves helpful to you!
