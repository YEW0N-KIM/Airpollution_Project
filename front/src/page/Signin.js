import Header from '../component/Header';
import '../css/Signin.css'

function Signin() {
  return (  
    <div className="page">
      <Header/>
      <div className="container">
        
        {/* 제목 */}
        <div className="title">회원가입</div>

        {/* 목차 */}
        <div className="index">
          <div className="agree">
            <div className="agree_Img">
              <img src="" alt="" />
            </div>
            <div className="agree_Content">약관 동의</div>
          </div>

          <div className="info">
            <div className="info_Img">
              <img src="" alt="" />
            </div>
            <div className="info_Content">정보 입력</div>
          </div>

          <div className="complete">
            <div className="complete_Img">
              <img src="" alt="" />
            </div>
            <div className="complete_Content">가입 완료</div>
          </div>
        </div>

        {/* 필수 입력정보 */}
       

          <form action="">
            <div className="ess_info">
              <div className="ess_header">
                <div className="ess_title">필수 입력정보</div>
                <div className="ess_content">필수 항목이므로 반드시 입력해주시길 바랍니다.</div>
              </div>
              <div className="ess_idform">
                <div className="ess_id">
                  아이디 <input type="text" placeholder='아이디'/>
                  <button> 중복확인 </button>
                </div>
                
                <div className="ess_pw">
                  비밀번호 <input type="text" placeholder='비밀번호'/>
                  <input type="text" placeholder='비밀번호 확인'/>                
                </div>
              </div>

              <div className="basicform">
                <div className="ess_name">
                  이름<input type="text" placeholder='이름'/> 
                </div>
                <div className="ess_tel">
                  전화번호 <input type="tel" name="" id="" placeholder='전화번호'/>
                </div>
                <div className="ess_birth">
                  생년월일 <input type="date" name="" id="" placeholder='생년월일' />
                </div>
                <div className="ess_email">
                  이메일 <input type="email" name="" id="" />
                </div>
                <div className='ess_gender'>
                  성별 <input type="checkbox" name="" id="" /> 여성 <input type="checkbox" name="" id="" /> 남성
                </div>
              </div>
            </div>

            <div className="option_info">
              <div className="option_header">
                <div className="option_title">선택입력정보</div>
              </div>


            </div>
            <input type="button" value="가입" />
            <input type="reset" value="취소" />
          </form>

        
      </div>
    </div>
  );
}

export default Signin;
