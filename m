Return-Path: <linux-leds+bounces-3620-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA89F3D09
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 22:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FA1C16CADE
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 21:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFDC1D619F;
	Mon, 16 Dec 2024 21:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b="MCQXGNqq";
	dkim=permerror (0-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b="ei0zGmuc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hypatia.paranoidlabs.org (hypatia.paranoidlabs.org [45.11.248.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C301D47AC;
	Mon, 16 Dec 2024 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.11.248.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734385769; cv=none; b=scukWOgOwcGQrOuuGnr0PCssvBxYcD3/zFXeanX908zRC9ZB0rLl1UNCJ26TROjtsNBIYtT5MkwsiRykkhcmVeTIlQW0FRshbaonR9pf3GZOUIfAan4d1G3TlghdSHuyfFtE1AklWtTYg6XC1KUhmf/82BY+Fkx6xa9YLhW2vIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734385769; c=relaxed/simple;
	bh=YfpOT6lI0QXtuY9AgmSgd9UCvos0bhmhePqWe+zv+Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZeMeHWhHp0WDxoEbuBHoutgSR7KYznmLe/H1zmk/8N68IsZRNdCuoEIzr7ApvU6TbdkNRfT8zdeQDoTclR3HeXyj0T/Zyo9HyFhx/D6AgbnKaTp29XePlfQDdRQ3IhzlesgOICHEzd/kQ8BE/0LoTBvINDHQXE/xA9zyG1ctGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paranoidlabs.org; spf=pass smtp.mailfrom=paranoidlabs.org; dkim=pass (2048-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b=MCQXGNqq; dkim=permerror (0-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b=ei0zGmuc; arc=none smtp.client-ip=45.11.248.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paranoidlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paranoidlabs.org
Received: from caph.lan (unknown [IPv6:2a02:1748:dd4e:ded0::3ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hypatia.paranoidlabs.org (PlabsMail) with ESMTPSA id A1D5B24FAE;
	Mon, 16 Dec 2024 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paranoidlabs.org;
	s=rsa-20210101; t=1734385755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3I0qk6a7qhxVLhmwlLtiJNcdVZw3kV/gYRLr37doYUQ=;
	b=MCQXGNqqjCg7Yd/FjfqYkdPtCvTlhz8EmSlYr1AjfNoIxiN0v6judF6orI8GFTP06sQq+n
	WqcejkKoe5+osA3Udl0fgeXSMPlW6ar87ZiV0k6XTQl2KZ+njvOydyK2ABcNOQOQoNrSwI
	WCJsrviQeFKGeObt6Ckg3UarGi6R3MNRu0kxDhVKTbzFhI3otFXeoFxrKfYBBi6lbBvPsH
	3oqxkonKJZKWsZQI6vKj+QYMhWj2W/wrcjWytJBQSTyBw3R8c+OSDsYVsyBhah+55LoXXu
	V0/qLtp7/AYH0xuTrGhHICB1Nf5eMnJuHjFdRktVy8EpBF/H+CfsG3r84T/kWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=paranoidlabs.org;
	s=ed25519-20210101; t=1734385755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3I0qk6a7qhxVLhmwlLtiJNcdVZw3kV/gYRLr37doYUQ=;
	b=ei0zGmucIUgItibKGWTt/ckDyzu5TDrZTZ+6FDOrSH9w7YVlUmAaoottG1iiecX90Vwp9x
	UafUvIQLPilsTTBg==
From: Jakob Riepler <jakob+lkml@paranoidlabs.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Jakob Riepler <jakob+lkml@paranoidlabs.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v4] leds: pwm-multicolor: Disable PWM when going to suspend
Date: Mon, 16 Dec 2024 22:37:55 +0100
Message-ID: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
has to be disabled for the PWM to enter suspend.
Another positive side effect is that active-low LEDs now properly
turn off instead of going back to full brightness when they are set to 0.

Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig@pengutronix.de/
Signed-off-by: Jakob Riepler <jakob+lkml@paranoidlabs.org>
Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Changes in v2:
 - fix wrong line-breaks in patch
Changes in v3:
 - use git send-email
Changes in v4:
 - use correct address in s-o-b

 drivers/leds/rgb/leds-pwm-multicolor.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index e1a81e0109e8..f80a06cc31f8 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -50,7 +50,13 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
 			duty = priv->leds[i].state.period - duty;
 
 		priv->leds[i].state.duty_cycle = duty;
-		priv->leds[i].state.enabled = duty > 0;
+		/*
+		 * Disabling a PWM doesn't guarantee that it emits the inactive level.
+		 * So keep it on. Only for suspending the PWM should be disabled because
+		 * otherwise it refuses to suspend. The possible downside is that the
+		 * LED might stay (or even go) on.
+		 */
+		priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
 		ret = pwm_apply_might_sleep(priv->leds[i].pwm,
 					    &priv->leds[i].state);
 		if (ret)
-- 
2.47.1


