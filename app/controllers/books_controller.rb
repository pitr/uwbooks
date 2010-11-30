class BooksController < BaseController
  actions :all, :except => :show

  before_filter :require_user, :only => [:edit, :update, :destroy, :mine]

  before_filter :ensure_book_is_mine, :only => [:edit, :update, :destroy]

  # CRUD actions

  def create
    create! { my_books_path }
  end

  def update
    update! { my_books_path }
  end

  # Custom actions

  def mine
    @books = end_of_association_chain.where(:user_id => current_user.id)
  end

  # Methods

  def begin_of_association_chain
    current_user
  end

  # Filters

  def ensure_book_is_mine
    unless !current_user || resource.user == current_user
      flash[:notice] = "You must own the book"
      redirect_to my_books_path
      return false
    end
  end

end
