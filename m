Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D4248B4BA
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jan 2022 18:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345135AbiAKRzt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jan 2022 12:55:49 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33332
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344997AbiAKRzQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Jan 2022 12:55:16 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C2DD3F17B
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923715;
        bh=BmB9cazi0hKFnRyUoCMsTBlnp9i8I7ETkGf9B7rE1rY=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=S44c47PptfO81kBVgbL9cifo7+YZos/J9DLX/XHsQ6BD/C8qarPVn3EmEW0e3hibw
         4K8Ts0nc1IKQtOLXrVc2aQhavQMYJ8ruAgEQqckZZ9hDvwq03tpYLqFUIpe9hWphIY
         RzMa/O9AqVLcCzeW9RnDrNwQrUfrY2mvy82Z8NHMAKlooP8eMEcDRI8zTSHFdRU/0P
         pdYidDsZQlMaIntvN5aOHw7my+CbiCj8dXsh6ve07SCVFMq+BFU/JAHEM8oWEiC6k0
         bG+1owBR2g3Gaio66E/ti4xPlR5nYAIFavbWEqvy7DYHBu18HsMfybIEel2Ud/fD21
         eIsy6ZEuxu6FA==
Received: by mail-ed1-f70.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso3074609edb.10
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 09:55:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmB9cazi0hKFnRyUoCMsTBlnp9i8I7ETkGf9B7rE1rY=;
        b=gHGYKn88iil8qVklrC3QynSXaQasNINDnbLCWQYzzpKJTbxJXuqsWCY28Or9kMlxRh
         ElG6YZwc5FtvOVZkqzNcNDvTqevTZU5x3BuPEDasunCIUGKSynU5evy+EGiVLr9VXjOK
         olabzETh9wb7V357hu+NTR+QX5lRcjHjMxTWEi014UDTFr8M50+pCaK8cole8X8yLnNl
         VMUezFRBXV5Cbwb9RtuSQcPa48FuVTFQMNU7cebtCL2qQDylDOADcmGUGh9cDYc4+CPO
         CuDQif0uq5pzFQ/+I23eZYaLuaDFwZC3nu54WtwWOyY4FqCk2tv6ufx5fP4fhB7raOQ1
         orcw==
X-Gm-Message-State: AOAM530eRQ8IuXst+8WhXRrYDdYjSJFMAanhbtzYOuS+IVvb5RQSskBG
        lxd0xOflarrtmno8gDyC1EJYOHhQlC6L1w02xYfXf05yOAMeJB3CokhHmdUX6aRaal4yruADEeM
        KBfhoykzr6a7RYc1C/TIwFkg1vNFupsSpptzCbmg=
X-Received: by 2002:a17:907:7f05:: with SMTP id qf5mr4531079ejc.597.1641923715345;
        Tue, 11 Jan 2022 09:55:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJCLUIrpEiP8qBwAD5GuOZRfnAaOXhGkc/rX1rQBiOtBHZz62WPoiPD24pySPPRqGLiXonwQ==
X-Received: by 2002:a17:907:7f05:: with SMTP id qf5mr4531069ejc.597.1641923715169;
        Tue, 11 Jan 2022 09:55:15 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 7sm3759949ejh.161.2022.01.11.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:55:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: leds: common: fix unit address in max77693 example
Date:   Tue, 11 Jan 2022 18:54:30 +0100
Message-Id: <20220111175430.224421-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The max77693 LED device node should not take an unit address, because it
is instantiated from a max77693 I2C parent device node.  This also
splits all examples to separate DTS examples because they are actually
independent.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703..328952d7acbb 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -185,9 +185,11 @@ examples:
         };
     };
 
-    led-controller@0 {
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
         compatible = "maxim,max77693-led";
-        reg = <0 0x100>;
 
         led {
             function = LED_FUNCTION_FLASH;
@@ -199,6 +201,9 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.32.0

