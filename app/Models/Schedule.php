<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Schedule extends Model
{
    use HasFactory;

    protected $table = "schedules";

    protected $guarded =[];


    protected $primaryKey = "id";

    public $timestamps=true ;


    public function classroom() : BelongsTo
    {
        return $this->belongsTo(Classroom::class,'classroom_id');

    }

    public function subject() : BelongsTo
    {
        return $this->belongsTo(Subject::class,'subject_id');

    }

    
}
