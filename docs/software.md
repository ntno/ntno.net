---
hide:
  - git_revision_date
  - toc
---

**open source projects**

<hr>

**gifcam** - [ntno/gifcam](https://github.com/ntno/gifcam){target=_blank}  

please see [project page](/electronics/gifcam) for details  
<hr>

**docker containers** - [ntno/docker-containers](https://github.com/ntno/docker-containers){target=_blank}  

[Docker containers](https://docs.docker.com/get-started/overview/){target=_blank} can be used to predefine a project's development environment, including all required developer tools.  With a properly defined container and a standardized Makefile, setting up a work environment becomes incredibly simple.  

The above repository includes a few use case specific containers.  It also provides an example of how to verify that a container is defined correctly using the [goss](https://github.com/aelsabbahy/goss){target=_blank} testing framework.  
<hr>

**mkdocs `terminal.css` theme** - [ntno/ntno.net/custom_theme](https://github.com/ntno/ntno.net/tree/main/custom_theme){target=_blank, title="separate packaging to be made available shortly"}  

[mkdocs](https://www.mkdocs.org/){target=_blank} is a framework for creating documentation websites from markdown files.  Custom themes can be applied to give sites a unique style.  I created the theme for this portfolio site using [terminal.css](https://github.com/Gioni06/terminal.css){target=_blank}.  It will be published as downloadable theme shortly.  See [squidfunk's material theme](https://squidfunk.github.io/mkdocs-material/getting-started/){target=_blank, title="view example site"} for theme comparison.
<hr>

**DnD cryptography puzzle** - [ntno/vertical-script-puzzle](https://github.com/ntno/vertical-script-puzzle){target=_blank}  

I created 'vertical-script' as a fun way to encode secret messages.  It is a constructed script for English and is written top-down, with letters within words connected by a vertical line.  

I used this script to encode fictional correspondence between the antagonists in DnD 5th edition's starter adventure.  The messages can be fully decoded by comparing common symbol features and English's letter frequency (see Figure 12).  
  
<section>
  <figure>
    <a target="_blank" href="/img/software/original-puzzle-in-progress.png">
    <img style="border: 1px solid #888888;"
      src="/img/software/original-puzzle-in-progress.png"
      alt=""
      title="original puzzle activity"
    />
    </a>
    <figcaption>Figure 12, players work together to decode symbols using letter frequency analysis</figcaption>
  </figure>
</section>
<br>
<br>
The above repository contains a `p5.js` sketch which loads the 'vertical-script' encoded messages to drag-and-drop tiles.  The sketch showcases the constructed script and allows users to analyze the script's symbols.
<section>
  <figure>
    <a target="_blank" href="/img/software/vertical_script_puzzle.gif">
    <img style="border: 1px solid #888888;"
      src="/img/software/vertical_script_puzzle.gif"
      alt=""
      title="script tiles in p5.js sketch"
    />
    </a>
    <figcaption>sorting word tiles by common feature in p5.js sketch</figcaption>
  </figure>
</section>
