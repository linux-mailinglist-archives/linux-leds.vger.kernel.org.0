Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA8A6AFF25
	for <lists+linux-leds@lfdr.de>; Wed,  8 Mar 2023 07:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCHGyk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Mar 2023 01:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCHGyj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2023 01:54:39 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3ECB8B072;
        Tue,  7 Mar 2023 22:54:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id g17so20103499lfv.4;
        Tue, 07 Mar 2023 22:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678258477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TseeJ+D4f++ygeWDUw0ivxIheeYmTO3mYfOEGNASe7s=;
        b=Nu4y+enq2ZUXYQ0jDT4mcHmOZF6Bqwi9RKKuOZWilU8bJOMTTCekGKwSFDE0C2uc/n
         Z+6+XGuS7sh1YEEmUZo4Vl3brluLR08wsBjHUpzm1EIaZJ7qFCfQUNqntqWjz+xN4FDI
         ROwKekXm4iaauSpZqGR0o17ZgqViO/Ty09feuRx3sQQJ1Guo08K8Snh6NnLtUKzeMZ6P
         PDA/5s3YhxkXNeueXoMk3izywPyPTkUi/9gIgr74g1EvuMKE5r0IOY4osy4aO6xl7pMM
         /fGuTftAfyF9t4ZnCZXUp7URxo+Q9R91AuHMVsnDO1n4VuSJd/HclAQJIq3fXTl4A6fd
         t8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678258477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TseeJ+D4f++ygeWDUw0ivxIheeYmTO3mYfOEGNASe7s=;
        b=MGdIs+0Zeh5G8BZPILgEpjWFdQkCiDp2KrLvYHwZV6GtJ8F1cy2NZqHyNLCJbCkRBF
         H+6mkp7ge4QczI5m7AOI6Gl5BSPvX70OeO1ZHgdzhFyIc6JpRDWyk90hu8zQ7uo4ydow
         DLchc6LiK7evhe0/DFLA5kK2UDhA94e641mBIW6rElTw1RRDV75jRWIzSwN3Uv+MxWDR
         EM4tM+K9Q8f9b355+f0wUfpP9hijqzr7XpwIzDvtmkVA9LQ4dX47x58NJtDjtRDKRwYI
         0oGzlPt+cjmxEHH9huQ7nBjnSgJyKGd0oam0M8+VTK6n++F7ceba6afzaf9lA8jm2u39
         ArdQ==
X-Gm-Message-State: AO0yUKWJMG+w+J6S6bT9kmM8SU3d30MXGAISCUVRHCZSWAfzDsr4YiKF
        n8NBCAiufwsrD+inUBFWT8Csub6QmcI=
X-Google-Smtp-Source: AK7set9Po5HuBKzV7pKBri6kMiMT3FFXoAkXpEwvjicMBm2QdGOR/F24SwRlHJ4h46UiPXWFxVzO9w==
X-Received: by 2002:ac2:508e:0:b0:4db:3e32:b92a with SMTP id f14-20020ac2508e000000b004db3e32b92amr4817746lfm.69.1678258476888;
        Tue, 07 Mar 2023 22:54:36 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id d3-20020ac25ec3000000b004db9dbe09c6sm2244210lfq.89.2023.03.07.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 22:54:36 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] dt-bindings: leds: add "usbport" trigger
Date:   Wed,  8 Mar 2023 07:54:24 +0100
Message-Id: <20230308065424.29113-1-zajec5@gmail.com>
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
 Documentation/devicetree/bindings/leds/common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 15e3f6645682..95b316ee3146 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -99,6 +99,7 @@ properties:
           - pattern
           - usb-gadget
           - usb-host
+          - usbport
       - pattern: "^cpu[0-9]*$"
       - pattern: "^hci[0-9]+-power$"
         # LED is triggered by Bluetooth activity
-- 
2.34.1

