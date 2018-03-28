---
title: "Connect to Purdue CS files using SSHFS"
authors: ["benweis"]
date: 2016-12-12T12:00:00-05:00
draft: false
tags:
  - purdue
  - development
  - homebrew
---

Here’s a quick tutorial on how I access my Purdue CS files remotely so that I can still use all my preferred local development tools, like Sublime Text and my shell customizations.

---

## Install Required Software on Mac OS X
I assume you already have [Brew][] and [Homebrew Cask][] installed on your Mac.

1. Use cask to install [osxfuse][]:

    ```bash
    brew cask install osxfuse
    ```

2. Use homebrew to install `sshfs`:

    ```bash
    brew install sshfs
    ```

## Mount Your Remote Directory
1. Run the following command to mount the directory to your local machine:

   ``` bash
   sshfs <username>@data.cs.purdue.edu:/homes/<username>/ ./<desired_mountpoint> -o auto_cache,reconnect,defer_permissions,noappledouble
   ```
   For example:

   ``` bash
   sshfs bweis@data.cs.purdue.edu:/homes/bweis/ ~/purdue -o auto_cache,reconnect,defer_permissions,noappledouble
   ```

2. You may receive the following dialogue box which will require you to give permissions to the application.
<div style="text-align: center;"><img src="/img/connect-to-purdue-cs-files-using-sshfs/Error.png" width="50% "></div>


3. Now change to the directory you mounted in. You should see the remote files in the directory, and you can interact with them just as if they were local files on your Mac.

## Unmount Your Remote Directory
1. Run the `umount` command to unmount the directory:

   ```bash
   umount ./desired_mountpoint
   ```


   For example:

   ``` bash
   umount ~/purdue
   ```

---

Of course, this works on any system that supports SSH, but the case of connecting to Purdue servers to work on projects from home has been especially convenient during my time as a CS student. I've found it to be a bit flaky depending on your network connectivity, and it rarely resumes the mount from a suspend gracefully. However, it's a really convenient way to access your files remotely while still developing locally.

Are you a Purdue CS student that stumbled upon this? Did it help you? Did something not work? Let me know [@Real_Ben_Weis](//twitter.com/Real_Ben_Weis)!


[brew]: http://brew.sh/ "Brew Website"
[homebrew cask]: https://caskroom.github.io/ "Homebrew Cask Website"
[osxfuse]: https://osxfuse.github.io/ "FUSE for OS X"
