import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Login from './page/Login';
import Main from './page/Main';
import Signin from './page/Signin';

function App() {
  return (
    <div className="App">
     
      <BrowserRouter>
        <Routes>
            <Route path={"/"} element={< Main/>}></Route>
            <Route path={"/user/login"} element={< Login/>}></Route>
            <Route path={"/user/signin"} element={< Signin/>}></Route>
        </Routes>
      </BrowserRouter>
      
      </div>
  );
}

export default App;
