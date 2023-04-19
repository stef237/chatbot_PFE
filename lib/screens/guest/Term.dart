import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const TermScreen({super.key, required this.onChangedStep});

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  late ScrollController _scrollController;
  bool _termsReaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() => _termsReaded = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text(
              'Terms & Conditions',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () => widget.onChangedStep(0),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                              "Conditions Générales de Vente\n Les présentes Conditions Générales de Vente régissent l’utilisation des services proposés sur le site internet www.ChatGPTfrance.net (ci-après désigné « le Site ») par la société CG FRANCE (ci-après désignée « nous » ou « notre »).\n En utilisant les services proposés sur le Site, vous acceptez pleinement et sans réserve les présentes Conditions Générales de Vente. Si vous n’êtes pas d’accord avec ces Conditions Générales de Vente, vous ne devez pas utiliser les services proposés sur le Site.\n Description des services proposés\n Le Site propose des articles informationnels gratuitement ainsi que 3 formules d’abonnement payant pour avoir accès à un service en ligne de type assistant personnel basé sur l’intelligence artificielle. Les formules d’abonnement sont les suivantes :\n Abonnement BASIC : Accès aux fonctionnalités de base de l’assistant personnel.\nAbonnement PREMIUM : Accès aux fonctionnalités de base de l’assistant personnel, ainsi qu’à un service de forum pour poser des questions. Le prestataire de paiement est la société STRIPE.\nAbonnement VIP/PRO : Accès à toutes les fonctionnalités de l’assistant personnel, ainsi qu’à un service de forum pour poser des questions et un chat en ligne pour obtenir de l’aide en cas de problème. Le prestataire de paiement est la société STRIPE.\nLes abonnements sont proposés pour une durée déterminée et renouvelables tacitement pour la même durée sauf si l’abonné demande la résiliation de son abonnement par le biais du lien « Mon Abonnement » en bas du site.\n\nPrix et paiement\n\nLes prix des abonnements sont indiqués sur le Site et peuvent être modifiés à tout moment par CG FRANCE. Le paiement des abonnements se fait par carte bancaire ou par tout autre moyen de paiement proposé sur le Site. Les paiements sont sécurisés et gérés par la société STRIPE.\n\n\nNous pouvons modifier nos prix en publiant un avis sur votre compte et/ou sur notre site web. Les augmentations de prix seront effectives 14 jours après leur publication, sauf pour les augmentations effectuées pour des raisons légales ou pour les services bêta (tels que définis dans nos conditions de service), qui seront effectives immédiatement.\n\nToute modification de prix s’appliquera aux frais facturés sur votre compte immédiatement après la date d’entrée en vigueur des modifications.\n\nDurée et résiliation de l’abonnement\nLa durée de l’abonnement est déterminée par la formule d’abonnement choisie par l’abonné. Les abonnements sont renouvelables tacitement pour la même durée sauf si l’abonné demande la résiliation de son abonnement avant la date de renouvellement.\n\nL’abonné peut demander la résiliation de son abonnement à tout moment en cliquant sur le lien de désabonnement disponible en bas du site. La résiliation prendra effet à la fin de la période d’abonnement en cours.\n\n\nResponsabilité\n\nNous ne pouvons être tenus responsables en cas de dysfonctionnement du Site ou des services proposés en raison de circonstances indépendantes de notre volonté, notamment en cas de force majeure, de perturbations ou d’interruptions du réseau internet.\n \nNous ne pouvons être tenus responsables des informations fournies par l’assistant personnel qui ne sont pas exactes ou qui ne répondent pas aux attentes de l’abonné.\n \nPropriété intellectuelle\n\nLe Site ainsi que les services proposés sont protégés par les lois sur la propriété intellectuelle. Toute reproduction ou représentation, totale ou partielle, du Site ou des services proposés est interdite sauf autorisation expresse de notre part.\n \nDonnées personnelles\n\nNous nous engageons à respecter la vie privée de nos utilisateurs et à protéger leurs données personnelles conformément à la législation en vigueur.\n \nLes données personnelles collectées sont nécessaires à la gestion des abonnements et à la fourniture des services proposés sur le Site. Elles peuvent également être utilisées à des fins statistiques et marketing, sauf si l’utilisateur s’y oppose en cochant la case prévue à cet effet.\n \nLes données personnelles collectées sont conservées pendant la durée de l’abonnement et sont supprimées à l’expiration de celui-ci.\n\nConformément à la législation en vigueur, l’utilisateur dispose d’un droit d’accès, de rectification, de suppression et d’opposition aux données personnelles le concernant. Ces droits peuvent être exercés en écrivant à l’adresse indiquée sur le Site.\n\nModification des Conditions Générales de Vente\nNous nous réservons le droit de modifier les présentes Conditions Générales de Vente à tout moment et sans préavis. Les modifications seront applicables à compter de leur mise en ligne sur le Site.\nIntégralité de l’accord\nLes présentes Conditions Générales de Vente constituent l’intégralité de l’accord entre vous et nous en ce qui concerne l’utilisation du Site et des services proposés. Elles annulent et remplacent toutes les communications et propositions antérieures ou contemporaines, écrites ou verbales, relatives à cet objet.\n \nContact\nPour toute question ou réclamation concernant les présentes Conditions Générales de Vente, vous pouvez nous contacter à l’adresse indiquée sur le Site.")
                        ],
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0)),
                    ),
                    onPressed:
                        !_termsReaded ? null : () => widget.onChangedStep(2),
                    child: Text(
                      'Accepter & Continuer'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
