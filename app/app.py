from turtle import pos
from fastapi import FastAPI
from app.schemas import PostCreateMode


app = FastAPI()


text_posts = {
    1: {'title': 'this is a simple post one', 'content': 'This is a simple text post content one'},
    2: {'title': 'this is a simple post two', 'content': 'This is a simple text post content two'},
    3: {'title': 'this is a simple post three', 'content': 'This is a simple text post content three'}
}


@app.post('/')
def create_post(post: PostCreateMode):
    new_post = {'title' : post.title, 'content': post.content}
    text_posts[max(text_posts.keys()) + 1] = new_post
    return text_posts
