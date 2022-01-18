class ApiKey
  def self.new_key
    user = '.'
    until user == nil
      key = SecureRandom.base64.tr('+/=', 'Qrt')
      user = User.find_by(api_key: key)
    end
    key
  end
end
