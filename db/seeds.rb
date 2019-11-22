Bookmark.destroy_all
Coordinate.destroy_all
Like.destroy_all
Trail.destroy_all
User.destroy_all

user = User.create(email: 'user@mail.com', password: 'password', name: 'Berg')