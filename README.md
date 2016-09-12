#Code Snippet
===============================

**Code-Snippet** is a place everybody can share their own personal code snippet with one another

##Atom developer
-----------------------------------
run below commands when pull **everytime** ,  this will update the code-snippet in **~/.atom/snippets.cson***
```bash
# In mac terminal
sh update.sh web
```
##Xcode developer
-----------------------------------
run below commands when pull **everytime** ,  this will update the code-snippet in **~/Library/Developer/Xcode/UserData/CodeSnippets/***
```bash
# In mac terminal
sh update.sh ios
```
## Finish
----------------------------------
before push to remote repositories，it update all code-snippets in  **~/Library/Developer/Xcode/UserData/CodeSnippets/***，then push to remote repositories！

```bash
# In mac terminal
sh git-push.sh
```

![demo](gettingStart.gif)
