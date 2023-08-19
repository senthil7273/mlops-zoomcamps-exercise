import kfp
from kfp import dsl
from kfp.v2 import compiler
from kfp.v2.dsl import (component)
@component(
    base_image="python:3.9",
    output_component_file="train_model.yaml",
)

def train() -> str:
    return "trained model"