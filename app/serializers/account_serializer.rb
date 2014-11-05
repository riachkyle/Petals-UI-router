class AccountSerializer < ActiveModel::Serializer
  attributes :id, :owner_name, :ig_account, :engagement
end
