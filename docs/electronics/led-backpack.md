---
grid_css: ntno_img_card_grid
tiles: 
  - img_src: /img/led-biking-backpack/led-layout-brainstorm.png
    caption: 'Figure 8, *Misc. Project Notes*, pages 82, 83.'
    img_title: ''
    img_alt: ''
  - img_src: /img/led-biking-backpack/led-layout.png
    caption: 'final NeoPixel layout (detail)'
    img_title: ''
    img_alt: ''
  - img_src: /img/led-biking-backpack/switch_flora_power.jpg
    caption: 'weather-proof enclosure for FLORA and power.  power switch and data lines exit the enclosure through hole drilled in side'
    img_title: ''
    img_alt: ''
  - img_src: /img/led-biking-backpack/rf_module.jpg
    caption: 'RF receiver module for swapping LED animations via clicker'
    img_title: ''
    img_alt: ''
  - img_src: /img/led-biking-backpack/lights.jpeg
    caption: 'NeoPixels installed in backpack lining (see Figure 10 for details)'
    img_title: ''
    img_alt: ''
    tile_css: ntno_img_card

---

# LED Brake Light Biking Backpack
May 2018 - October 2018

My goals for this project were to create a backpack with installed LEDs for nighttime visibility and daytime aesthetics.  The intention was to pre-program the individually addressable LEDs with various traffic signal animations (left turn, right turn, brake, etc.).  These animations could then be triggered via radio controller or accelerometer.  

Unfortunately, the NeoPixel installation proved to be extremely unstable (see [Construction Challenges](#construction-challenges)).  The data and power connections between NeoPixels quickly deteriorated after a few weeks of using the backpack for everyday storage.  

I decided to retire this project early and revisit my visibility and aesthetic objectives in a [Skating Vest](/electronics/led-vest) in 2019.


<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MGH-tQvNgmE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>Figure 9, Completed Backpack</figcaption>
  </figure>
</section>
<br>

# Construction Challenges 

<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/x3G2lGEFHbc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>Figure 10, Project Reflection</figcaption>
  </figure>
</section>
<br>

**Transcript**  
*Note: Filler words removed removed for clarity*  

`[00:05]` Hi everyone, this is Natan and I have an update on the backpack project. So what I have done is I took out all of the components and I'm just trying to figure out exactly what is the problem here. 

`[00:24]` So I undid most of the soldering because it was really messy and I wasn't sure if that was part of the problem. So I took all that out and now I have everything hooked up just to the bread board, power, and Flora (the Uno is not being used here, just the bread board.  

`[00:45]` So I have everything hooked up and the good news is the lights light up. All of them light up so that was really exciting and you can see it's pretty bright (oh my gosh it is so pretty).  Right, okay, but there's a problem, well two problems, which is that 

`[01:07]` A) these lights are supposed to be changing color and they are not and 

`[01:11]` B) yeah as soon as you sort of move this, these lights go out and this one and this one and this one just flicker weirdly.  

`[01:23]` Since the toughest part of this whole project was installing the lights, I'm not sure that I really want to go through the effort of ripping all these out and installing a fresh set; and then even if I do, maybe it's the fact that all of this wiring is like curled back in a bunch of times and squished together really tight.  Maybe that's causing the instability of the of the NeoPixel strand. So given that, I'm not sure it makes sense to salvage this particular version of the brake light backpack. So this might need to live on in a version two. 

`[02:17]` But I really liked this project and I think I will keep going with it in some other form.  The NeoPixels are very cool. Yeah.  Very cool, and I really like the effect it's just sad that they don't seem to handle being squished up that well.  
 
`[02:40]` Anyways, I'll try to zoom in and show you how I did this... So I cut out holes in the backpack and I cauterized the edges of them with a lighter because it's a synthetic material.  

`[03:00]` And then cut out the liner here and stuck all of the NeoPixels in there.  Then sewed them to the outer face of the backpack so that they would be sticking out of the backpack.

`[03:27]` So you can see that these are 3-dimensional little knobs. So you have to sew them so that they're being pulled against the face of the backpack, otherwise they will just fall in and they won't stick out any more.  They'll fall into the bag and you won't be able to see them. 

`[03:49]` So that's the update.  Really fun project.  Gonna keep going.  I just might not install the lights directly into the back next time. Maybe on the outside, something that you clip on.  So thanks for watching. Have a good one, guys!  Bye.

# Acknowledgements

Project inspired by Becky Stern's Brake Light Backpack<sup>[1](./#references)</sup>.  Many thanks to Becky for her excellent build guide.

# References

[1] Becky Stern.  "Flora Brake Light Backpack"  *learn.adafruit.com*, 13 Feb. 2013, [https://learn.adafruit.com/flora-brakelight-backpack](https://learn.adafruit.com/flora-brakelight-backpack){target=_blank}.

# Process Photos
