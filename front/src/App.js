import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Login from './page/Login';
import Main from './page/Main';
import Signup from './page/Signup';

function App() {
  return (
    <div className="App">
     
      <BrowserRouter>
        <Routes>
            <Route path={"/"} element={< Main/>}></Route>
            <Route path={"/user/login"} element={< Login/>}></Route>
            <Route path={"/user/signup"} element={< Signup/>}></Route>
        </Routes>
      </BrowserRouter>
      
      </div>
  );
}

export default App;
