module CommentsHelper 

    def created_at(comment)
        comment.created_at.strftime("%A, %b %e, at %l:%M %p")
      end 

end
