Return-Path: <linux-leds+bounces-327-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BAA80B6F6
	for <lists+linux-leds@lfdr.de>; Sat,  9 Dec 2023 23:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BACF81F20F5B
	for <lists+linux-leds@lfdr.de>; Sat,  9 Dec 2023 22:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66A61B277;
	Sat,  9 Dec 2023 22:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObX8zToo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331EBC1
	for <linux-leds@vger.kernel.org>; Sat,  9 Dec 2023 14:54:53 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so4587122a12.3
        for <linux-leds@vger.kernel.org>; Sat, 09 Dec 2023 14:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702162491; x=1702767291; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3UgeLVASaTzqbQAZ7qi6lQglLBmMj1s7RI0m2iUmhQ=;
        b=ObX8zToo9Xrq7Jn3mEsR+yM4WDApCGqn7NBSSKapsrXE1AdC+IAIhprrW997bdAkuJ
         HLOXvrYEt7dg54fSkYi5hQwEa4TtiUkP3dT9Y5B3obKXL5/j4NN3O/jL0F9Xur/eXvFt
         +QwYTFdC3w5mTLUT+heUGKpzuuLhx5iSo2zBRkzru9Tm7457t2B+LD/wvQqEiMwAHdSd
         a3U0EFkSWeESzL0EgMcKe9hs1jzOwz3MJar1GY+pvNShCgQJhfsf6cbUsGVDpICZTa6q
         iUxn6NSzlNEOG1JQ4J73XTISGH3JxEDm1i+XGAhSL6ZfkyLs21jVhxY6J3j8sDdrX97y
         KeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702162491; x=1702767291;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3UgeLVASaTzqbQAZ7qi6lQglLBmMj1s7RI0m2iUmhQ=;
        b=bGOo44c6v9sdpdY1ezy46BE6Su7uzWoN6SplZk64sIpvMlVNOiLSLR9v5xyJXcKfu4
         Llsnx5joDJz4LFdkw6wP3q9dyNUwwmLvyBxbL/DhNgNLBJnbL17prtEmEK78KehNGNbW
         vO4plmja8lBoyncnXVFM0MaerZ37MQQlPBXeriVIXLSt/pT/J2USXw3kQgU0AUrbrcbz
         Y/txBsZK4Blb679EZ6DGEbfeD/UDxsNzH1I0+2ngaaHyWAq+F3peVzfY04vF/NJX33ot
         Z5o6D+oCPN7LkvrWoQaXuk09o+EIQUVU31PVi5rumlWQmdVaKVlwpqWNOvwzJo4n4amF
         WpPA==
X-Gm-Message-State: AOJu0Yywcad73tku/yGoFRLcLXRoTLzrI6qb0LuWD0K+RiNiJD3HEdS3
	HPrG3PGN3MNpOGCOd6zhlOc=
X-Google-Smtp-Source: AGHT+IEgMsQYf2gYOb+hDQEfE5jWvpD1nFl2yX46VDCI9syj7lAy/Vzo2Mqb2xTyFNgdcGDx2dn2GA==
X-Received: by 2002:a17:906:f852:b0:a1c:7a18:b506 with SMTP id ks18-20020a170906f85200b00a1c7a18b506mr531695ejb.121.1702162491082;
        Sat, 09 Dec 2023 14:54:51 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f10:8000:d512:8b24:38b6:5405? (dynamic-2a01-0c22-6f10-8000-d512-8b24-38b6-5405.c22.pool.telefonica.de. [2a01:c22:6f10:8000:d512:8b24:38b6:5405])
        by smtp.googlemail.com with ESMTPSA id tz9-20020a170907c78900b00a19afc16d23sm2718450ejc.104.2023.12.09.14.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 14:54:50 -0800 (PST)
Message-ID: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
Date: Sat, 9 Dec 2023 23:54:51 +0100
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
Subject: [PATCH] leds: trigger: panic: simplify led_trigger_set_panic
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I don't see why we iterate over all triggers to find the panic trigger.
We *are* the panic trigger. Therefore we also know that the panic
trigger doesn't have an activate() hook. So we can simplify the code
significantly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-panic.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
index 72297a845..c646a3cbc 100644
--- a/drivers/leds/trigger/ledtrig-panic.c
+++ b/drivers/leds/trigger/ledtrig-panic.c
@@ -21,24 +21,15 @@ static struct led_trigger *trigger;
  */
 static void led_trigger_set_panic(struct led_classdev *led_cdev)
 {
-	struct led_trigger *trig;
+	if (led_cdev->trigger)
+		list_del(&led_cdev->trig_list);
+	list_add_tail(&led_cdev->trig_list, &trigger->led_cdevs);
 
-	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (strcmp("panic", trig->name))
-			continue;
-		if (led_cdev->trigger)
-			list_del(&led_cdev->trig_list);
-		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
+	/* Avoid the delayed blink path */
+	led_cdev->blink_delay_on = 0;
+	led_cdev->blink_delay_off = 0;
 
-		/* Avoid the delayed blink path */
-		led_cdev->blink_delay_on = 0;
-		led_cdev->blink_delay_off = 0;
-
-		led_cdev->trigger = trig;
-		if (trig->activate)
-			trig->activate(led_cdev);
-		break;
-	}
+	led_cdev->trigger = trigger;
 }
 
 static int led_trigger_panic_notifier(struct notifier_block *nb,
-- 
2.43.0


