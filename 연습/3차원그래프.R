#로드
df<-read.csv("C:/Users/alsdu/Downloads/hotel2.csv")

#구조확인
str(df)

#팩터변경
for (j in c(1:2,9,13:14)){
  df[,j]<-as.factor(df[,j])
}

#엔에이 일단 그냥 지움
df$children<-ifelse(is.na(df_new$children),0, df_new$children)

#팔레트지정
mycolors <- c('royalblue1', 'darkcyan', 'oldlace')
df$color <- mycolors[ as.numeric(df$reserved_room_type ) ]



ind<-sample(1:nrow(df), nrow(df)*0.009, replace=F)
df_sample<-df[ind,]
str(df_sample)

# Plot
plot3d( 
  x=df_sample$`adults`, y=df_sample$`children`, z=df_sample$`babies`, 
  col = df$color, 
  type = 's', 
  radius = .1,
  xlab="A", ylab="C", zlab="B")

table(df$adults)
