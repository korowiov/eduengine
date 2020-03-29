require 'test_helper'

module ApiTests
  module ResourceControllerTests
    module IndexTests
      class BaseTest < ActionDispatch::IntegrationTest
        include SharedContexts::StubSignedAccount

        let(:author) { create(:account) }
        let(:request_params) {{}}
        let(:make_request) { get '/api/resources', params: request_params, headers: authentication_headers }

        def resource_jsonify(resource)
          hsh = resource.slice(:uuid, :name)
          hsh[:published] = resource.published_at.strftime("%F %H:%M")
          hsh[:tags] = resource.tag_list
          hsh[:author] = resource.author.slice(:uuid, :email, :nickname)
          hsh[:subject] = resource.subject.slice(:id, :name, :icon_code)
          hsh
        end
      end
    end
  end
end