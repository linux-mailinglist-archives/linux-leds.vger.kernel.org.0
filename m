Return-Path: <linux-leds+bounces-2564-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D079687AF
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EDB21F22CE2
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121713DDB9;
	Mon,  2 Sep 2024 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnrTSWQW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8C19E99E
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280880; cv=none; b=k56Cy4Egm7Feit0cRh3VFf2ajo+N3tqrUEiKWO1GU4dijtRHX4pJszK3rgOC3cn2+brQOpQ6av7clg4Rvrx4XyDWVT7mTq/ttrKJkQJ9beCfYf6ETyXQybFvhKVqs1C98bDhNd380mDfFhAX3Ada7hdZdC11r2VPhUrtoMVm6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280880; c=relaxed/simple;
	bh=zvOuyojDJja+UDOztElDzMX9QR22CMLU+PdeXgp60gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4faEU8TPEfj4SCfKF/cuLjKeVvnDXWxXlwIXMqXTTrr3vAY4CR1sfdgPRhChhBjev6YY5pYUUjO2uSNtniIDOKnFChv+jar9M/ayHs63JkwrNBm14VqMc/AXu1LX+4S/9f9LS/pU74KL4qjC72fRnUQ/YiEOa+AULC6ndwW3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnrTSWQW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9989BC4CEC6;
	Mon,  2 Sep 2024 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280880;
	bh=zvOuyojDJja+UDOztElDzMX9QR22CMLU+PdeXgp60gI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=NnrTSWQWJEmeYEj9rX7vvXnaSy6BG1e5ifZxHI7r5v2wykWYAHpyKIOyZMwanu8Oz
	 HqRcnPSgN8V+J5Ki47jfchoiOaoc5s00eIDz5a9Wn13cTBNaeDuntG+E7ruNcfJ8Tk
	 jyp+mJAHRTBGcu9/SxC0hlSV+qj+Q2DOGYEDOqwIGqC7YPRfmL99/LKTLO94PFTf1k
	 /QZsDxx57hf0bUZ4TgDmdBfZ4zkUhjLGe5t6kIzRZkh82NpHfFfxwFJ4EXWHCkIfMH
	 4TzoScqrXwJ21b/7i2jnSi5iosZtWnbn9FUOk69/xlTVMxMdYpV4FTiQna72PCVHDs
	 teIYuOKh4bRcA==
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
Subject: [PATCH leds 3/8] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Mon,  2 Sep 2024 14:40:59 +0200
Message-ID: <20240902124104.14297-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902124104.14297-1-kabel@kernel.org>
References: <20240902124104.14297-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add definitions for contents of the OMNIA_CMD_LED_MODE and
OMNIA_CMD_LED_STATE commands to the global turris-omnia-mcu-interface.h
header.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 include/linux/turris-omnia-mcu-interface.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
index eab67b81f310..bf5d04e53809 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -240,6 +240,18 @@ enum omnia_int_e {
 	OMNIA_INT_LAN5_LED1		= BIT(31),
 };
 
+enum omnia_cmd_led_mode_e {
+	OMNIA_CMD_LED_MODE_LED_MASK	= GENMASK(3, 0),
+#define OMNIA_CMD_LED_MODE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_MODE_LED_MASK, _l)
+	OMNIA_CMD_LED_MODE_USER		= BIT(4),
+};
+
+enum omnia_cmd_led_state_e {
+	OMNIA_CMD_LED_STATE_LED_MASK	= GENMASK(3, 0),
+#define OMNIA_CMD_LED_STATE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_STATE_LED_MASK, _l)
+	OMNIA_CMD_LED_STATE_ON		= BIT(4),
+};
+
 enum omnia_cmd_poweroff_e {
 	OMNIA_CMD_POWER_OFF_POWERON_BUTTON	= BIT(0),
 	OMNIA_CMD_POWER_OFF_MAGIC		= 0xdead,
-- 
2.44.2


