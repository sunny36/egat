module CustomFinder
  def self.included(base)
    base.scope :find_all_by_transformer_id_order_by_most_recent, lambda {
      |transformer_id| base.where('transformer_id = ?',
                             transformer_id).order('test_date DESC')
    }
  end

end
