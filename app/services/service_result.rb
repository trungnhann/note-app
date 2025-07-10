class ServiceResult
  attr_reader :success, :message, :data, :errors

  def initialize(success:, message: '', data: {}, errors: {})
    @success = success
    @message = message
    @data = data
    @errors = errors
  end

  def success?
    success
  end

  def failure?
    !success?
  end
end
