# Zetten

An opinionated note-taking system heavily based on [zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) method, implem

## The problem
You need to note/jot-down a some idea|info|quote|link|todo ,but without the overhead of naming, creating or organizing a note just for it.

## The idea
- A directory of notes, each with an unique ID (timestamp), each marked with a "@TAG" on the top of the file, eg: `@TAG school`, 
 - You run a command which finds all the "zettels" with the given tag, and puts their content into a single document for you to be able to explore/remove them.

## Usage

```bash
./zetten.sh: an optionated note-taking system
  -n -- create a new zettel and open it using nano
  -m <string> -- create a new named zettel and open it using nano
  -t <string> -- filter zettels in /home/aadv1k/zet by the given tag
```
