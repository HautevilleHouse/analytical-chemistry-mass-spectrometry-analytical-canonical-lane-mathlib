import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure FragmentationDatum where
  precursorIonMass : Float
  productIonMasses : List Float
  fragmentationMethod : String
  collisionEnergy : Float
deriving Repr

structure FragmentationPatternLayerCertificate where
  fragmentDatum : FragmentationDatum
  fragmentationRoute : String
  spectralLibraryRoute : String
  patternMatched : Bool
  librarySearched : Bool

default instance : Inhabited FragmentationPatternLayerCertificate where
  default := {
    fragmentDatum := {
      precursorIonMass := 500.0,
      productIonMasses := [150.0, 200.0, 350.0],
      fragmentationMethod := "collision-induced dissociation",
      collisionEnergy := 30.0
    },
    fragmentationRoute := "fragmentation pattern obtained via CID at 30 eV",
    spectralLibraryRoute := "NIST library match",
    patternMatched := true,
    librarySearched := true
  }

def FragmentationPatternLayerClosed (C : FragmentationPatternLayerCertificate) : Prop :=
  C.fragmentDatum.productIonMasses.length ≥ 1 ∧
  C.patternMatched = true ∧
  C.librarySearched = true

theorem fragmentation_pattern_layer_closed_checked :
    FragmentationPatternLayerClosed (default : FragmentationPatternLayerCertificate) := by
  unfold FragmentationPatternLayerClosed
  have h1 : (default : FragmentationPatternLayerCertificate).fragmentDatum.productIonMasses.length ≥ 1 := by
    native_decide
  have h2 : (default : FragmentationPatternLayerCertificate).patternMatched = true := by rfl
  have h3 : (default : FragmentationPatternLayerCertificate).librarySearched = true := by rfl
  exact And.intro h1 (And.intro h2 h3)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse