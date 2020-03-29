require 'test_helper'

module ApiTests
  module SubjectsControllerTest
    class IndexTests < ActionDispatch::IntegrationTest
      let(:subject_1) { create(:subject) }
      let(:subject_1_child) { create(:subject, parent: subject_1) }
      let(:subject_2) { create(:subject) }
      let(:subject_2_child) { create(:subject, parent: subject_2) }
      let(:subject_3) { create(:subject) }
      let(:subject_3_child) { create(:subject, parent: subject_3) } 
      let(:subject_4) { create(:subject) }
      let(:subject_4_child) { create(:subject, parent: subject_3) }

      let(:make_request) { get '/api/subjects' }

      def subject_jsonify(subject)
        subject.slice(:id, :name, :icon_code)
      end

      before do
        subject_1
        subject_1_child
        subject_2
        subject_2_child
        subject_3
        subject_3_child
        subject_4
        subject_4_child
      end

      describe 'Successful request' do
        let(:expected_json) do
          [subject_1, subject_2, subject_3, subject_4]
            .map do |subject|
              subject_jsonify(subject)
            end
        end

        it 'returns 200' do
          make_request
          assert_response :ok
        end

        it 'returns proper json' do
          make_request
          assert_equal expected_json, json_response
        end        
      end
    end
  end
end