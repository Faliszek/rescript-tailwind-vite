@react.component
let make = (~library) => {
    open Library
    
  let docLink = switch library {
  | Rescript => "https://rescript-lang.org/docs/manual/latest/introduction"
  | Tailwind => "https://tailwindcss.com/docs"
  | Vite => "https://vitejs.dev/guide/features.html"
  }

  let libraryName = library->Library.toString
  let colorLink = library->Library.toColorLink

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
