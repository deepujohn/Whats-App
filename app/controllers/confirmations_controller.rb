class ConfirmationsController < ApplicationController
	protected
     def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        home_path
      else
        new_session_path(resource_name)
      end
    end
end
