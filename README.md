# cmp-live-templates

Compose Multiplatform(CMP) 개발 시 반복되는 보일러플레이트 코드를 빠르게 작성하기 위한 Android Studio Live Templates 모음입니다.(🚧 Work In Progress)

---

## 포함된 템플릿

| 단축어 (Abbreviation) | 설명 | 사용 위치 | 생성 코드 |
| :--- | :--- | :--- | :--- |
| `comp` | Composable 함수 기본 골격 생성 | Kotlin 전반(최상위·클래스·함수/블록 내부) | `@Composable fun Name(modifier: Modifier = Modifier)` |
| `prev` | `@Preview` 함수 생성 (파일명 자동 추론) | 파일 최상위 | `@Preview @Composable private fun FileNamePreview()` |
| `rem` | `remember` 상태 블록 생성 | 함수 내부 | `val state = remember() { }` |
| `le` | `LaunchedEffect` 사이드 이펙트 블록 생성 | 함수 내부 | `LaunchedEffect(Unit) { }` |

### 생성 코드 미리보기

#### `comp`
```kotlin
@Composable
fun Component(
    modifier: Modifier = Modifier,
) {
    
}
```

#### `prev`
```kotlin
@Preview
@Composable
private fun ComponentPreview() {
    MaterialTheme {
        
    }
}
```

---

## 설치 방법

### 1. 저장소 클론
```bash
git clone https://github.com/smsdia/cmp-live-templates.git
cd cmp-live-templates
```

### 2. OS별 설치 스크립트 실행

#### macOS / Linux
```bash
chmod +x cmp-live-templates-install.sh
./cmp-live-templates-install.sh
```

#### Windows (PowerShell)
```powershell
powershell -ExecutionPolicy Bypass -File .\cmp-live-templates-install.ps1
```

> **참고:** 스크립트 실행 전 Android Studio가 최소 1회 이상 실행되어 설정 디렉터리가 생성되어 있어야 합니다.

### 3. Android Studio 재시작 및 확인
1. 스크립트 실행 완료 후 **Android Studio를 완전히 종료했다가 다시 실행**합니다.
2. `Settings` (macOS: `Cmd + ,` / Windows: `Ctrl + Alt + S`) → `Editor` → `Live Templates` 메뉴로 이동합니다.
3. 목록에서 **`CMP`** 그룹과 하위 템플릿(`comp`, `prev`, `rem`, `le`)이 정상 등록되었는지 확인합니다.

---

## 수동 설치 방법

스크립트를 사용하지 않고 직접 파일을 복사하려면 아래 경로에 `templates/CMP.xml` 파일을 넣어주세요.

* **macOS:** `~/Library/Application Support/Google/AndroidStudio<버전>/templates/`
* **Windows:** `%APPDATA%\Google\AndroidStudio<버전>\templates\`
* **Linux:** `~/.config/Google/AndroidStudio<버전>/templates/`

---

## 사용 및 커스터마이징 팁

* **테마 변경 (`prev`):** `prev` 입력 후 `Tab` 키를 누르면 함수명(`$NAME$`)에 이어 테마명(`$THEME$`)으로 커서가 이동합니다. 기본값인 `MaterialTheme` 대신 프로젝트에서 사용하는 테마(예: `AppTheme`)를 바로 입력해 사용할 수 있습니다.
* **CMP `@Preview` 패키지 선택:** Compose Multiplatform 환경에서는 프로젝트 구성에 따라 `org.jetbrains.compose.ui.tooling.preview.Preview` 또는 `androidx.compose.ui.tooling.preview.Preview` 중 프로젝트에 맞는 패키지를 import 해주세요.