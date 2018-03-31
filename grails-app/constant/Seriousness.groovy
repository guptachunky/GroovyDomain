package constant

enum Seriousness {

    Serious, VerySerious, Casual

    static Seriousness stringSeriousness(String seriousness) {
        if (seriousness.toLowerCase().equals("serious")) {
            return Seriousness.Serious
        } else if (seriousness.toLowerCase().equals("veryserious")) {
            return Seriousness.VerySerious
        } else
            return Seriousness.Casual

    }
}


