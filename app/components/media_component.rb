class MediaComponent < ViewComponent::Base
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def image_url
    model.creator.image_url
  end
end
