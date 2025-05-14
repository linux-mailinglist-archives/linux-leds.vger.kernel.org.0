Return-Path: <linux-leds+bounces-4630-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33ACAB68FA
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 12:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A65D8C1894
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD5C270EBD;
	Wed, 14 May 2025 10:37:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2C2270EA8
	for <linux-leds@vger.kernel.org>; Wed, 14 May 2025 10:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219022; cv=none; b=TeacGjJOTSgkGfVOSNQxgr+ozHibc2ccl1/aHLJvgTQaBUqBUMbwqwgdg/ToZErJtc1nhu8ZuSPQYuzwsoYw/ng49RxqmmSrxDrtW6f8WXeiIFRMwaPRiIqjDuQBZ2xq+5SKIYiS2pgbeoloA8Xnfu2nJmSQykiVqRxJo8IJ6uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219022; c=relaxed/simple;
	bh=ZVIRs7QvHwwH5VRDf/P72Eh4Z9YC9U4yL9J7u4baBYI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bSVDDR1NJF/LNsUkjCrIUDlKhIXZDoKjlhukddN64UinpHDoCDWUC+fFpE/8VEN3c+YpCHCIyrP1QXE4923LQQFsDAXLjqvOlMCSSQtjdj6NGfucEkxWVopo0qDXVqFvXIEX7XNcEhOEYgTXpHmN4hC6tbjAWQc5hyqdIw2IVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1uF9Tk-0004uZ-52; Wed, 14 May 2025 12:36:48 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/4] LED: Add basic LP5860 LED matrix driver
Date: Wed, 14 May 2025 12:36:27 +0200
Message-Id: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtyJGgC/3WNyw7CIBBFf8WwdgyM0Icr/8N00VLaTmKAAJKap
 v8uNm5dnpPcczcWTSAT2e20sWAyRXK2AJ5PTC+9nQ3QWJghR8VRtJArEBKS86QhETy9aioOE6p
 eNkOFum5Z2fpgJlqP7qMrvFBMLryPmyy+9ldE/qeYBXCQ2NRyGHWtxPXujZ1fKThL62U0rNv3/
 QOwfIGvvwAAAA==
X-Change-ID: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The lp5860 is a LED matrix driver with 18 constant current sinks and 11
scan switches which allows controlling up to 198 LED dots.

This series adds just the basic support for the device on the SPI bus.
It is also possible to use it on I2C. The interface can be
switched/selected via an interface select pin.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- add open and short detection
- add ABI documentation
- fix devicetree binding (maxItems/minItems)
- fix commit message to imperative mood
- minor cleanup
- Link to v1: https://lore.kernel.org/r/20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de

---
Steffen Trumtrar (4):
      dt-bindings: leds: add lp5860 LED controller
      leds: add support for TI LP5860 LED driver chip
      leds: lp5860: save count of multi_leds
      leds: lp5860: detect and report fault state

 Documentation/ABI/testing/sysfs-class-spi-lp5860   |  73 ++++
 .../devicetree/bindings/leds/leds-lp5860.yaml      | 112 ++++++
 drivers/leds/Kconfig                               |  23 ++
 drivers/leds/Makefile                              |   2 +
 drivers/leds/leds-lp5860-core.c                    | 413 +++++++++++++++++++++
 drivers/leds/leds-lp5860-spi.c                     | 101 +++++
 drivers/leds/leds-lp5860.h                         | 326 ++++++++++++++++
 7 files changed, 1050 insertions(+)
---
base-commit: 63ee0d00c8fc276d8653e71fb2c914cf257db2b2
change-id: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


