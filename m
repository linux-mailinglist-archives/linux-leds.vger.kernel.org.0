Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A771C7672F9
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 19:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjG1RLc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 13:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjG1RLb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 13:11:31 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D29335AD
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 10:11:28 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bdcade7fbso267559366b.1
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690564287; x=1691169087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vLd49UA9ZS4ED6oj9Cvc0oWvVQ1Vp2pb+8A7EL0GlE=;
        b=ME8bO7jI5SAAERVvZ7Or4EwrcnmuZn5aPghQ66hQT5oMTYHQBVmdcWv3AXDXiWJFou
         8hW4+6i7JB23PNhj/t9teQEMbPy3E3uCMvzTw74451ikJFeSOSk+TB4Z1j1/1gaanktn
         Y7zqh4sJV65QhgeE1NNN7ly3NPfkcYFSX0PG/hIj+txBIQp+QquqVhITLhLTJvQcIFLn
         7S3AR5Vqk3mwaMlAW5YwQIdFlfTaSIhvixnPmiLf9+20O+Qk10P4Yl/jlvfGVC8tSB3l
         xgrmIPu3ZP/O2ZAdaQxDolJYJMV/JMBch3036Z07wjEhXfUlfWwPUAtmZ+FaEQVG77jF
         yzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690564287; x=1691169087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vLd49UA9ZS4ED6oj9Cvc0oWvVQ1Vp2pb+8A7EL0GlE=;
        b=HHsExWSGI4qqMESGDbwsFpiDWvl6htDudETsPGC3mGMIa9BtxXPVkQGakzkNk56CA1
         ntdzJf8jjjQkUoD82aCHojyoRMc9LzZpylQSQOimC6Q74w01lWLcB6tITCRAxLjDneLf
         D4MqEJJ90nZA/aGlMgWlRpyIT2LLh+nhhVSoeaPrdeyVNs7POmqwQk+yX+y4kXvVur7z
         gF13L+b5ajQjTAx5ntDd54JFQsZsM6ebdxDreT3bMfOW++9dQ6V0fSG8AqCS46aFo9ih
         Tk2WIKOW8rHUv7WSCx+hRZVAAevPjWmIJshaoG6VBIqn/3TWPLqhC1XC3yVQ7ADtS+2M
         qVJA==
X-Gm-Message-State: ABy/qLYk1lnLRWhGm+FmMVkc0HqQLG0VKwV6LBYKV5IGTq8gTtS5XVy3
        dsZU/begAuLhun8os9e+mZABeCWnM0S3hde2n1+Cfg==
X-Google-Smtp-Source: APBJJlHOQw7TVHFemIIdO6aGeTm3uGqtn098tFJjraIz8hhx5s5wCV3wwhgBfeJG+/rDAOz5jdoe0g==
X-Received: by 2002:a17:907:7848:b0:99b:c372:7082 with SMTP id lb8-20020a170907784800b0099bc3727082mr2328191ejc.72.1690564286995;
        Fri, 28 Jul 2023 10:11:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l6-20020a1709067d4600b00988f168811bsm2290561ejp.135.2023.07.28.10.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 10:11:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: leds: rohm,bd71828: Drop select:false
Date:   Fri, 28 Jul 2023 19:11:23 +0200
Message-Id: <20230728171123.110489-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

select:false makes the schema basically ignored (not selected for given
compatible), unless some other binding references it.  It's not really
useful nor needed for device bindings, even if they are part of other
binding (like MFD).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
index 58f0d94c6d71..b7a3ef76cbf4 100644
--- a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -18,8 +18,6 @@ description: |
 
   The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
 
-select: false
-
 properties:
   compatible:
     const: rohm,bd71828-leds
-- 
2.34.1

