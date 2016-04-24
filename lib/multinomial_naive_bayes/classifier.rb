module MultinomialNaiveBayes
  class Classifier
    def initialize(categories_summaries, categories_probabilities)
      @categories_summaries = categories_summaries
      @categories_probabilities = categories_probabilities
    end

    def classify(vector)
      max_ln_category_probability(vector)[0]
    end

    def max_ln_category_probability(vector)
      all_ln_categories_probabilities(vector).
        to_a.
        sort_by{|ln_category_probability| -ln_category_probability[1]}.
        first
    end

    def all_ln_categories_probabilities(vector)
      @categories_summaries.keys.inject({}) do |map, category|
        map[category] = ln_category_probability(vector, category)
        map
      end
    end

    def ln_category_probability(vector, category)
      sum = 0
      vector.each_with_index do |feature_value, feature|
        sum += Math.log(@categories_summaries[category][feature]**feature_value)
      end
      sum + Math.log(@categories_probabilities[category])
    end
  end
end
