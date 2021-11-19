# Investigation into Integrated SMS and Web-based Apps
## Research Project funded by the Clare Boothe Luce Foundation

Natan Organick, Bryn Mawr College 2015
Supervised by Doug Blank and Deepak Kumar 


The goal of this research project was to find a way to create web based applications which use text messaging to interact with clients.  With a text messaging based system, the application does not have to conform to any particular mobile operating system, clients do not have to download a mobile app, and they are able to use the app without a smartphone or a data plan.  

I chose to use Twilio, a cloud communications company, for handling the text messages and Django, a web application framework, for building the web application.  

The procedure is as follows:  

1) Client texts the Twilio virtual phone number

2) Twilio makes an HTTP POST request to the Django powered web application

3) Web application generates a response message based on the contents of the client's text message (found inside the POST request)

4) Web application replies to client via the Twilio virtual phone number



In order to share the knowledge I have compiled during my research I have created a comprehensive tutorial on creating such an application, which can be found here:

https://bitbucket.org/horganick/clare-boothe-luce-research/wiki/Home





### NextBlueBus  

In addition to the tutorial, I created the NextBlueBus app.  This application provides users a quick and easy way to determine the next few times the Blue Bus will run from Bryn Mawr College to Haverford College or vice versa.  



To use:

Text your current location followed by your destination to 1 (906) 398-2877 or 190NextBus7.  



Ex:

To receive the next 5 times for buses going from Bryn Mawr College to Haverford College text 'bmc hc' to the above phone number, or just 'b h'.  

To receive the next 5 times for buses going in the opposite direction, text 'h b'.  

Text 'all' to receive the next 5 times for buses going in either direction.





### NextBlueBus Status

The NextBlueBus app is down as of September 10, 2014 due to lack of funding. Funds are required to pay for the text messages themselves and for hosting the web application. If you are interested in helping me acquire funding from Bryn Mawr College or Haverford College, contact me at my college email address (horganick@bmc).





### History

This research project was inspired by work done during the 2014 Tri-Co Hackathon by the NextNextBlueBus team: 



Rachel Li  		BMC '14

Yijun Zhou		BMC '15 

Natan Organick	BMC '15



The NextBlueBus app created as part of this research project is not directly connected to Angie Chen's (BMC '16) Android application, which you can find at https://play.google.com/store/apps/details?id=com.aychen0110.bluebus.





### Acknowledgements

Thanks to Professor Doug Blank and Professor Deepak Kumar of Bryn Mawr College for their guidance on this research project.  Thanks to Tim Doug for his previous work on Bi-Co bus schedule parsing https://github.com/timdoug/nextbluebus.  

