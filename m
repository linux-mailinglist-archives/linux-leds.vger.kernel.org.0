Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1706A5B16
	for <lists+linux-leds@lfdr.de>; Tue, 28 Feb 2023 15:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjB1OuF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Feb 2023 09:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjB1OuF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2023 09:50:05 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19ADE305E9;
        Tue, 28 Feb 2023 06:49:47 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so13574901lfb.2;
        Tue, 28 Feb 2023 06:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjS2aNfbFdXX4IxXdtQD++Q/Rtlz/Mu5DMHVg/XQ/5o=;
        b=dkqlBZdD66YtxXBSVrkjfpWdJF68Uz2FrCH5zryMdr9ppB4vzwOvnHZCeMG7O9fkVY
         JL62Brf1AadOohpTpDLSQecwYVPoADCrUSKodp+ooT1W1T+xum4GWd7mhB4FRtoSu0kw
         mm/jUrauIlXo9Ok2v4ElDDkQBXXtmLuTD/WfzOXQCeMMUiHBUfCtp0SBwIIXSNDHWeh3
         KXwJiB9dphTie+8GgbN5Q5r/klCxslzZBasT00R39eP4bqM3cjGSsanw9Vor/TzbQMyy
         f5JUyQP9G3coiUIdq7t+3gMV3jMUDp5p7lMdC87U5aPrCAb1DQfMjOXqxQBEZwqLNtfa
         gSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjS2aNfbFdXX4IxXdtQD++Q/Rtlz/Mu5DMHVg/XQ/5o=;
        b=ddoTkam+R+0ic5jOvVZZ0WR9Oe8J60cTodDlDfge+KHGxUi1qMJ3SHTAkbAgMPuD74
         fEf90X2KsL+Sib+vD8FZ64WEg8zjYnf3BPbjOC48QkpxtRekmViNmahCCq9wrLjoe0vb
         yQs/8R0gpIfA/E2GaVarNop2JCCHAycxX7e8K8xx+RGWp0TpUbMHp8j+YL5NlGmXZU1D
         7Ywg24WFz8+iVIUgV2oMCinMwabvb810VvJGYQWsxBz6kctJkECHpnjXtt9VQp/MyXY1
         1fa+oGmiy+4fSJ+BjYLC8+fhsHUuVTzGBBnGylWKh5MhxSLhkZ5dFJOEe4EZWxrMIj0B
         2QKQ==
X-Gm-Message-State: AO0yUKVxvTIFq8h19LrBcRAPsLbnOlemJ3y9wzJt00E77mRsgmCR6fCm
        fCRbVauhfw2ZUkVbkF3txEos51/iQ8w=
X-Google-Smtp-Source: AK7set/XFR7Kup5rgyT7a4+9lhWzkAAm3uAUSvIe766aSGWoibzpdQhoNXdBvkynw5r1hZo2g0+vnA==
X-Received: by 2002:a19:750c:0:b0:4a4:68b9:66b7 with SMTP id y12-20020a19750c000000b004a468b966b7mr759473lfe.2.1677595785321;
        Tue, 28 Feb 2023 06:49:45 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651204c900b004b40c1f1c70sm1356472lfq.212.2023.02.28.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 06:49:44 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: leds: add "usbport" trigger
Date:   Tue, 28 Feb 2023 15:49:33 +0100
Message-Id: <20230228144933.22614-1-zajec5@gmail.com>
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

It's a trigger used on many home routers that have LEDs to indicate
specific USB port state.

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

