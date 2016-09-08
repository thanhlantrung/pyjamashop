# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

  end

  def listen(data)
  	stop_all_streams
  	stream_for data ["product_id"]
  end

  def perform(comment, current_user)
  product = comment.product
  average_rating = product.average_rating
  comments_count = product.comments.count

  ProductChannel.broadcast_to comment.product.id, comment: render_comment(comment, current_user), average_rating: average_rating, comments_count: comments_count
  end

end
