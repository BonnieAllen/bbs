require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

 def test_can_create_comments 
        assert_difference('Comment.count') do
        post :create, comment: { body: @comment.body, commenter: @comment.commenter }, post_id: @post.id

       assert_equal "302", response.code
       assert_includes response.redirect_url, comment_path(comment)
    end
  end
end