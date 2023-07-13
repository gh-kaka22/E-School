<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\PostDestination;
use App\Models\Student;
use App\Models\Student_classroom;
use App\Models\Teacher;
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
            //'type_id'=>['required'],
            'student_id'=>['required']
        ]);
        $creator_id=Auth::id();

        $student=Student::find($request->student_id);
        if(!$student)
            return $this->apiResponse('Student not found',null,false);
        $user_id=$student->user_id;


            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                //'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString,
                'user_id'=>$creator_id
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
            //'type_id'=>['required'],
            'classroom_id'=>['required']
        ]);

        $creator_id=Auth::id();


            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                //'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString,
                'user_id'=>$creator_id
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
            //'type_id'=>['required'],
            'grade_id'=>['required']
        ]);

        $creator_id=Auth::id();

            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                //'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString,
                'user_id'=>$creator_id
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
            //'type_id'=>['required'],
        ]);

        $creator_id=Auth::id();

            $currentDateTimeString = Carbon::now()->format('Y-m-d H:i:s');

            $post=Post::create([
                'body'=>$request->body,
                //'type_id'=>$request->type_id,
                'date'=>$currentDateTimeString,
                'user_id'=>$creator_id
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
//        $request->validate([
//            'type_id'=>['required','integer']
//        ]);
        $user=Auth::user();


        $posts = DB::table('posts_destination')
            ->join('posts', 'posts.post_id', '=', 'posts_destination.post_id')
            ->join('users','users.id','=','posts.user_id')
            ->where('posts_destination.user_id','=', $user->id)
            ->select('posts.post_id','posts.body','posts.date','posts.updated_at','posts.user_id','role')
            ->get();
            //->pluck('body');

        $res=array();

        foreach($posts as $post) {
            $post->likes_count=$this->likes($post->post_id);
            $post->coments_count=$this->comments($post->post_id);
            if ($post->role == 4)
            {
                $teacher=DB::table('teachers')
                ->where('user_id','=',$post->user_id)
                ->first();
                $post->publisher=$teacher->first_name . " " . $teacher->last_name;
                array_push($res,$post);
            }
            else{
                $post->publisher='school';
                array_push($res,$post);

            }
        }



        return $this->apiResponse('success',$res);



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

    public function  likes($post_id){
        $post = Post::find($post_id);
        $likes = $post->likes()->get();
        return count($likes);
    }

    public function comments($post_id){
        $post = Post::find($post_id);
        $comments = $post->comments;
        return count($comments);
    }

}
