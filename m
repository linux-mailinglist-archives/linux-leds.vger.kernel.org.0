Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1937A577633
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 14:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiGQMnF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 08:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiGQMnF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 08:43:05 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D09C1572F;
        Sun, 17 Jul 2022 05:43:04 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id j22so16782615ejs.2;
        Sun, 17 Jul 2022 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=heItu7qNWLJ2iI4fhTzcVgfEgKTOgTZD5O+P4na3DrY=;
        b=iA17OtDvOPV9zwYv53yjkHqCiHIbJMZQconVanqI63FrS+kXrjsxnjJVBUQTKAjFdQ
         MuLaV0UHmzjbvcptjecnJwR/hlNPvb32pi2iwAudkrnyAaTLsw74Z3BhoNW+3WcWofUa
         kYnBNUCPEwTG2UO1nvoKtSuFfR8UJQhiay+ZzuO34+lbIWY1kEkjP1Ao5IvV4Y7yjaDf
         yUbsJphraV3sCTl8F5bZvoSRiBWbEt0MYd3FhlNcO4OiZaU4wP7e6askx364e8OEdf3Q
         hLHD9tNoc9OXqIddB1MSTUaHeLAJHCC6bM37TiynonUEuoMB7D0EEH7kkUqwGfC26/a+
         PaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=heItu7qNWLJ2iI4fhTzcVgfEgKTOgTZD5O+P4na3DrY=;
        b=kmHHoAuynjCtdqC+TAbISMo+Iv100VnK4g2lbGCy9olYganNCUyexD3Ggf/oqp6YeJ
         M156m0iyyCIKmf/sZX1HnasNXht9yoUz3yYoGhYtIhMZUydtzF6sCOwm3O3etlL/I4za
         wIG0qRd+VPvHvYVlj2CmtCfIvU4G/Lv6imz7WsH2NWD9BzWQ2HxQornmc+Pwlgh0pYfT
         EiB7IBDt8J9DRTWT9FLx7fCoRYmUxuYQjixiawpMYCtK1DCcqJS1o8Irt3rruiAMMG17
         JuBIFtdf1orbbeJdwrqMd70wiYliNEUTTBqcaDgm97J1jO6FSmzjYLbMLd469hI1uiJt
         s5Jg==
X-Gm-Message-State: AJIora+OSOGV7aMhgx7atcxUx6YhyYCGY7QbgxiJc/nvy9uUjH6eIAWL
        IpQjO6WRKQxTwWClt4NwE64=
X-Google-Smtp-Source: AGRyM1swE+XIig5oXG3rbEORKdCkp52rvaCzTxLSD6iXjjaQ4BQ6qlo1Y0LYuZbJQ2rIaoZWjQEv3w==
X-Received: by 2002:a17:906:8479:b0:72b:83cf:4cf3 with SMTP id hx25-20020a170906847900b0072b83cf4cf3mr21609830ejc.90.1658061782404;
        Sun, 17 Jul 2022 05:43:02 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b0043a64eee322sm4520588edq.28.2022.07.17.05.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:43:02 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: leds: leds-bcm63138: unify full stops in descriptions
Date:   Sun, 17 Jul 2022 14:42:46 +0200
Message-Id: <20220717124248.13562-2-zajec5@gmail.com>
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

Description of "reg" doesn't have full stop at the end. It makes sense
as it's a one-sentence only. Use the same style for "active-low".

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
index 99cd4ba9b0ca..52252fb6bb32 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
@@ -54,7 +54,7 @@ patternProperties:
 
       active-low:
         type: boolean
-        description: Makes LED active low.
+        description: Makes LED active low
 
     required:
       - reg
-- 
2.34.1

