Return-Path: <linux-leds+bounces-2667-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA806977FE9
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 14:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C349281EF3
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A82A1DA118;
	Fri, 13 Sep 2024 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLo5XgDR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717231DA110;
	Fri, 13 Sep 2024 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230670; cv=none; b=OQRFlTx4nphoGszSfITbR1OCgph5YQZylpOnlGtTkmnfVpNJKBiNQXYgaI1fJgf/SgINnoaVVF5PfU1pOCpdI1j3W8oDH5q7G8vsMAAopleEaevxLA/+11FqkgZ8jAHYqUPx9djRPO+t6FkgNToe8ek9JLxVVv75TvTOt6iqYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230670; c=relaxed/simple;
	bh=9zbXLs01rJN0ObAMBm52pWCMloxHSGISDzqIEVGl3o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J3ryhaIYs8yC9DLAh/3XWeHXShvvo8HJrE4I2LySeQBvcDOUBTzfq232nfL0n0LnC5HmaNODQwyGeti1pRhuxljUAgO/tTgji4vuqiWpj3EBeXgIpvHN+o8tqUVfhf3+IMGkfEbDA/br56FbzkdlDDsftAuf72eqN8Kzyfd1/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLo5XgDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DB9C4CED4;
	Fri, 13 Sep 2024 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230669;
	bh=9zbXLs01rJN0ObAMBm52pWCMloxHSGISDzqIEVGl3o4=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=aLo5XgDR0oiFrLoC5NDgki1hsAHhvzoWoGCxrAgPehMKkGEpSahDcwiy08PzK5kXa
	 fYez0ivrsFSWXX5HPFIgDpc0UCKl/8WQowSpiTNY2FwinGO+TeNOm0qgjzlsXng1b1
	 2F6wrDFief7HfVbSL1VxwajYRXiATxnHv/lCJm0ueXALmKHPMjLep2xL7+e491FIcO
	 m4XO7I7qyDixmz1eq8xWCmQ+8iaqC9tAD/WL20C8xHX9eV3FRJh8jGOk8UsihWhM5B
	 0lUKBe7bmBEHb9Z6z0RaLXB1+eQ+drfVb4C+D9lUooxTzOmIVzhsxfW0oW/tCTzsXo
	 u8CIUcf41RBUw==
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
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v3 00/11] Turris Omnia LED driver changes
Date: Fri, 13 Sep 2024 14:30:52 +0200
Message-ID: <20240913123103.21226-1-kabel@kernel.org>
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

this is v3 of Turris Omnia LED driver changes.
v1 and v2 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/

This series is for 6.12 (alternatively 6.13), but it depends on changes
that have been merged to 6.11-rc3. Your for-leds-next branch is based on
6.11-rc1, so it won't apply there.

Changes since v2:
- added interrupts property description to device-tree binding to fix
  the device-tree binding check reported by Rob's bot (new patch 05/11
  in this series)
- dropped the patch that converted to 100 column wrapping, as suggested
  by Arnd
- took Andy's suggestions into the patch that converts to
  dev_err_probe()

Marek

Marek Behún (11):
  turris-omnia-mcu-interface.h: Move command execution function to
    global header
  leds: turris-omnia: Use command execution functions from the MCU
    driver
  turris-omnia-mcu-interface.h: Add LED commands related definitions to
    global header
  leds: turris-omnia: Use global header for MCU command definitions
  dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
  leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
  platform: cznic: turris-omnia-mcu: Inform about missing LED panel
    brightness change interrupt feature
  leds: turris-omnia: Inform about missing LED gamma correction feature
    in the MCU driver
  leds: turris-omnia: Use dev_err_probe() where appropriate
  leds: turris-omnia: Use uppercase first letter in all comments
  ARM: dts: turris-omnia: Add global LED brightness change interrupt

 .../leds/cznic,turris-omnia-leds.yaml         |   8 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   1 +
 drivers/leds/leds-turris-omnia.c              | 262 +++++++-----------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 ---------
 include/linux/turris-omnia-mcu-interface.h    | 148 +++++++++-
 6 files changed, 258 insertions(+), 294 deletions(-)

-- 
2.44.2


