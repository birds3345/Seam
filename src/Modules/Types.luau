-- Author: iGottic

export type BaseState<T> = {
    Value : T,
}

export type Child = Instance | BaseState<Child> | {[unknown] : Child}

export type Value<T> = {
    Changed : RBXScriptSignal,
} & BaseState<T>

export type Spring<T> = {
    Velocity : T,
    Target : T
} & BaseState<T>

export type Tween<T> = {
    Target : T
} & BaseState<T>

export type Rendered<T> = BaseState<T> & {}
export type Computed<T> = {} & BaseState<T>
export type ForPairs<K, V> = {} & BaseState<{[K]: V}>

export type UsedAs<T> = BaseState<T> | T

export type Use = <T>(Value: UsedAs<T>) -> T

export type Scope = {
    New: (self: Scope, Class: string | Instance | {[string] : any?}, Properties: {[any] : any},From: any?) -> Instance,
    Rendered: <T>(self: Scope, Callback: () -> T?) -> Rendered<T>,
    Value: <T>(self: Scope, InitialValue: T) -> Value<T>,
    Spring: <T>(self: Scope, Value: UsedAs<T>, Speed: number, Dampening: number) -> Spring<T>,
    Tween: <T>(self: Scope, Value: UsedAs<T>, TweenInformation :TweenInfo) -> Tween<T>,
    Computed: <T>(self: Scope, Callback: (Use) -> T) -> Computed<T>,
    ForPairs: <KI, VI, KO, VO>(self: Scope, TrackedValue: Value<{[KO]: VO}>, Callback: (Use, KI, VI) -> ()) -> ForPairs<KO, VO>,
    OnChanged: <T>(self: Scope, Object: Instance | Value<T>, Callback: <U>(PropertyChanged: string, NewValue: U) -> ()) -> RBXScriptConnection,
    OnAttributeChanged: (self: Scope, AttributeName: string) -> (...any) -> RBXScriptConnection,
    OnEvent: (self: Scope, EventName: string) -> (...any) -> RBXScriptConnection,
    OnAttached: <T>(self: Scope, Object: T, Callback : (AttachedInstance: Instance) -> ()) -> RBXScriptConnection,

    InnerScope: (self: Scope, ScopedObjects: {[string]: any}?) -> Scope,
    AddObject: <T>(self: Scope, Object: T) -> (),
    RemoveObject: <T>(self: Scope, Object: T) -> (),
    Destroy: (self: Scope) -> (),
}

return nil
