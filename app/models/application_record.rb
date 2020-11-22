class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Dry::Monads[:result]

  def self.create(attributes = nil, &block)
    record = super
    if record.persisted?
      Success(record)
    else
      M::Failure[:persist, record]
    end
  end

  def self.find(id)
    Maybe(self.class.find_by(id))
  end

  def create(attributes = nil, &block)
    if super
      Success(self.reload)
    else
      M::Failure[:persist, self]
    end
  end

  def update(attributes)
    if super
      Success(self.reload)
    else
      M::Failure[:persist, errors]
    end
  end

  def destroy
    if super
      Success(self)
    else
      M::Failure[:persist, errors]
    end
  end
end
