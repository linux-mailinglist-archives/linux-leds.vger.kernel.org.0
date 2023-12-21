Return-Path: <linux-leds+bounces-471-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8F81BD46
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 18:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 738C11C21092
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 17:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4C15991D;
	Thu, 21 Dec 2023 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZk/6WCi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142A62803
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54c7744a93fso1250616a12.2
        for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703179909; x=1703784709; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sl4xWaa/YanOYUDyLRwIulVIaM5N2PZrG0JXFZvNw0w=;
        b=QZk/6WCi7oZZRW/kavwtnX6ns6o5i0RjGYr+FrSoWb/UKwJNwHEN+f6SFiRVR4mf54
         2UBX3jYvnkihFN+fvK4VG676xnvliomALl6FbaP7NhpTxJACG5fXZzNFkuxdRBdwxQAK
         yOWjrjkAdvm7dBClbFEfmmA2ko7VZ55m26YyINOEbr7cd9FcvQpM1H3vsu9AeTP8gBlp
         U90HB8ro111mLguyzoPRbMyS5jOI4qiD2055LTPC1yqjqUxfAT/6GCauRrpHD+8cfFOA
         IMONGaAMrHyPhQobIp+1VHFZYoOe1FZ0IV7zngpN2TCxvZ1ITNbv1G05f/tL353NzEyi
         QVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703179909; x=1703784709;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sl4xWaa/YanOYUDyLRwIulVIaM5N2PZrG0JXFZvNw0w=;
        b=Wjh9iei1x3lscEdnc4WmGXu4er3E09PN6oZaXyEzleCdRGS9LSBiQfFoTerj2EAQyY
         uUxKgGqUCgrUK+5XK+HMEEH3EQfRduBY6eI08xMTegHp4ubURMes1fv8r2PehXrTX9eZ
         2gGHEq881K4VPkx3LvKtbVXD7hQTAeIQgqu7NllzGcmVuWzIticvLmw9Eb7AAd+uuuU9
         oAQEVIAVPpfpYTCoG4nLNgugo+UxJlKkAvmOYpbfgUzdnNlzHG5wiNbSWQHi112gTwEQ
         l6zu2dYLHuzTITUQtmoWapTEB/xs/5il+Lw9MsI3aQb9SuFEFFn3Pj+WibhwAiw0OXCH
         AWWQ==
X-Gm-Message-State: AOJu0YwN8f9E8TGzCm7I1JMtJFy22MlXLKARuA5NkhG5yHzEjQsHW4yV
	B6aRqEmPwBuLFZX9YeoOmt4=
X-Google-Smtp-Source: AGHT+IHT+EKXmB8NSq2LESn1Z0rHQuklZWKA6IyL2qnJOnxdzZ7xctOuzZXKpSRWy5ZVR/j+PSEAFQ==
X-Received: by 2002:a50:d70a:0:b0:552:e9d1:5dc6 with SMTP id t10-20020a50d70a000000b00552e9d15dc6mr5201597edi.14.1703179909345;
        Thu, 21 Dec 2023 09:31:49 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870? (dynamic-2a01-0c23-b8a5-3600-c010-4b2f-ccc7-a870.c23.pool.telefonica.de. [2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870])
        by smtp.googlemail.com with ESMTPSA id f19-20020a056402069300b0054c9b0bd576sm1415575edy.26.2023.12.21.09.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 09:31:48 -0800 (PST)
Message-ID: <d3f2859c-2673-401c-a4f7-fcaef2167991@gmail.com>
Date: Thu, 21 Dec 2023 18:31:48 +0100
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
Subject: [PATCH v4] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The current codes uses the sw_control path in set_baseline_state() when
called from netdev_trig_activate() even if we're hw-controlled. This
may result in errors when led_set_brightness() is called because we may
not have set_brightness led ops (if hw doesn't support setting a "LED"
to ON). In addition this path may schedule trigger_data->work which
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
v3:
- spelling and style fixes
v4:
- rebased on top of for-leds-next
---
 drivers/leds/trigger/ledtrig-netdev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 836610292..192662e05 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -275,7 +275,10 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 
 	trigger_data->last_activity = 0;
 
-	set_baseline_state(trigger_data);
+	/* Skip if we're called from netdev_trig_activate() and hw_control is true */
+	if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
+		set_baseline_state(trigger_data);
+
 	mutex_unlock(&trigger_data->lock);
 
 	return 0;
@@ -614,8 +617,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 		if (dev) {
 			const char *name = dev_name(dev);
 
-			set_device_name(trigger_data, name, strlen(name));
 			trigger_data->hw_control = true;
+			set_device_name(trigger_data, name, strlen(name));
 
 			rc = led_cdev->hw_control_get(led_cdev, &mode);
 			if (!rc)
-- 
2.43.0

