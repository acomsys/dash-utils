import { load } from './loader';
// import { IGreeter } from './native/greeter/greeter';
// import { IHello } from './native/hello/hello';

type IDashUtilsModule = {
    increment(): number;
    subobject: {
        decrement(): number;
    }
    new(): IDashUtilsModule;
}

export const DashUtils = load<IDashUtilsModule>('dash_utils');

// export const Greeter = dashUtils.Greeter;
// export const hello = dashUtils.hello;
