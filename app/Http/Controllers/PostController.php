<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\PostDestination;
use App\Models\Student;
use App\Models\Student_classroom;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class PostController extends Controller
{
    use ApiResponseTrait;

    public function createForStudent(Request $request){

        $data = $request->validate([
            'body'=>['required'],
            'type_id'=>['required'],
            'student_id'=>['required']
        ]);


            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString
            ]);


            $postDestenation=PostDestination::create([
                'student_id'=>$request->student_id,
                'post_id'=>$post->post_id
            ]);

            return $this->apiResponse('success',$post);





    }

    public function createForClassroom(Request $request){

        $request->validate([
            'body'=>['required'],
            'type_id'=>['required'],
            'classroom_id'=>['required']
        ]);


            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString
            ]);

            $students = Student_classroom::query()
                ->where('classroom_id','=',$request->classroom_id)
                ->get();

            $student_ids = array();
            foreach ($students as $som) {
                $student_ids[] = $som->student_id;
            }

            foreach($student_ids as $student_id){
                $data = [
                    ['student_id'=>$student_id, 'post_id'=>$post->post_id],

                ];
                $res=PostDestination::insert($data);
            }

            return $this->apiResponse('success',$post);






    }

    public function createForGrade(Request $request){
        $request->validate([
            'body'=>['required'],
            'type_id'=>['required'],
            'grade_id'=>['required']
        ]);



            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString
            ]);

            $students = Student::query()
                ->where('grade_id','=',$request->grade_id)
                ->get();

            $student_ids = array();
            foreach ($students as $som) {
                $student_ids[] = $som->student_id;
            }

            foreach($student_ids as $student_id){
                $data = [
                    ['student_id'=>$student_id, 'post_id'=>$post->post_id],

                ];
                $res=PostDestination::insert($data);
            }

            return $this->apiResponse('success',$post);




    }

    public function createForSchool(Request $request){
        $request->validate([
            'body'=>['required'],
            'type_id'=>['required'],
        ]);


            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString
            ]);

            $students = Student::query()
                ->get();

            $student_ids = array();
            foreach ($students as $som) {
                $student_ids[] = $som->student_id;
            }

            foreach($student_ids as $student_id){
                $data = [
                    ['student_id'=>$student_id, 'post_id'=>$post->post_id],

                ];
                $res=PostDestination::insert($data);
            }

            return $this->apiResponse('success',$post);


    }

    public function getPosts(Request $request){
        $request->validate([
            'type_id'=>['required','integer']
        ]);

        $student_id=$request->id;
        $type_id=$request->type_id;



        $posts = DB::table('posts_destination')
            ->join('posts', 'posts.post_id', '=', 'posts_destination.post_id')
            ->where('posts_destination.student_id', $student_id)
            ->where('posts.type_id', $type_id)
            ->get();
            //->pluck('body');

        return $this->apiResponse('success',$posts);



    }

}
