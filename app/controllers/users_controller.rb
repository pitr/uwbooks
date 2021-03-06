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
    # try to authenticate the user
    user_session = UserSession.new(params[:user])
    if user_session.save
      @user = user_session.user

      @book = @user.books.new(params[:user][:books_attributes]['0'])
      if @book.save
        redirect_to my_books_path
      else
        render 'books/new'
      end
    else
      if User.find_by_email(params[:user][:email])
        @user = User.new(params[:user])
        @user.errors[:password] = 'is incorrect.'
        render :action => 'new'
      else
        # fall back to creating the user
        @user = User.new(params[:user])
        if @user.save
          UserMailer.signup(@user).deliver
          redirect_to my_books_path
        else
          render :action => 'new'
        end
      end
    end
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