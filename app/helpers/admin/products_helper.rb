module Admin::ProductsHelper
	def number_to_currency(price_tax_excluded)
		"#{price_tax_excluded.to_s(:delimited)}"
	end
end
