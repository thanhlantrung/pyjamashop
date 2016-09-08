class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment, current_user)
  product = comment.product
  average_rating = product.average_rating
  comments_count = product.comments.count

  ProductChannel.broadcast_to comment.product.id, comment: render_comment(comment, current_user), average_rating: average_rating, comments_count: comments_count
  end



private 

	def render_comment(comment, current_user)
		CommentsController.render(partial: 'comment', locals: {comment: comment, current_user: current_user })
	end
end