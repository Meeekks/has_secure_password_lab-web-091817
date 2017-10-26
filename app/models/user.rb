class User < ActiveRecord::Base
  has_secure_password

  flash = {success: "It worked!", error: "It failed!"}
end
