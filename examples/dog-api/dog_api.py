from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
import requests

app = FastAPI()

DOG_API_URL = "https://dog.ceo/api/breeds/image/random"

@app.get("/health")
async def health():
    return "woof"

@app.get("/", response_class=HTMLResponse)
async def get_random_dog():
    try:
        response = requests.get(DOG_API_URL)
        response.raise_for_status()
        data = response.json()
        image_url = data["message"]
        return f"""
            <html>
            <head>
                <title>DevOps Dog Shelter</title>
            </head>
            <body>
                <h1>DevOps From Scratch Dog Shelter</h1>
                <img src="{image_url}" alt="DevOps From Scratch Dog Shelter">
            </body>
            </html>"""
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))