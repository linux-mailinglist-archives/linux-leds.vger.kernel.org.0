Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D4067C17E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Jan 2023 01:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjAZAZZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Jan 2023 19:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235773AbjAZAZW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jan 2023 19:25:22 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E8A62D29
        for <linux-leds@vger.kernel.org>; Wed, 25 Jan 2023 16:25:19 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id kt14so1152866ejc.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Jan 2023 16:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWJPaMXoH2PrQS6MMYyiTrpadygd8fEOfJS6Z2yu7Wk=;
        b=GVfiLyBjO/3PtwYrQ9lPdzDSU16lro04OGdbj/pvVeutN4lQQ/RlpnuTRuK1UVP2iS
         Xc/i6ZRqCLD1KyXf3DQ5g5yQ2GnuXG3sDADkCtXL7X544EQa++Ma4S5cyS/NKUPQj3NB
         rVBQ+Kt4N4x5cy9btk3nuMpSnkQYsB9RpZlio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWJPaMXoH2PrQS6MMYyiTrpadygd8fEOfJS6Z2yu7Wk=;
        b=4ZFtK0JLLMakizTLbT7WiCjjK0sFRaRx0zA0qI0DkPXmZmy2AGrAYABqmykJJ5Gocx
         qOrnpe3trergVsgIMVdOYVBlq/yYUpWBqfWD89MaSQd8G9SZFsPLw9ew5eD61FglkQY1
         ZxZZsoLirKWojmMTCywHThBij9zVUtlTKl73IgkH7R6LYkORAeAPXMo3roaVNNhMVkfC
         XagWZTL3+sexglUtd7mTiMJSwv7rN6rojpszQvAIAD0wb1iOKaMw+eTtGtNluVLZuHDn
         8aRC6D040QdFa4aOUxnzsFn5knXESrANQgQrJQiLL9A+xQEkdR2nnyCCxkJRAwQo9G9z
         bW7Q==
X-Gm-Message-State: AFqh2kqYTTi194Yd9b7qPJiw1qsRtEcMNfZe7n1homumTHPhUjk0OvXX
        bbkuEL97paOK/9V839bBO1QvpA==
X-Google-Smtp-Source: AMrXdXv+0BffhjLuqkEBd9lTBLw8uv8bcIerolRnD+gWDGLAHMoX4oyLDYgnS4xQpZ51+Q09mCh2Rw==
X-Received: by 2002:a17:906:d9db:b0:86e:2c11:9bd5 with SMTP id qk27-20020a170906d9db00b0086e2c119bd5mr37329496ejb.56.1674692718215;
        Wed, 25 Jan 2023 16:25:18 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id jy12-20020a170907762c00b008784e808553sm555707ejc.6.2023.01.25.16.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 16:25:17 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Thu, 26 Jan 2023 00:24:56 +0000
Subject: [PATCH 4/5] HID: dualshock4_remove: manually unregister leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v1-4-9a5192dcef16@diag.uniroma1.it>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674692715; l=1198;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=LeHfl1tt40cP85uXQcC/duWnRACVmqzbUtWz/wcGE/A=;
 b=xsUYK5juv7Wd5lxRVyEZM0ZE5k03Jar9TWnZDsr7679SNhg6ZPP9DAsElhLipGvZoG+8NpBp9OjA
 +it8s7MyANzuraxYDILrnI0OGpiH11w71JNTPyFZts88djtiHerU
X-Developer-Key: i=borrello@diag.uniroma1.it; a=ed25519;
 pk=4xRQbiJKehl7dFvrG33o2HpveMrwQiUPKtIlObzKmdY=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Unregister the LED controller before device removal, as
dualshock4_led_set_brightness() may schedule output_worker
after the structure has been freed, causing a use-after-free.

Fixes: 4521109a8f40 ("HID: playstation: support DualShock4 lightbar.")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-playstation.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 9e23860b7e95..6fae5a24eaad 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2432,11 +2432,15 @@ static void dualshock4_remove(struct ps_device *ps_dev)
 {
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	unsigned long flags;
+	int i;
 
 	spin_lock_irqsave(&ds4->base.lock, flags);
 	ds4->output_worker_initialized = false;
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
+	for (i = 0; i < ARRAY_SIZE(ds4->lightbar_leds); i++)
+		devm_led_classdev_unregister(&ps_dev->hdev->dev, &ds4->lightbar_leds[i]);
+
 	cancel_work_sync(&ds4->output_worker);
 
 	if (ps_dev->hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE)

-- 
2.25.1
