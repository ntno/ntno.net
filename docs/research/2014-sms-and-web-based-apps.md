**Investigation into Integrated SMS and Web-based Apps**  
Spring 2014

I was awarded a Clare Boothe Luce Undergraduate Scholarship for my junior and senior years at Bryn Mawr College.  As part of this scholarship, I was asked to conduct independent research and share my findings with my peers in the Computer Science department.  

# Project Goals
The goal of this research project was to find a way to create web based applications which use text messaging to interact with clients.  With a text messaging based system, the application does not have to conform to any particular mobile operating system, clients do not have to download a mobile app, and they are able to use the app without a smartphone or a data plan.  

I chose to use Twilio, a cloud communications company, for handling the text messages and Django, a web application framework, for building the web application.  

The procedure is as follows:  

1. Client texts the Twilio virtual phone number  
2. Twilio makes an HTTP POST request to the Django powered web application  
3. Web application generates a response message based on the contents of the client's text message (found inside the POST request)  
4. Web application replies to client via the Twilio virtual phone number  

In order to share the knowledge I have compiled during my research I have created a comprehensive tutorial on creating such an application, which can be found here: [https://bitbucket.org/norganick/clare-boothe-luce-research/wiki/Home](https://bitbucket.org/norganick/clare-boothe-luce-research/wiki/Home){target=_blank}  
<br>  

### NextBlueBus App

<section>
  <figure>
    <a target="_blank" href="https://www.brynmawr.edu/transportation" title="Bryn Mawr College Blue Bus">
    <img
      src="https://www.brynmawr.edu/sites/default/files/styles/carousel_double_wide/public/field/slide-image/bus.jpg"
      alt="a person in an orange dress boarding the Bryn Mawr College Blue Bus"
      title="Bryn Mawr College Blue Bus"
    />
    </a>
    <figcaption>The 'BlueBus' is a shuttle service which links the Tri-College Community of Bryn Mawr, Haverford and Swarthmore Colleges</figcaption>
  </figure>
</section>
<br>

In addition to the tutorial, I created the NextBlueBus app.  This application provides users a quick and easy way to determine the next few times the [Blue Bus](https://www.brynmawr.edu/transportation/blue-bus-bi-co){target=_blank} will run from Bryn Mawr College to Haverford College or vice versa.  
<br>  

To use:
Text your current location followed by your destination to `1 (906) 398-2877` or `190NextBus7`.  

Examples:

- To receive the next 5 times for buses going from Bryn Mawr College to Haverford College text `bmc hc` to the above phone number, or just `b h`.  

- To receive the next 5 times for buses going in the opposite direction, text `h b`.  

- Text `all` to receive the next 5 times for buses going in either direction.

<div class="terminal-alert">
NOTE: The NextBlueBus app was retired September 10, 2014.  The above instructions are included for archival purposes.
</div>
<br>

### Project History
This research project was inspired by work done during the 2014 Tri-Co Hackathon by the NextNextBlueBus team:  

- Rachel Li  		BMC '14  
- Yijun Zhou		BMC '15  
- Natan Organick	BMC '15  

The NextBlueBus app created as part of this research project is not directly connected to Angie Chen's (BMC '16) Android application, which you can find [here](https://play.google.com/store/apps/details?id=com.aychen0110){target=_blank}.  
<br>  

### Acknowledgements
Thanks to Professor Doug Blank and Professor Deepak Kumar of Bryn Mawr College for their guidance on this research project.  Thanks to Tim Doug for his [previous work](https://github.com/timdoug/nextbluebus){target=_blank} on Bi-Co bus schedule parsing.  This research was supported in part by a Clare Boothe Luce Undergraduate Scholarship.  
<br>  