class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ 
    show 
    edit 
    update 
    destroy 
    edit_title
    edit_duration
    edit_year
    edit_description
    edit_director_id
  ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  def edit_title
    respond_to do |format|
      format.js do
        render template: "movies/_edit_title.js.erb"
      end
    end
  end

  def edit_duration
    respond_to do |format|
      format.js do
        render template: "movies/_edit_duration.js.erb"
      end
    end
  end

  def edit_year
    respond_to do |format|
      format.js do
        render template: "movies/_edit_year.js.erb"
      end
    end
  end

  def edit_description
    respond_to do |format|
      format.js do
        render template: "movies/_edit_description.js.erb"
      end
    end
  end

  def edit_director_id
    respond_to do |format|
      format.js do
        render template: "movies/_edit_director_id.js.erb"
      end
    end
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
        format.js do
          render template: "movies/_create.js.erb"
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        format.js do
          render template: "movies/update.js.erb"
        end 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
      format.js do
        render template: "movies/_destroy.js.erb"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      movie_id = params[:id] || params[:movie_id]

      @movie = Movie.find(movie_id)
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :duration, :image, :year, :director_id)
    end
end
