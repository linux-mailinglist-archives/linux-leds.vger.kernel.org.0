Return-Path: <linux-leds+bounces-3378-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 092059C3B9E
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B44811F20FC8
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5581A175562;
	Mon, 11 Nov 2024 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iogNKRKX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6EA15C15A;
	Mon, 11 Nov 2024 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319465; cv=none; b=FiG3kokmGdybg53Eqy7Zg6rO+N2N5IRXG/pIJ1tvEerHbemDjpFDV7LZA5t0y3GgQX0hbs/FqzMRA8ZGBrO7+dsO4bVdr6vK2nqHB60wQqreUiecoYOBujLHiYQ55iMTnE8cKYhXxK8VRy8vlFCIbgbx3id9/M8tZvFGYe2uHz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319465; c=relaxed/simple;
	bh=v7WL23ms+ZXopV86QQbTvWoLrATGoi65c3m/UcEpUlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCnk23thwaYURZrtXA1mz3wCM7rATUGAD23Fo3fgsD7Qe6ONuakQ45zWdz5wVmKSExNxwKGPXjvTmfTr1GKniAhKO3WPtyde5TqZmU4GykE0B5i8F+8kuZVMUuwes/rYUMef9ZgMx+Dtu2rjXhtzWvOmUr46+SVbxfkDF7uzHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iogNKRKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A57C4CED8;
	Mon, 11 Nov 2024 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319465;
	bh=v7WL23ms+ZXopV86QQbTvWoLrATGoi65c3m/UcEpUlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iogNKRKXYNCLxVUg9+CTQpiWoSwg1smhkoUnxxKMuEtCyDj2QC2Fg5znpEVJjRCwO
	 /un0S0ZXcGYl53AdAwgvZOFxmMWr00FV1g8lwOFRu1KgMBBGZv4z6W7QYKrG6auz6K
	 ODLGlOOg24G0OGvLXFhV6OJDKyG3tWgHY1tofGSUtC6SX+YcDuCpl7zHLsoYhiFPPA
	 csWmxO4iIl5byENLONrsj12Q0ivi8GGk2EkH8gSBxyX1upKeZNM0IMbZa2zwAma8cp
	 SwyaQzB1B+xZLuPMbm+lAhzGcNbWbzaFIOLW94El2dEG64Rgxn33/9rKExTCnVwL4M
	 JQJxAz21dhNSQ==
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
Subject: [PATCH leds v7 06/11] leds: turris-omnia: Document driver private structures
Date: Mon, 11 Nov 2024 11:03:50 +0100
Message-ID: <20241111100355.6978-7-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>
References: <20241111100355.6978-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for driver private structures, `struct omnia_leds` and
`struct omnia_led`.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 50fef4389c93..b60c34f57d0e 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -19,6 +19,15 @@
 /* MCU controller I2C address 0x2a, needed for detecting MCU features */
 #define OMNIA_MCU_I2C_ADDR	0x2a
 
+/**
+ * struct omnia_led - per-LED part of driver private data structure
+ * @mc_cdev:		multi-color LED class device
+ * @subled_info:	per-channel information
+ * @cached_channels:	cached values of per-channel brightness that was sent to the MCU
+ * @on:			whether the LED was set on
+ * @hwtrig:		whether the LED blinking was offloaded to the MCU
+ * @reg:		LED identifier to the MCU
+ */
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
 	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
@@ -29,6 +38,13 @@ struct omnia_led {
 
 #define to_omnia_led(l)		container_of(l, struct omnia_led, mc_cdev)
 
+/**
+ * struct omnia_leds - driver private data structure
+ * @client:			I2C client device
+ * @lock:			mutex to protect cached state
+ * @has_gamma_correction:	whether the MCU firmware supports gamma correction
+ * @leds:			flexible array of per-LED data
+ */
 struct omnia_leds {
 	struct i2c_client *client;
 	struct mutex lock;
-- 
2.45.2


