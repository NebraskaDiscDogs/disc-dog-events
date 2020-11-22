if defined?(M)
	raise RuntimeError, "Expected M to point to Dry::Monads but got #{M.inspect} instead!" unless M == Dry::Monads
else
	M = Dry::Monads
end