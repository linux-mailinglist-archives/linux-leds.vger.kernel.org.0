Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD720577637
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 14:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbiGQMnI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 08:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbiGQMnH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 08:43:07 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657AB1572F;
        Sun, 17 Jul 2022 05:43:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ez10so16713367ejc.13;
        Sun, 17 Jul 2022 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYzoacsZMoWFZstDTYaMwcaR8lS9+roWWLsiPfEpSnk=;
        b=e4uJUwKO+QuZiIwn6MC8rXU63K4IQnrySJmVyWBlaYif3fEz+/I8FexF02N7TDtzwA
         zHQmFzbKcC93LA0JZiHT89zqpF8q04j3rxXpaIvh8yselMOnEWl3fZSN7p87Top8KD+1
         Ijkpgvmnde3BdhbD75TOHeFc2y+z6j7wvxTassSQY9kf7CdS/Ehe1bS7pjq5Y1B0+8VO
         LpEilgind89SzZKFYbSuPpOvdjAr3RejDAxvejRx6ZmfU5f+seWqjMbbArt9fgvLrH5u
         VIi6MJ8Eece+DJ0vZquVDkEU6XX131ME3J4wWi4FXqXoJYFmiYFUTl5MOYDL2bISl38o
         8yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYzoacsZMoWFZstDTYaMwcaR8lS9+roWWLsiPfEpSnk=;
        b=zLlEJJk2toEa1vVvoJqBAv9LgI07NN3ubgoPFEzp/opMepW0nfmSxR5sYJswXoXz6w
         9e4I7toydCDbNVm49xC44wueIoKq+n5sd4T4vdwq0DSqtHsAHYDvnjOIRxiolk+BSl7u
         H9yRLJEJJl+I3IheYukRWyJVkJncXUudI3JeLTxoxtDX84m/Pwd9Nh8w8cxpIH2N2Kra
         d66elJKSfgEtZStRaQ1awC5beCVauQQn4AgDEcz6whX6HbPjsJgM4IYgep9UqI9rYdXB
         mh2WYYY4Dc06CfSQWU4/f5h2eNrfIaOqeWmr5afkIFU3WGfw0JkG4sd4uNqHyyYrn936
         qwZg==
X-Gm-Message-State: AJIora+yZWmMq+K9zxFRp0qSeXdC8KUAm9KyaEfLs+YCgJHoTD2B6ZGM
        cX3yPJmhW7lokHftRbUz0vU=
X-Google-Smtp-Source: AGRyM1sttkl1O/1N7usBItncy6DZS9ukz2ekFShxJ2xUrrGYNYHYHmSTZlR9vyWolD2P98D++QtOfA==
X-Received: by 2002:a17:907:1def:b0:72b:33e6:46d6 with SMTP id og47-20020a1709071def00b0072b33e646d6mr21444035ejc.414.1658061784949;
        Sun, 17 Jul 2022 05:43:04 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b0043a64eee322sm4520588edq.28.2022.07.17.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:43:04 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-leds@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] leds: leds-bcm63138: get rid of LED_OFF
Date:   Sun, 17 Jul 2022 14:42:48 +0200
Message-Id: <20220717124248.13562-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717124248.13562-1-zajec5@gmail.com>
References: <20220717124248.13562-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

The whole "enum led_brightness" is marked as obsolete. Replace it with a
(non-)zero check.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/blink/leds-bcm63138.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index c083cb1332cb..2cf2761e4914 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -113,8 +113,7 @@ static void bcm63138_leds_enable_led(struct bcm63138_leds *leds,
 {
 	u32 bit = BIT(led->pin);
 
-	bcm63138_leds_update_bits(leds, BCM63138_SW_DATA, bit,
-				  value == LED_OFF ? 0 : bit);
+	bcm63138_leds_update_bits(leds, BCM63138_SW_DATA, bit, value ? bit : 0);
 }
 
 /*
-- 
2.34.1

