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
