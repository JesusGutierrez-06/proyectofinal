{{-- <x-guest-layout>
    <x-jet-authentication-card>
        <x-slot name="logo">
            <x-jet-authentication-card-logo />
        </x-slot> --}}
        @extends( empty(Auth::user()) ? 'layout': (Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
        'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout'))))
        @section('title','Restablecer')
            
        @section('contenido')
        <section class="container-fluid">
            <section class="row justify-content-center">


        <form method="POST" class="form-container" action="{{ route('password.update') }}">
            @csrf
            <x-jet-validation-errors class="mb-4" />

            <input type="hidden" name="token" value="{{ $request->route('token') }}">

            <div class="block">
                <x-jet-label for="email" value="{{ __('Email') }}" /> <br>
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email', $request->email)" required autofocus />
            </div>

            <div class="mt-4">
                <x-jet-label for="password" value="{{ __('Password') }}" /><br>
                <x-jet-input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="new-password" />
            </div>

            <div class="mt-4">
                <x-jet-label for="password_confirmation" value="{{ __('Confirm Password') }}" /><br>
                <x-jet-input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="new-password" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-jet-button class="btn-primary">
                    {{ __('Reset Password') }}
                </x-jet-button>
            </div>
        </form>
    {{-- </x-jet-authentication-card>
</x-guest-layout> --}}
</section>
</section>
@endsection
