require 'test_helper'

module ApiTests
  module ResourcesControllerTests
    module IndexTests
      class BaseTest < ActionDispatch::IntegrationTest
        include SharedContexts::StubSignedAccount

        let(:author) { create(:account) }
        let(:request_params) {{}}
        let(:make_request) { get '/api/resources', params: request_params, headers: authentication_headers }

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
      end
    end
  end
end