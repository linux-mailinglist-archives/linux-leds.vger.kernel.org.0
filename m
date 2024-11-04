Return-Path: <linux-leds+bounces-3259-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C69BB778
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E891F2348C
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 14:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DB913B2A5;
	Mon,  4 Nov 2024 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX2TFR5Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6A7083E;
	Mon,  4 Nov 2024 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729984; cv=none; b=e81AkXJ5NykhO0U+DVBgk89/LklkaJmEIskfCbG2rTIfjGhDIQs/wiXvbsDhjsQU9G0aozD915ndf8DY8/U3+net8rKu6GQQ0y5cX3qBqyxey1cDCZjNQW2iTKTXHm/8zGevqyUvtHhbCAWHEfffjCfOf9lr0BFxgI5Gn5oTDCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729984; c=relaxed/simple;
	bh=k2ET+mNmV11DXD5Dqt3IxyuEPJFzW2WgZvGZBxEVi74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msui70aVywFGD3Ib9P7DQl4Kc6rFgQBxtvODe4n3HMH+jGS7rp6F1eL4fjLed+I/21SCRh+IL1BJnIOGioLIxnlH7o3osNXBNIisLZvcuZLpuAxkomRBNQTbzj+Xe+77yDAZJ0dBTmHobwfe1WyQ7wVgfCsdliiRoPBJaYJjOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX2TFR5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E56C4CED7;
	Mon,  4 Nov 2024 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729984;
	bh=k2ET+mNmV11DXD5Dqt3IxyuEPJFzW2WgZvGZBxEVi74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nX2TFR5Qd8+QiLcV7pj55KT2EowrrXFQor5r0toYxbx0EjjswlN5lDe9TQ+Z6RZ+K
	 a/ON0jQkcerdAlqGSLuq5bashkB+nLZL2qBPoPAfSl3MJA8pjjRr1kdA/kaftl/5tG
	 lgOUc9S4zrQihKaOoC5stIbLIDxyLm9OQKI752E7R67vS63kN5W78vgljEpVJJc6Zw
	 /WWgbkYqk8TKSUHPfzpWoD70eJ3eE9T5LUrD0f4yt39nMiWHboaqwDFaGnvw8MGd9i
	 Kbk9HtM77ww68oPZ7MnmG4VBr9/qhXqWIXg5cs0HZxAriijmiQcub2/Wd8EMEKlLRx
	 +HQD+J20q7Mhw==
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
Subject: [PATCH leds v5 03/12] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Mon,  4 Nov 2024 15:19:15 +0100
Message-ID: <20241104141924.18816-4-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
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


