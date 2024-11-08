Return-Path: <linux-leds+bounces-3353-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E87A9C1E00
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FFBB1C20BEC
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309AA1EE03C;
	Fri,  8 Nov 2024 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlP1P3Yv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16A1EB9F0;
	Fri,  8 Nov 2024 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072559; cv=none; b=XV7gzBRMzJwFDw557UCue909vrkBml8VcCNBpFySrWcxeL8LoMkCaqzI7NH+aQ4DelSEKzslH6KWYkHbLq6Uobm1GEBYxXn6TYaihNb/CS2/UPZzT+CGz34J00h0rFB5z2GBwWb4GwuH4ofzj57o9JmjPGSXP7HYishbqGNPAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072559; c=relaxed/simple;
	bh=rTAIY6aQ5hb64k5weAhBRvT5KfxwL7qw3p8nyT7tcWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSRtaRk/wUUzE5bBM5iotVhGJBcPhp1xN/OZo6SHT3idxEbp+glTIBQDQzzh3F69rjsZ1Ki5oBDKcbm2UZR/93Vm8WVvTpI0eyFEv4cu8d8hWl/FTB+3zwAwrFASm5WrdGYjZKuVdDfLRJTp10t/3G12NIiZ9p1C4TPpANb/KJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlP1P3Yv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24448C4CED0;
	Fri,  8 Nov 2024 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072558;
	bh=rTAIY6aQ5hb64k5weAhBRvT5KfxwL7qw3p8nyT7tcWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dlP1P3YvnkhI234tQ9DFN2eUOFfcjue+LHI6ChNlTDP7UBl+YM89jhwE99Bx5m3ET
	 acbyOWzsTFqas6Y0mqZadcdqeR/AJo/MZVs1WN2ceeqhYhquv5LwHCDpZycmmAT//Q
	 i7XA/0V3lbYUKLbjG+IY2RptwtmCu8yUCjfc3SWQCSMGhd4I6KM71YokJ7JM4i3Gau
	 hVShnpU3icH8tw6HMz/rMTaeUh22j41GMPjgyYdYzYPNd65ZFBNFd4QbB775xo3BhX
	 nIlV18wpFNT0PTj2kJSA3gRwr2M/F3ZdYhY6AVVyKRXFcSOMlwp82OtKzDcxmakqTi
	 k4MWep/veY1nQ==
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
Subject: [PATCH leds v6 06/12] leds: turris-omnia: Document driver private structures
Date: Fri,  8 Nov 2024 14:28:39 +0100
Message-ID: <20241108132845.31005-7-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
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
index 50fef4389c93..7d2ed0c6500a 100644
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


