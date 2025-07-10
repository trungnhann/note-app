class ApplicationService
  def self.call(*, **)
    new(*, **).call
  end
  private_class_method :new
  def call
    raise NotImplementedError, '[ApplicationService] Subclasses must implement #call'
  end

  private

  def success(data = {}, message = 'success')
    ServiceResult.new(success: true, data: data, message: message)
  end

  def failure(message = 'error', errors = {})
    ServiceResult.new(success: false, errors: errors, message: message)
  end
end
