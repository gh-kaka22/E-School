<?php

namespace App\Http\Controllers;

use App\Models\ExamSchedule;
use App\Models\ExamSchedule_ExamType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ExamScheduleController extends Controller
{

    use  ApiResponseTrait;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $exam_schedule = ExamSchedule_ExamType::query()
            ->join('exam_schedules' , 'exam_schedules.exam_schedule_id' , '=' ,
            'exam_schedule__exam_type_pivot.exam_schedule_id')
            ->orderBy('exam_schedules.exam_schedule_id','DESC')
            ->get();

        if(!$exam_schedule)
            return $this->apiResponse('schedule is not found',null,false);

        return $this->apiResponse('success',$exam_schedule);
    }

    public function create(Request $request)
    {
        $request->validate([
            'grade_id'=>['required','integer'],
            'School_Year'=>['required','integer'],
            'type_id'=>['required','integer'],
            'image'=> ['required', 'image','mimes:jpeg,png,bmp,jpg'],
        ]);

            $file_extintion = $request->file('image') ->getClientOriginalExtension();
            $file_name = time().'.'.$file_extintion;
            $path = 'ExamScheduleImages';
            $request ->file('image')-> move($path,$file_name);


        $insertedData = ExamSchedule::create([
            'grade_id' => $request->grade_id,
            'School_Year'=>$request->School_Year,
            'image' => $file_name,
        ]);

        $exam_schedule = ExamSchedule::query()
            ->orderBy('created_at','DESC')
            ->first();



        $insertedData2 = ExamSchedule_ExamType::create([
            'exam_schedule_id' => $exam_schedule->exam_schedule_id,
            'type_id'=>$request->type_id,
        ]);

        $exam_schedule->type_id=$insertedData2->type_id;


        return $this->apiResponse('Schedule uploaded successfully',$exam_schedule);

    }


    /**
     * Display the specified resource.
     */


    public function showByGrade($grade_id)
    {


        $exam_schedule = DB::table('exam_schedules')
            ->where('grade_id','=',$grade_id)
            ->orderBy('created_at', 'DESC')
            ->first();

        $exam_type =  ExamSchedule_ExamType::query()
            ->where('exam_schedule_id','=',$exam_schedule->exam_schedule_id)
            ->first()->type_id;


        $exam_schedule->type_id=$exam_type;


        if(!$exam_schedule)
            return $this->apiResponse('schedule is not found',null,false);


        return $this->apiResponse('success',$exam_schedule);


    }



    /**
     * Update the specified resource in storage.
     */
//    public function update(Request $request , $id)
//    {
//        //
//       $inputdata = $request->validate([
//            'grade_id'=>['integer'],
//            'School_Year'=>['integer'],
//            'type_id'=>['integer'],
//            'image'=> [ 'image','mimes:jpeg,png,bmp,jpg'],
//        ]);
//
//
//        if( $request->file('image') != null)
//        {
//            $file_extintion = $request->file('image') ->getClientOriginalExtension();
//            $file_name = time().'.'.$file_extintion;
//            $path = 'ExpertImages';
//            $request ->file('image')-> move($path,$file_name);
//            $examSchedule_image= $file_name;
//        }
//        else{
//            $examSchedule_image=ExamSchedule::query()
//                ->select('image')
//                ->where('grade_id', '=', $request->grade_id)
//                ->first();
//        }
//
////        $examSchedule_image = ExamSchedule::query()->find($request->grade_id);
//
//        $examSchedule= ExamSchedule::query()->where('grade_id', '=', $request->grade_id)->first();
//
//        $exam_schedule= ExamSchedule::query()->where('grade_id', '=', $request->grade_id)->update([
//            'grade_id' => $request->has('grade_id')? $request['grade_id']: $examSchedule['grade_id'],
//            'School_Year' => $request->has('School_Year')? $request['School_Year']: $examSchedule['School_Year'],
//        ]);
//
//
//        $exam_schedule_type= ExamSchedule_ExamType::query()->where('exam_schedule_id', '=', $exam_schedule->exam_schedule_id)->update([
//            'type_id' => $request->has('type_id')? $request['type_id']: $examSchedule['type_id']
//        ]);
//
//        return $this->apiResponse('success',$exam_schedule);
//
//    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExamSchedule $examSchedule)
    {
        //
    }
}
