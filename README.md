# MARAPI
Movie Artwork Retrieval API
Get High Resolution Movie, and TV-Show Posters!


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


Start the Webserver
```bash
  set FLASK_APP=app.py && python3 -m flask run --host=localhost --port=5000
```
