require 'rails_helper'

RSpec.describe "Memos", type: :system do
  before do
    driven_by(:rack_test)
    user = FactoryBot.create(:user1)
    sign_in user
  end

  it "opens the new memo page from the index" do
    visit memos_path
    click_link I18n.t('memo.new'), match: :first
    expect(page).to have_current_path(new_memo_path)
  end
end