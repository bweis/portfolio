---
title: "Making sqlplus Usable"
date: 2017-11-17T12:00:00-05:00
categories:
  - purdue
---

I have been taking [CS 348: Information Systems](https://selfservice.mypurdue.purdue.edu/prod/bwckctlg.p_disp_course_detail?cat_term_in=201820&subj_code_in=CS&crse_numb_in=34800) this semester and found that using sqlplus on the lab machines is borderline maddening.

A friend helped me configure the [rlwrap](https://github.com/hanslub42/rlwrap) wrapper utility to make `sqlplus` less frustrating to use. I wanted to document the process for anyone else who wants sane keyboard editing inside `sqlplus`.

---

## The Problem with `sqlplus`
Out of the box, `sqlplus` is quite frustrating to use because it doesn't have line editor functionality. This means that if you use your up and down arrow keys, for instance, you do not go through your input history (as in a terminal), but instead you see the escape character for the up/down arrows: `^[[A^[[B` Frustrating!

## The Solution: rlwrap
[rlwrap](https://github.com/hanslub42/rlwrap) is a 'readline wrapper', which allows for the editing of keyboard input for any command. It's quite simple to build and use.

1. Clone the project to your home directory.

    ```
    cd ~
    git clone https://github.com/hanslub42/rlwrap.git
    ```

2. Configure and build the project.

    ```
    cd rlwrap
    autoreconf --install
    ./configure --prefix=$HOME
    make install
    ```

3. Use `rlwrap` to run `sqlplus`.

    ```
    rlwrap sqlplus
    ```

---

Now you've got better keyboard support for interacting with `sqlplus`! Hopefully this makes working with it a little less frustrating (sorry, I haven't found a way to make SQL itself more enjoyable).
