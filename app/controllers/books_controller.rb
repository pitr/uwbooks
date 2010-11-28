class BooksController < InheritedResources::Base
  before_filter :require_user, :only => [:edit, :update, :destory]
end
