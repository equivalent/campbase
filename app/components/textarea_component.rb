# frozen_string_literal: true

class TextareaComponent < ViewComponent::Base
  attr_reader :form, :label

  def initialize(form, label: true)
    @form = form
    @label = label
  end

  def textarea_class
    klass = ["textarea"]
    klass << "is-danger" if errors.any?
    klass
  end

  def label_class
    klass = ["label"]
    klass << "is-hidden" unless label
    klass
  end

  def errors
    form.object.errors[:description]
  end
end
