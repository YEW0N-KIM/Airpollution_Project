import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Login from './page/Login';
import Main from './page/Main';

function App() {
  return (
    <div className="App">
     
      <BrowserRouter>
        <Routes>
            <Route path={"/"} element={< Main/>}></Route>
            <Route path={"/user/login"} element={< Login/>}></Route>
        </Routes>
      </BrowserRouter>
      
      </div>
  );
}

export default App;
