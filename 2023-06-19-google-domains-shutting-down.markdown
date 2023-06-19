---
title:  "RIP Google Domains" # This is the title that is displayed to users
date:   2023-06-19
author: David Bono
---





You may have heard, one of google's beloved and most simple services, google domains, [is shutting down](https://support.google.com/domains/answer/13689670). 



This is extremely unfortunate for me because all of the domains I manage and use have been registered through google domains. Most if not all other domain registrars I've encountered seem to be complete scams, and have wildly unnecessary features for  the average technologist who just wants to play around with cool internet things (no squarespace, I don't want to use your point and click website builder integrated with e-commerce and stripe etc etc etc, I _just_ want a domain). Luckily, a service everyone has encountered at least once, offers an option for the exact person like myself; Cloudflare



Here's step by step how to transfer your domains from google domains to cloudflare (do it now, before google domains sends you to a squarespace account!).

## 1. Unlock your domain

Go to your google domains "Registration settings" and turn off "domain is locked". (This disables the "clientTransferProhibited" check and is necessary to transfer the domain). The reason I say to do this first is because this may take a while to propagate, and hopefully it will have propagated by the time you actually want to transfer the domain.



## 2. Add your "site" to your cloudflare account

Choose "Add site" in the top right and enter your domain in the input box

![https://i.imgur.com/smmVE6j.png](https://i.imgur.com/smmVE6j.png)



Follow the prompts, you likely can just choose "Free" for the next step (unless you know you need the paid features)


![https://i.imgur.com/W2zcHLz.png](https://i.imgur.com/W2zcHLz.png)



On the next screen, verify that your DNS settings are correct (these should simply be copied from google domains but it would be a shame to have a service down because the dns didn't copy over correctly)



The last step to add your site is to add the cloud flare name servers to your google domains registrar, to do this in google domains, go to your dns settings on your domain you wish to transfer.



<img title="" src="https://i.imgur.com/ZrYNbtK.png" alt="https://imgur.com/ZrYNbtK" width="159"> 



And select "custom name servers"

<img title="" src="https://i.imgur.com/iZUE1BV.png" alt="https://i.imgur.com/iZUE1BV.png" width="358">



This is where you enter the names provided by cloudflare, and click save. Then click "Switch to these settings". This might take a few minutes, but google domains usually propagates changes quickly. You'll get an email from cloudflare when it officially is updated. 



## 3. Get a transfer auth code

Go back to the cloudflare dashboard and click domain `registration` > `transfer domains`. Select the domain you wish to transfer, and click "confirm domains"



At the end of this process, you will be charged for an extra year of registration, but this is likely cheaper than google domains. 



![https://i.imgur.com/QZ0y8hD.png](https://i.imgur.com/QZ0y8hD.png)



Go back to google domains, go to the domain you wish to transfer, registration settings.



Scroll down to "transfer out domain" and click "get auth code".  A pop up will show up with the auth code. Copy and paste this into the next page on cloudflare and choose "confirm and proceed".



Fill out the contact info (this will be hidden by cloudflare to the public, but they need to keep it on record, similar to google domain privacy)



## 4. Approve the transfer on google domains

You will get an email from google domains saying something like verify transfer out request. Follow the instructions in that email. It will bring you to the google domains page and a pop up will show up. Here you have to click the "transfer" option

![https://i.imgur.com/KVluMft.png](https://i.imgur.com/KVluMft.png)



And that's it! 



You'll get an email from cloudflare saying that your domain is now registered with them.
