<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameBlogTagsNameColumn extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('blogs_tags_relation', function (Blueprint $table) {
            $table->renameColumn('blogTag_id','blog_tag_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('blogs_tags_relation', function (Blueprint $table) {
            $table->renameColumn('blog_tag_id','blogTag_id');
        });
    }
}
