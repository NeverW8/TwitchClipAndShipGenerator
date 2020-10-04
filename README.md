# Twitch Clip Generator
Twitch Clip Generator download 20 clips from the top 7 categories on twitch, edits them together and eventually will publish each category according to each category/day.

The script is made from a debian based system and is expected to run from it.
But it shouldn't be a hassle to run it on other systems.

# File requirements

For the linkdownloader, urlgrepper and the renderer (ffmpeg) you'll need the following..

You'll need a linux/bash terminal (WSL will work aswell).

> ffmpeg toilet figlet youtube-dl rename

These files/packages is more or less needed for it to work.

For the youtube uploader you'll need the following packages

> google-api-python-client oauth2client progressbar2 testresources

(These packages is included in the install.sh file)

You'll also need to get your hands on a OAUTH file.
(Credits to https://github.com/tokland/youtube-upload/ )

You'll see that there is no email/password options. Instead, the Youtube API uses OAuth 2.0 to authenticate the upload. The first time you try to upload a video, you will be asked to follow a URL in your browser to get an authentication token. If you have multiple channels for the logged in user, you will also be asked to pick which one you want to upload the videos to. You can use multiple credentials, just use the option --credentials-file. Also, check the token expiration policies.

The package used to include a default client_secrets.json file. It does not work anymore, Google has revoked it. So you now must create and use your own OAuth 2.0 file, it's a free service. Steps:

    Go to the Google console.
    Create project.
    Side menu: APIs & auth -> APIs
    Top menu: Enabled API(s): Enable all Youtube APIs.
    Side menu: APIs & auth -> Credentials.
    Create a Client ID: Add credentials -> OAuth 2.0 Client ID -> Other -> Name: youtube-upload -> Create -> OK
    Download JSON: Under the section "OAuth 2.0 client IDs". Save the file to your local system.
    Use this JSON as your credentials file: --client-secrets=CLIENT_SECRETS or copy it to ~/client_secrets.json.

Note: client_secrets.json is a file you can download from the developer console, the credentials file is something auto generated after the first time the script is run and the google account sign in is followed, the file is stored at ~/.youtube-upload-credentials.json.

# How to run

Install all the required files by running:

> ./install.sh

This will install the libs + deb packages required (+ some extras) for the program to run.

Then.. run:

> ./tcg.sh
This will run the "Twitch Clip Generator".

It will install/create the directories along with downloading the clips then eventually render them together.

At this point we'll need to upload the video to youtube (whichever one you'd like)

> something bla bla

You do this by running:

Upload a video with extra metadata, with your own client secrets and credentials file, and to a playlist (if not found, it will be created):
> $ youtube-upload \
  --title="A.S. Mutter" \
  --description="A.S. Mutter plays Beethoven" \
  --category="Music" \
  --tags="mutter, beethoven" \
  --recording-date="2011-03-10T15:32:17.0Z" \
  --default-language="en" \
  --default-audio-language="en" \
  --client-secrets="my_client_secrets.json" \
  --credentials-file="my_credentials.json" \
  --playlist="My favorite music" \
  --embeddable=True|False \
  anne_sophie_mutter.flv
tx2Zb-145Yz

Gz

# Support
You could always support by helping out committing or just fixing up our ugly code.

# Q & A's

!Q How long does it take to render?
!A Depending on your hardware, everything from 10m to infinity (my machine crunches every clip in 30m's)

bla bla
