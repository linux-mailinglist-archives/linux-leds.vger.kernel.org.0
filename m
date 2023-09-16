Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0DA7A3181
	for <lists+linux-leds@lfdr.de>; Sat, 16 Sep 2023 18:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjIPQxD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 16 Sep 2023 12:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjIPQwp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 16 Sep 2023 12:52:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C52CEB
        for <linux-leds@vger.kernel.org>; Sat, 16 Sep 2023 09:52:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso4799372e87.1
        for <linux-leds@vger.kernel.org>; Sat, 16 Sep 2023 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694883158; x=1695487958; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F2bpY1WXX/2nWx1Qdw3/a/39vkL80pHxnXkILWF5/MY=;
        b=cACWf86UGPgcbbimkpwJZIEE2bpDvpkp5kDbzjrhfIND9oJkHYuwyONY4pRhSMWK9j
         P9HkJRB8/886ZsV33U4ugrEDoQjLmkcsdvyRvraIuw9ydcl/xV0BsKixKOGLANPJApRp
         yf7dzCZDHTB4aUn9bxJYdNbNT7/bxnOtt9aOnQ+OriVgfoD75TFYbDRacXucJOXzfM+S
         PujtUTXjB9LJx6HIGEf/02OUHQYbjhPRD4zPcpUawqrjejr54ryZaVnwr5aQO/OWHnzD
         B98r92Q9HpzdgS25P0Jv+9mAyKzvyitLm3+yLxBOLVpAsFVeefdgXx4h063UrnAly0hx
         vV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694883158; x=1695487958;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2bpY1WXX/2nWx1Qdw3/a/39vkL80pHxnXkILWF5/MY=;
        b=Esj36V13BjgCDN99NvkOEkGd8l6IReIw3qikLng4tZ9ApSMS9nCURqT6LOSejrpj5q
         hgR+11jIczKYMGfe1n7jQWsI4MFt5VcUQaGgKlWuo4FHjZLtxPN20KrElzaw/YEdgprB
         YRYzICnzwnPo40LkOmGIhNJIwgrVmhsE+XpI1EFQM49a3fgdm4Ror3flT1n1AmHk12pf
         Lza40XoexOP/Gtu720Zj5mvWTjavhP9zCVtaM7OPHMJxrvtNJLUTzjvqjf3DBHbDkv1c
         dzwbA3mMMi+QnUViVYXsEl00+LfgFNtbuQYUr4jU87ObMALyOR6+8F52E7rOcC8U5Xkq
         EZVg==
X-Gm-Message-State: AOJu0Yxyvt6BzBo4lRti+EKfx+991PhzA6i9Gj5/5PRAinue7Op1G+CG
        js106YeIG40ZB662+icvV0qoBg==
X-Google-Smtp-Source: AGHT+IFR7kTT8uIkQT7DDLjOQc51gZ8DjPRXcuJ6FaCW0uD/vyffgvxL7NBnwamnPN44f009BCqrVw==
X-Received: by 2002:a05:6512:3496:b0:500:c180:59ca with SMTP id v22-20020a056512349600b00500c18059camr3526140lfr.41.1694883158111;
        Sat, 16 Sep 2023 09:52:38 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b0050304a2022esm302782lfk.47.2023.09.16.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 09:52:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 Sep 2023 18:52:30 +0200
Subject: [PATCH] schemas: gpio: Add trigger-source-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230916-gpio-triggers-v1-1-6e5052bead9a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAE3dBWUC/x3MQQqAIBBA0avIrBPUyKirRIvI0WajMkYE4t2Tl
 m/xf4WCTFhgFRUYHyqUYoceBJzXEQNKct1glBnVoq0MmZK8mUJALtJM6I11zs1aQ28yo6f3/21
 7ax8paX8aXwAAAA==
To:     Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        =?utf-8?q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds trigger-source-cells to the GPIO schema,
and makes it depend on the GPIO controller also being
an interrupt controller.

This makes the most sense when reusing the
trigger-sources also for GPIO, driver bindings can
opt in by specifying the number of cells.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 dtschema/schemas/gpio/gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dtschema/schemas/gpio/gpio.yaml b/dtschema/schemas/gpio/gpio.yaml
index 87c381b2942b..0c3950d8789e 100644
--- a/dtschema/schemas/gpio/gpio.yaml
+++ b/dtschema/schemas/gpio/gpio.yaml
@@ -13,6 +13,7 @@ select: true
 
 properties:
   "#gpio-cells": true
+  "#trigger-source-cells": true
   gpio-controller:
     $ref: /schemas/types.yaml#/definitions/flag
   gpio-line-names:
@@ -36,6 +37,7 @@ properties:
 dependencies:
   gpio-controller: ['#gpio-cells']
   '#gpio-cells': [ gpio-controller ]
+  '#trigger-source-cells': [ interrupt-controller ]
   gpio-line-names: ['#gpio-cells']
   ngpios: ['#gpio-cells']
   gpio-reserved-ranges: ['#gpio-cells']

---
base-commit: 033d0b1430e0670ddeb58f60fbff0ecefccaa925
change-id: 20230916-gpio-triggers-25ef26ddd711

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

