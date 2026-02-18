/*  script.js
    각종 javascript 모듈을 작성한다.
*/
// 로그인 validate 체크
const checkLogin = (params) => {
  // 서비스코드는 5000번(테스트앱)만 허용한다.
  if (params.sid.value === '') {
    alert('서비스코드를 입력해주세요.');
    params.sid.focus();
    return false;
  } else if (params.sid.value !== '5000') {
    alert('서비스코드가 잘못 입력 되었습니다.');
    params.sid.value = '';
    params.sid.focus();
    return false;
  }

  // 아이디 공백체크
  if (params.uid.value === '') {
    alert('ID를 입력해주세요.');
    params.uid.focus();
    return false;
  }

  // 비밀번호 공백체크
  if (params.pwd.value === '') {
    alert('암호를 입력해주세요.');
    params.pwd.focus();
    return false;
  }

  return true;
};

// 엔터키 입력 시 지정하는 textfield로 이동함 (onkeydown=moveFucus('이동할 textfield의 name이름'))
const moveFucus = (next) => {
  const ec = event.keyCode;

  // 엔터인 경우
  if (ec === 13) {
    document.getElementById(next).focus();
  }
};
