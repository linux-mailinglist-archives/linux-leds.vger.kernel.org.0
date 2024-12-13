Return-Path: <linux-leds+bounces-3601-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F32EB9F15AF
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 20:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F075188D31B
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 19:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4071684AC;
	Fri, 13 Dec 2024 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b="Z+6zO/ak";
	dkim=pass (2048-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b="JcwlwK3z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hypatia.paranoidlabs.org (hypatia.paranoidlabs.org [45.11.248.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B71E501C;
	Fri, 13 Dec 2024 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.11.248.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734117614; cv=none; b=Ef1+JKOtpzx0Sx/QdxqWSle8fgdJl0GWWwttMlwlAwSEqodRnHN4vChtBh7NbyIdcbY1ZImVgVWDwY7kHdQwgw8mvieVYvyY/0feKJEjmdlgb7MFDnPmnMA7TM8uLOy5IbcdAxouJeVq1icI2IbTxSfH0HS/Kzw4fHqbK/65qY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734117614; c=relaxed/simple;
	bh=9OoqmauZQxohnJFZN4P+wamIlR3i4wpOOCK/m7yVa1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOb3YNRRKztQbASFravCa/Fo7W2ouRQ21tjispCafsSdoZcr5Cwq4h9nf1YkNrTy/E7zLxSwuorZJyypcd4oySAQeHAjHcuCHqt1E2kKk8s+qmOjy4KTENHHUWLAZT0kTfxTAxwopL3xb+XLV2cs5T77cIJDhJmu5OqqToyI5b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paranoidlabs.org; spf=pass smtp.mailfrom=paranoidlabs.org; dkim=permerror (0-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b=Z+6zO/ak; dkim=pass (2048-bit key) header.d=paranoidlabs.org header.i=@paranoidlabs.org header.b=JcwlwK3z; arc=none smtp.client-ip=45.11.248.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paranoidlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paranoidlabs.org
Received: from caph.lan (unknown [IPv6:2a02:1748:dd4e:ded0::3ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hypatia.paranoidlabs.org (PlabsMail) with ESMTPSA id C2F621DB80;
	Fri, 13 Dec 2024 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=paranoidlabs.org;
	s=ed25519-20210101; t=1734117191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ8n5rTevTsEagDkA9CThrufiGSWMm/mG2qZW+/pzSQ=;
	b=Z+6zO/ak+dNkVat4nDjkQYeN5w9UZrge2k44A1oF5xuLUhqTJu2ybLMp6O5LSOwM9JoUwr
	8ObkavOgfgMOUqAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paranoidlabs.org;
	s=rsa-20210101; t=1734117191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ8n5rTevTsEagDkA9CThrufiGSWMm/mG2qZW+/pzSQ=;
	b=JcwlwK3z7+TjYCQwVsn6bMMZPrYZAq/gd7D49TkqWNGarXxSfHMCeahfkhqfZ0JEzLNBNL
	BD8xXppPnNiyyy0FLxQQOuh9SBU4/2rh0TQXy/TthEZVb74KH3cP8RlPlnQflFZZXNZUBd
	DA80P/FWaaNGLZ4HLVxPcViqSSaj6QBhds78Ju/nRD06t3F4gEy9jmcn/+3ugxjiAvE881
	03is+8bP34LHLsoqsvioePvTHgask0Wpy62vG/5psd0qKoYtT9Tp1uhwWRElMC2hMhEQql
	YGLSDd2sAB/LOWdoQjqhd6b8WAE3AOED8BfUL+oggA9plmP0ARqoLIfxE0duXg==
From: Jakob Riepler <jakob+lkml@paranoidlabs.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Jakob Riepler <jakob+lkml@paranoidlabs.org>,
	Jakob Riepler <jakob+lkml@chaosfield.at>
Subject: [PATCH v3] leds: pwm-multicolor: Disable PWM when going to suspend
Date: Fri, 13 Dec 2024 20:10:41 +0100
Message-ID: <20241213191039.181169-3-jakob+lkml@paranoidlabs.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213163445.GA2418536@google.com>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at> <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at> <20241212174356.GJ7139@google.com> <d021d011-d5d4-4692-973a-f5a45be8db94@chaosfield.at> <20241213163445.GA2418536@google.com>
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
Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>
---
Changes in v2:
 - fix wrong line-breaks in patch
Changes in v3:
 - use git send-email

Sorry for the issues.
I'm using git send-email with a different mailserver now so the patch
formatting should now be correct - at least in my tests git am was
happy now.

Best regards
Jakob

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


