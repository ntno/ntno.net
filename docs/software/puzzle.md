# DnD Cryptography Puzzle
Fall 2021 

I created 'vertical-script' as a fun way to encode secret messages.  It is a constructed script for English and is written top-down, with letters within words connected by a vertical line.  

I used this script to encode fictional correspondence between the antagonists in DnD 5th edition's starter adventure.  The messages can be fully decoded by comparing common symbol features and English's letter frequency (see Figure 12).  
  
<section>
  <figure>
    <a href="/img/software/original-puzzle-in-progress.png">
    <img style="border: 1px solid #888888;"
      src="/img/software/original-puzzle-in-progress.png"
      alt="screenshot of players' progress decoding symbols in Roll20"
      title="original puzzle in Roll20"
    />
    </a>
    <figcaption>Figure 12, players work together to decode symbols using letter frequency analysis</figcaption>
  </figure>
</section>
<br>
<br>

## p5.js Sketch

[ntno/vertical-script-puzzle](https://github.com/ntno/vertical-script-puzzle) contains a [p5.js](https://p5js.org/) sketch which loads the 'vertical-script' encoded messages to drag-and-drop tiles.  The sketch showcases the constructed script and allows users to analyze the script's symbols.
<section>
  <figure>
    <a href="/img/software/vertical_script_puzzle.gif">
    <img style="border: 1px solid #888888;"
      src="/img/software/vertical_script_puzzle.gif"
      alt="animated gif of word tiles being grouped together by common symbol feature"
      title="script tiles in p5.js sketch"
    />
    </a>
    <figcaption>sorting word tiles by common feature in p5.js sketch</figcaption>
  </figure>
</section>
