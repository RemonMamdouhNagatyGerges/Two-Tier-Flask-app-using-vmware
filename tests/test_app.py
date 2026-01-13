def test_always_passes():
    """A simple test to verify the testing pipeline is working."""
    assert True

def test_app_import():
    """Verify that the Flask app can be imported without errors."""
    try:
        from run import app
        assert app is not None
    except ImportError:
        assert False, "Could not import the Flask app"