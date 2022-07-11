###
# 1. 데이터 로드 및 확인
akl_hourly_raw = read_csv("akl_weather_hourly_2016.csv")
akl_hourly_raw
# make_date()로 합침
akl_hourly  <- akl_hourly_raw  %>% 
  mutate(date = make_date(year = year, month = month, day = mday))

# date+time 컬럼 붙여서 string변수 만듦 -> 다시 POXITct변경
akl_hourly <- akl_hourly  %>% 
  mutate(
    datetime_string = paste(date, time, sep = "T"),
    datetime = ymd_hms(datetime_string)
  )

# 선택
akl_hourly %>% select(date, time, datetime)

# datetime에 따른 temp (연간 변화와 비교 가능)
ggplot(akl_hourly, aes(x = datetime, y = temperature)) +
  geom_line()

##################################
#라운드하기
#round_date(), ceiling_date(), floor_date()
# Create day_hour, datetime rounded down to hour
df %>% mutate(day_hour= floor_date(datetime, unit="hour"))