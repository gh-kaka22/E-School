<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\PostDestination;
use App\Models\Student;
use App\Models\Student_classroom;
use App\Models\User;
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

        $student=Student::find($request->student_id);
        if(!$student)
            return $this->apiResponse('Student not found',null,false);
        $user_id=$student->user_id;


            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString
            ]);


            $postDestenation=PostDestination::create([
                'user_id'=>$user_id,
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


           $user_ids= DB::table('students_classrooms')
                ->join('students','students.student_id','=','students_classrooms.student_id')
                ->where('students_classrooms.classroom_id','=',$request->classroom_id)
                ->pluck('students.user_id');


            foreach($user_ids as $id){
                $data = [
                    ['user_id'=>$id, 'post_id'=>$post->post_id],

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



        $students = DB::table('students')
            ->where('grade_id','=',$request->grade_id)
            ->pluck('user_id');


            foreach($students as $id){
                $data = [
                    ['user_id'=>$id, 'post_id'=>$post->post_id],

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

             $user_ids = DB::table('users')
              ->pluck('id');

              //return $this->apiResponse('s',$users);



            foreach($user_ids as $id){
                $data = [
                    ['user_id'=>$id, 'post_id'=>$post->post_id],

                ];
                $res=PostDestination::insert($data);
            }

            return $this->apiResponse('success',$post);


    }

    public function getPosts(Request $request){
        $request->validate([
            'type_id'=>['required','integer']
        ]);

        $user_id=Auth::id();
        $type_id=$request->type_id;



        $posts = DB::table('posts_destination')
            ->join('posts', 'posts.post_id', '=', 'posts_destination.post_id')
            ->where('posts_destination.user_id','=', $user_id)
            ->where('posts.type_id','=', $type_id)
            ->get();
            //->pluck('body');

        return $this->apiResponse('success',$posts);



    }

    public function deletePost($post_id){

        try {
            $res=DB::table('posts')
                ->where('post_id','=',$post_id)
                ->delete();
            return $this->apiResponse('Deleted',$res);

        }catch (\Exception $e){
            return $this->apiResponse('Post not found');
        }




    }

}
