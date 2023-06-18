---
title:  "AI Audio Sites with Audio Preview" # This is the title that is displayed to users
date:   2023-06-17
author: David Bono
---

_The topics discussed in this article are for educational and research purposes only_

AI is obviously the latest hype trend of 2023, and like most other curious tech guys, I had to run some experiments. I recently came across a text-to-speech ai platform (which will remain nameless for the purposes of this post) that has an extremely solid text-to-speech system with voices that sound realistic, with support for many languages and accents.

The site allows you to type your text and preview what it sounds like, however, after pressing the "download" button to export the audio of the synthesized speech, you are greeted with a paywall

<img title="" src="https://i.imgur.com/TEeLvaT.png" alt="https://i.imgur.com/TEeLvaT.png" width="358" data-align="center">

This would usually deter the average user, or get them to pay if they really needed the audio, but me, a security researcher, had better ideas. 

At this point you could obviously do something like get a virtual microphone driver whose input source is the audio out of your computer, and record the preview to your own audio file, but that would be no fun. 

I've seen sites like this before, where they let you preview the audio without downloading it. In order for this to happen, two things must be true:

1. The audio file has to be sent to the browser in some format (otherwise there would be zero way to preview it)

2. The format has to eventually end up in a standard format (otherwise the browser couldn't actually play it)

A different AI generated audio site simply added an `<audio>` tag to the dom for previewing and linked to a file that was generated and temporarily stored on their servers. That type of system is extremely easy to reverse engineer, you simply could request the url mentioned in the src attribute and be off to the races with your downloaded audio file. This recent site wasn't that simple (if it was I probably couldn't write a blog post about it). 

I checked the network tab to inspect the requests that were happening when the audio file was generated, and I noticed a call to a URL that looked promising; 

`audio.api.<unnamed>.com`

The response of this request, however, was not promising. 

<img src="https://i.imgur.com/diHsPI6.png" title="" alt="https://i.imgur.com/diHsPI6.png" data-align="center">

I base64 decoded the response and saved it to `raw_message.bin` . Using the `file` command just spat back that it was `data` so I wasn't lucky enough that the response was going to simply be the raw audio file.

I opened the file up in a hex editor to see if there was anything interesting and bytes 4-7 of the file were `OggS` . OggS are the magic bytes for \*.ogg audio files! However, they are at bytes 4-7 of the file instead of 0-3. 🤔 Why would there be a 4 byte offset?

I checked back to the request/response sequence for the audio file and noticed something, the MIME type for the response is `application/protobuf` and the request includes a json field `forcedAudioFormat: "ogg"` . Could the message be a protobuf where the first key/value pair contains the audio data?

I used `protoc --deocde_raw < raw_message.bin` and Voila! The strucure of the message spat out at me and included the first field containing a byte array, the second field containg a string; "ogg" and then a few more fields relating to the original text I typed to generate the audio file in the first place. 

I quickly wrote my own .proto definition for the example message I had (because that's the easiest way to extract one specific value from a proto message), and used python to write the value of the first field to `speech.ogg` . I opened the file in VLC and was able to hear the sweet quasi-realistic AI voice speaking back to me the words I just had it generate moments ago, although this time the file was located on my own hardware. 



### Remediations?

I thought about a possible way to have this audio preview feature for AI audio sites like this that somehow can avoid users downloading the audio files, however I think most efforts would be in vain. A user still would have the ability to redirect the audio output to a virtual micrphone, digitally "record" the preview and walk away with the audio file. 



You could potentially split up the audio file into multiple pieces before sending it, which would make data collection cumbersome, but security through obscurity is never a good way to make something "secure". Someone who is highly motivated would still be able to download the file. 
