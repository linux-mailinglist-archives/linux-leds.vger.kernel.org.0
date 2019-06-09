Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069413AB95
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfFITIc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54509 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729082AbfFITIb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so6487775wme.4;
        Sun, 09 Jun 2019 12:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S+efY5p/WBHiTwQo53QIB9t4BE0FddcekanVGJm7Es4=;
        b=lC3/7hBVaDu37FAKEDPfxppdPGYZ5Jz0KKm9gCiy9k6Q+RSvRXdTkZlhA97qCrMig2
         lTir9e1RSJc4tJi/rskb8dr3LXXrsfyBjjggtwf+yMOaorRlizS4IH/NBKDb1og9YlZr
         8UHGic6nMLi2cmRD79223Z4CPCl+UnOwLYDu6CMxv66M4FWjo8mrdyKyj5oQIW1sAlqw
         llvQwN5XVA6a/pjTU1s88+UWL72S1dybFT1ocUcPe9iTd9z22970FxMe7Ek4lBHhISC+
         j0dDMdCMKJqCnJUPFa4XtWGD/BfFFWHduhD0GfFEKj6W5PizOoHfQ4rqiYhp+edEn8O7
         3EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S+efY5p/WBHiTwQo53QIB9t4BE0FddcekanVGJm7Es4=;
        b=KZ612/0SnbtLhHtb9VLeq8Q8+oqKds1jgsUzQeX+XHwroSeW47XPGZGsiGSDYeiZRi
         vgMv8v4tBQpcc+VBVbqmFS2Pw+wyDumE8SUreDQg/GPnTd+bGL8zyC3CpeE3rktXZfyW
         K1jfrT6sh38zlp/oRDwx4sgPIH80qQn15v3ectxC61+t+kjxsqfAaZgNP/RCYKPOdKNt
         nLSw4ywLHHh+48zvd6ndzQPXTPOrmchoZ+13bjCmIZeROh4Bg3mZfD2Hq5CMz0s7axjN
         Fdvc/pJStxcFV3msQAVnWn7QWbbjdiiLxTdNx3f8WDdW+m/gBgkICRHzLiUFMSA9JC9d
         A/9A==
X-Gm-Message-State: APjAAAURxkOFHuNbAZeHo8Ihad5yX1g5bLTFRCd+elSROc06DM+3U3No
        BQaHnLD9C02rPGmk97583f2McJEt
X-Google-Smtp-Source: APXvYqxkf7BhtvOazrLWsfutPBVYpjv0lZkm/H41G2pFyQYu5VvL2UBPunM8Y+/JYHwo5GTbrSPPxg==
X-Received: by 2002:a1c:c2d5:: with SMTP id s204mr11126665wmf.174.1560107308839;
        Sun, 09 Jun 2019 12:08:28 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:28 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 02/26] dt-bindings: leds: Add LED_COLOR_ID definitions
Date:   Sun,  9 Jun 2019 21:07:39 +0200
Message-Id: <20190609190803.14815-3-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add common LED color identifiers.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index e171d0a6beb2..217ee9e0dd6c 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -19,4 +19,15 @@
 #define LEDS_BOOST_ADAPTIVE	1
 #define LEDS_BOOST_FIXED	2
 
+/* Standard LED colors */
+#define LED_COLOR_ID_WHITE	0
+#define LED_COLOR_ID_RED	1
+#define LED_COLOR_ID_GREEN	2
+#define LED_COLOR_ID_BLUE	3
+#define LED_COLOR_ID_AMBER	4
+#define LED_COLOR_ID_VIOLET	5
+#define LED_COLOR_ID_YELLOW	6
+#define LED_COLOR_ID_IR		7
+#define LED_COLOR_ID_MAX	8
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.11.0

