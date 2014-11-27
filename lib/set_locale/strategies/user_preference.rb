class SetLocale::Strategies::UserPreference < SetLocale::Strategies::Base
  def initialize(options = {})
    @current_user_method = options[:current_user_method] || :current_user
    @locale_method = options[:locale_method] || :locale
  end

  def fetch
    user_preference ? user_preference.to_sym : nil
  end

  def user_preference
    current_user_method = @current_user_method
    locale_preference_method = @locale_method

    @controller.instance_eval do
      if self.send(current_user_method)
        self.send(current_user_method).send(locale_preference_method)
      end
    end
  end
end
