package constant

enum Visibility {

    Public, Private

    static Visibility stringEnum(String visibility) {
        if (visibility.toLowerCase() == "public") {
            return Visibility.Public
        } else {
            return Visibility.Private
        }
    }
}
