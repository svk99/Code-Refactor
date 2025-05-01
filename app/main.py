from openai import OpenAI
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from dotenv import load_dotenv
import os

load_dotenv()

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Item(BaseModel):
    code :str

@app.get("/",methods=["GET","HEAD"])
def read_root():
    return {"status": "FastAPI running"}

@app.post("/refactor")
async def refactor_code(request:Item):
    try:
        client = OpenAI(
            api_key=os.getenv('GEMINI_API_KEY'),
            base_url="https://generativelanguage.googleapis.com/v1beta/openai/"
        )

        response = client.chat.completions.create(
            model="gemini-2.0-flash",
            messages = 
            [
                {"role" : "system", "content" : "You are a senior software engineer. Clean, refactor, and comment the following code."},
                { 
                    "role" : "user", 
                    "content" : request.code
                }
            ]
        )
        return response.choices[0].message.content
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e)) 