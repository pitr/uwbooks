class BooksController < BaseController
  actions :all, :except => :show

  before_filter :require_user, :only => [:edit, :update, :destory]
end
