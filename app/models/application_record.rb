# frozen_string_literal: true

#  Plugins / gems or direct methods
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
