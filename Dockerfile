FROM frolvlad/alpine-java:jdk8-slim AS builder

RUN echo 'public class Main { public static void main(String[] args) { System.out.println("Hello World"); } }' > Main.java
RUN javac Main.java

FROM frolvlad/alpine-java:jre8-slim
COPY --from=builder /Main.class /

CMD ["java", "Main"]
