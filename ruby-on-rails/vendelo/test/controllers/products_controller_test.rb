require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path
    
        assert_response :success
        assert_select '.product', 2  # Debe haber dos elementos de clase html product
      end

    test 'render a detailed product page' do
        get product_path(products(:ps4))

        assert_response :success
        assert_select '.title', 'PS4 Fat'
        assert_select '.description', 'PS4 en buen estado'
        assert_select '.price', '150$'
    end
end
