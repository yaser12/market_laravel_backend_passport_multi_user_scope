<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCSCTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_s_c_translations', function (Blueprint $table) {

            $table->increments('id');

            $table->integer('contact_sub_category_id')->unsigned();

            $table->integer('translated_languages_id')->unsigned();


            $table->string('name') ;
    
            $table->foreign('contact_sub_category_id')->references('id')->on('contact_sub_categories');

            $table->foreign('translated_languages_id')->references('id')->on('translated_languages');


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recieved_emails');
    }
}
