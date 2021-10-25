require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    describe '#new' do

        it "renders a new template" do
        get(:new)
        expect(response).to(render_template(:new))
        end
        it "sets an instance variable with a new idea" do
            get(:new)
            expect(assigns(:idea)).to(be_a_new(Idea))
        end
    end
    describe "#create" do
        context "with valid parameters" do
            def valid_request
                post(:create, params: {idea: FactoryBot.attributes_for(:idea)})
            end
            it 'saves a new idea to the db' do
                count_before = Idea.count
                valid_request
                count_after = Idea.count
                expect(count_after).to eq(count_before + 1)
            end
            it 'redirects to the show page of that idea' do
                valid_request
                idea = Idea.last
                expect(response).to(redirect_to(ideas_path(idea.id)))
              end
        end
        context "with invalid parameters" do
            def invalid_request
              post(:create, params: {idea: FactoryBot.attributes_for(:idea, title: nil)})
            end
            it 'does not create an idea in the db' do
              count_before = Idea.count
              invalid_request
              count_after = Idea.count
              expect(count_after).to eq(count_before)
            end
            it 'renders the new template' do
                invalid_request
                expect(response).to render_template(:new)
            end
            it 'assigns an invalid idea as an instance variable' do
                invalid_request
                expect(assigns(:idea)).to be_a(Idea)
            end
        end
    end


end
