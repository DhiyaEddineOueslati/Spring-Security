package tn.enig.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tn.enig.dao.IAdherant;
import tn.enig.dao.IEmprunt;
import tn.enig.dao.ILivre;
import tn.enig.model.Adherant;
import tn.enig.model.Emprunt;
import tn.enig.model.Livre;

import java.util.List;

@Controller
public class AppController {

    @Autowired
    private ILivre livreRepo;

    @Autowired
    private IAdherant adherantRepo;

    @Autowired
    private IEmprunt empruntRepo;

    @GetMapping("/livres")
    public String afficherLivres(Model model) {
        List<Livre> livres = livreRepo.findAll();
        model.addAttribute("livres", livres);
        return "listeLivres";
    }

    @GetMapping("/adherants")
    public String afficherAdherants(Model model) {
        List<Adherant> adherants = adherantRepo.findAll();
        model.addAttribute("adherants", adherants);
        return "listeAdherants";
    }

    @GetMapping("/emprunts/adherant/{id}")
    public String afficherEmpruntsParAdherant(@PathVariable Long id, Model model) {
        List<Emprunt> emprunts = empruntRepo.findByAdherantId(id);
        model.addAttribute("emprunts", emprunts);
        return "listeEmpruntsAdherant";
    }

    @GetMapping("/emprunts/livre/{id}")
    public String afficherEmpruntsParLivre(@PathVariable Long id, Model model) {
        List<Emprunt> emprunts = empruntRepo.findByLivreId(id);
        model.addAttribute("emprunts", emprunts);
        return "listeEmpruntsLivre";
    }

    @GetMapping("/emprunts/ajout")
    public String ajouterEmpruntForm(Model model) {
        model.addAttribute("livres", livreRepo.findAll());
        model.addAttribute("adherants", adherantRepo.findAll());
        return "ajoutEmprunt";
    }

    @PostMapping("/emprunts/ajout")
    public String ajouterEmprunt(@ModelAttribute Emprunt emprunt) {
        empruntRepo.save(emprunt);
        Long adherantId = emprunt.getAdherant().getId(); 
        return "redirect:/emprunts/adherant/" + adherantId;
    }


    @GetMapping("/livres/ajout")
    public String ajouterLivreForm() {
        return "ajoutLivre";
    }

    @PostMapping("/livres/ajout")
    public String ajouterLivre(@ModelAttribute Livre livre) {
        livreRepo.save(livre);
        return "redirect:/livres";
    }
    @GetMapping("/adherants/ajout")
    public String ajouterAdherantForm() {
        return "ajoutAdherant";
    }

    @PostMapping("/adherants/ajout")
    public String ajouterAdherant(@ModelAttribute Adherant adherant) {
        adherantRepo.save(adherant);
        return "redirect:/adherants";
    }
    
   
   
    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public String f4(@RequestParam(value = "error", required = false) String error, Model model) {
        String msg = null;
        if (error != null) {
            msg = "Username or Password is incorrect !!";
        }
        model.addAttribute("errorMessage", msg); 
        return "login"; 
    }
 
    @GetMapping(value="/Page403")
    public String get55(Model model) {
    	return "PageErreur";
    }
    
}
