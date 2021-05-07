require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

    describe "#new" do
        it "renders the new template" do
            # Given
            # When
            get(:new)
            # Then
            expect(response).to render_template(:new)
        end
        it 'sets an instance variable with a new idea' do
            # Given
            # When
            get(:new)
            # Then
            expect(assigns(:idea)).to be_a_new(Idea)
        end
    end
    describe '#create' do
        def valid_request
            post(:create, params:{ idea: {title: "some unique test title", body: "this is an idea body" } })
        end
        def invalid_request
            post(:create, params:{idea: FactoryBot.attributes_for(:idea, title: nil)})
        end
        # valid
        it 'creates an idea in the database' do
            # Given
            count_before = Idea.count
            valid_request
            # When

            # Then
            count_after = Idea.count
            expect(count_after).to eq(count_before+1)
       end
       it 'redirects us to the show page for the idea' do
            # Given

            # When
            valid_request
            # Then
            idea = Idea.last
            expect(response).to redirect_to(idea_url(idea.id))
       end
       # invalid
       it 'does not save a record in the database' do
            # Given
            count_before = Idea.count
            # When
            invalid_request
            # Then
            count_after = Idea.count
            expect(count_after).to eq(count_before)
       end
       it 'renders the new template' do
            # Given

            # When
            invalid_request
            # Then
            expect(response).to render_template(:new)
       end

    end

end
