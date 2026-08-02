package sn.supdeco.modele;

public class Cours {
    private int id;
    private String code;
    private String intitule;
    private int credits;
    private String enseignant;

    // Constructeurs
    public Cours() {}

    public Cours(String code, String intitule, int credits, String enseignant) {
        this.code = code;
        this.intitule = intitule;
        this.credits = credits;
        this.enseignant = enseignant;
    }

    public Cours(int id, String code, String intitule, int credits, String enseignant) {
        this.id = id;
        this.code = code;
        this.intitule = intitule;
        this.credits = credits;
        this.enseignant = enseignant;
    }

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getIntitule() { return intitule; }
    public void setIntitule(String intitule) { this.intitule = intitule; }

    public int getCredits() { return credits; }
    public void setCredits(int credits) { this.credits = credits; }

    public String getEnseignant() { return enseignant; }
    public void setEnseignant(String enseignant) { this.enseignant = enseignant; }

    @Override
    public String toString() {
        return "Cours{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", intitule='" + intitule + '\'' +
                ", credits=" + credits +
                ", enseignant='" + enseignant + '\'' +
                '}';
    }
}