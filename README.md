#Code Snippet
===============================

**Code-Snippet** is a place everybody can share their own personal code snippet with one another

##User Quick Starts

#### Atom
-----------------------------------
* run commands while **each pull**, this will update the newest snippets into **~/.atom/snippets.cson***
```bash
# In terminal "Without" Fork Repositories
sh update.sh atom

# In terminal "With" Fork Repositories
sh synchronizeRepository.sh atom
```

#### Xcode
-----------------------------------
* run commands while **each pull**, this will update the newest snippets into **~/Library/Developer/Xcode/UserData/CodeSnippets**
```bash
# In terminal "Without" Fork Repositories
sh update.sh xcode

# In terminal "With" Fork Repositories
sh synchronizeRepository.sh xcode
```

##Contributor

temporarily we only support xcode :) 

#### Xcode
----------------------------------
* **push** your newest snippet  
```bash
# In mac terminal
sh push.sh commit-message
```
