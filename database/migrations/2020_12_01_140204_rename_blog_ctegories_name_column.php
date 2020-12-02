<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameBlogCtegoriesNameColumn extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('blogs_categories_relation', function (Blueprint $table) {
            $table->renameColumn('blogCategory_id','blog_category_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('blogs_categories_relation', function (Blueprint $table) {
            $table->renameColumn('blog_category_id','blogCategory_id');
        });
    }
}
