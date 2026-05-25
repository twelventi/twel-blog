---
title: SWEs Are Not Going Anywhere
date: 2026-05-25
author: David Bono
tags:
  - 7f1f91a
  - philosophy
---
There is much talk about how AI is going to replace software engineers. In NYC, practically every ad you see is for some AI company. Even the [Vatican](https://x.com/grok/status/2058918681250242608?s=20) is getting involved. 

I recently wrote an article on this blog about [Automating Twel-Blog with Obsidian](https://twelventi.com/blog/2026-05-25-automating-the-blog-with-obsidian) The scripts created for this automation took about 30 seconds of prompting cursor in order to get something satisfactory, it would have taken much longer if I were to do it myself by hand. 

On the surface, it seems like anyone would be able to set up things like this, but there's a prohibitive attribute here. _You don't know what you don't know._ In order to effectively use these AI code generation tools, you necessarily have to be able to describe to them what you want them to do. Without a great command of the english language, or enough domain knowledge to understand what's going on, you will not be able to effectively communicate to the AI robots the intended effect you desire. 

There are definitely some tech domains where automatic code generation from qualitative english descriptions are more prone to automation than others. For example, building UIs with cursor is amazing, even if sometimes its very obvious that it was AI that wrote the layout. Tasks like this in some cases can definitely be accomplished by a non-technical person prompting an AI. "I want this button to be over here instead" or even "build me a layout with this data". 

However in some cases these things can't be automated properly without proper domain knowledge. The other day I had asked cursor to build me a layout in react with a sticky element that stays on the screen as you scroll down. Cursor had implemented custom logic in javascript that calculated the position the element should have been depending on the height of the scroll, then re-rendering that element in this position, instead of implementing the layout in a manner in which the css property ``position: sticky;`` could be used. This in turn caused the element's height to "lag" when scrolling on the page.

With the proper domain knowledge I easily observed this, and told cursor to change the implementation approach, but someone without this domain knowledge probably would not have asked to use this specific css property, and base the implementation around this fact.

Contrary to this observation though, I did switch the model to Opus 4.7 and described qualitatively the behavior that was a result of the implementation decision to render the element with javascript, and Opus observed the poor implementation decision and did a refactor to use `position: sticky;` on its own. But even in this case, you would have had to observe the behavior in the ui and understand that it was wrong in order to prompt the AI to fix it.

So herein lies the issue; _You don't know what you don't know_. 