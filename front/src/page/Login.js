import '../css/Login.css';
import Header from '../component/Header';

function Login() {
  return (
    <div className="page">
      <Header/>
      <div className="container">
        <div className="title">로그인</div>

        <form action="">
          <input type="text" placeholder="아이디"/>
          <input type="password" placeholder="비밀번호"/>
          <input type="button" value="로그인" />
        </form>

        <div className="tab">
          <div className="idSave">
            <input type="checkbox" name="" id="" /> 아이디 저장
          </div>
          <div className="search">
            <div className="idSearch"><a href="">아이디 찾기</a></div>
            <div className="pwSearch"><a href="">비밀번호 찾기</a></div>
          </div>
        </div>

        <div className="short">
        <div className="google api">
            <a href=""><img src="" alt="" /></a>
          </div>
          <div className="kakao api">
            <a href=""><img src="" alt="" /></a>
          </div>
          <div className="naver api">
            <a href=""><img src="" alt="" /></a>
          </div>
        </div>
        <div className="sign">우리 동네 아파트 찾기, <a href="">가입하기</a> </div>
       </div>
    </div>
  
  );
}

export default Login;
