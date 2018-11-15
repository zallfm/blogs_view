# frozen_string_literal: true

#  Plugins / gems or direct methods
class Comment < ApplicationRecord
  belongs_to :article
end
