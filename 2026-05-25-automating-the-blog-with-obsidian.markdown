---
title: Automating The Blog with Obsidian
date: 2026-05-25
author: David Bono
---

I've needed a new post for a while now, and this article outlines how I've enabled the automation of new articles for twel-blog.

I've finally bit the bullet and decided to download Obsidian. I've been needing a solid note taking solution for a while to organize/document my thoughts. Especially now (2026) that AI allows me to slop out all kinds of random projects effortlessly, I've needed to maintain a list somewhere of how to keep track of them. 

### The Automation
I've used an extension in obsidian called "shell commands", for anyone who's a developer, you can probably just intuit where this article is going. The solution is very simple. I simply wrote a shell script to copy the obsidian markdown file to the repo that contains all the markdown articles. Then the script adds the file, commits, regens the rss, and pushes to the repo. 