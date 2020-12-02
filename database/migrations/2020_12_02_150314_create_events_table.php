<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id()->unsigned();
            $table->string('title');
            $table->date('start_date');
            $table->date('end_date');
            $table->string('cost')->nullable();
            $table->string('image');
            $table->text('content');
            $table->string('speaker_name');
            $table->string('location')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->integer('attendance')->default(0);
            $table->integer('category_id');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
