---
---
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
