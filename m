Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061396C1EE8
	for <lists+linux-leds@lfdr.de>; Mon, 20 Mar 2023 19:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjCTSCk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Mar 2023 14:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjCTSCJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Mar 2023 14:02:09 -0400
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBECC7690
        for <linux-leds@vger.kernel.org>; Mon, 20 Mar 2023 10:56:33 -0700 (PDT)
Date:   Mon, 20 Mar 2023 17:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1679334933; x=1679594133;
        bh=FAkqOD8kiqkTEaAEfEctBYZB4b4Y94ELoYgOe0EWWpk=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=ZMhAHgPg6OUDCGsoHzTQSoirpDB1jUXVGQCPGqI8sxUuA4OBl8bdZ/YxSxXofUTF4
         dHBuRkWVrF1MbyOggw/Qx2i7/IZHBkxZ01EkOTinpD2jUp8Mf85eiRk9bHJnRt2loF
         ZoiOARjYnSd2A+Abk0wVkuwjEXtVTYAf4tf/AfP6hTcdcQMaZIsxWNwrgimNeGLO92
         gdDDg0i/W/vZUcc61XgjatznxWorG2NNFH3L9msrdfaTlVPetnEIE5NeJfYY4G5m+Y
         uUMlqnaOjUz3n3FKsndqNq3G/f71uQ/zfxoxlS57W6kOiBBQ6mHZNksr08M4fUgDin
         JLVtV5Tl854/w==
To:     linux-kernel@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 1/2] dt-bindings: leds: aw2013: Document vddio-supply
Message-ID: <20230320175131.174657-1-linmengbo0689@protonmail.com>
In-Reply-To: <20230320174949.174600-1-linmengbo0689@protonmail.com>
References: <20230320174949.174600-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some LEDs controllers are used with external pull-up for the interrupt
line and the I2C lines, so we might need to enable a regulator to bring
the lines into usable state. Otherwise, this might cause spurious
interrupts and reading from I2C will fail.

Document support for "vddio-supply" that is enabled by the aw2013 driver
so that the regulator gets enabled when needed.

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Docu=
mentation/devicetree/bindings/leds/leds-aw2013.yaml
index 08f3e1cfc1b1..79b69cf1d1fe 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -23,6 +23,11 @@ properties:
   vcc-supply:
     description: Regulator providing power to the "VCC" pin.
=20
+  vddio-supply:
+    description: |
+      Optional regulator that provides digital I/O voltage,
+      e.g. for pulling up the interrupt line or the I2C pins.
+
   "#address-cells":
     const: 1
=20
--=20
2.30.2


