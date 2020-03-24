module DashboardHelper
    def sum (array)
        @a = 0
        array.each {
            |item| 
            @a += item.amount.to_i
        } 

        @a 
    end 
end
