import '../css/Header.css';
import logo from '../img/logo.jpg'

function Header() {
  return (
    <header>
      <div className="header_container">
        <div className="logo">
          <a href=""><img src={logo} alt="우리동네아파트 로고" /></a>
        </div>

        <div className="right before">
          <div className="login"><a>로그인</a></div>
          <div className="signin"><a>회원가입</a></div>
        </div>
        
        <div className="right after">
          <div className="logout"><a>로그아웃</a></div>
          <div className="mypage"><a>마이페이지</a></div>
        </div>
      </div>
      
    </header>
  );
}

export default Header;
