class BooksController < BaseController
  actions :all, :except => :show

  respond_to :js, :only => [:index, :mine, :remove]

  before_filter :require_user, :only => [:edit, :update, :destroy, :mine]

  before_filter :ensure_book_is_mine, :only => [:edit, :update, :destroy]

  # CRUD actions

  def create
    @book = current_user.books.new(params[:book])
    create! { my_books_path }
  end

  def update
    update! { my_books_path }
  end

  def destroy
    destroy! { my_books_path }
  end

  # Custom actions

  def mine
    @books = end_of_association_chain
      .where(:user_id => current_user.id)
      .paginate(:page => params[:page])
  end

  def remove
    Book.update(params[:id], :removed => true)

    respond_with do |format|
      format.html { redirect_to my_books_path }
      format.js { }
    end
  end

  # Methods

  def collection
    @books = end_of_association_chain.includes(:user)
    # @books = @books.with_keywords(params[:search]) unless params[:search].blank?
    @books = @books.paginate(:page => params[:page])
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
