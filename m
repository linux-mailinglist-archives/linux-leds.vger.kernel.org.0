Return-Path: <linux-leds+bounces-442-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9781769E
	for <lists+linux-leds@lfdr.de>; Mon, 18 Dec 2023 17:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E0F1F24E9A
	for <lists+linux-leds@lfdr.de>; Mon, 18 Dec 2023 16:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351C83D574;
	Mon, 18 Dec 2023 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2pogMJi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC63D54C
	for <linux-leds@vger.kernel.org>; Mon, 18 Dec 2023 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2345aaeb05so189109366b.0
        for <linux-leds@vger.kernel.org>; Mon, 18 Dec 2023 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702915302; x=1703520102; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4kNm6pSIuzmPH9CbL1idzIsDkCrwAljqL7FtVGST2c=;
        b=N2pogMJiAm9VJVj1yKsuU4PNA+Oi1T/9Os+4fJB8tOhuqud4YIqQyjYxWvTNEZPEi7
         GeaVkJvb53pnUNwWer2foJmgOUg1GRBg9t+MuH+GqMDN9IAWbYhkd6wX0CbSiSqZ7umj
         bgmcqaYyhMCw3ANQRT/cctg6VE1pF8nADQcZ0e42xZ3vj+YgrkU+k9s9Wu3Bj6wlEWdr
         K0CvSFzy4iUHbeAZayspwQ5v/IWmeVIuayCcB4BtDLvSZkblrqG2Tt9MZMLa5eaiFOv5
         U1CnYCTCEvW4VXIpo5yJjY0FrsOKomOeZMxjEcxn0LCx7BE9qzBe1YLx1jE13rSvHDyc
         3cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915302; x=1703520102;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4kNm6pSIuzmPH9CbL1idzIsDkCrwAljqL7FtVGST2c=;
        b=TlEB16wxaf0xZHjq2JKps10SSpY2TgM/hOKKQqIio42fOr5v5BFjSxXcKsfLQulH7H
         OZ+3jIxfVOhh3dhVPSIKQyO7+bSO20vk9CA9DM9PCBKb9FodnktHV1LeQuCcYNzbY/f9
         mJi3NIGxWlSvga187ndgqohYCJIvD6r1xjhVth89wis06vZVjbX54u9Zu8mg1fze0xWK
         aNlPW621NUnbf0eyc0osYnp6niftTCYrxZPhOmPE8jPxKyYRwLoyZhJ8PcDu2SBJNzsR
         yOSHAz08QUjbhKBnehtfmrm6JV5Bf/tmrpDaUBAxxOXEMkaEvf3OlN48RA33Hk7N3C0F
         PL7A==
X-Gm-Message-State: AOJu0Yw810zBxhj1tmtCJE0pIWShb/jsUo+8MDMYkMAefP2dg+PcmFdX
	waSJ4gI89my6bgIekM4MGHA=
X-Google-Smtp-Source: AGHT+IExKiVy9aqHl3M3+kmlDUxnuNIY7kNIjNnjZP1e/W/BxC3p8pL4RqX7Cyvl70WYRVeGeLKEtQ==
X-Received: by 2002:a17:906:33d7:b0:a23:4c5d:dab4 with SMTP id w23-20020a17090633d700b00a234c5ddab4mr1109813eja.62.1702915299088;
        Mon, 18 Dec 2023 08:01:39 -0800 (PST)
Received: from ?IPV6:2a01:c22:7744:1300:ac89:da88:4c31:cd86? (dynamic-2a01-0c22-7744-1300-ac89-da88-4c31-cd86.c22.pool.telefonica.de. [2a01:c22:7744:1300:ac89:da88:4c31:cd86])
        by smtp.googlemail.com with ESMTPSA id vi7-20020a170907d40700b00a1dc7e789fbsm14191169ejc.21.2023.12.18.08.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 08:01:38 -0800 (PST)
Message-ID: <91f7f2aa-b666-450a-b970-967b1b06fe9a@gmail.com>
Date: Mon, 18 Dec 2023 17:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The current codes uses the sw_control path in set_baseline_state() when
called from netdev_trig_activate() even if we're hw-controlled. This
may result in errors when led_set_brightness() is called because we may
not have set_brightness led ops (if hw doesn't support setting a LED
to ON). In addition this path may schedule trigger_data->work what
doesn't make sense when being hw-controlled.

Therefore set trigger_data->hw_control = true before calling
set_device_name() from netdev_trig_activate(). In this call chain we
have to prevent set_baseline_state() from being called, because this
would call hw_control_set(). Use led_cdev->trigger_data == NULL as
indicator for being called from netdev_trig_activate().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve commit message
---
 drivers/leds/trigger/ledtrig-netdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 7ed2d0b64..b58396600 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -251,7 +251,11 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 
 	trigger_data->last_activity = 0;
 
-	set_baseline_state(trigger_data);
+	/* skip if we're called from netdev_trig_activate() and hw_control is true */
+	if (!trigger_data->hw_control ||
+	    led_get_trigger_data(trigger_data->led_cdev))
+		set_baseline_state(trigger_data);
+
 	mutex_unlock(&trigger_data->lock);
 	rtnl_unlock();
 
@@ -568,8 +572,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 		if (dev) {
 			const char *name = dev_name(dev);
 
-			set_device_name(trigger_data, name, strlen(name));
 			trigger_data->hw_control = true;
+			set_device_name(trigger_data, name, strlen(name));
 
 			rc = led_cdev->hw_control_get(led_cdev, &mode);
 			if (!rc)
-- 
2.43.0


