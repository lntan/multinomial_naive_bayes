module MultinomialNaiveBayes
  class Learner
    def initialize(alpha = 1.0)
      @alpha = alpha
    end

    def train(vector, category)
      @category_to_feature_group ||= {}
      @category_to_feature_group[category] ||= {}
      vector.each_with_index do |feature_value, feature|
        @category_to_feature_group[category][feature] ||= []
        @category_to_feature_group[category][feature] << feature_value
      end
      @number_of_features ||= vector.length
      @category_to_num_instances ||= Hash.new(0)
      @category_to_num_instances[category] += 1
    end

    def classifier
      Classifier.new(categories_summaries, categories_probabilities)
    end

    def categories_summaries
      @category_to_feature_group.inject({}) do |map, (category, feature_group)|
        map[category] = category_summary(feature_group)
        map
      end
    end

    def category_summary(feature_group)
      total_count_of_all_features =  feature_group.values.flatten.reduce(&:+)
      feature_group.inject({}) do |map, (feature, feature_values)|
        total_count_of_feature = feature_values.reduce(&:+)
        map[feature] = (total_count_of_feature + @alpha).to_f/(total_count_of_all_features + @number_of_features)
        map
      end
    end

    def categories_probabilities
      total_instances = @category_to_num_instances.values.reduce(&:+)
      @category_to_num_instances.inject({}) do |map, (category, num_instances)|
        map[category] = num_instances.to_f/total_instances
        map
      end
    end
  end
end
