<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Owner;
use App\Models\Parentt;
use App\Models\Student;
use App\Models\Student_Parent;
use App\Models\Teacher;
use App\Models\TeacherClassroom;
use App\Models\User;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rules\Password as password_rule;
use App\Http\Controllers\ApiResponseTrait;

class AuthController extends Controller
{
    use ApiResponseTrait;



    public function login2(Request $request)
    {


        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $success['token'] = $user->createToken('accessToken')->accessToken;

            return $this->apiResponse('You are successfully logged in.', $success);

        } else {
            return $this->apiResponse('Unauthorised.', null);
        }
    }


    public function register(Request $request)
    {
//        $validator = Validator::make($request->all(), [
//            'name' => 'required',
//            'email' => 'required|email|unique:users',
//            'password' => 'required|min:8'
//        ]);

       // if ($validator->fails()) return sendError('Validation Error.', $validator->errors(), 422);

        try {
            $user = User::create([
                'role' => $request->role,
                'email' => $request->email,
                'password' => bcrypt($request->password)
            ]);

            $success['name'] = $user->name;
            $message = 'Yay! A user has been successfully created.';
            $success['token'] = $user->createToken('accessToken')->accessToken;
        } catch (Exception $e) {
            $success['token'] = [];
            $message = $e->getMessage();
        }

        return $this->apiResponse($message,$success);
    }























    public function StudentRegister(Request $request): JsonResponse
    {

        $attributes=$request->validate([
            'first_name' => ['required', 'max:55', 'string'],
            'last_name' => ['required', 'max:55', 'string'],
            'date_of_birth'=>['required', 'date'],
            'father_first_name' => ['nullable', 'max:55', 'string'],
            'father_phone_number' => ['nullable','min:10', 'max:14', 'string'],
            //'father_national_id' => ['nullable', 'string'],
            'mother_first_name'=>['nullable','max:55','string'],
            'mother_last_name'=>['nullable','max:55','string'],
            'mother_phone_number' => ['nullable','min:10', 'max:14', 'string'],
            //'mother_national_id' => ['nullable', 'string'],
            'religion' => ['required', 'max:55', 'string'],
            'national_id'=>['required', 'max:55', 'string'],
            'address'=>['required', 'string'],
            'grade_number'=>['required', 'max:12', 'integer'],
            'details' => ['nullable'],
            'have_kids'=>['required','integer'],
            'parent_id'=>['nullable','integer'],
            'gender_id'=>['required','integer'],

        ]);



        if($request->have_kids==0){

            $request->validate([
                'father_first_name' => ['required', 'max:55', 'string'],
                'father_phone_number' => ['required','min:10', 'max:14', 'string'],
                //'father_national_id' => ['required', 'string'],
                'mother_first_name'=>['required','max:55','string'],
                'mother_last_name'=>['required','max:55','string'],
                'mother_phone_number' => ['required','min:10', 'max:14', 'string'],
                //'mother_national_id' => ['required', 'string'],
            ]);


            $Pinput=array();
            $Pinput['parent_password'] =  300 . rand(pow(10, 6 - 1), pow(10, 6) -1);
            $ParentpasswordDecoded=$Pinput['parent_password'];
            $Pinput['parent_password'] = bcrypt($Pinput['parent_password']);
            $Pinput['parent_email'] =   $request->father_first_name  . rand(pow(10, 4 - 1), pow(10, 4) -1). $request->mother_first_name .'@schoolname.com';


           try{
               $parent=Parentt::query()->create([
               'father_first_name'=>$request->father_first_name,
               'father_last_name'=>$request->last_name,
               'father_phone_number'=>$request->father_phone_number,
               'mother_first_name'=>$request->mother_first_name,
               'mother_last_name'=>$request->mother_last_name,
               'mother_phone_number'=>$request->mother_phone_number,
               'national_id'=>$request->national_id,
               'email'=>$Pinput['parent_email'],
               'password'=>$Pinput['parent_password'],

           ]);

               $parent_id=$parent->parent_id;
               $parent_email=$parent->email;

           } catch (\Exception $e){
               if($e->getCode()==23000)
               return $this->apiResponse('The national id already exist',null,false);
           }


            $father_name=$request->father_first_name;
            $father_phone_number=$request->father_phone_number;
            $mother_first_name=$request->mother_first_name;
            $mother_last_name=$request->mother_last_name;
            $mother_phone_number=$request->mother_phone_number;

        }



        if($request->have_kids==1){



            try{
                $parent=DB::table('parents')
                ->where('national_id','=',$request->national_id)
                ->first();
                $parent_id=$parent->parent_id;
                $parent_email=$parent->email;
            }catch (\Exception $e){
                if($e->getCode()==0)
                return $this->apiResponse('The national id does not exist',null,false);


            }
            $father_name=$parent->father_first_name;
            $father_phone_number=$parent->father_phone_number;
            $mother_first_name=$parent->mother_first_name;
            $mother_last_name=$parent->mother_last_name;
            $mother_phone_number=$parent->mother_phone_number;

        }



        $input=array();
        $input['student_password'] =  200 . rand(pow(10, 6 - 1), pow(10, 6) -1);
        $StudentpasswordDecoded=$input['student_password'];
        $input['student_password'] = bcrypt($input['student_password']);
        $input['student_email'] =   $request->first_name . rand(pow(10, 4 - 1), pow(10, 4) -1).'@schoolname.com';

        $student = Student::query()->create(
            [
                'first_name'=>$request->first_name,
                'last_name'=>$request->last_name,
                'date_of_birth'=>$request->date_of_birth,
                'religion'=>$request->religion,
                'address'=>$request->address,
                'grade_id'=>$request->grade_number,
                'details'=>$request->details,
                'email'=>$input['student_email'],
                'password'=>$input['student_password'],
                'gender_id'=>$request->gender_id,
                'parent_id'=>$parent_id,
            ]
        );
        if($request->have_kids==0)
            $student['ParentPasswordDecoded']=$ParentpasswordDecoded;




        $student['StudentPasswordDecoded']=$StudentpasswordDecoded;
        $student['father_name']=$father_name;
        $student['father_phone_number']=$father_phone_number;
        $student['mother_first_name']=$mother_first_name;
        $student['mother_last_name']=$mother_last_name;
        $student['mother_phone_number']=$mother_phone_number;
        $student['parent_email']=$parent_email;
        $student['student_token']=$accessToken = $student->createToken('MyApp', ['student'])->accessToken;


        return $this->apiResponse('success',$student);

    }


