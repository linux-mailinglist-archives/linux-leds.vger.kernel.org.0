Return-Path: <linux-leds+bounces-730-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A778441ED
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jan 2024 15:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4A741F25B85
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jan 2024 14:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC3A6025D;
	Wed, 31 Jan 2024 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6LPTqMz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9841AAB
	for <linux-leds@vger.kernel.org>; Wed, 31 Jan 2024 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706711592; cv=none; b=HOpvyd9OqThvxj4yl6GyhJsSYp7Tq/JQs6lkeTCMM009pMmCtdmwBXCW2PiNkPnst7Hx2l2B0YWrOLgcPG+nXuChDWVRQo5rjrs3hpQUNHychQkQ9V4mafLKoEmCc03Iw28Tqs+WxjwSqMA1YQ9cqADHV9o5HLScZaInVxh76PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706711592; c=relaxed/simple;
	bh=GO+QLibzYm83+uiYMNxfuVGMv3iS1EPcP/eGq5tX3ks=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HFKS4fcN6G39M7aCG060chqoR3iF4X/HbEpW/0Vadqpu2PpyCKMHd43h2Q0S1fCQO8SfUp5yMBePCHA/QN/BhmdJ64bXqeicoVquAXfpGAzs+BGNZhHs5urCqdeYSIZDN+mpNMa8EjIdtxatDNWXKplSdSz2Op4wsNi/TJqMviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6LPTqMz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a35e9161b8cso419684766b.3
        for <linux-leds@vger.kernel.org>; Wed, 31 Jan 2024 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706711588; x=1707316388; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wti05TkZJBThH80GoMGTtqnfsj2P5rGLyYemFKuXAxM=;
        b=Z6LPTqMzZZXWXG1cM4giBMEr6z4PSQp8kj47OvCcWks579Zys3gtL26hCYwlWibwo7
         9TwZJa2xbnxZbZ3yQcAhMgQLavks+/f2FvL+jZATvLmGlDGupzanYaz6E6jb4kZwCJ4+
         Bzlfoa573U2q0AFuW65q4JkhFFdP+eLXptLhD16aljQRfXmxY2jCZ4DSTFEMJZ6yrql8
         lOQVventXbl57nlsdwThptTolJ0SyuEHq3oKCst61Eu+9LSdsWyscDtYLPvg4AgzpmFU
         lXTEqtIzkPkG2RyaSbTQW1F4sW56avrgu2X7BCoupJEE8RK4VaPq84kKx0tcUwbZ4CPT
         cPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706711588; x=1707316388;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wti05TkZJBThH80GoMGTtqnfsj2P5rGLyYemFKuXAxM=;
        b=Pm7bMMxP66SJ7FR7OSRO+TS9D0Sjm/y4/LxVEaUe2lRvIgHP6XmGca29rVrJvrEuSn
         UgY8MxCGoXqHHKprWUQm3NziudcD4bF0DA0NSV+NPDuVQyGzleAAio3gDItPesozsQOE
         +jyGHHw1Y5Fa6gXpDyWMGEUMRDcVllR+3vPJnVs4mGlVn01LST7dufywPhzEiVvcveQ4
         7hBjlPQNM8FM7vbtUXvkUNK9u8MKSZTewMGJY/60QzBYK1d7wHOfSvmuByvEo8qTn6mS
         3qhiI4hknlO09VND1SVP48W9b5/Kuf4rmlQzqU5tw1VuGTTDHY+YxIud3t0bDqaRIdQ8
         MAfA==
X-Gm-Message-State: AOJu0Yy2+Q1hyyXOYz4e2YW3DimbBefi42tZprdq1G8PhW8nccLN/BD9
	IbQqwRqpMccToS8vkdRxYmu9dDPi7wXnOmc4I9GrLWHyCzhZjmWd
X-Google-Smtp-Source: AGHT+IFPjVl2fr6Nk+yhhsn8zoP9MIj/KisGobz0v83mH0HEw8QLdJuUrmNcuwSup4Ac/mC7DjaoKg==
X-Received: by 2002:a17:906:aec4:b0:a36:1fa2:30b0 with SMTP id me4-20020a170906aec400b00a361fa230b0mr1141614ejb.40.1706711588157;
        Wed, 31 Jan 2024 06:33:08 -0800 (PST)
Received: from ?IPV6:2a01:c23:b988:d300:edee:b71e:7331:fed8? (dynamic-2a01-0c23-b988-d300-edee-b71e-7331-fed8.c23.pool.telefonica.de. [2a01:c23:b988:d300:edee:b71e:7331:fed8])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm6286692ejb.54.2024.01.31.06.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 06:33:07 -0800 (PST)
Message-ID: <d78eef6f-c18c-4546-b83e-6d1890849154@gmail.com>
Date: Wed, 31 Jan 2024 15:33:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: triggers: Add helper led_match_default_trigger
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Avoid code duplication and factor out common functionality to new
helper led_match_default_trigger().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
applies on top of for-leds-next
---
 drivers/leds/led-triggers.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 371000770..0f5ac3005 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -247,6 +247,19 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+static bool led_match_default_trigger(struct led_classdev *led_cdev,
+				      struct led_trigger *trig)
+{
+	if (!strcmp(led_cdev->default_trigger, trig->name) &&
+	    trigger_relevant(led_cdev, trig)) {
+		led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
+		led_trigger_set(led_cdev, trig);
+		return true;
+	}
+
+	return false;
+}
+
 void led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
@@ -258,13 +271,9 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name) &&
-		    trigger_relevant(led_cdev, trig)) {
-			found = true;
-			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
-			led_trigger_set(led_cdev, trig);
+		found = led_match_default_trigger(led_cdev, trig);
+		if (found)
 			break;
-		}
 	}
 	up_write(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
@@ -306,12 +315,8 @@ int led_trigger_register(struct led_trigger *trig)
 	down_read(&leds_list_lock);
 	list_for_each_entry(led_cdev, &leds_list, node) {
 		down_write(&led_cdev->trigger_lock);
-		if (!led_cdev->trigger && led_cdev->default_trigger &&
-		    !strcmp(led_cdev->default_trigger, trig->name) &&
-		    trigger_relevant(led_cdev, trig)) {
-			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
-			led_trigger_set(led_cdev, trig);
-		}
+		if (!led_cdev->trigger && led_cdev->default_trigger)
+			led_match_default_trigger(led_cdev, trig);
 		up_write(&led_cdev->trigger_lock);
 	}
 	up_read(&leds_list_lock);
-- 
2.43.0


