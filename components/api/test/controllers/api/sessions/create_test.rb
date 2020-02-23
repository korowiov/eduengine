require 'test_helper'

module ApiTests
  module SessionsControllerTests
    class CreateTest < ActionDispatch::IntegrationTest
      include SharedContexts::StubIncomingIp

      let(:params) {{}}
      let(:make_request) { post '/api/sessions', params: params }

      before do
        stub_incoming_ip!
      end
    end
  end
end