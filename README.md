# SynthAct: Synthetic Data for Human Action Recognition

## Introduction
SynthAct offers a novel approach to generating synthetic data to enhance human action recognition capabilities, especially in privacy-sensitive environments like household settings. Using advanced 3D pose estimation technologies, SynthAct creates realistic and extensive datasets that significantly reduce the need for real-world data collection.

## Datasets

SynthAct introduces two significant datasets:

- **AMARV (Archive Of Motion Capture As Rendered Videos)**: Consists of over 800,000 multi-view action clips for extensive pretraining and fine-tuning with the BABEL label dataset. Due to the significant compute resources required to generate this dataset, we offer the pre-computed dataset to be downloaded. Please see the download section.
- **Synthetic Smarthome**: Designed to mirror real-world household activities from Toyota Smarthome, supporting training models in privacy-sensitive areas. For this dataset we provide the instruction to recomputer the dataset based on the original Toyota Smarthome dataset, due to licensing. We will publish the pre-computed data in the future, given the agreement of the Toyota Smarthome license holder.
- **NTU RGB+D**: For this dataset we provide the instruction to recomputer the dataset based on the original Toyota Smarthome dataset, due to licensing. We will publish the pre-computed data in the future, given the agreement of the Toyota Smarthome license holder.

Each dataset comes with diverse modalities, including RGB videos, depth maps, and more, providing a rich dataset for varied research and application needs.

### Download Links
- [AMARV Dataset Download](https://s.kit.edu/amarv)

### Dataset Password Access
While we release the **added value** of our contribution of AMARV under the MIT License, AMARV is based on the AMASS dataset and you need to additionally accept the license terms of AMASS to make use of AMARV. In order to ensure that each user accepted the AMASS license terms, we require you to download the SMPL-H version of AMASS, first. Use the provided bash script to generate a password for AMARV. This script calculates the MD5 checksum of selected files from each folder, ensuring that you have downloaded and have access to the complete AMASS dataset (which implies agreeing to their terms of service) before using AMARV.

#### How to Use the Password Script

1. Download the password script from [this link](amarv/generate_password.sh).
2. Run the script in your AMASS dataset directory (depending on your file structure you might have to adapt the paths in the script):
   ```bash
   bash ./generate_password.sh
   ```
3. Use the generated password to unlock the dataset files.

## Citation

If SynthAct contributes to your research, please cite our work:

```bibtex
@inproceedings{schneider2024synthact,
  title={SynthAct: Towards Generalizable Human Action Recognition based on Synthetic Data},
  author={Schneider, David and Keller, Marco and Zhong, Zeyun and Peng, Kunyu and Roitberg, Alina and Beyerer, Juergen and Stiefelhagen, Rainer},
  booktitle={2024 IEEE International Conference on Robotics and Automation (ICRA)},
  year={2024},
  organization={IEEE}
}
```

## Data generator
The SynthAct data generator will be released shortly.

## License

The added value of this project is released under the MIT License - details can be found in the [LICENSE.md](LICENSE.md) file.
This project is based on motion data provided by AMASS and their respective license applies without change.

## Acknowledgments

This work was supported by the JuBot project which was made possible by funding from the Carl-Zeiss-Foundation and performed on the HoreKa supercomputer funded by the Ministry of Science, Research and the Arts Baden-Württemberg and by the Federal Ministry of Education and Research. A. Roitberg is supported by the Deutsche Forschungsgemeinschaft (DFG) under Germany’s Excellence Strategy - EXC 2075 (SimTech).
