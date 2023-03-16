Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1689D6BD197
	for <lists+linux-leds@lfdr.de>; Thu, 16 Mar 2023 14:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjCPN4h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Mar 2023 09:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCPN4g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Mar 2023 09:56:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8511BCB9C;
        Thu, 16 Mar 2023 06:56:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g17so2495891lfv.4;
        Thu, 16 Mar 2023 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678974971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSKKJxYQPkav8jnlnExMx5aoBByX6BMBB/8LW2t3irg=;
        b=UJ9we3/VNrUf0SmkUyvjHx/5MLfHro1DF0B6xmMa7LxGhysek7zTkW4pY9auUlP5yG
         T2lveYWFzHlPS03sM8Z/JQtfh3HQntWNCF9t+T2rRFJcALTp0zZXTgpgrOWJiYi1WWwR
         vnTePQHLCbm5sCuw1iL93hj10go9x3IkjTZSVTcylgvcKeTvGUyW+nN64zYRAsVWl45+
         OazN8ZuQLylCnDp87zuOCK7V8QiIkLN73niYpVPm15rts6AkyDK0vWFzmlqfI58fwOwu
         GZJBkPgYYzN79OQyWcw++zjKQbXCueQU6zL6pziujTa1AvmAr9kcXzhGPSdwSTDl1LoO
         GJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSKKJxYQPkav8jnlnExMx5aoBByX6BMBB/8LW2t3irg=;
        b=oZNRQq6chI4vZDJsxS3uY1P3/BR5gsQKfJfNkoEc1cGDKl5juTL8cyWAQsKxKTWzTd
         W5FPCyx29mTGuTnWQvkKf5iovBib6DNfjKH7SR3aqlVt78OHfUux5uKVUprOnFxqZ6yY
         XOQCy21L4c5ECceBcxHKekLEyIER5vDPxZnJqEu3k14N/O4EiLHyO9kNOLTDNlaUWyd8
         oDioxBfTiqJAiZQZ2NBvrPrpFrKcKH9Eb3KkphxKtocXXSB19hhlkapSdByCF0ivkipH
         7Ys12WLByvtDzt/ySQ1fWvhdwD7gMKhPEpL4aB+TXfJrDLCZ5gzAdmj5apSk3Dxo9h/0
         0oIg==
X-Gm-Message-State: AO0yUKVr5BJEEJNs+9TYpM+XxOBHn4ukprVdopww2Ov2jenyt1BcAeLk
        u1xmVIyvPvh/JJmQesKZmLw=
X-Google-Smtp-Source: AK7set9kMAqRI/Dka2TwaqtsN9R4P8ZAlFiVxbZV4o/xtedtGwcKIcVmflzwg0KlohzAc5uvfY/3Cw==
X-Received: by 2002:a19:700b:0:b0:4e8:55ec:b17 with SMTP id h11-20020a19700b000000b004e855ec0b17mr2412139lfc.7.1678974970633;
        Thu, 16 Mar 2023 06:56:10 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ee04000000b004d40e22c1eesm1234338lfb.252.2023.03.16.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:56:10 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 REBASED] dt-bindings: leds: add "usbport" trigger
Date:   Thu, 16 Mar 2023 14:55:46 +0100
Message-Id: <20230316135546.9162-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Linux's "usbport" trigger is a bit specific one. It allows LED to follow
state of multiple USB ports which have to be selected additionally
(there isn't a single trigger for each port).

Default list of USB ports to monitor can be specified using
"trigger-sources" DT property. Theoretically it should be possible for
Linux to deduce applicable trigger based on the references nodes in the
"trigger-sources". It hasn't been implemented however (probably due to
laziness).

Milk spilled - we already have DT files specifying "usbport" manually -
allow that value in the binding. This fixes validation of in-kernel and
external DT files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 61e63ed81ced..11aedf1650a1 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -125,6 +125,8 @@ properties:
           - usb-gadget
             # LED indicates USB host activity
           - usb-host
+            # LED indicates USB port state
+          - usbport
         # LED is triggered by CPU activity
       - pattern: "^cpu[0-9]*$"
         # LED is triggered by Bluetooth activity
-- 
2.34.1

