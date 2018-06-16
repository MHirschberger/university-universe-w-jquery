class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?, :us_states, :post_types
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !session[:user_id].nil?
    end

    def home
      if logged_in?
        redirect_to user_path(current_user)
      end
    end

    def require_login
      return head(:forbidden) unless logged_in?
    end

    def validate_poster(post)
      if post.user != current_user
        return head(:forbidden)
      end
    end

    def post_types
      [
        ['Current Student', 'Current Student'],
        ['Course Review/Rating', 'Course Review/Rating'],
        ['Other', 'Other']
      ]
    end

    def us_states
      [
        ['AK', 'AK'],
        ['AL', 'AL'],
        ['AR', 'AR'],
        ['AZ', 'AZ'],
        ['CA', 'CA'],
        ['CO', 'CO'],
        ['CT', 'CT'],
        ['DC', 'DC'],
        ['DE', 'DE'],
        ['FL', 'FL'],
        ['GA', 'GA'],
        ['HI', 'HI'],
        ['IA', 'IA'],
        ['ID', 'ID'],
        ['IL', 'IL'],
        ['IN', 'IN'],
        ['KS', 'KS'],
        ['KY', 'KY'],
        ['LA', 'LA'],
        ['MA', 'MA'],
        ['MD', 'MD'],
        ['ME', 'ME'],
        ['MI', 'MI'],
        ['MN', 'MN'],
        ['MO', 'MO'],
        ['MS', 'MS'],
        ['MT', 'MT'],
        ['NC', 'NC'],
        ['ND', 'ND'],
        ['NE', 'NE'],
        ['NH', 'NH'],
        ['NJ', 'NJ'],
        ['NM', 'NM'],
        ['NV', 'NV'],
        ['NY', 'NY'],
        ['OH', 'OH'],
        ['OK', 'OK'],
        ['OR', 'OR'],
        ['PA', 'PA'],
        ['RI', 'RI'],
        ['SC', 'SC'],
        ['SD', 'SD'],
        ['TN', 'TN'],
        ['TX', 'TX'],
        ['UT', 'UT'],
        ['VA', 'VA'],
        ['VT', 'VT'],
        ['WA', 'WA'],
        ['WI', 'WI'],
        ['WV', 'WV'],
        ['WY', 'WY']
      ]
    end
    
end
