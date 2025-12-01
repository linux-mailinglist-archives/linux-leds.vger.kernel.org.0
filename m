Return-Path: <linux-leds+bounces-6360-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB3C96DBC
	for <lists+linux-leds@lfdr.de>; Mon, 01 Dec 2025 12:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0E213A3112
	for <lists+linux-leds@lfdr.de>; Mon,  1 Dec 2025 11:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F98324E4B4;
	Mon,  1 Dec 2025 11:20:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F62E5B08
	for <linux-leds@vger.kernel.org>; Mon,  1 Dec 2025 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588015; cv=none; b=gJsy18ntL8fqStQXx6+xRfwWRvXB8zzulgHpJSZ4acPBxzKqhegY9EOb3Js0g7QCho0tG+XCnnmkeZpqd+s3OOGqF9y3NwKLLhtuZLcEc6s4Xo1MnAh2Ci/LR/LjENQVuXZOHskeBXW8YEEv6rJ8k0DheH1o5hS8bPE391vj3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588015; c=relaxed/simple;
	bh=mhxXoJIal6xSKWaH3YPwAX0jxLvC9hL6DO8DkyviWRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WOV7VTJs9JmkBs6lCjUFy1grQAia4HUHnrmh9LaOETK6jSl05YLjCrw6F0YGHqyW4Nub9C5gxDS9xiqJA8a4b62Da2I92h1IQFLVjn1+O2c+4M14JlkIlpJUikzDHPU3ICKZXpKh249P6t7Ue4kqwptYLFMO0ZuyYj9SrretrYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vQ1wn-00055e-Cj; Mon, 01 Dec 2025 12:20:01 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v6 0/2] LED: Add basic LP5860 LED matrix driver
Date: Mon, 01 Dec 2025 12:19:46 +0100
Message-Id: <20251201-v6-14-topic-ti-lp5860-v6-0-be9a21218157@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJ5LWkC/3XQzWrDMAzA8VcpPs9D8pesnvYeYwfHcVrDSIKTh
 Y6Sd59bxnJYcvwL9BPoLqZUcprE+XQXJS15ykNfw72cRLyG/pJkbmsLBcqCQpaLk2jkPIw5yjn
 Lz9F6B7JTNhjfOBWJRd0dS+ry7em+f9S+5mkeyvfzzIKP6a+o4EBcUII0ypNp2kgW9duY+svXX
 IY+317bJB7sojbKVuSAUpUilWL0XTChpV1KbxQjHlG6UpqBtE8dt4S7lPmjEICOKFMpdkTWg+P
 GwS5lNwrx8Fe2UrYhooY5MNh/1LquPw5l8qrrAQAA
X-Change-ID: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The lp5860 is a LED matrix driver with 18 constant current sinks and 11
scan switches which allows controlling up to 196 LED dots.

This series adds just the basic support for the device on the SPI bus.
It is also possible to use it on I2C. The interface can be
switched/selected via an interface select pin.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v6:
- Kconfig depends -> select
- change some function/variable names
- change line breaks (80char -> 100char)
- call led_init_default_state_get once
- rename index variable i -> led_index
- don't fail on missing dt-properties
- remove sysfs_create_group residue from v5
- Link to v5: https://lore.kernel.org/r/20251110-v6-14-topic-ti-lp5860-v5-0-5b777b99a905@pengutronix.de

Changes in v5:
- remove global_brightness code and sysfs ABI
- rebase to v6.18-rc1
- Link to v4: https://lore.kernel.org/r/20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de

Changes in v4:
- move to drivers/leds/rgb
- fix some upper/lowercase
- use ATTRIBUTE_GROUPS macro
- unwrap some lines
- Link to v3: https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de

Changes in v3:
- fix c-styling errors
- rename functions/defines/variables
- split out ABI documentation
- rename [rgb]_current* to [rgb]_global_brightness*
- rework multi-led probing
- Link to v2: https://lore.kernel.org/r/20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de

Changes in v2:
- add open and short detection
- add ABI documentation
- fix devicetree binding (maxItems/minItems)
- fix commit message to imperative mood
- minor cleanup
- Link to v1: https://lore.kernel.org/r/20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de

---
Steffen Trumtrar (2):
      dt-bindings: leds: add lp5860 LED controller
      leds: add support for TI LP5860 LED driver chip

 .../devicetree/bindings/leds/leds-lp5860.yaml      | 111 +++++++++
 drivers/leds/rgb/Kconfig                           |  27 +++
 drivers/leds/rgb/Makefile                          |   2 +
 drivers/leds/rgb/leds-lp5860-core.c                | 192 +++++++++++++++
 drivers/leds/rgb/leds-lp5860-spi.c                 |  89 +++++++
 include/linux/platform_data/leds-lp5860.h          | 268 +++++++++++++++++++++
 6 files changed, 689 insertions(+)
---
base-commit: e9b0c4a6e84a3a1cbdeee1cfa7f4a5756fc75a6f
change-id: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


