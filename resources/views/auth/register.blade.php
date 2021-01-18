@extends( empty(Auth::user()) ? 'layout': (Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout'))))
@section('title','Registro')
    
@section('contenido')
<section class="container-fluid">
    <section class="row justify-content-center">


        <form method="POST" class="form-container" action="{{ route('register') }}">
            @csrf
            <x-jet-validation-errors class="mb-4" />
            <div class="mt-4">
                <x-jet-label for="email" value="{{ __('Email') }}" />
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
            </div>

            <div class="mt-4">
                <x-jet-label for="password" value="{{ __('Password') }}" />
                <x-jet-input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="new-password" />
            </div>

            <div class="mt-4">
                <x-jet-label for="password_confirmation" value="{{ __('Confirm Password') }}" />
                <x-jet-input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="new-password" />
            </div>
<div class="mt-4">
    <label for="">Empresa</label>
    <input type="radio" id="tipo_usuario_id" value="3" name="tipo_usuario_id"><br>
    <label for="">Estudiante</label>
    <input type="radio" id="tipo_usuario_id" value="2" name="tipo_usuario_id">
</div>     
<div class="flex items-center justify-end mt-4">
                <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('login') }}">
                    {{ __('¿Ya registrado?') }}
                </a>

                <x-jet-button class="btn-primary">
                    {{ __('Registrar') }}
                </x-jet-button>
            </div>
        </form>
    </section>
</section>

@endsection