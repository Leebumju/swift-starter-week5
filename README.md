# swift-starter-week5

## Step 1: 야곰 엔터 오디션
-----------

### Person 클래스를 정의합니다.

- 저장프로퍼티로 이름(name)을 선언합니다.
- 저장프로퍼티로 키(height)를 선언합니다.

<br>

### Level 열거형을 정의합니다.

- A, B, C 등급의 case를 가집니다.
<br>

### Talent 프로토콜을 정의합니다.

- singing, dancing, acting 라는 3개의 Level 타입의 프로퍼티를 생성합니다.
<br>

### BadPersonality 프로토콜을 정의합니다.

- frequancyOfCursing라는 Level 타입 프로퍼티를 정의합니다.
<br>

### 오디션을 담당해줄 AuditionManager 구조체를 정의합니다.

- [Person] 타입의 totalApplicantsList를 프로퍼티로 가집니다.

- [Person] 타입의 passedApplicantsList 프로퍼티를 가집니다. (이 프로퍼티의 기본값은 [] 빈 배열 입니다.)

- 지원자 리스트에서 합격자를 골라내는 cast() 메서드를 정의합니다.

- Talent를 채택하고 있는 지원자 중에 노래, 춤, 연기의 레벨이 하나 이상 A 레벨인 경우 합격자로 분류됩니다.
- 그러나 실력이 뛰어나도 인성이 좋지않은 경우 합격 명단에서 제외됩니다.
- 합격자를 출력하는 announcePassedApplicants 메서드를 구현합니다.
<br>
