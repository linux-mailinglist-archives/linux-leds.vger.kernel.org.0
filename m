Return-Path: <linux-leds+bounces-4735-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E909EAC9ACF
	for <lists+linux-leds@lfdr.de>; Sat, 31 May 2025 14:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BDD3174087
	for <lists+linux-leds@lfdr.de>; Sat, 31 May 2025 12:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED09239562;
	Sat, 31 May 2025 12:11:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1177260A;
	Sat, 31 May 2025 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693490; cv=none; b=DxjAmu8oM8Wj3/Nmzl5v7dB9+ZTGXxr3xnQ7ACdCSZ6hiXLQ0G5/LsWxqGdsU2yWIR7bKL8nNiY0bb0lP0LKYVJMByNwJhHHR1swkXjAY3XSsGXR4QfdNr4TH9MgEcvVZ2urK1AQN9leXfAo45p6iea4abF5FUWPXmmNxwnceuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693490; c=relaxed/simple;
	bh=us2Py93GBDsSp0jD+73Gd0wAEBph6IjnFu+nDClLvYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bi+Gt00L3UlUi+8XBq3BQqbl3ra3txB4rHrp85iRzX1kmSbkKgWwHGbgo14SgNKTzUqevdCla62W1lLByiudHFIGiw2yxkIn033/l1YZAeF7WlFgZb3wKSvHVp/fdA5KuoTheaBGrZ+N2A7ER2COs0/0XIc2IhyhH/SGXnLKtFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b8f8q69K0z9skH;
	Sat, 31 May 2025 14:11:23 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH v2 0/2] Support for Osram as3668 LED driver 
Date: Sat, 31 May 2025 14:07:16 +0200
Message-ID: <20250531120715.302870-4-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the patch series adding support for the as3668 LED driver. I am sending v2 because I discovered major issues in v1 that required correction before review.

This patch adds basic support for the as3668 driver IC via I2C interface. The IC is capable of driving four individual LEDs up to 25.5mA per channel. Hardware blinking would be theoretically possible, but this chip only supports a few set on/off-delays which makes using that feature unfeasable, therefore my driver doesn't offer that capability. It's intended applications is in mobile devices such as phones, tablets and cameras. This driver was tested and is working on a samsung-manta which is running postmarketOS with a near mainline kernel.

Please note: This is my first suggested patch to the kernel. checkpatch.pl runs without warnings or errors. I've read the docs in regards to the led subsystem, coding style and submission of patches, but I'm still a bit unsure about the general workflow. I will try my best.

Changes in v2:
- Fixed reading led subnodes in dt incorrectly, which caused wrong numbering and a segfault when removing the driver module
- Fixed calling of_property_read_u8 with an int, causing a compiler error
- Added more error checking during writes to the i2c bus
- Link to v1: https://lore.kernel.org/linux-leds/20250530184219.78085-3-linux@timmermann.space/

Lukas Timmermann (2):
  leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
  dt-bindings: leds: Add new as3668 support

 .../devicetree/bindings/leds/leds-as3668.yaml |  76 +++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-as3668.c                    | 192 ++++++++++++++++++
 4 files changed, 279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.49.0


