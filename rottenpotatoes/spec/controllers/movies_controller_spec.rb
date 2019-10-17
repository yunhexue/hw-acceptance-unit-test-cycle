require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'Find With Same Director' do
        
        it 'should show movies by this director' do
            fake_movie = double('movie', :title => 'pop', :director => 'lichen')              # my fake movie.
            expect(Movie).to receive(:find).with('1').and_return(fake_movie)                 # The id of the movie is 1
            fake_results = [double('movie1', :title => 'father', :director => 'lichen'),        # two otehr fake movies directed by me
            double('movie2', :title => 'mother', :director => 'lichen')]
            expect(Movie).to receive(:same_directors).with('lichen').and_return(fake_results) # return two fake movies
            get :similar_direc, {:id => '1'}                                                
            expect(response).to render_template('similar_direc')
        end
        
    end
end