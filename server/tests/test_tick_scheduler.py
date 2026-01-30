"""Tests for the TickScheduler utility."""

import asyncio

import pytest

from server.core.tick import TickScheduler


@pytest.mark.asyncio
async def test_tick_scheduler_runs_and_stops_quickly():
    calls = []

    def on_tick():
        calls.append(object())

    scheduler = TickScheduler(on_tick)
    scheduler.TICK_INTERVAL_S = 0.001  # speed up for tests

    await scheduler.start()
    await asyncio.sleep(0.006)
    await scheduler.stop()

    assert not scheduler._running
    assert scheduler._task is None or scheduler._task.cancelled()
    assert len(calls) >= 3  # multiple ticks occurred


@pytest.mark.asyncio
async def test_tick_scheduler_swallows_callback_errors():
    calls = {"count": 0}
    fail_once = {"raised": False}

    def on_tick():
        calls["count"] += 1
        if not fail_once["raised"]:
            fail_once["raised"] = True
            raise RuntimeError("boom")

    scheduler = TickScheduler(on_tick)
    scheduler.TICK_INTERVAL_S = 0.001

    await scheduler.start()
    await asyncio.sleep(0.004)
    await scheduler.stop()

    assert calls["count"] >= 2  # continued after exception
