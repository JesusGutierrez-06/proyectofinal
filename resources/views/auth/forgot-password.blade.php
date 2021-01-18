{{-- <x-guest-layout>
    <x-jet-authentication-card>
        <x-slot name="logo">
            <x-jet-authentication-card-logo />
        </x-slot> --}}
        @extends( empty(Auth::user()) ? 'layout': (Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
        'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout'))))
        @section('title','Home')
            
        @section('contenido')
        <section class="container-fluid">
            <section class="row justify-content-center">
    

        @if (session('status'))
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ session('status') }}
            </div>
        @endif


        <form method="POST" class="form-container" action="{{ route('password.email') }}">
            @csrf

            <div class="mb-4 text-sm text-gray-600">
                {{ __('¿Olvidaste tu contraseña? No hay problema. Simplemente díganos su dirección de correo electrónico y le enviaremos un enlace para restablecer la contraseña que le permitirá elegir una nueva.') }}
            </div>
            <x-jet-validation-errors class="mb-4" />
            <div class="block">
                <x-jet-label for="email" value="{{ __('Email') }}" />
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-jet-button class="btn-primary">
                    {{ __('Email Enlace de restablecimiento de contraseña') }}
                </x-jet-button>
            </div>
        </form>
    {{-- </x-jet-authentication-card>
</x-guest-layout> --}}
</section>
</section>

@endsection
