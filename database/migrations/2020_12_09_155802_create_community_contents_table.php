<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommunityContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('community_contents', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('title')->nullable();
            $table->text('content')->nullable();
            $table->string('images')->nullable();
            $table->string('video')->nullable();
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
        Schema::dropIfExists('community_contents');
    }
}
