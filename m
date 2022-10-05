Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8546A5F52C3
	for <lists+linux-leds@lfdr.de>; Wed,  5 Oct 2022 12:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJEKnx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Oct 2022 06:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJEKnw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Oct 2022 06:43:52 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23D520BED
        for <linux-leds@vger.kernel.org>; Wed,  5 Oct 2022 03:43:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j7so19970767wrr.3
        for <linux-leds@vger.kernel.org>; Wed, 05 Oct 2022 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=t+w6hbnmBxGh/SnoAN51PbGzmPnoa7byBs+QlkLCahk=;
        b=R15R3ATdN6iufu7nin46PsM+hmljQu6HCebkOcpbM86w6JXB4tLmnyYFGvzMyaTAK9
         DATKweeG+C19s87m0osqZcX7Wv9VnlYLA46pxoDC4t3EDfSTUH2dxWw6r8HZQOZrurgW
         Mr2tL4Ois41SkKvl7nCRc0iTbtwxokNap3lSU4anX43Xtt/OM4Ovg7Cdr5VYsRpvrb7+
         2FLht8fwNR7E+quV80q7AkrbSt9IbjICU6kiDoY7JXZ7G4H+1dELcHMCE+VWtXcxtT4M
         40Ta6v1SggniF9P24SFUae6kj/b8LqMY9uqlox6N0QUm1mPRCQ1SB5kH1PLK7ytH3o5m
         sRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=t+w6hbnmBxGh/SnoAN51PbGzmPnoa7byBs+QlkLCahk=;
        b=OInfqMMCCUzjPCr1MTirCiNJPTmxoPg/3REYqSesGdNnIF5fqPSrkUxgE7Mi+ShcwL
         eX78pFe4jWjOrneosEgR3gStBbazPdoDqgA0U8FJHXVwOJWoTSJsYDGOlIXZFugLXcOr
         RXWMDWJpt3zPWBnKPrZfQ/rmOGu48LPDPt5fSXsUHfZXgs2WbQV7zQGJtHiXlYRthTrt
         lxVeRURzHUR+yf/FLJIxGn5HgQdp765iQWurlLgXb7An6twiGDBEcRzCHp+gjbJjHIMQ
         +430Qm/VePrgn8+c9OLUIQRC+xLxZMHth75ElpQPHeQv2ex1Brs1g5ZR37lL2YH0O+ye
         tM3w==
X-Gm-Message-State: ACrzQf3FqWyai+jHaLiP6d9OCW75ZCdoPmRSH/wbxdzVnaoXhtW3SUDT
        DNWA1nllCBvhb/i/JmFJaAI3Rg==
X-Google-Smtp-Source: AMsMyM4S6PxB3wWBcc/2e0dkBoWv6zeqFc1QryB9JS3nHWDnAppPn5iGRCLyYPFlzPDI4dUlGlGbXQ==
X-Received: by 2002:a5d:688f:0:b0:22c:df1c:92cd with SMTP id h15-20020a5d688f000000b0022cdf1c92cdmr4916246wru.52.1664966629401;
        Wed, 05 Oct 2022 03:43:49 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id q18-20020a056000137200b0022cc7c32309sm15004694wrz.115.2022.10.05.03.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:43:49 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     pavel@ucw.cz, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: leds: common: add disk write/read and usb-host/usb-gadget
Date:   Wed,  5 Oct 2022 10:43:40 +0000
Message-Id: <20221005104341.3505550-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The triggers enum misses 3 cases used by gemini DT.
usb-host was added via commit 0cfbd328d60f ("usb: Add LED triggers for USB activity")
so we add also as valid trigger usb-gadget which was added along in this
commit.

disk-read/disk-write were added by commit d1ed7c558612 ("leds: Extends disk trigger for reads and writes")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
V1 can be seen at https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210508193654.2596119-1-clabbe@baylibre.com/
Changes since v1:
- rebased on recent tree

 Documentation/devicetree/bindings/leds/common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 3c14a98430e1..25f3b7cc0cdb 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -90,6 +90,8 @@ properties:
           - heartbeat
             # LED indicates disk activity
           - disk-activity
+          - disk-read
+          - disk-write
             # LED indicates IDE disk activity (deprecated), in new implementations
             # use "disk-activity"
           - ide-disk
@@ -98,6 +100,8 @@ properties:
             # LED alters the brightness for the specified duration with one software
             # timer (requires "led-pattern" property)
           - pattern
+          - usb-gadget
+          - usb-host
         # LED is triggered by SD/MMC activity
       - pattern: "^mmc[0-9]+$"
 
-- 
2.35.1

