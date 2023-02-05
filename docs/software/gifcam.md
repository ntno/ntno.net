---
grid_css: ntno_img_card_grid
tiles: 
  - caption: Figure 1, *Misc. Project Notes*, pages 84, 85.
    img_src: /img/gifcam/circuitry-1-of-3.png
    alt_text: scan of notebook pages containing illustrations of components and circuitry
  - caption: Figure 2, *Misc. Project Notes*, pages 86, 87.
    img_src: /img/gifcam/circuitry-2-of-3.png
    alt_text: scan of notebook pages containing illustrations of circuitry with labels indicating wire colors
  - caption: Figure 3, *Misc. Project Notes*, page 88.
    img_src: /img/gifcam/notes-3-of-3.png
    alt_text: scan of notebook page containing brainstorming notes on software components needed to securely upload images to Amazon S3 storage
  - caption: discovered partway through build that the ribbon connector sold with camera was incompatible with Pi Zero W
    img_src: /img/gifcam/dont_use_incompatible_ribbon.jpg
    alt_text: 3D printed camera case with camera and default ribbon installed.  annotation notes that this ribbon is incompatible with Pi Zero W
  - caption: constructed floating platform to secure the Pi Zero within reach of a shorter, compatible connector
    img_src: /img/gifcam/modify_case_to_support_compatible_ribbon.jpg
    alt_text: detail of Pi Zero secured to floating platform.  the new, compatible ribbon connector is able to reach the Pi Zero
  - caption: PowerBoost connections (battery to PowerBoost, power switch to PowerBoost, PowerBoost to Pi Zero)
    img_src: /img/gifcam/wires_annotated.jpg
    alt_text: detail of PowerBoost with annotations indicating which wires connect to the power switch, Pi Zero, and battery
    tile_css: ntno_img_card
---
# gifcam
Summer 2019

<figure markdown>
  <img
    src="/img/gifcam/philly-07.gif"
    alt="animated gif of view through car window as car crosses street.  rain drops partially obscure view.  pedestrians cross the street in rain gear."
  />
  <figcaption markdown>Natan Organick, *untitled*, capture from gifcam, 2019.</figcaption>
</figure>

# Project Goals

- create a RaspberryPi camera that captures and publishes GIF animations to social media  
- [improve on](#architecture-goals) Nick Brewer's existing gifcam software<sup>[2](./#references)</sup>  
- explore AWS IoT service features  


<em>Note: hardware design by Nick Brewer<sup>[1](./#references)</sup></em>

# Architecture Goals

- verify IoT device connecting to cloud platform is authorized
- do not store AWS access keys on the RaspberryPi 
- do not store social media API keys on the RaspberryPi
- speed up time between GIF captures by offloading GIF processing to cloud

<section>
  <figure>
    <img style="border: 1px solid #888888;"
      src="/img/gifcam/tweet.gif"
      alt="screen capture of tweet.  tweet contains animated gif of spinning ceiling fan.  tweet author is ntno-dev"
      title="screen capture of tweet published by cloud enabled gifcam"
    />
    <figcaption>successful tweet from gifcam (July 1, 2019)</figcaption>
  </figure>
</section>
<br>

# Architecture

source code available on github: [ntno/gifcam](https://github.com/ntno/gifcam){target=_blank}

<figure>
  <img src="/img/gifcam/architecture.jpeg" alt="gifcam software architecture, illustration."/>
  <figcaption>Figure 11, Gifcam Architecture</figcaption>
</figure>
<br>

**Figure 11 Annotations**

1. gifcam connects to AWS IoT with approved private key
- gifcam subscribes to the `presigned-url` AWS IoT topic
- gifcam captures frames via picamera module
- gifcam publishes request to the `request-url` AWS IoT topic over MQTT protocol
- new `request-url` message triggers `generate-s3-url` Lambda 
- `generate-s3-url` Lambda authorizes POST and DELETE to requested S3 object location
- `generate-s3-url` Lambda publishes the pre-signed S3 URLs to the `presigned-url` AWS IoT topic
- gifcam executes upload callback and posts frames to pre-signed URL over HTTPS
- gifcam creates a DELETE marker to indicate that all frames have been uploaded
- new DELETE marker in S3 bucket triggers `create-gif` Lambda
- `create-gif` Lambda downloads frames from S3
- `create-gif` Lambda creates GIF file using the GraphicsMagick library (requires custom Lambda layer) and uploads to S3
- new `.gif` file in S3 bucket triggers `tweet-gif` Lambda
- `tweet-gif` Lambda downloads the gif from S3 and publishes to Twitter 

# Hardware  

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

[2] Brewer, Nick.  "nickbrewer/gifcam."  *github.com*, 20 Apr. 2017, [https://github.com/nickbrewer/gifcam](https://github.com/nickbrewer/gifcam){target=_blank}.

# Progress Photos  

