class Api::V1::TestController < ApplicationController
    # POST /test
    def create
        @test = Test.new(test_params)
        if @test    
            render json: {return_string: cutString(@test.string_to_cut)}, status: 201
        else
            render json: { error: "Unable to create test"}, status: 400
        end
    end

    private
        def test_params
            params.require(:test).permit(:string_to_cut)
        end  

        def cutString(string)
            result = ''
            i = 2
            if string.length < 3
                result = ''
            else
                (string.length/3).times do
                    result += string[i]
                    i += 3  # use i as index number to get every third letter
                end
            end      
            return result    
        end 
end
