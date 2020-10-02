json.text  @comment.text
json.user_name  @comment.user.name
json.user_image_url  @comment.user.image.url
json.created_at  @comment.created_at.strftime('%Y/%m/%d %H:%M:%S')
json.user_id  @comment.user.id