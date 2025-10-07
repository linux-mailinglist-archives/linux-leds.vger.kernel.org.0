Return-Path: <linux-leds+bounces-5667-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33776BC0C9D
	for <lists+linux-leds@lfdr.de>; Tue, 07 Oct 2025 10:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11493AF048
	for <lists+linux-leds@lfdr.de>; Tue,  7 Oct 2025 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A946525743E;
	Tue,  7 Oct 2025 08:58:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB352D6603
	for <linux-leds@vger.kernel.org>; Tue,  7 Oct 2025 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759827498; cv=none; b=NKRDmAkNKrP8dfbjvPWCwGzfPKt460hL4Rp4K2TmsWT6IoNAFe9RB+3rs099LcyH1Cmha9ooTznRikIbSck0ZM2vPx+ygo6JHql8ccRvPxNQJ7O8+eRWh7j2QpeQRBYoCyuksiyOA5iNLBvKYYWgNpL6ZS9IcW5y5yJ4ULo1Nsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759827498; c=relaxed/simple;
	bh=s3kbGH2m7tYAq0Ru+MGjztJlEXICfIdT9WzMkCBCWFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ik0iwthWPMRe5YDhCF4e9cTSN5CjwjUHyVIbaCC39h/c5lyEkEaQ+P9gphwowkEq0gF9BupHbkHpBB3syY7s7LeaZwDOMaJ2/4PDs0COZDduK4MH3DoWezXdDDhqBnIJnwJYZ8ewveN8dvpYlFHqMjAruc4SvFN6EOs3Xt1wlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1v63WO-0007XY-Km; Tue, 07 Oct 2025 10:58:12 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 07 Oct 2025 10:58:04 +0200
Subject: [PATCH v4 3/3] Documentation: ABI: add lp5860 led matrix
 controller
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-v6-14-topic-ti-lp5860-v4-3-967758069b60@pengutronix.de>
References: <20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de>
In-Reply-To: <20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The lp5860 is an LED matrix controller that can be connected to SPI or I2C.
It supports setting the maximum brightness of the three basic
colors (R,G,B) with a global value.

To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/ABI/testing/sysfs-class-spi-lp5860 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860
new file mode 100644
index 0000000000000000000000000000000000000000..80b22a9d6642100a25efbf658cfed8604150baa5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
@@ -0,0 +1,23 @@
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/b_global_brightness_set
+Date:           July 2025
+KernelVersion:  6.16
+Contact:        Steffen Trumtrar <kernel@pengutronix.de>
+Description:
+	Contains and sets the global brightness for the B color group.
+	Can be adjusted in 128 steps from 0% to 100% of the maximum brightness.
+
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/g_global_brightness_set
+Date:           July 2025
+KernelVersion:  6.16
+Contact:        Steffen Trumtrar <kernel@pengutronix.de>
+Description:
+	Contains and sets the global brightness for the G color group.
+	Can be adjusted in 128 steps from 0% to 100% of the maximum brightness.
+
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/r_global_brightness_set
+Date:           July 2025
+KernelVersion:  6.16
+Contact:        Steffen Trumtrar <kernel@pengutronix.de>
+Description:
+	Contains and sets the global brightness for the R color group.
+	Can be adjusted in 128 steps from 0% to 100% of the maximum brightness.

-- 
2.49.0


