Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AE27BCEE9
	for <lists+linux-leds@lfdr.de>; Sun,  8 Oct 2023 16:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjJHO1k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Oct 2023 10:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjJHO1k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Oct 2023 10:27:40 -0400
X-Greylist: delayed 383 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Oct 2023 07:27:39 PDT
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CEFAB
        for <linux-leds@vger.kernel.org>; Sun,  8 Oct 2023 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1696774873; bh=c7Gvjps46g8yeM0WEfoJ5nEDCww/QxvKFIcDCSrUh0U=;
        h=From:To:Cc:Subject:Date:From;
        b=MuTpJr4CVffYfoxQxFinVf0BLpukpKFNWmxvuIGDCachQ684ifqP0vFPwCujl1U/u
         oegeQpeq+KhtxhZ8FmY6/dRLlX8pjcfHnw1p2R0U4SnSeqEOCdEFOen8bayQqpwTmQ
         lcYEnk/irCvZ+oexaWHXEQTvhXatv3ByAktjEOW0=
From:   =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To:     linux-kernel@vger.kernel.org
Cc:     Ondrej Jirman <megi@xff.cz>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH] dt-bindings: leds: Last color id is now 14 (LED_COLOR_ID_LIME)
Date:   Sun,  8 Oct 2023 16:21:00 +0200
Message-ID: <20231008142103.1174028-1-megi@xff.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Ondrej Jirman <megi@xff.cz>

Increase the limit to match available values in dt-bindings/leds/common.h

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 5fb7007f3618..8bb8a519ed28 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
-    maximum: 9
+    maximum: 14
 
   function-enumerator:
     description:
-- 
2.42.0

