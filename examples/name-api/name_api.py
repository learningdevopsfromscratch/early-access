from fastapi import FastAPI
import randomname

app = FastAPI()

@app.get("/health")
async def health():
    return "healthy"

@app.get("/")
async def get_random_name():
    name = randomname.get_name(noun=('dogs'))
    return {"names": name}
