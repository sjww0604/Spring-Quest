package kr.sparta.practical2_starter;

import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MbtiEmojiService {
    private static final Map<String, String> MBTI_EMOJI_MAP = Map.ofEntries(
            Map.entry("ISTJ","📘"), Map.entry("ISFJ","🧹"),
            Map.entry("INFJ","🧪"), Map.entry("INTJ","♟️"),
            Map.entry("ISTP","🛠️"), Map.entry("ISFP","🎨"),
            Map.entry("INFP","🌸"), Map.entry("INTP","🔬"),
            Map.entry("ESTP","🏍️"), Map.entry("ESFP","🎤"),
            Map.entry("ENFP","🔥"), Map.entry("ENTP","🧠"),
            Map.entry("ESTJ","📋"), Map.entry("ESFJ","🤝"),
            Map.entry("ENFJ","⭐"), Map.entry("ENTJ","👑")
    );

    public String emojiFor(String mbti) {
        if (mbti == null) return "";
        return MBTI_EMOJI_MAP.getOrDefault(mbti.toUpperCase(), "");
    }
}
