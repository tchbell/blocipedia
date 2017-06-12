module WikisHelper
    def collaborator_for(logged_in_user)
      @wiki.users.each do |user|
        if user.id == logged_in_user.id
          false
        end
      end
    end
end
