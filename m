Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CE479D290
	for <lists+linux-leds@lfdr.de>; Tue, 12 Sep 2023 15:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbjILNok (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Sep 2023 09:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbjILNoi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Sep 2023 09:44:38 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEEF10D8
        for <linux-leds@vger.kernel.org>; Tue, 12 Sep 2023 06:44:34 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so9332814e87.1
        for <linux-leds@vger.kernel.org>; Tue, 12 Sep 2023 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694526272; x=1695131072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zr1tndUa8GJ+rpTLKAA728oy8bkiMEVH1LyXXvtzocQ=;
        b=ljM6uTY8TLHrVWuTsqAw98/sjye7NvFIIU3xXeOnql3N4k1SPvpvXiwUf8SON2sqnz
         ITjEEDogB8bX2WuCiSdq0dKuwwLHq8S07PeW4xPVAYg1XoFCH96oN4ikRQDSvpR+epoe
         SmgcaxYsEPLlL63QynjdtpmnUwOeMz66roO3HYiFupf7iBO1IRejrDuUWVXc0oWhVVbC
         FtBgrUiWVOl1ZDetmCXhCNNZzpvaYDvuLG+rBRnKV16KlCPkiNVdI4X0nL7WnPwjYNlB
         qXSKYM7y1HAsRSYN9P1fkBU3f72cPZyl9RtPFw5akLjhapJQlE8pBEYi32lyFSH1utji
         HdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526272; x=1695131072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr1tndUa8GJ+rpTLKAA728oy8bkiMEVH1LyXXvtzocQ=;
        b=mBk1TKHMZVNmdIbkIa9W+HDcrPNSwQTwU7j2donltao7JuExAtYalwGkrBCnxbaEON
         /obz3bD5yJcS3l0LbDrKGSaKNScHb8Lw7LYwT3oSHmkJrCz1QkqkEy6VW4K5R6pUxRu0
         1DW5+ZZci1x4NIWRegsxZTLLPcFGMM1/dwInr0xDwcvdVekhlI9WTmHbEkIWFMlwncqH
         DXo7pKDaFT06sGs5WUGJ6iK029gDeRhgEVSTFO7qnAd+J28hTJeuO6vMt9BF1zHzSxfb
         3HovrNx1A+xDg9JeSYI5HnFryZT3MuuCY7HHPL7gVnMRxV/S+cyEoydetDxPWpgk4tEQ
         jDow==
X-Gm-Message-State: AOJu0YyUh6k9NwsBfKsZYKWHxMLHKdthRnQ4ja6491cenOAlt2iji4NP
        Wv413tGtk6aZo0AJfVqXwXtU6kPrmJR+fwTJjmE=
X-Google-Smtp-Source: AGHT+IExYOF8Z1H2+7WrYkOmXEqxoUhVgHZ5qH3K2fmA63lrB/Qf8UcVmXqkOUgjL2O2q/QfFc1XVQ==
X-Received: by 2002:a05:6512:3082:b0:501:be3d:8a46 with SMTP id z2-20020a056512308200b00501be3d8a46mr12680112lfd.26.1694526272217;
        Tue, 12 Sep 2023 06:44:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y6-20020ac255a6000000b00500a2091e30sm1755020lfg.115.2023.09.12.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:44:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 15:44:30 +0200
Subject: [PATCH 1/2] dt-bindings: leds: Mention GPIO triggers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230912-gpio-led-trigger-dt-v1-1-1b50e3756dda@linaro.org>
References: <20230912-gpio-led-trigger-dt-v1-0-1b50e3756dda@linaro.org>
In-Reply-To: <20230912-gpio-led-trigger-dt-v1-0-1b50e3756dda@linaro.org>
To:     =?utf-8?q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We reuse the trigger-sources phandle to just point to
GPIOs we may want to use as LED triggers.

Example:

gpio: gpio@0 {
    compatible "my-gpio";
    gpio-controller;
    #gpio-cells = <2>;
    interrupt-controller;
    #interrupt-cells = <2>;
    #trigger-source-cells = <2>;
};

leds {
    compatible = "gpio-leds";
    led-my-gpio {
        label = "device:blue:myled";
        gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
        default-state = "off";
        linux,default-trigger = "gpio";
        trigger-sources = <&gpio 1 GPIO_ACTIVE_HIGH>;
    };
};

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 5fb7007f3618..b42950643b9d 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -191,6 +191,8 @@ properties:
       each of them having its own LED assigned (assuming they are not
       hardwired). In such cases this property should contain phandle(s) of
       related source device(s).
+      Another example is a GPIO line that will be monitored and mirror the
+      state of the line (with or without inversion flags) to the LED.
       In many cases LED can be related to more than one device (e.g. one USB LED
       vs. multiple USB ports). Each source should be represented by a node in
       the device tree and be referenced by a phandle and a set of phandle

-- 
2.34.1

