Return-Path: <linux-leds+bounces-3185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E29B4B75
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877CF1F2421F
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3F6206965;
	Tue, 29 Oct 2024 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEEVbvud"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B4E205132;
	Tue, 29 Oct 2024 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210205; cv=none; b=dD0A1cfIs9nmnl+jjY1fjBlSl6YnbI0IL1nipHh58Z5T3ORtxKNNLP0sEXOdKwaW+NQqTDVXtTsL4v7qsA5bPHTml22vKOM4+VJEm7QlgtZWcFpPdOROqrBUsSdJLnRmuxVwv52vLKB3nMKEa0AsNqjMr3K4Y2dVBvhZWqC9MmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210205; c=relaxed/simple;
	bh=k2ET+mNmV11DXD5Dqt3IxyuEPJFzW2WgZvGZBxEVi74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FDChkStWyuaXyKp7tvpqfZevRy/jVKsP1wmpM6XdBoo7QUcvZW5yayrKkfMkSUZ/c1FzBwPvtJmiFvkWVcH1euB6dOnXMLdS2z+dKHlREmWa5nbtLh/GcfcNOBidYu/638Kyl35U+9fNvy8E4UCsxJvTkUkcYLjCP9Bzvw1pxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEEVbvud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AF8C4CEE3;
	Tue, 29 Oct 2024 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210205;
	bh=k2ET+mNmV11DXD5Dqt3IxyuEPJFzW2WgZvGZBxEVi74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AEEVbvuddxQFsXMPV+nUNCsZmMpd2IYw0V6Uzvga6fENNIzCOIQOvoYZ7r9IkzZuE
	 w4gNjsoZPwB+pALR2SMndqERsloOOE/LXavsjCcagmA7uIFvDOt7OoeRUFznSI5hmC
	 NWarF13fs9ISoGVIUPmkWqKIPFU/7ZHxHB9ZnK1p83ws6UGWPYJMLe4hYa3ePRXLRn
	 2f0k2rNrt9xGKp5nBW8RR+uLP6vjBuIUgVsLDhekAqwQwNWgiP2vEWrg9SkN327LHq
	 Cvgv+D0eZ0WOupUrEx+hGueP+MNQDonsCZ3fk8KxmpxXlyEcg7RmiQYdkH1xuGEiRB
	 +Vbz2f0R2So1Q==
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
Subject: [PATCH leds v4 03/12] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Tue, 29 Oct 2024 14:56:12 +0100
Message-ID: <20241029135621.12546-4-kabel@kernel.org>
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


