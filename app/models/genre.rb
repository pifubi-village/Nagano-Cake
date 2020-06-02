class Genre < ApplicationRecord
	enum name:{
		cake: 0,
		pudding: 1,
		bake_sweets: 2,
		candy: 3
	}
end
