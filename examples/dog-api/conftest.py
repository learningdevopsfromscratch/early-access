import pytest

def pytest_addoption(parser):
    parser.addoption(
        '--run-integration-tests',
        action='store_true',
        default=False,
        help='Run tests marked with the `integration_test` marker'
    )

def pytest_configure(config):
    config.addinivalue_line('markers', 'integration_test: mark test to run only when --run-integration-tests is passed')

def pytest_collection_modifyitems(config, items):
    if not config.getoption('--run-integration-tests'):
        skip_flagged = pytest.mark.skip(reason="Need --run-integration-tests options to run")
        for item in items:
            if 'integration_test' in item.keywords:
                item.add_marker(skip_flagged)
