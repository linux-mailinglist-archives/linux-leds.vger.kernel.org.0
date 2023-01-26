Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABEA767C17C
	for <lists+linux-leds@lfdr.de>; Thu, 26 Jan 2023 01:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjAZAZ0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Jan 2023 19:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbjAZAZW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jan 2023 19:25:22 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E86D611D4
        for <linux-leds@vger.kernel.org>; Wed, 25 Jan 2023 16:25:20 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id me3so1101534ejb.7
        for <linux-leds@vger.kernel.org>; Wed, 25 Jan 2023 16:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBEBor+gnsfUYPOUW+OLBqnWMEjDoXQsh85+8ApHEhw=;
        b=kYwY+kVYV/Q1HAOK4nSWSqU2aS/vnszT5DoWgnuvCPJlFXba9yQLFA32M1r81JvmLW
         k1po+3OJS2h04DoboLdK9AkYAfNIgjf6/OU6G6hwVSzXajteF2EdZ9HvGJFRvNheNsBh
         r938rP9fDZbvnBT/zlgk1G3bNX5iZ4ZLw0/Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBEBor+gnsfUYPOUW+OLBqnWMEjDoXQsh85+8ApHEhw=;
        b=gEEpvl77z54RpAYbi0Rqlg1A7wcbHv3fsF3pLiQtP+9XKrriQZLBmUZuHjyh7iD4QK
         g+xs2/OImx7it4iTTjQtE0c7KcJQACUOdEQK2uvW0HoQe6xvSu3/6CETqokaK6dTn513
         hOZRJlbiMyYpx/L0oBl7J7KZLLpoY4/Acizpl6NdoDqDK3B1sPBZi1oL/Zvhvmd4aU4u
         NRu3ByOp6hq/4BNvAscy8jO5y9tLkeCdYlXuJRtOPrSqNyiaQK6GRqBXTp+3CUnpq0ff
         7WLIhEZv7F6GZVv0UWelGlOrZdgLn0JU7/KtSQbNoppT2R9aP6ov9cA1GBaKYCy8rB8n
         tx+g==
X-Gm-Message-State: AFqh2kqFvEI2IZO8/I8ZmtLnvShAFyojgRYP1bejTsiY6tJ/zVp+rpTc
        i1zRXNI1Br0KyXOmT+pi7O9Fhg==
X-Google-Smtp-Source: AMrXdXvJIC2UGnr/1hfI3axwW49AFykjf04VfF8qw+mj4LupHpC31heF7B0mpWUctTgn/O1q9rIN/A==
X-Received: by 2002:a17:906:6c97:b0:870:34c:97cd with SMTP id s23-20020a1709066c9700b00870034c97cdmr36269656ejr.25.1674692718718;
        Wed, 25 Jan 2023 16:25:18 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id jy12-20020a170907762c00b008784e808553sm555707ejc.6.2023.01.25.16.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 16:25:18 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Thu, 26 Jan 2023 00:24:57 +0000
Subject: [PATCH 5/5] HID: sony_remove: manually unregister leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v1-5-9a5192dcef16@diag.uniroma1.it>
References: <20230125-hid-unregister-leds-v1-0-9a5192dcef16@diag.uniroma1.it>
In-Reply-To: <20230125-hid-unregister-leds-v1-0-9a5192dcef16@diag.uniroma1.it>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>,
        Carlo Caione <carlo@endlessm.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Sven Eckelmann <sven@narfation.org>
Cc:     linux-leds@vger.kernel.org,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Pietro Borrello <borrello@diag.uniroma1.it>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674692715; l=1310;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=ZOrIdJOdwJPCFoQ8po11GD9ZIwbv+SiF+0joUOhG2lc=;
 b=yDx0s+P1ZVx5mqJlSm2mB+LHUgB4rhTcR2ZrYHpbnNZXiW2UzAypHnRsFGPsPUP2VDdK7g70wdPh
 6a6ui0PpAfe1uO8u0jYA4LK0oT6VyntdmYWUHPnsYRHg9jDtnQJr
X-Developer-Key: i=borrello@diag.uniroma1.it; a=ed25519;
 pk=4xRQbiJKehl7dFvrG33o2HpveMrwQiUPKtIlObzKmdY=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Unregister the LED controller before device removal, as
sony_led_set_brightness() may schedule sc->state_worker
after the structure has been freed, causing a use-after-free.

Fixes: 0a286ef27852 ("HID: sony: Add LED support for Sixaxis/Dualshock3 USB")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-sony.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 13125997ab5e..146677c8319c 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -3083,6 +3083,7 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static void sony_remove(struct hid_device *hdev)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
+	int n;
 
 	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
 		del_timer_sync(&sc->ghl_poke_timer);
@@ -3100,6 +3101,13 @@ static void sony_remove(struct hid_device *hdev)
 	if (sc->hw_version_created)
 		device_remove_file(&sc->hdev->dev, &dev_attr_hardware_version);
 
+	if (sc->quirks & SONY_LED_SUPPORT) {
+		for (n = 0; n < sc->led_count; n++) {
+			if (sc->leds[n])
+				devm_led_classdev_unregister(&hdev->dev, sc->leds[n]);
+		}
+	}
+
 	sony_cancel_work_sync(sc);
 
 	sony_remove_dev_list(sc);

-- 
2.25.1
