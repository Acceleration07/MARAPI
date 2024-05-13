from flask import Flask, send_file
import subprocess
import requests
import tempfile
import os

app = Flask(__name__)

def download_image(url):
    response = requests.get(url)
    if response.status_code == 200:
        fd, temp_path = tempfile.mkstemp(suffix=".jpg")
        with os.fdopen(fd, 'wb') as f:
            f.write(response.content)
        return temp_path
    else:
        return None

@app.route('/marapi/<imdb_code>/p<int:number>', methods=['GET'])
@app.route('/marapi/<imdb_code>', methods=['GET'])
def get_poster(imdb_code, number=None):
    # Run the bash script with provided IMDb code
    cmd = ['./movie-search.sh', '-l', f'https://www.imdb.com/title/{imdb_code}']
    result = subprocess.run(cmd, capture_output=True, text=True)

    # Parse the output of the script
    output_lines = result.stdout.splitlines()
    poster_urls = [line.strip() for line in output_lines]

    if number is not None:
        image_url = poster_urls[0][:-8] + str(number) + "_.jpg"
    else:
        image_url = poster_urls[0][:-8]

    image_path = download_image(image_url)
    if image_path:
        return send_file(image_path, mimetype='image/jpeg')
    else:
        return "Image not found", 404

@app.route('/marapi')
def index():
    return 'Welcome to the Movie Artwork Retrieval API'

if __name__ == '__main__':
    app.run(host='localhost', debug=True)