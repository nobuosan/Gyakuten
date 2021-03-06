# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  contents   :text
#  desc       :text
#  genre      :string
#  position   :integer
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_id    :integer
#

require "rails_helper"

RSpec.describe Movie, type: :model do
  context "title と contents と genre が存在するとき" do
    let(:movie) { create(:movie) }
    it "動画の記事が作られる" do
      expect(movie).to be_valid
    end
  end

  context "title が存在しないとき" do
    let(:movie) { build(:movie, title: nil) }
    it "エラーする" do
      expect(movie).not_to be_valid
      expect(movie.errors.messages[:title]).to include "を入力してください"
    end
  end

  context "contents が存在しないとき" do
    let(:movie) { build(:movie, contents: nil) }
    it "エラーする" do
      expect(movie).not_to be_valid
      expect(movie.errors.messages[:contents]).to include "を入力してください"
    end
  end

  context "genre が存在しないとき" do
    let(:movie) { build(:movie, genre: nil) }
    it "エラーする" do
      expect(movie).not_to be_valid
      expect(movie.errors.messages[:genre]).to include "を入力してください"
    end
  end
end
