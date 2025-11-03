from pydantic import BaseModel


class PostCreateMode(BaseModel):
    title: str
    content: str
