require 'test_helper'

module ApiTests
  module ResourcesControllerTests
    class ShowTest < ActionDispatch::IntegrationTest
      include SharedContexts::StubSignedAccount
      
      let(:resource_id) { }
      let(:make_request) { get "/api/resources/#{resource_id}", headers: authentication_headers }

      def resource_jsonify(resource)
        hsh = resource.slice(:uuid, :name, :education_level, :description)
        hsh[:published] = resource.published_at.strftime("%F %H:%M")

        hsh[:author] = resource.author.slice(:uuid, :email, :nickname)
        hsh[:subjects] = [].tap do |elements|
          unless resource.subject.root?
            elements.push(resource.subject.parent.slice(:id, :name, :icon_code))
          end
          elements.push(resource.subject.slice(:id, :name, :icon_code))
        end
        hsh[:tags] = resource.tag_list
        hsh
      end

      %w[quiz flashcards_deck].each do |resource_type|
        describe "Get resource type #{resource_type}" do
          let(:resource) do
            create(:resource, :published, :random_date, type: resource_type.classify)
          end

          let(:resource_id) { resource.uuid }

          before do
            resource
          end

          describe 'Successful request' do
            it 'returns 200' do
              make_request
              assert_response :ok
            end
          end

          describe 'Unsuccessful request' do
            describe 'Invalid id' do
              let(:resource_id) { 'invalid' }

              it 'returns 404' do
                make_request
                assert_response :not_found
              end
            end
    
            describe 'User not logged in' do
              let(:make_request) { get "/api/resources/#{resource_id}" }

              it 'returns 401' do
                make_request
                assert_response :unauthorized
              end
            end
          end
        end
      end
    end
  end
end