---
img_cards: 
  - img_src: /img/gifcam/circuitry-1-of-3.png
    img_caption: 'Figure 1, <i>Misc. Project Notes</i>, pages 84, 85.'
    img_title: ''
    img_alt: 'scan of notebook pages containing illustrations of components and circuitry'
  - img_src: /img/gifcam/circuitry-2-of-3.png
    img_caption: 'Figure 2, <i>Misc. Project Notes</i>, pages 86, 87.'
    img_title: ''
    img_alt: 'scan of notebook pages containing illustrations of circuitry with labels indicating wire colors'
  - img_src: /img/gifcam/notes-3-of-3.png
    img_caption: 'Figure 3, <i>Misc. Project Notes</i>, page 88.'
    img_title: ''
    img_alt: 'scan of notebook page containing brainstorming notes on software components needed to securely upload images to Amazon S3 storage'
  - img_src: /img/gifcam/dont_use_incompatible_ribbon.jpg
    img_caption: 'discovered partway through build that the ribbon connector sold with camera was incompatible with Pi Zero W'
    img_title: ''
    img_alt: '3D printed camera case with camera and default ribbon installed.  annotation notes that this ribbon is incompatible with Pi Zero W'
  - img_src: /img/gifcam/modify_case_to_support_compatible_ribbon.jpg
    img_caption: 'constructed floating platform to secure the Pi Zero within reach of a shorter, compatible connector'
    img_title: ''
    img_alt: 'detail of Pi Zero secured to floating platform.  the new, compatible ribbon connector is able to reach the Pi Zero'
  - img_src: /img/gifcam/wires_annotated.jpg
    img_caption: 'PowerBoost connections (battery to PowerBoost, power switch to PowerBoost, PowerBoost to Pi Zero)'
    img_title: ''
    img_alt: 'detail of PowerBoost with annotations indicating which wires connect to the power switch, Pi Zero, and battery'
---
# gifcam
Summer 2019

<section>
  <figure>
    <img
      src="/img/gifcam/philly-07.gif"
      alt="animated gif of view through car window as car crosses street.  rain drops partially obscure view.  pedestrians cross the street in rain gear."
      title="capture from gifcam"
    />
    <figcaption>Natan Organick, <i>untitled</i>, capture from gifcam, 2019.</figcaption>
  </figure>
</section>



# Project Goals  

- wireless camera to capture GIFs without the distraction of smart phone
- automatic publishing from camera (no deliberation on photo, more like a Polaroid in that all images are 'printed')
- experiment with Amazon's IOT services

# Custom Software  

- MQTT 
- Amazon S3 secured by pre-signed links
- Images converted to GIF in Lambda
- Images posted to Twitter

<br>
<section>
  <figure>
    <img style="border: 1px solid #888888;"
      src="/img/gifcam/tweet.gif"
      alt="screencapture of tweet.  tweet contains animated gif of spinning ceiling fan.  tweet author is ntno-dev"
      title="gif screencapture of tweet with gifcam capture attached"
    />
    <figcaption>successful tweet from gifcam (July 1, 2019)</figcaption>
  </figure>
</section>
<br>

# Materials  

- Raspberry Pi Zero W
- Raspberry Pi Camera Module
- Adafruit PowerBoost 500 C (charger)
- 3.7v 2500mAh Lithium Ion Polymer Battery
- illuminated pushbutton switch, LED, SPDT switch
- 3D printer (Lulzbot)

# Acknowledgements

Camera case and circuitry design based on Nick Brewer's PIX-E Gif Camera<sup>[1](./#references)</sup>.  Many thanks to Nick for his excellent build guide.

# References

[1] Brewer, Nick.  "PIX-E Gif Camera."  *hackaday.io*, 14 Oct. 2016, [https://hackaday.io/project/16358-pix-e-gif-camera](https://hackaday.io/project/16358-pix-e-gif-camera){target=_blank}.


# Progress Photos  

