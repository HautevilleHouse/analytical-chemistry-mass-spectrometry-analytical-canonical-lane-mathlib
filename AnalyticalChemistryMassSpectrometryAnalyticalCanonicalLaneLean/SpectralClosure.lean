import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryAdmissibleClass
import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.FragmentationBridge

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

def ConstrainedMSClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ms_closure (A : AdmissibleClass) :
    ConstrainedMSClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse