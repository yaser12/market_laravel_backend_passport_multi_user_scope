
<html>
<body>
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-body">
            <form action="{{route('image.upload.post')}}" method="POST" enctype="multipart/form-data">
                {{ csrf_field() }}
                <div class="row">
                    <div class="col-md-6">
                        <input type="file" name="image" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-success">Upload</button>
                    </div>
                </div>
            </form>
            @if ($message = Session::get('success'))
                <div class="alert alert-success alert-block">
                    {{--<button type="button" class="close" data-dismiss="alert">×</button>--}}
                    <p>Path:</p>
                </div>
                <strong>images/{{Session::get('image')}}</strong>
                @if ($target_input)
                   <script>

                       try{

                       parent. document.getElementById('{{$target_input}}').value='images/{{Session::get('image')}}';

                       }
                       catch (e) {
                           console.log(e);
                       }

                       try{


                           parent. document.getElementById('{{$target_img}}').src='images/{{Session::get('image')}}';

                       }
                       catch (e) {
console.log(e);
                       }

                   </script>
                @endif

                {{--<img src="images/{{Session::get('image')}}" width="100px" height="100px">--}}
            @elseif(isset(Request()->current_src))
                <img src="{{Request()->current_src}} " width="100px" height="100px">
            @endif
            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>Whoops!</strong> There were some problems with your input.
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
    </div>
</div>
</body>
</html>
