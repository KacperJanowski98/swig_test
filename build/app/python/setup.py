from setuptools import find_packages, setup
from setuptools.dist import Distribution

class BinaryDistribution(Distribution):
  def is_pure(self):
    return False
  def has_ext_modules(self):
    return True

from setuptools.command.install import install
class InstallPlatlib(install):
    def finalize_options(self):
        install.finalize_options(self)
        self.install_lib=self.install_platlib

setup(
  name='pyapp',
  version='0.1.0',
  distclass=BinaryDistribution,
  cmdclass={'install': InstallPlatlib},
  packages=find_packages(),
  package_data={
  'pyapp':[
        '_pyapp_wrapper.pyd'
      ],
  },
  include_package_data=True,
)
