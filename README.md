# MARAPI
Movie Artwork Retrieval API

## Features

- Obtain High Resolution Movie and TV-Show Posters
- Changable Poster Resolution

## Disclaimers

- This is most ideal for servers or computers that are always on
- This will NOT run on any Windows Version

## Installation

Install Dependencies
```bash
sudo apt install python3 python3-pip && pip install Flask && pip install requests
```

Navigate to where you want the project folder to be
```bash
cd {project-folder}
```

Clone The Repository
```bash
git clone https://github.com/Acceleration07/MARAPI.git
```

Navigate to your Project folder
```bash
cd MARAPI
```

Change File Permissions *Not Neccesary Sometimes*
```bash
sudo chmod 777 *
```


Start the API
```bash
set FLASK_APP=app.py && python3 -m flask run --host=localhost --port=5000
```

## Usage

For the sake of example we will be using the movie "[Inception](https://www.imdb.com/title/tt1375666/)"

After starting the API, you can start to load posters by going to this link

http://localhost:5000/marapi/{imdb-code}/p{Pixel-Height}

*the pixel height isn't neccasary, if it's not used it will default to the max resolution Poster found*

IMDb Codes come from the links of the imdb movie or tv-show profile.

EXAMPLE:
Link: https://www.imdb.com/title/tt1375666/

Code: tt1375666

EXAMPLE
```bash
http://localhost:5000/marapi/tt1375666/p900
```
this would give me the poster for inception with the vertical height of 900px

```bash
http://localhost:5000/marapi/tt1375666
```
this would give me the poster for inception with the max vertical height


Downloading Image from Command Line
```bash
wget -q --show-progress "{MARAPI URL}" -O poster.jpg
```
