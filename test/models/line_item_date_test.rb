# == Schema Information
#
# Table name: line_item_dates
#
#  id         :bigint           not null, primary key
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quote_id   :bigint           not null
#
# Indexes
#
#  index_line_item_dates_on_date               (date)
#  index_line_item_dates_on_date_and_quote_id  (date,quote_id) UNIQUE
#  index_line_item_dates_on_quote_id           (quote_id)
#
# Foreign Keys
#
#  fk_rails_...  (quote_id => quotes.id)
#
require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date returns the quote's previous date when it exitsts" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when the quote has no previous date" do
    assert_nil line_item_dates(:today).previous_date
  end
end