Return-Path: <linux-leds+bounces-3188-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 292809B4B7A
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3912284BA7
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51027206E61;
	Tue, 29 Oct 2024 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBzZTaMX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273FD206E72;
	Tue, 29 Oct 2024 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210217; cv=none; b=MqDGXXaxBmjbbQTadnDNVpQALGv/tG+VtwpDxnEMbNMKOJa03cOc4I/+303UxtRwKiDUgAX52bt9A1nfLLNelXvOiigqZb1CTNg0v10yMo8+DMRFC50E6es446SCSdySIx3DR+FH0jvyLq1toVyqPaOjMWDMeAWI8fHr/06DNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210217; c=relaxed/simple;
	bh=wCvR1DsmVcTKlbR4ZRdGJLWwzhcOYcxjtGptt9x3GTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kgi5EKroxcxsy2oiEyxdfuoe6eBb5O09KZVatKRl91A1hWqgBlesYRH5GVjqmYfukev9lYE+acQvGRhFAJ9/Dino8IEGMIe7nVx2ID+zclwWg04ofeWFyuERFwu1/W/xUGvRjoW8BjuJrSeJrEX4Ho0vs+cq1keK0yiJ8Lfe5DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBzZTaMX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6933EC4CEE6;
	Tue, 29 Oct 2024 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210216;
	bh=wCvR1DsmVcTKlbR4ZRdGJLWwzhcOYcxjtGptt9x3GTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TBzZTaMXn3Dd+Q6HH/kgaa3P/8/1ndZw02zIFqeRsqr2J+2H6/F5FQ0ijhAwzQbql
	 bohvr7w9pnvp8EkDzRujWOD4E9qTnknn3kjhkuYxaICi7gDJNzkhk5Vwb2mFePSx6V
	 tqIvXbzxGgT93T4FH30Nepkt6D3g6Qu1mObuGmHhKUeJ21TIXBIRzL4Jh0mmWEtsf3
	 B7bjFo65YyEzFOI6hy9SMwdH8v33Ims0YHuN5OxKK1oFuSVN7FugRxt1b1WYGnKBSu
	 0atl4+5/csRx9jzmUaA75nEpRRK5JWtrRDxp+MOiYNNRcnWCk8f6/l9iSpM03o1uPq
	 TEjlOFfQTPvjA==
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
Subject: [PATCH leds v4 06/12] leds: turris-omnia: Document driver private structures
Date: Tue, 29 Oct 2024 14:56:15 +0100
Message-ID: <20241029135621.12546-7-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
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
index 82cf58fbe946..b13b3b269ae9 100644
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
+ * @lock:			mutex to protect
+ * @has_gamma_correction:	whether the MCU firmware supports gamma correction
+ * @leds:			flexible array of per-LED data
+ */
 struct omnia_leds {
 	struct i2c_client *client;
 	struct mutex lock;
-- 
2.45.2


