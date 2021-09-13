Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC9B409D04
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242848AbhIMT3n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:43 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:35660 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345251AbhIMT3k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:40 -0400
Received: by mail-ot1-f42.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so14898628otf.2;
        Mon, 13 Sep 2021 12:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgiY/jAX2so3Eo3P0Fr/TYfuN0OCzOoGgLVFkTmAlds=;
        b=PX0Mp6ES+muN/246oioQdz/7eSSPhtlgqkRjG+aB7lkjDkUJ6l5KAxaZ64OKbu+xMj
         YINVJ59GMlNQAUlwiHV3uGqOnrqikw9IK54WiRaIdgsJl7QFNgF6dhe1ycqHy3H9AelR
         aeOwEZ/PX/KEJoxt1nMlvKTYplWu6VBwTRvzFPf+jBYnjgANejJeITUuV2Rsk78ors+Q
         ifiFAHdQiiPqYX+K2Wxdzx/lYmmftC/DtWsFKHaJ66OjOZdjB6HuzqrjnPZN8lNm01P4
         T7+9SuOPtwB7nIMVXEmOZ3MEbAa6bcbutRlyAsbH6zlim4EWvcpD+YJd2b2v44SYIzbY
         xc1A==
X-Gm-Message-State: AOAM531nsxcUhpZ0iUj0V4HCM55z7T0RwNMVTwXdhlLEOZd017ZdHk22
        XxzXU1SDp6ZnbarHPiRVNw==
X-Google-Smtp-Source: ABdhPJzpqWrUPAfk00ZZ8dcb0VnfDtjObauAupfH66mE9bMdN8U/ZqyKu/nV+tn2823C+5noGI0K/g==
X-Received: by 2002:a05:6830:2f5:: with SMTP id r21mr11126615ote.24.1631561304319;
        Mon, 13 Sep 2021 12:28:24 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:23 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 4/8] dt-bindings: clock: arm,syscon-icst: Use 'reg' instead of 'vco-offset' for VCO register address
Date:   Mon, 13 Sep 2021 14:28:12 -0500
Message-Id: <20210913192816.1225025-5-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

'reg' is the standard property for defining register banks/addresses. Add
it to use for the VCO register address and deprecate 'vco-offset'. This
will also allow for using standard node names with unit-addresses.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Rob Herring <robh@kernel.org>

---
v2:
 - Fix 'deprecated'
---
 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
index 118c5543e037..90eadf6869b2 100644
--- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
+++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
@@ -69,6 +69,10 @@ properties:
       - arm,impd1-vco1
       - arm,impd1-vco2
 
+  reg:
+    maxItems: 1
+    description: The VCO register
+
   clocks:
     description: Parent clock for the ICST VCO
     maxItems: 1
@@ -83,6 +87,7 @@ properties:
   vco-offset:
     $ref: '/schemas/types.yaml#/definitions/uint32'
     description: Offset to the VCO register for the oscillator
+    deprecated: true
 
 required:
   - "#clock-cells"
-- 
2.30.2

