class Memo < ApplicationRecord
    belongs_to :user, optional: true
end
