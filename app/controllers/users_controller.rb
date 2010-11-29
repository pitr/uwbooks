class UsersController < BaseController
  actions :new, :create, :edit, :update, :destroy

  before_filter :require_user, :only => [:update, :destroy]
  before_filter :require_no_user, :only => [:create]

  before_filter :switch_new_to_edit, :only => :new
  before_filter :switch_edit_to_new, :only => :edit

  # Actions

  def new
    @user = User.new
    @user.books.build

    new!
  end

  def create
    create! { my_books_path }
  end

  # Filters

  def switch_new_to_edit
    if current_user
      redirect_to edit_users_path
      return false
    end
  end

  def switch_edit_to_new
    unless current_user
      redirect_to new_users_path
      return false
    end
  end
end