Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71851405ED9
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347788AbhIIVck (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:40 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36425 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347200AbhIIVcg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:36 -0400
Received: by mail-oi1-f175.google.com with SMTP id s20so4462737oiw.3;
        Thu, 09 Sep 2021 14:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OouCvFJ++nuywgCCHEwUOM1skEnqu2zrunTR0UYW3Mo=;
        b=FCSo5rxWtoYaoUFVRQam8zOX3CWN38LSOoN8vdnJ9ViViPbM3AiOQoTTaqkDGF0/cR
         7kbgvLNZn9veIEAvCRpzdRQrC1wFqTSttr0/ACL7u3vQ9BAf10UaZHDjCAjbgwlhOda9
         aP+JRuR35wnKItpwgpyqODVWszJO0zgsfbgZhABUVeL672GfsA7I9ZPi+8ktDAvopu05
         faVdBJjkLEgZ3MoN7nbYHqL24s7dpFcDhs+rC6ecZ2RSf0mZQw1tiimqqnj0WK4NG+FJ
         6PSkQIyBltF9P/KPOKNi7Rl/OOrepx7Q7HnNfS0OXm1swJsdyNMwJJgUxoBszyq+w5Jk
         ha5A==
X-Gm-Message-State: AOAM531G4ZX+D4F2+rzw7IXov0L7FOi06XHee30672Znvskc3O1ogQ3i
        Hw2dNxi3tNl6tMZRpZ1la1RkaUdNRA==
X-Google-Smtp-Source: ABdhPJxAFk3svHypjYVUy8yyVA03M4qLaof0mv/akclx4vLxdLFjqLFEXA36E/OiNs2ID0JQEDhekA==
X-Received: by 2002:aca:2216:: with SMTP id b22mr1545943oic.163.1631223085675;
        Thu, 09 Sep 2021 14:31:25 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:25 -0700 (PDT)
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
Subject: [PATCH 4/8] dt-bindings: clock: arm,syscon-icst: Use 'reg' instead of 'vco-offset' for VCO register address
Date:   Thu,  9 Sep 2021 16:31:14 -0500
Message-Id: <20210909213118.1087083-5-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
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
 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
index 118c5543e037..c346287ca15d 100644
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
+    deprecated
 
 required:
   - "#clock-cells"
-- 
2.30.2

