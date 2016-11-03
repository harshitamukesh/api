class Api::V1::MoviesController < ApplicationController
    def create
		@movie = Movie.new(movie_params)
		if @movie.save
			render json:{message: "Successfully created", data: @movie, status_code: 200}
		else
            render json:{message: "Failure", data: @movie.errors,  status_code: 422}
		end
	end

	def index
    @movie = Movie.all
    render json:{message: "Successfully listed", data: @movie, status_code: 200}
	end

	def update
		@movie = Movie.find_by_title(params[:title])
		@movie.update_attributes(movie_params)
		 render json:{message: "Successfully updated", data: @movie, status_code: 200}
	end

    def destroy
    	@movie = Movie.find_by_title(params[:title])
    	@movie.destroy
    	render json:{message: "Successfully Deleted", data: @movie, status_code: 200}
    end

	private
	def movie_params
		params.require(:movie).permit(:title, :year, :rating, :language)
	end

end