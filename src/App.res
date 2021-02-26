%%raw(`import "./style.css"`)

open Library

module Rescript = {
  @react.component
  let make = () => {
    <View library=Rescript />
  }
}

module Tailwind = {
  @react.component
  let make = () => {
    <View library=Tailwind />
  }
}

module Vite = {
  @react.component
  let make = () => {
    <View library=Vite />
  }
}

@react.component
let make = () => {
  let {path} = RescriptReactRouter.useUrl()

  <div>
    <Menu />
    {switch path {
    | list{"tailwind"} => <Tailwind />
    | list{"vite"} => <Vite />
    | _ => <Rescript />
    }}
  </div>
}
