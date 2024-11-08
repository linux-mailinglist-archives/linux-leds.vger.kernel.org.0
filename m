Return-Path: <linux-leds+bounces-3350-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 054C89C1DF8
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA77E1F21778
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3DE1EBA07;
	Fri,  8 Nov 2024 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4qvg5Hz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F61EABD3;
	Fri,  8 Nov 2024 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072547; cv=none; b=Pody6DLvxgRDDkr8G1VsnN2dpqUc+hS6YfmilfIu8iNSPzeNdGCLMozbhDBw/BFTMcB8gGjnIWCaOmNKB0ugM4f5c6GjUE+Nv34uwQXwFm6haDKDYYIw2x0bCXx/tiqMi3yyzupQ3WvFHjUjNdq4IPiPbaJI4sZRVk8AZ/yauMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072547; c=relaxed/simple;
	bh=k2ET+mNmV11DXD5Dqt3IxyuEPJFzW2WgZvGZBxEVi74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXz9KYPZw11QnQ+TYBDtST5AJ8RNproEXpsKKOcKvsPXmmOPjsJUKgbt2Ci0ioY4nJPDQcXTvZ1aE6j0DIT/p2TLsgONvy3njD17VKfwPOKmu3kDRPQSu7cLVVpsnWWVanJIhAdMUlvfayvuzK1ZYNsrRdRdcxzjR9k1aB+AVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4qvg5Hz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D894C4CED8;
	Fri,  8 Nov 2024 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072546;
	bh=k2ET+mNmV11DXD5Dqt3IxyuEPJFzW2WgZvGZBxEVi74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4qvg5Hz4Yh7Verd//i5NTdG0H8JmO93oHZgkxx3WxkWR+PgP8p2KVzHwrwdS5/Ry
	 o0qfgeUDdbn1n/82VEH5C9/PghI72Cjoog2bpXuzPpbiAcTXDLr0lwu36llDyYr2Lu
	 0BbQAqut165hREGFVcIon08EiCsStwtu6oyCgSN3bTbTdxd7Y/mWkouOmpeJREdBFm
	 rBBQMH8aORzHQtvIi3sGh1uXJbMwqra3oqcK/QoKRcaEgZYp0x6eWEkQMpJyJQN5eR
	 Ikxx99Ab8I7WXp+22RBZ+iSTiznDueSKOHJBRNMmMh+GHRhQGVXnacYZpJPrtMMJYJ
	 dcEII8FP/HWkw==
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
Subject: [PATCH leds v6 03/12] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Fri,  8 Nov 2024 14:28:36 +0100
Message-ID: <20241108132845.31005-4-kabel@kernel.org>
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

Add definitions for contents of the OMNIA_CMD_LED_MODE and
OMNIA_CMD_LED_STATE commands to the global turris-omnia-mcu-interface.h
header.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 include/linux/turris-omnia-mcu-interface.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
index 7f24cc682780..06c94e032c6f 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -239,6 +239,18 @@ enum omnia_int_e {
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
2.45.2


