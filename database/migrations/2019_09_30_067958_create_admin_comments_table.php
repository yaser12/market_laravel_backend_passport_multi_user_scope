<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdminCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_comments', function (Blueprint $table)
        {
            $table->increments('id');
            $table->string('comment') ;
            $table->integer('recieved_email_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->timestamps();


            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('recieved_email_id')->references('id')->on('recieved_emails');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admin_comments');
    }
}
