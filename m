Return-Path: <linux-leds+bounces-729-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D850C8441E8
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jan 2024 15:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08B151C2037A
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jan 2024 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA1F29CA;
	Wed, 31 Jan 2024 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXbrQOFl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14438185E
	for <linux-leds@vger.kernel.org>; Wed, 31 Jan 2024 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706711456; cv=none; b=ld/dFhL0XWvItdqUwWb+125jhq6MCXIZHZM2nZPDaCD/+meq4e2orE2+38bddQI0TIp8zQczw8IYzKslETpYcPguPVVbuL5YeQsqJSjqUfcBhjgMxzlIpcXTqW71g1QXPKnocXu/Vw1DrnvzsjpYSaVbArAOQ0txlxDKkWJqTlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706711456; c=relaxed/simple;
	bh=sgnd2hMXWPnLmDhXLSZ0Q1r8f3x2ZZVeTnOdkzOlRpU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=J/3C0WwwFzJVKLqiS/8DoRS66MuwkFL1M65mqWjlizn8hjVk/EUOJM42BqGvzg56DKuYK4WUhdAeTXbnQnIAeWv3xOkDa/xArzFh54ChliA4GwiGIpFHDQf90vpRzqt/faetXgq1Xo7OYwp/EuSPZkLqbXCQT0jX1icI9nL5neQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXbrQOFl; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cf206e4d56so59816291fa.3
        for <linux-leds@vger.kernel.org>; Wed, 31 Jan 2024 06:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706711453; x=1707316253; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZSnLDsiOLwnodm59pDZXE4IlIyhtKS6ys5WaZclqc=;
        b=SXbrQOFlyHaEnWBj2djJQ4c0LocEN+IJ+nQ4cz/9Cv7Nxc5eN27DsRBh6K2vPGXpRH
         wSRrt2njEmrzIzOdl4rVOi92lFTlokGzudp3NUjxwvcUhAzQZJ02vO6AvS7OprQA3U8L
         crwQtefjKB7ySpJmeQHpn75bTxN/PvVi9QYbnOhDpxTe/G7D0mNlOaMAVoEzg8PBVWMt
         9wjGI+zlQ5VusTFKamAXewvF0QyEo+3GsYfKG2Kj4UUfmsdpDJ7nS1iPsKDOOIwpqIaS
         uRXgg9p4njVeIK0Is5C0Hh0cY+uUIeyZpMAyfPAjdcDodElJkP8KhV21IAFLwJC6pgFm
         pOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706711453; x=1707316253;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKZSnLDsiOLwnodm59pDZXE4IlIyhtKS6ys5WaZclqc=;
        b=AoVcrnt0y47P3b+yiXd6JJ1R8EJqqGX/OyYYTkN8pA9xAP0mn9mG84DbPawwfnvir2
         zEvZoN56To0Qj9dxja+30accDab9wp7Aq3QhHcqYcaxbaXP4xo1jnt+e0rBldWRLV7O5
         uQcmvUzgDkgvA5HSlt4OOnu2EWofP/eydRBugOgUWmx5302+LB5wJntDkxwfCyhnn5hI
         GKYvUnMRQSsFGpA+V46nxbYAlgNrJ/2R8TJIg9P+n0Q4U+RJ6dasJYvMpsXuJo7TLl/M
         8GoMxOWYyTh4dnx44yoEo4VWb7Q6HwjTYADteXWKt+dR7jguFBmFunq4p7aXj+VDJf5s
         XsEQ==
X-Gm-Message-State: AOJu0Yw6wBykmHQMGpfYrMCEuUMoC8DkIgjsOhah14agy4T8R4c3VTAu
	GVZVSE83Y2g1G1bOi2PxUPV/8BttPQLkElRd7Xw63zBHGr8vQzJG
X-Google-Smtp-Source: AGHT+IEkHX6EHfvY+5/i9BfL6N103YjB2wgpslk6h9UIgDDIJGogpzj6VOgq0I4qNRpgJE6EsKV1+w==
X-Received: by 2002:a2e:b0e7:0:b0:2cd:7a4b:99f with SMTP id h7-20020a2eb0e7000000b002cd7a4b099fmr1258833ljl.48.1706711452656;
        Wed, 31 Jan 2024 06:30:52 -0800 (PST)
Received: from ?IPV6:2a01:c23:b988:d300:edee:b71e:7331:fed8? (dynamic-2a01-0c23-b988-d300-edee-b71e-7331-fed8.c23.pool.telefonica.de. [2a01:c23:b988:d300:edee:b71e:7331:fed8])
        by smtp.googlemail.com with ESMTPSA id g13-20020aa7c84d000000b0055c1433be60sm6051796edt.50.2024.01.31.06.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 06:30:52 -0800 (PST)
Message-ID: <ca185fb1-3a66-46b9-920e-bfecbe39c6bf@gmail.com>
Date: Wed, 31 Jan 2024 15:30:53 +0100
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
Subject: [PATCH] leds: trigger: stop exporting trigger_list
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

682e98564ffb ("leds: trigger: panic: Simplify led_trigger_set_panic")
removed the last external user of variable trigger_list. So stop
exporting it.
If in future a need should arise again to access this variable, I think
we better add some accessor instead of exporting the variable directly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
applies on top of for-leds-next
---
 drivers/leds/led-triggers.c | 2 +-
 drivers/leds/leds.h         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 71cb0aee5..371000770 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -23,7 +23,7 @@
  * Nests outside led_cdev->trigger_lock
  */
 static DECLARE_RWSEM(triggers_list_lock);
-LIST_HEAD(trigger_list);
+static LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 345062cca..1138e2ab8 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -30,7 +30,6 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
-extern struct list_head trigger_list;
 extern const char * const led_colors[LED_COLOR_ID_MAX];
 
 #endif	/* __LEDS_H_INCLUDED */
-- 
2.43.0


