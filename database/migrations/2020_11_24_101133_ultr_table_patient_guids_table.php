<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UltrTablePatientGuidsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('patient_guids', function (Blueprint $table) {
            $table->integer('patient_guide_category_id');
            $table->string('title');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('patient_guids', function (Blueprint $table) {
            $table->dropColumn('patient_guide_category_id');
            $table->dropColumn('title');
        });
    }
}
