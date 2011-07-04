require 'spec_helper'

describe OilContamination do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: oil_contaminations
#
#  id             :integer(4)      not null, primary key
#  version        :integer(4)
#  color          :float
#  ift            :float
#  nn             :float
#  pf100          :float
#  pf20           :float
#  test_by        :string(255)
#  test_date      :datetime
#  water_content  :integer(4)
#  work_order     :string(255)
#  transformer_id :integer(4)
#  test_type      :integer(4)
#

