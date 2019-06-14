class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create


    @sale = Sale.new(sale_params)


   @sale.total =@sale.value - @sale.discount
    if @sale.tax == 0
     @sale.total *= 1.19
     @sale.tax = 19
    else
     @sale.tax = 0
   end
    @sale.save
    redirect_to sales_done_path
 # no esta terminado, no guarda la "venta" y falta mostrarla en done.html.erb

  end


  def done

  end


private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end

  def find_sale
    @sale = Sale.find(params[:id])
  end
end
