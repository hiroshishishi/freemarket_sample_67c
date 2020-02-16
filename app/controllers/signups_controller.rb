class SignupsController < ApplicationController
  def index

  end

  def user_register
    @user = User.new
  end

  def address_register
    # binding.pry
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:firstname] = user_params[:firstname]
    session[:lastname] = user_params[:lastname]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:birth_year] = params[:birthday]["birthday(1i)"]
    session[:birth_month] = params[:birthday]["birthday(2i)"]
    session[:birth_day] = params[:birthday]["birthday(3i)"]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )
    @address = Address.new
  end

  def phone_register
    # binding.pry
    session[:firstname] = address_params[:firstname]
    session[:lastname] = address_params[:lastname]
    session[:firstname_kana] = address_params[:firstname_kana]
    session[:lastname_kana] = address_params[:lastname_kana]
    session[:zip_code] = address_params[:zip_code]
    session[:prefecture_id] = address_params[:prefecture_id]
    session[:city] = address_params[:city]
    session[:street] = address_params[:street]
    session[:block_room] = address_params[:block_room]
    session[:telephone] = address_params[:telephone]
    # binding.pry
    @user = User.new
    @address = Address.new(
      user: @user,
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      zip_code: session[:zip_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      street: session[:street],
      block_room: session[:block_room],
      telephone: session[:telephone]
    )
    # binding.pry
    @user = User.new
    # binding.pry
  end


  def create
    # binding.pry
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      telephone: user_params[:telephone],
      lastname: session[:lastname], 
      firstname: session[:firstname], 
      lastname_kana: session[:lastname_kana], 
      firstname_kana: session[:firstname_kana], 
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render '/signups/user_register' and return
    end
    if @user.save
      session[:id] = @user.id
      redirect_to done_register_signups_path
      @address = Address.create(
        user: @user,
        zip_code: session[:zip_code],
        prefecture_id: session[:prefecture_id],
        city: session[:city],
        street: session[:street],
        block_room: session[:block_room],
        telephone: session[:telephone],
        lastname: session[:lastname], 
        firstname: session[:firstname], 
        lastname_kana: session[:lastname_kana], 
        firstname_kana: session[:firstname_kana]
      )
      unless @address.valid?
        flash.now[:alert] = @address.errors.full_messages
        render '/signups/user_register' and return
      end
    else
      render '/signups/index'
    end

  end

  def login
  end

  def done_register
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :lastname,
      :firstname,
      :lastname_kana,
      :firstname_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :password,
      :email,
      :telephone
    )
  end

  def address_params
    params.require(:address).permit(
      :lastname,
      :firstname,
      :lastname_kana,
      :firstname_kana,
      :zip_code,
      :prefecture_id,
      :city,
      :street,
      :block_room,
      :telephone
    )
  end
end