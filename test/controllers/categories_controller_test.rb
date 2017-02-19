require 'test_helper'


class CategoriesControllerTest< ActionController::TestCase
    
    def setup
        
       @category = Category.create(name: "sports")
     @user =User.create(username:"luquinhas", email: "email@meail.com", password: "password", admin: true)

        
    end
    
    
    test "should get categories index" do
        
       get :index 
        assert_response :success
        
    end
    
    
    
    test "should get new" do
        session[:user_id] = @user.id
        get :new
        assert_response :success 
        
        
    end
    
    
    
    test "should get show"do
        get(:show, {'id' => @category.id} )
        assert_response :success
        
        
    end
    

    
end