/*
 *
 public function ParentRegister(Request $request): JsonResponse
    {

        $request->validate([
       'national_id_code' => 'required|string|exists:parents',
        ]);


        $parent = Parentt::query()->where('national_id_code' , '=' , $request->national_id_code)->first();

        $parent_name = $parent->first_name . $parent->last_name;


        $input=array();
        $input['email'] =  $parent_name. rand(pow(10, 4 - 1), pow(10, 4) -1).'@schoolname.com';
        $input['password'] =  rand(pow(10, 6 - 1), pow(10, 6) -1);
        $passwordDecoded=$input['password'];
        $input['password']=bcrypt($input['password']);

        $parent = Parentt::query()->update([
           'email' =>  $input->email,
            'password' => $input->password
        ]);


        $parent['token']=$accessToken = $parent->createToken('MyApp', ['parent'])->accessToken;
        $parent['password_decoded']=$passwordDecoded;





        return $this->apiResponse('Register success',$parent);

    }
 *
 */



    public function AdminRegister(Request $request): JsonResponse
    {

        $request->validate([
            'first_name' => ['required', 'max:55', 'string'],
            'last_name' => ['required', 'max:55', 'string'],

        ]);


        $input = $request->all();
        $input['email'] =   $request->first_name . rand(pow(10, 4 - 1), pow(10, 4) -1).'@schoolname.com';
        $input['password'] =  100 . rand(pow(10, 6 - 1), pow(10, 6) -1);
        $passwordDecoded=$input['password'];
        $input['password']=bcrypt($input['password']);



        $admin = Admin::query()->create($input);
        $accessToken = $admin->createToken('MyApp', ['admin'])->accessToken;
        $admin['password_decoded']=$passwordDecoded;
        $admin['token']=$accessToken;




        return $this->apiResponse('Register success',$admin);

    }



    public function TeacherRegister(Request $request): JsonResponse
    {

        $request->validate([
            'first_name' => ['required', 'max:55', 'string'],
            'last_name' => ['required', 'max:55', 'string'],
            'phone_number' => ['required','min:10', 'max:14', 'string'],
            'address'=>['required', 'string'],
            'details' => 'nullable',
            'classrooms' => ['required', 'array'],
            'subject_id' => ['required' , ' integer'],
        ]);





        $input = $request->all();
        $input['email'] =   $request->first_name . rand(pow(10, 4 - 1), pow(10, 4) -1).'@schoolname.com';
        $input['password'] =  400 . rand(pow(10, 6 - 1), pow(10, 6) -1);
        $passwordDecoded=$input['password'];
        $input['password']=bcrypt($input['password']);



        $teacher = Teacher::query()->create($input);
        $accessToken = $teacher->createToken('MyApp', ['teacher'])->accessToken;
        $teacher['password_decoded']=$passwordDecoded;
        $teacher['token']=$accessToken;

        foreach ($request->classrooms as $classroom_id){
            $data=[
                'teacher_id'=>$teacher->teacher_id,'classroom_id'=>$classroom_id
            ];
            TeacherClassroom::insert($data);

        }



        return $this->apiResponse('Register success',$teacher);

    }




    //.............................................................................................

    public function login(Request $request){
        $loginData = $request->validate([
            'email'=>'email|required',
            'password' => 'required'
        ]);
        $code="{$request->password[0]}{$request->password[1]}{$request->password[2]}";
        if($code==100)
            return $this->AdminLogin($request);
        else if($code==200)
            return $this->StudentLogin($request);
        else if($code==300)
            return $this->ParentLogin($request);
        else if($code==400)
            return $this->TeacherLogin($request);
        else return $this->apiResponse('email or password are incorrect',null,false);



    }


    public function StudentLogin(Request $request): JsonResponse
    {

        $loginData = $request->validate([
            'email' => 'required',
            'password' => 'required'
        ]);

        $credentials = request(['email', 'password']);


        if(auth()->guard('student')->attempt($request->only('email', 'password'))){;


           config(['auth.guards.api.provider' => 'student']);
          $student = Student::select('students.*')->find(auth()->guard('student')->user()['student_id']);

          $success =  $student;



            $accessToken =  $student->createToken('MyApp', ['student'])->accessToken;


            $parents=DB::table('parents')
            ->where('parent_id','=',$student->parent_id)
            ->first();

            $success['father_first_name']=$parents->father_first_name;
            $success['father_last_name']=$parents->father_last_name;
            $success['father_phone_number']=$parents->father_phone_number;
            $success['mother_first_name']=$parents->mother_first_name;
            $success['mother_last_name']=$parents->mother_last_name;
            $success['mother_phone_number']=$parents->mother_phone_number;



            $success['token'] = $accessToken;


            return $this->apiResponse('login successfully',$success);
        } else {
            return $this->apiResponse('Credentials did not match',null,false);

        }


    }


    public function AdminLogin(Request $request): JsonResponse
    {

        $loginData = $request->validate([
            'email'=>'email|required',
            'password' => 'required'
        ]);

        if(auth()->guard('admin')->attempt($request->only('email', 'password'))){

            config(['auth.guards.api.provider' => 'admin']);

            $admin = Admin::select('admins.*')->find(auth()->guard('admin')->user()['id']);
            $success =  $admin;
            $success['token'] =  $admin->createToken('MyApp',['admin'])->accessToken;

            return $this->apiResponse('login successfully',$success);

        }


        else if(auth()->guard('owner')->attempt($request->only('email', 'password')))
        {


            config(['auth.guards.api.provider' => 'owner']);

            $owner = Owner::select('owners.*')->find(auth()->guard('owner')->user()['id']);
            $success =  $owner;
            $success['token'] =  $owner->createToken('MyApp',['owner'])->accessToken;

            return $this->apiResponse('login successfully as owner',$success);

        }


        else {
            return $this->apiResponse('Credentials did not match',"null",false);

        }

    }



    public function OwnerLogin(Request $request): JsonResponse
    {

        $loginData = $request->validate([
            'email'=>'email|required',
            'password' => 'required'
        ]);

        if(auth()->guard('admin')->attempt($request->only('email', 'password'))){

            config(['auth.guards.api.provider' => 'admin']);

            $owner = Admin::select('owners.*')->find(auth()->guard('admin')->user()['id']);
            $success =  $owner;
            $success['token'] =  $owner->createToken('MyApp',['admin'])->accessToken;

            return $this->apiResponse('login successfully',$success);

        } else {

            return $this->apiResponse('Credentials did not match',"null",false);

        }

    }



    public function TeacherLogin(Request $request): JsonResponse
    {

        $loginData = $request->validate([
            'email'=>'email|required',
            'password' => 'required'
        ]);

        if(auth()->guard('teacher')->attempt($request->only('email', 'password'))){

            config(['auth.guards.api.provider' => 'teacher']);

            $teacher = Teacher::select('teachers.*')->find(auth()->guard('teacher')->user()['teacher_id']);
            $success =  $teacher;
            $success['token'] =  $teacher->createToken('MyApp',['teacher'])->accessToken;

            return $this->apiResponse('login successfully',$success);

        } else {

            return $this->apiResponse('Credentials did not match',"null",false);

        }

    }


    public function ParentLogin(Request $request): JsonResponse
    {

        $loginData = $request->validate([
            'email'=>'email|required',
            'password' => 'required'
        ]);

        if(auth()->guard('parent')->attempt($request->only('email', 'password'))){

            config(['auth.guards.api.provider' => 'parent']);

            $parent = Parentt::select('parents.*')->find(auth()->guard('parent')->user()['parent_id']);
            $success =  $parent;
            $success['token'] =  $parent->createToken('MyApp',['parent'])->accessToken;
//
            return $this->apiResponse('login successfully',$success);

        } else {

            return $this->apiResponse('Credentials did not match',"null",false);

        }

    }




    //.............................................................................................


    public function StudentLogout(): JsonResponse
    {
        Auth::guard('student-api')->User()->token()->revoke();
        return $this->apiResponse('logged out successfully');
    }


    public function AdminLogout(): JsonResponse
    {
        Auth::guard('admin-api')->user()->token()->revoke();
        return $this->apiResponse('logged out successfully');
    }


    public function TeacherLogout(): JsonResponse
    {
        Auth::guard('teacher-api')->User()->token()->revoke();
        return $this->apiResponse('logged out successfully');
    }


    public function ParentLogout(): JsonResponse
    {
        Auth::guard('parent-api')->User()->token()->revoke();
        return $this->apiResponse('logged out successfully');
    }





}
