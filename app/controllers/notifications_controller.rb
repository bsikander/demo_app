class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new

    gcm = GCM.new("AIzaSyBtQrO5CJeP3x1Y0hDefxL4Bi82f6tK3TI")
# you can set option parameters in here
#  - all options are pass to HTTParty method arguments
#  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
#  gcm = GCM.new(api_key, timeout: 3)

    registration_ids= ["APA91bEgE3VHEfA8RN5WaNIV76QynNij2tuPuishNch5vyRItxWzjJI9KA6V3qRHQYmkL8wnmD0bKPh61WACrMqR03-gcnAa54r9LmAo5_e1qZmVPyzbXRFA8e-JMVzkEqBU9Tl4gUT0nESX8XzYoC2H5gdH7jx_jw"] # an array of one or more client registration IDs
    options = {data: {score: "123"}, collapse_key: "updated_score"}
    response = gcm.send_notification(registration_ids, options)

  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notification }
      else
        format.html { render action: 'new' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:user_id, :message, :status)
    end
end
