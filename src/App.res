%%raw(`import "./style.css"`)

module Menu = {
  let go = (e, path) => {
    e->ReactEvent.Mouse.preventDefault
    RescriptReactRouter.push(path)
  }

  module Link = {
    @react.component
    let make = (~children, ~href) => {
      let {path} = RescriptReactRouter.useUrl()

      let textColor = switch path {
      | list{"tailwind"} if href == "/tailwind" => "text-blue-500 hover:text-blue-600"
      | list{"vite"} if href == "/vite" => "text-purple-500 hover:text-purple-600"
      | list{} if href == "/" => "text-red-500 hover:text-red-600"
      | _ => "text-gray-800 hover:text-gray-600"
      }

      <a className={"text-xl transition-colors " ++ textColor} href onClick={e => go(e, href)}>
        {React.string(children)}
      </a>
    }
  }
  @react.component
  let make = () => {
    <div className="flex gap-20 items-center justify-center p-16 h-16 fixed w-full">
      <Link href="/"> "Rescript" </Link>
      <Link href="/tailwind"> "Tailwind" </Link>
      <Link href="/vite"> "Vite" </Link>
    </div>
  }
}

type library = Rescript | Tailwind | Vite

let libraryToString = lib => {
  switch lib {
  | Rescript => "Rescript"
  | Tailwind => "Tailwind"
  | Vite => "Vite"
  }
}

let libraryToColorLink = lib =>
  switch lib {
  | Rescript => "#E84F4F"
  | Tailwind => "#06B6D4"
  | Vite => "#BD34FE"
  }

module Block = {
  @react.component
  let make = (~library) => {
    let docLink = switch library {
    | Rescript => "https://rescript-lang.org/docs/manual/latest/introduction"
    | Tailwind => "https://tailwindcss.com/docs"
    | Vite => "https://vitejs.dev/guide/features.html"
    }

    let libraryName = library->libraryToString
    let colorLink = library->libraryToColorLink

    <div className="pt-24 h-screen flex justify-center items-center">
      <div className="flex flex-col ">
        {switch library {
        | Rescript => <Logo.Rescript />
        | Tailwind => <Logo.Tailwind />
        | Vite => <Logo.Vite />
        }}
        <div className="flex flex-col items-center p-8">
          <h1 className="text-3xl text-gray-600 mb-4"> {j`Hello $libraryName!`->React.string} </h1>
          <a
            className="text-xl"
            href=docLink
            target="_blank"
            style={ReactDOM.Style.make(~color=colorLink, ())}>
            {React.string("Documentation")}
          </a>
        </div>
      </div>
    </div>
  }
}

module Rescript = {
  @react.component
  let make = () => {
    <Block library=Rescript />
  }
}

module Tailwind = {
  @react.component
  let make = () => {
    <Block library=Tailwind />
  }
}

module Vite = {
  @react.component
  let make = () => {
    <Block library=Vite />
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
