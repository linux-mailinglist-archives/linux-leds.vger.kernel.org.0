Return-Path: <linux-leds+bounces-4574-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39707AA7573
	for <lists+linux-leds@lfdr.de>; Fri,  2 May 2025 17:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28541C062D3
	for <lists+linux-leds@lfdr.de>; Fri,  2 May 2025 15:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C70E2571C3;
	Fri,  2 May 2025 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sjMryabD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D619004A;
	Fri,  2 May 2025 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198050; cv=none; b=eLU4udB7R0dfkf4GTXyuzdJJyfnkpylmWBeSM3RwVAlAce3eOfnzhCgk6hae9F05CO2yu8f6NEdgEpYILY9nBpPFQdCHXmBt8G+XhHbc6nFaGwXymViL1/7CbizlaUYc5nT5cge1Of+uCNbNGCQXRYq02+RzdyI9+HoA+Dib3iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198050; c=relaxed/simple;
	bh=dC2Y1O5qazKCP6X5USs05T/PU1V9Nks638uqbD9EaB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfZaZ8r4vU8XDtUim3jtO+pB3jSSIzOYYyVRI8xLGU2AbA+/Vc6y3NRZ8YIKXL7KnLJhka25GeW5tD5BJ8i6SHBqTbKHgRsM0ido8LwE6Ak/qOvD0QH0TFsP7DofCXkabzQJqxtbGIAVqVpwf/FUfgMdTyGPd/cPKaSNR5gkpp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sjMryabD; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ArjhuI7RsSMUrArjkuJEbc; Fri, 02 May 2025 16:51:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746197498;
	bh=WjZ/X+9NMMif7OyiK71JbAQs+u2dkiGWcjzAyUuvLBE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sjMryabDPp3Mn5I/w6t+4ZGxjGnRvLA5GTEcOeCkqKLheOAxYapN5MAMkZERbzquh
	 TkCOBHPRIJY0b0AdgrebihxkMK9OS5ca+C3UAruXgUiU8tyCtQIr5b/HqjiU5yOrvG
	 096tcr91wUm/QjeEqQNG+V9DXmZiZX8DIaBeJkNYUg/PMGF6E1Nu5wT1tHKWfilj7B
	 lX+LtLMti9wgy+KcXXg+PTOrfu/koKViCBjKbeeUzzAB9AEqIoEzqeQUvxifp6aXsf
	 JixqSrCg5LUJA9LSqN4VgX3WQ78XEVSeRikJSXAOwLkzBgb7haJwUjNA5/WMDJYeNi
	 snSrYBV9RGG9w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 02 May 2025 16:51:38 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] leds: rgb: leds-mt6370-rgb: Improve definition of some struct linear_range
Date: Fri,  2 May 2025 16:51:22 +0200
Message-ID: <1ce4245107e0a51dce502a007a69899bda018d5f.1746197460.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use LINEAR_RANGE() instead of hand-writing it. It is more robust, should
the layout of the structure change one day.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index ebd3ba878dd5..c5927d0eb830 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -199,17 +199,17 @@ static const struct reg_field mt6372_reg_fields[F_MAX_FIELDS] = {
 
 /* Current unit: microamp, time unit: millisecond */
 static const struct linear_range common_led_ranges[R_MAX_RANGES] = {
-	[R_LED123_CURR]	= { 4000, 1, 6, 4000 },
-	[R_LED4_CURR]	= { 2000, 1, 3, 2000 },
-	[R_LED_TRFON]	= { 125, 0, 15, 200 },
-	[R_LED_TOFF]	= { 250, 0, 15, 400 },
+	[R_LED123_CURR]	= LINEAR_RANGE(4000, 1, 6, 4000),
+	[R_LED4_CURR]	= LINEAR_RANGE(2000, 1, 3, 2000),
+	[R_LED_TRFON]	= LINEAR_RANGE(125, 0, 15, 200),
+	[R_LED_TOFF]	= LINEAR_RANGE(250, 0, 15, 400),
 };
 
 static const struct linear_range mt6372_led_ranges[R_MAX_RANGES] = {
-	[R_LED123_CURR]	= { 2000, 1, 14, 2000 },
-	[R_LED4_CURR]	= { 2000, 1, 14, 2000 },
-	[R_LED_TRFON]	= { 125, 0, 15, 250 },
-	[R_LED_TOFF]	= { 250, 0, 15, 500 },
+	[R_LED123_CURR]	= LINEAR_RANGE(2000, 1, 14, 2000),
+	[R_LED4_CURR]	= LINEAR_RANGE(2000, 1, 14, 2000),
+	[R_LED_TRFON]	= LINEAR_RANGE(125, 0, 15, 250),
+	[R_LED_TOFF]	= LINEAR_RANGE(250, 0, 15, 500),
 };
 
 static const unsigned int common_tfreqs[] = {
-- 
2.49.0


