require 'rails_helper'

RSpec.describe "Memos", type: :request do
  before do
    @category1 = FactoryBot.create(:c_todo)
    @category2 = FactoryBot.create(:c_idea)
    @memo1 = FactoryBot.create(:memo1)
    @memo2 = FactoryBot.create(:memo2)
  end

  describe "GET /index" do
    it "Successfully signed in, displays memos list page." do
      @user = FactoryBot.create(:user1)
      sign_in @user
      get memos_path
      expect(response).to have_http_status(200)
    end

    it "signed in, but, no handle_name, redirect to user edit." do
      @user = FactoryBot.create(:user_new)
      sign_in @user
      get memos_path
      expect(response).to redirect_to edit_user_path(@user.id)
    end

    it "not signed in yet, redirect to login screen." do
      get memos_path
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "PATCH/PUT /update" do
    before do
      @user = FactoryBot.create(:user1)
      sign_in @user
      get edit_memo_path(@memo1.id)
    end

    context "when category_id is null, " do
      it "data will not be updated, and return edit." do
        patch memo_path(@memo1),
          params: { memo: attributes_for(:memo1).merge(category_id: nil) }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end

    context "when category_id is not null, " do
      it "will be updated." do
        patch '/memos/' + @memo1.id.to_s,
          params: { memo: attributes_for(:memo1_new) }
        @memo1.reload
        expect(@memo1.category.name).to eq(@category1.name)
        expect(@memo1.content).to eq("Python Report, by Nov. 5")
      end

      it "will be redirect, after updated." do
        patch '/memos/' + @memo1.id.to_s,
          params: { memo: attributes_for(:memo1_new) }
          expect(response).to redirect_to(memo_path(@memo1, locale: :ja))
      end
    end
  end
end