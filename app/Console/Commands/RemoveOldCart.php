<?php

namespace App\Console\Commands;

use App\Cart;
use App\StockProduct;
use Illuminate\Console\Command;

class RemoveOldCart extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'oldcard:remove';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'when add cart product occupied , so we need to remove old card and free occupied product';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
      https://www.youtube.com/watch?v=Udx8MIB0UBY
    Do not forget to replace /path/to/artisan with the full path to the Artisan command of your Laravel Application.
     * * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1
     * @return mixed
     */
    public function handle()
    {
        $carts=   Cart::where('is_ordered','=',false)
            ->where('updated_at', '<=', now()->subMinutes(30)->toDateTimeString())->get();

        foreach ($carts  as &$cart)
        {
            $stack_product=StockProduct::where("id",'=',$cart->stock_product_id)->first();

            $stack_product->number_in_cart=$stack_product->number_in_cart-1;

            $stack_product->save();
        }

        $carts=   Cart::where('is_ordered','=',false)
            ->where('updated_at', '<=', now()->subMinutes(30)->toDateTimeString())->get();
        $carts::delete();
    }
}
