Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995E9747902
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jul 2023 22:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjGDU3z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jul 2023 16:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjGDU3y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jul 2023 16:29:54 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB744E76;
        Tue,  4 Jul 2023 13:29:53 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B7BB284F74;
        Tue,  4 Jul 2023 22:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688502592;
        bh=O0qfxhKM9iQb4hCGG37neQGxGAw4raxK1zqZwHKXlbk=;
        h=From:To:Cc:Subject:Date:From;
        b=nSsd1uvHNK/hICzIaz9a4FSLLBRpQB+Hsn3q9N+3Oj9t8gaD6DBG/wpktJnGpn7nQ
         N1mEtscA/aIXTp7a5Zj8fmcAltRBJFAAbPkMoGq1R7xDnBihpQgiIhnyxyQ+8CVZMI
         +VQUyv8lRPo1TfmfpBDOkCRe6kBIMAgpV6Bhp/LkKyq/xCZ86Lt7XAEWRwaCODg0jX
         73tSHjFfKuPtDDQ0/RcfEKgY+EWRlWRJECrafoZ1ohW+/e38BnbXjK0mJpI43jf4Xz
         DeU2x9NFI6R4ged6vtJbgNVaglK24OF2y/pGc4JLy9W+X2OfO7qgsjqhdUqyDx0CCW
         nq3Qd/chdnvaw==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Andreas Kemnade <andreas@kemnade.info>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] [RFC] dt-bindings: leds: bd2606mvv: Fix maximum register value
Date:   Tue,  4 Jul 2023 22:29:29 +0200
Message-Id: <20230704202929.91962-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since the chip can drive up to 6 lines, the maximum
register number should be only 5, not 6.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
index 14700a2e5feaa..44dd91aa239de 100644
--- a/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
+++ b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
@@ -35,7 +35,7 @@ properties:
     description: GPIO pin to enable/disable the device.
 
 patternProperties:
-  "^led@[0-6]$":
+  "^led@[0-5]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
@@ -43,7 +43,7 @@ patternProperties:
     properties:
       reg:
         minimum: 0
-        maximum: 6
+        maximum: 5
 
     required:
       - reg
-- 
2.40.1

