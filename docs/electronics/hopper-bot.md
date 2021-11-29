---
---

**HopperBot**  
2017 - 2019  

While working at Vanguard as a software engineer I had the opportunity to participate in several internal hackathons.  One of these hackathons grew into a long running project which I continued volunteering on until I moved jobs in 2019.  

For the third of Vanguard's internal hackathons, my team decided to create an interactive coding activity for Vanguard to host at an upcoming outreach event.  The annual event, [Girls Exploring Tommorrow's Technology](https://gettpa.org/){target=_blank}, regularly brings several hundred middle-school aged girls from Southeastern Pennsylvania to meet women in STEM careers and to participate in hands-on activities.  

# Project Goals  

We aimed to create a programming activity which:

- would be accessible to middle-school aged students  
- would be accessible to students who did not have prior coding experience  
- would engage the students in ["Turtle-Talk"](#turtle-talk)
- could be used via web browser without any additional set up

<br>
<section>
  <figure>
    <img
      src="/img/hopperbot/gett/2019_bot_at_gett.jpeg"
      alt="robot on wood floor in between pool noodle barriers"
      title=""
    />
    <figcaption>HopperBot at 2019 GETT conference</figcaption>
  </figure>
</section>
<br>

# Project History
## 2017

During the hackathon we split up the big tasks among our four-person team in order to work as efficiently as possible with our limited time.  Two members designed and built the robot, a third created a webpage with a drag-and-drop interface to simulate our eventual coding environment, and I worked on the robot controller and connecting the various components.  

<section>
  <figure>
    <a target="_blank" href="/img/hopperbot/2017/architecture.jpeg">
    <img
      src="/img/hopperbot/2017/architecture.jpeg"
      alt="illustration demonstrating how client javascript application and robot controller connect via ngrok"
      title="view diagram in new tab"
    />
    </a>
    <figcaption>Figure 4, 2017 Hackathon Architecture</figcaption>
  </figure>
</section>
<br>

I came up with the following solution which is illustrated in Figure 4:

- a [flask application](https://flask.palletsprojects.com/en/2.0.x/){target=_blank, title="flask is a Python webapp framework"} runs on the RaspberryPi at `localhost:5000` 
    * the app has API routes for each of the robot's pre-defined actions (`/forward`, `/reverse`, etc.)
    * when a request is made to a route, the app turns on or off the appropriate GPIO pins
- a [ngrok](https://ngrok.com/product){target=_blank, title="ngrok is tool used to expose a locally running server to the public internet"} tunnel process makes the flask application publically available at a random address (represented by **NGROK-XYZ** in Figure 4)
- the drag-and-drop web application is served on the RaspberryPi at `localhost:8000` using Python's simple HTTP server module
- a second ngrok tunnel process makes the client web application publically available at another random address (ex: **NGROK-ABC**)


User flow:  
When a user requests the drag-and-drop webpage at **NGROK-ABC** from their mobile device, ngrok passes the request to the Python HTTP server via its tunnel process.  The javascript and html is returned to the user's web browser and rendered.  The user can then move action blocks into and out of the sandbox area (see Figure 5).  Once a user releases an action block inside the sandbox area, the page makes an AJAX request to the associated route at **NGROK-XYZ**.  The request is relayed via ngrok to the flask application running on the RaspberryPi and the robot executes the requested action.


### 2017 Reflection

It was really excting to be able to complete the hackathon with a working prototype.  We created a RaspberryPi controlled robot, and we achieved our goal of having particpants control the robot using their own personal devices.  

In order create an activity where students could think through creating an algorithm and then express that algorithm as code, we needed a more sophisticated web application.  I continued this work in [2018](#2018) with the help of Google's [Blockly](https://developers.google.com/blockly/guides/overview){target=_blank, title="Blockly is a library that adds a visual code editor to web and mobile apps"} library.

<section>
  <figure>
    <img
      src="/img/hopperbot/2017/2017_bot.png"
      alt="two wheeled robot with breadboard, Raspberry Pi, and assorted wires on top"
      title=""
    />
    <figcaption>2017 Hackathon Robot (Hopper Senior)</figcaption>
  </figure>
</section>
<br>

### July 28, 2017

<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/eSlY1OUxymU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>2017 Hackathon Prototype</figcaption>
  </figure>
</section>
<br>
<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/PyvTeeromyU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>2017 Hackathon Participant Interaction</figcaption>
  </figure>
</section>
<br>
<br>
<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/q_sTnm1BBU8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>Figure 5, 2017 Hackathon Drag-And-Drop Interface</figcaption>
  </figure>
</section>
<br>


## 2018  

In 2018 I made several major updates to the design (see Figure 6).  The first was to decouple the robot controller from the client web app.  Instead of having the client web app make requests directly to the robot controller (via ngrok tunnel), I updated both components to communicate via a publish-subscribe model, using the cloud service [pubnub](https://www.pubnub.com/developers/){target=_blank, title="pubnub provides tools for real-time messaging"}.  The robot controller subscribed to a private "commands" channel which the client web app published to on submit.  Whenever the robot controller received a message on this channel, it extracted the included Python program, wrote the program to the file system, and executed the program.  

<section>
  <figure>
    <a target="_blank" href="/img/hopperbot/2018/architecture.jpeg">
    <img
      src="/img/hopperbot/2018/architecture.jpeg"
      alt="illustration demonstrating how client blockly application and robot control application connect via pubnub"
      title="view diagram in new tab"
    />
    </a>
    <figcaption>Figure 6, 2018 - 2019 GETT Activity Architecture</figcaption>
  </figure>
</section>
<br>
The second major change was to update the CSS-based drag-and-drop web page to instead use Google's [Blockly](https://developers.google.com/blockly/guides/overview){target=_blank, title="Blockly is a library that adds a visual code editor to web and mobile apps"} visual coding library.  Blockly allowed us to define code blocks for the HopperBot context at multiple abstraction levels (full robot control, individual motor control, GPIO pin control).  It also allowed us to easily create a user friendly programming environment.  Users could pick code blocks from folders on the left, drag them into the workspace at the center, and see the equivalent Python code at the right (see Figure 7).
<br>
<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/lWwFTDho-3w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>Figure 7, 2018 Blockly Interface</figcaption>
  </figure>
</section>
<br>

We hosted the new client application on [Heroku](https://www.heroku.com/nodejs){target=_blank} which improved uptime and further decoupled the client application from the robot.  

In addition to helping implement the new Blockly code blocks, my Vanguard colleagues [Rebecca T.](https://www.linkedin.com/in/rebecca-thayil/){target=_blank, title="Rebecca's linkedin, full name omitted in webpage text by request"} and [Terry T.](https://www.linkedin.com/in/terry-m-tan/){target=_blank, title="Terry's linkedin"} upgraded the robot's circuitry to allow for an additional set of wheels which improved stability and enabled additional programming options.  They also created a build guide for students to follow in case they were interested in making their own robot.  

We brought the updated HopperBot and web app to GETT in 2018 and 2019.  The activity was well received and Rebecca and Terry went on to present this work in a lightning talk at the 2019 Grace Hopper Celebration.  

<br>
<section>
  <figure>
    <img
      src="/img/hopperbot/2018/2018_bot.jpeg"
      alt="four wheeled robot with breadboard, Raspberry Pi in enclosure, and orderly wires on top"
      title=""
    />
    <figcaption>2018 HopperBot with Improved Hardware (case, onboard power supply, 4 wheels for increased stability and versatility)</figcaption>
    <!-- also googly eyes which are very important -->
  </figure>
</section>
<br>

# 2019  

<section>
  <figure>
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/yPX6cYOBSdk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <figcaption>2019 HopperBot GETT Activity</figcaption>
  </figure>
</section>
<br>

# Turtle Talk  

"Turtle-Talk" is a method of thinking through a problem and creating a solution in a mechanical or algorithmic manner, discussed by the computer scientist, mathematician, and MIT professor Seymour Papert in his book *Mindstorms*<sup>[2](/research/2013-ego-syntonic-learning#references)</sup>.  

The "Turtle" in "Turtle-Talk" refers to the Turtle Graphics drawing library for the programming language Logo.  Using Turtle Graphic commands, a robot (or a Turtle when represented on a virtual canvas) can be moved around a plane.  This agent has a location, orientation, and other properties about its drawing pen which it drags around as it moves.  These properties include line width, color, and whether the pen is is up off of the plane or drawing down on the plane/canvas.

When Papert used this methodology with learners, he would ask them to place themselves in the position of the turtle, and then to move about the space as they would like the turtle to move.  As they did so, they would narrate what they were doing and then be able to translate this process into an algorithm.  

For example, if a student wanted the turtle to draw a circle, they might start by walking forward a bit, turning right a bit, walking forward some more, then turning, etc. They might then come to the conclusion that they would need to repeat this a number of times before the turtle came back to where it originally started.

Teaching students a mechanical-thinking style helps them to program and to recognize the difference between algorithmic and non-algorithmic approaches, and the learner is able to apply this method to other situations as needed.  In addition, the use of Turtles and Playing-Turtle allows the learner to use their own sense and knowledge about their own body and to relate to the process of programming on a more personal level.  This style of learning uses body syntonic reasoning (contrast to [ego syntonic reasoning](/research/2013-ego-syntonic-learning)). 

<!-- <blockquote>
<p>Even the simplest Turtle work can open new opportunities for sharpening one’s thinking about thinking: Programming the Turtle starts by making one reflect on how one does one-self what one would like the Turtle to do. Thus teaching the Turtle to act or to ‘think’ can lead one to reflect on one’s own actions and thinking.</p>
<footer>
<cite>
Seymour Papert, <a href="/research/2013-ego-syntonic-learning#references" >Mindstorms pg. 27-28</a>
</cite>
</footer>
</blockquote> -->
