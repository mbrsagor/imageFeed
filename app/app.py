from fastapi import FastAPI, HTTPException, File, UploadFile, Form, Depends
from contextlib import asynccontextmanager
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

from app.schemas import PostCreateMode
from app.db import Post, create_db_and_tables, get_async_session


@asynccontextmanager
async def lifespan(app:FastAPI):
    await create_db_and_tables()
    yield


app = FastAPI(lifespan=lifespan)


@app.post('/upload')
async def upload_file(file: UploadFile =File, caption:str = Form(), session: AsyncSession=Depends(get_async_session)):
    post = Post(
        caption = caption,
        url = "Dummy URL",
        file_type = "photo",
        file_name = "Dummy file name",
    )
    session.add(post)
    await session.commit()
    await session.refresh(post)
    return post


@app.get('/feeds')
async def get_feeds(session: AsyncSession = Depends(get_async_session)):

    result = await session.execute(select(Post).order_by(Post.created_at.desc()))
    posts = [row[0] for row in result.all()]

    posts_data = []

    for post in posts:
        posts_data.append(
            {
                "id": str(post.id),
                "user_id": str(post.user_id),
                "caption": post.caption,
                "url": post.url,
                "file_type": post.file_type,
                "file_name": post.file_name,
                "created_at": post.created_at.isoformat(),
                "is_owner": post.user_id == user.id,
                "email": user_dict.get(post.user_id, "Unknown")
            }
        )

    return {"posts": posts_data}

