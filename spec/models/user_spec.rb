require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameとemail、encrypted_passwordとencrypted_password_confirmation、上の名前と下の名前、ふりがな、生年月日が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに＠がないと登録できないこと" do
      @user.email = "abcdefghijk"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be @ in the email")
    end

    it "passwordが空では登録できないこと" do
      @user.encrypted_password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.encrypted_password = "abc00"
      @user.encrypted_password_confirmation = "abc00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英のみだと登録できない" do
      @user.encrypted_password = "abcdef"
      @user.encrypted_password_confirmation = "absdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be only english")
    end

    it "passwordが半角数字のみであると登録できない"
      @user.encrypted_password = "000000"
      @user.encrypted_password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be only numbers")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.encrypted_password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name can't be blank")
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("name can't be blank")
    end

    it "family_name_furiganaが空では登録できないこと" do
      @user.family_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_furigana can't be blank")
    end

    it "name_furiganaが空では登録できないこと" do
      @user.name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("name_furigana can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("birthday can't be blank")
    end

    it"family_name_furiganaは全角カタカナでないと登録できない" do
      @user.family_name_furigana = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_furigana can't be hiragana")
    end

    it"name_furiganaは全角カタカナでないと登録できない" do
      @user.name_furigana = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include("name_furigana can't be hiragana")
    end

    it "family_nameが全角入力でなければ登録できないこと" do
      @user.family_name = "ｱｲｳｴｵ"
      user.valid?
      expect(@user.errors.full_messages).to include("name_furigana can't be hankaku")
    end

    it "nameが全角入力でなければ登録できないこと" do
      @user.name = "ｱｲｳｴｵ"
      user.valid?
      expect(@user.errors.full_messages).to include("name can't be hankaku")
    end
  end
end