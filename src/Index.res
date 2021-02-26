switch ReactDOM.querySelector("#app") {
| Some(el) => ReactDOM.render(<App />, el)
| None => Js.log("Not initialized! Container not found")
}
