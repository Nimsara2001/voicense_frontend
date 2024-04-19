# voicense-app
Lecture  Transcription tool for enhanced learning


# How to get started with this project ?


- First you have to download this codebase. For that give the following command, by going to what ever directory(folder) which you like to download this code base. <br/>
  `git clone link`

- run `flutter pub get`

- debug project without errors

- After downloading the code base, create a your own git branch to work. For that give the bellow command.<br />
  `git branch <your name>`

- After creating the branch to go in to that branch give the following command. <br />
  `git checkout <your name>`

- Then you can work in your branch and can do the changes you require.<br />

- After doing the changes first add the changes which you did in to your local repository. For that give the command<br />
  `git add .`

- After adding the changes you have to describe breafly about what is the change which you made. For that give the following command<br />
  `git commit -m "<commit message line>"`

- Then push the code in to your remote branch by giving the following command<br />
  `git push -u origin <branch name which you created>`

- After pushing the code in to global repository, now you can go to the github.com website and make a pull request. For that;<br />
    - when creating a pull request make the pull request from your branch to 'dev' branch. Not to 'main' branch.<br />
      `Ex: hansaka => dev`

- To get an updated codebase from the dev branch<br />
  `git checkout <your branch name>`<br />
  `git fetch origin`<br />
  `git merge origin/dev`

- Requirements of project <br/>
    - Flutter SDK version 3.19.3
    - Dart SDK version 3.3.1
    - Android SDK version 34.0.0
    - JDK version 17 (environment variable should be set as JAVA_HOME)
    - Gradle version 7.6.3
    - get_cli version 1.6.0

- Dependencies <br/>
    - get: ^4.6.6
    - flutter_markdown: ^0.6.22
    - device_preview: ^1.1.0
    - cupertino_icons: ^1.0.
    - flutter_tts: ^4.0.2
    - http: ^1.2.1