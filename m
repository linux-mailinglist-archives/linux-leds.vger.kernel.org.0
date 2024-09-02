Return-Path: <linux-leds+bounces-2561-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD69687AD
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D1D1C217A2
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D75F13DDB9;
	Mon,  2 Sep 2024 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcXHg7/j"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3B19E998
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280871; cv=none; b=hZVyLQX6P14WbPC7b/kIYnkHqRHcieFwKdkMp1R4epgIKBzbGxyQISsrbbBFdSD1AiPa7/472hGkVofV6FvcfZGWVL3spMPe+SbLplt8m5YGqiL0Df1v7/WpWrGyVZcAfyPRhFJIRhg/3DtJ7fTEDi9eae60nYtVQNmzFkz7248=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280871; c=relaxed/simple;
	bh=zW/MH3mw+Dzek1nzViHs0K1rsisWdenDXoEOQmUJCdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gPuuKTI355yNe9I/XEJG9gxsmlJPH/zaEboH3NzdJ2d0enuNKDjrWgUbA5doozHzk4al+p7Zgs6slKxfQdNHIjolr8CvX2SZnyDSwk5oZVOUzVNXMwGYkZGNfBWpq7s5y/qtVZhBHeCqvR4GbxQNQJoDbBQRH+zN3bcEez4ycPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcXHg7/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FA0C4CEC2;
	Mon,  2 Sep 2024 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280870;
	bh=zW/MH3mw+Dzek1nzViHs0K1rsisWdenDXoEOQmUJCdY=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=RcXHg7/j9LSPOmw8mVOU5Vv184mUO8ZbHzHvSXfVW9MW2E5eYL9jQB9lOgrZIchnT
	 jNM+T+I5lkVu6C01AQ1vI1c545N0vZLsaJOYWHedt7OOALVimpL8hF0RZnDD3ynryP
	 3tAt4xIOlhXGs97w9UbiWMMO/v7FSJXBmZcMorXCw296jObO77UL1VN7xePH+6wmsf
	 hd3i6HWDg3ov7jyQwz59RidouT/j5aEIwKAmqIsCMyeFuMT/SNbKabCZI00TFpWQnC
	 PfbAh2FUORWZ7kinU7DlJ9aDMfM7OD88HEb3nizXunWh/Vcjhtb3iwuMRTqmPV5VzB
	 bHY5xKcPVoqHA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 0/8] Turris Omnia LED driver changes
Date: Mon,  2 Sep 2024 14:40:56 +0200
Message-ID: <20240902124104.14297-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Lee,

this series is for 6.12, but it depends on changes that have been
merged to 6.11-rc3. Your for-leds-next branch is based on 6.11-rc1, so
it won't apply there.

This series does two things:
1. It drops the code for executing MCU commands from the LEDs driver and
   instead starts using the functions from the turris-omnia-mcu platform
   driver. This is so that we don't have the same code at two places.
2. It adds support for the global LED brightness change interrupt to the
   LED driver. This interrupt is exposed by the MCU driver. Userspace
   can poll for global LED brightness change (triggered by pressing the
   front button) by polling the corresponding sysfs file,
   /sys/class/leds/<led>/device/brightness, documented in
   Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia.

Marek

Marek Behún (8):
  turris-omnia-mcu-interface.h: Move command execution function to
    global header
  leds: turris-omnia: Use command execution functions from the MCU
    driver
  turris-omnia-mcu-interface.h: Add LED commands related definitions to
    global header
  leds: turris-omnia: Use global header for MCU command definitions
  leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
  platform: cznic: turris-omnia-mcu: Inform about missing LED panel
    brightness change interrupt feature
  leds: turris-omnia: Inform about missing LED gamma correction feature
    in the MCU driver
  ARM: dts: turris-omnia: Add global LED brightness change interrupt

 .../dts/marvell/armada-385-turris-omnia.dts   |   1 +
 drivers/leds/leds-turris-omnia.c              | 228 +++++++++---------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 ----------
 include/linux/turris-omnia-mcu-interface.h    | 147 +++++++++++
 5 files changed, 259 insertions(+), 250 deletions(-)

-- 
2.44.2


