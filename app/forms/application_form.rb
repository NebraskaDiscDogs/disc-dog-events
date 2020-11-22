class ApplicationForm
	require "dry/initializer"
	require "dry/monads"
	require "dry/monads/do"

	include Virtus.model

	extend ActiveModel::Naming
	include ActiveModel::Conversion
	include ActiveModel::Validations


	def initialize(attributes = nil)
		super(attributes)
		yield self if block_given?
	end

	def persisted?
		false
	end

	def save
		return persist! if core_valid?
		false
	end

	def assign_attributes(attributes)
		id_fields, rest = self.class.attribute_names.partition { |key, _| key.to_s.end_with?("_id") }

		attributes.each do |key, value|
			if id_fields.include?(:"#{key}_id") && !rest.include?(key)
				key   = :"#{key}_id"
				value = value.id if value.respond_to?(:id)
			end

			self.send "#{key}=", value
		end
	end

	private

	def copy_errors(from_obj)
		from_obj.errors.keys.each do |key|
			self.errors[key].concat from_obj.errors[key]
		end
	end
end