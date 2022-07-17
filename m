Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58AE577635
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 14:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiGQMnG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 08:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbiGQMnF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 08:43:05 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EE115A2E;
        Sun, 17 Jul 2022 05:43:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id mf4so16791259ejc.3;
        Sun, 17 Jul 2022 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KE97/SBmhO7aw3gFJCxcKM7p1dKmYViOU/YqYue35DU=;
        b=HHyPrTv20yWLSIzwggHfU0DjvMlfi6GYfxFKo1Z7U9HTkjp2D5Zb0cd2pZ9qJCOhSg
         fTJLoZ192E8Jpe9/T4LoCoEA0kCJtHSs83b28YYY7qY5olKAXBSLeRPgIv585mM90Ml5
         DCHYJEx5cV/B+L88n4CGqbSgORmQi0QH/8kyqcJ82OC4Ar1DOolqRx1nTiknYBWmYqtY
         qeUjXzBIyJWfkVnzWtcQZZKmWpiu2YuyXRXA7ViYpkTHdw1FvI4VTXG2mEhuRRYkv4HC
         cNo3A8y7qcIJTEJ49qiBk3JZTkNokTtVLv/zHYQz4cpqFsnoIBgoKsfAr4nMllRUnuMY
         tSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KE97/SBmhO7aw3gFJCxcKM7p1dKmYViOU/YqYue35DU=;
        b=RfnOCgZf+ysQCK7rDrQn211EVn+8aF12owNSWFuULSSmyY56dg5wqPDHPEKvvp9Bpe
         TYecjNOPQA4rbC6mhk9Nco5CddeCs7oUgmpA+4WgV1YivX/EecnLuRNcpWrpqH9FwoAH
         XTjLIVgvL0fOVPFjtKfCT9tqS/8lVMYLx5i3e0Y/2GavgQUAHp5ce8Mcya7LLqoWu4KQ
         PR6AtRkSWMZenOkfPoHrYMgPKEzp0xCfTs+Xp4/+hibO/V3ZkOzGTscmqn5FQjfKCu7W
         LeJ752CeP/hOmYaIrVH0RtPcq9w95TtnfkjFOmTHx3qbf7Ddc8OEAer6fOG2ahIqQknq
         D44w==
X-Gm-Message-State: AJIora8gU+5koZqf3J3iRdXnGtHXpQSSAdmkfU0ssF81V7IBh99aW/iM
        fUVlKqJtNW51ppN07I8GVHw=
X-Google-Smtp-Source: AGRyM1sK3E8RGOgV5nk5HqHonA0Fzt27080ufNkbbTtW55Cwh9UkAaff/TEgsGooDK46U/vWGvNZnA==
X-Received: by 2002:a17:907:760f:b0:72b:7eb4:be52 with SMTP id jx15-20020a170907760f00b0072b7eb4be52mr21867628ejc.737.1658061783601;
        Sun, 17 Jul 2022 05:43:03 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b0043a64eee322sm4520588edq.28.2022.07.17.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:43:03 -0700 (PDT)
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
Subject: [PATCH 2/3] leds: add help info about BCM63138 module name
Date:   Sun, 17 Jul 2022 14:42:47 +0200
Message-Id: <20220717124248.13562-3-zajec5@gmail.com>
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

It's what we do for all other LEDs drivers.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/blink/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index c680af01b5a9..945c84286a4e 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -10,6 +10,8 @@ config LEDS_BCM63138
 	  BCM63138 SoC. The same hardware block is known to be also used
 	  in BCM4908, BCM6848, BCM6858, BCM63148, BCM63381 and BCM68360.
 
+	  If compiled as module it will be called leds-bcm63138.
+
 config LEDS_LGM
        tristate "LED support for LGM SoC series"
        depends on X86 || COMPILE_TEST
-- 
2.34.1

