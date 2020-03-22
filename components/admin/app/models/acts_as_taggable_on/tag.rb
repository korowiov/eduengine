module ActsAsTaggableOn
  class Tag
    rails_admin do
      create do
        fields :name
      end

      edit do
        fields :name
      end

      list do
        fields :name
        fields :taggins_count
      end    
    end
  end
end