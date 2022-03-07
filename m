Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1594A4CF818
	for <lists+linux-leds@lfdr.de>; Mon,  7 Mar 2022 10:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237998AbiCGJvd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Mar 2022 04:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238922AbiCGJsw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2022 04:48:52 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5EE6E4C8
        for <linux-leds@vger.kernel.org>; Mon,  7 Mar 2022 01:42:44 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id n33-20020a05600c3ba100b003832caf7f3aso6304680wms.0
        for <linux-leds@vger.kernel.org>; Mon, 07 Mar 2022 01:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/ZxQ6z5PZGHQq9JKGs5BndICctE34zGD7U+mK09Uits=;
        b=mV7uGh1AN3uU8R4KM0f4CaUkiQE7W3yax2HST5RXofwB3zd6VsTxHERt01MHByu81r
         NZx/A7wJ1LJ9HXqr24yLhBbLmyQO5Bem3UCWozIMhLCvrLiLJdEwA/6uGgQTXZYdbA00
         PTlUngJR8dWdmaAOQCYDvx74WmwoWUMlmsIiEsomdcobzf/Lo+/bEEI2smHRL4UNaKAy
         r1c1d0285zVj36Gvwq4O7tWF460rdLhXJ6UCFL/38LVftsoyzIIkRYbfMU+8Q8k0AoGb
         ktHHabe0wbt5ShJIYMc6Zc8JSRLpKvG9L6D0drTWTgP0cPAVJzUCdBp57IRjMN1aLsRM
         Iq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/ZxQ6z5PZGHQq9JKGs5BndICctE34zGD7U+mK09Uits=;
        b=es2OCPLniaGtiA3Q4SR0yRxMB+Hth1MM1qKKNMzJNerTd/5EUuW6pUc44Gp3QAWiCG
         tfnpQgSft+ln639WV5BGV7ZvD4I/zirWSxTAo9wTqsstf9SThUUQTDFvAeswrBzcgx50
         GljB0PTUxsAHHKOWEaOcAiw6elaUSz1wpXxwLwR/x4qq8Kgxp4VCSUkQ1eMJav4LKvf9
         iLnYS0so32Ca8VxDG5UwIzbUCV6wuYyCMv314HZ6P5uwVRz+FvPEPZNdSy6k3pCBfOR1
         psbQJg+ulBBTImAqZrybVKlij//dEnS96Ph4tm54wX6q55Tou3BzbE7QeP8SJ/taB1nc
         DmdQ==
X-Gm-Message-State: AOAM533Ma49bveeBnCFhXJWDVRS7uzapr8+iCbTyTWlx+Eur7ivbOWYh
        7HgH2BsOQt9Ze2dIVkhF+npXGLNStO03Dg==
X-Google-Smtp-Source: ABdhPJwHQeN0MgKhNErx7gl+9mJHuTeeNqxKmMx0vFXKVgA5RRBGOXqtFt55oleSuIQG/9RsBt4H2g==
X-Received: by 2002:a05:600c:3ac3:b0:389:adb4:e7a1 with SMTP id d3-20020a05600c3ac300b00389adb4e7a1mr1693655wms.136.1646646151709;
        Mon, 07 Mar 2022 01:42:31 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id b7-20020adfe647000000b001f1d614b8besm6997606wrn.112.2022.03.07.01.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:42:31 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:42:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] regulator/mfd: dt-bindings: maxim,max77802:
 convert to dtschema
Message-ID: <YiXThUFuzTQmtrCJ@google.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 11 Jan 2022, Krzysztof Kozlowski wrote:

> Hi,
> 
> Changes since v1
> ================
> 1. MFD: Use absolute path to schemas.
> 2. Regulator: skip properties.

Ah, this is v2.

Un-applying this and heading to apply v3 instead.

> Dependencies
> ============
> 1. DTS patch: nothing depends on it, sending here so Rob's automatic
>    checker won't complain about DTS.
>    I will take it via Samsung SoC tree.
> 
> 2. Final MFD patch depends on regulator, so the two last patches could
>    go via Rob's, Mark's or Lee's trees.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (3):
>   regulator: dt-bindings: maxim,max77802: convert to dtschema
>   dt-bindings: mfd: maxim,max77802: convert to dtschema
>   dt-bindings: leds: common: fix unit address in max77693 example
> 
>  .../devicetree/bindings/leds/common.yaml      |   9 +-
>  .../devicetree/bindings/mfd/max77802.txt      |  25 ---
>  .../bindings/mfd/maxim,max77802.yaml          | 194 ++++++++++++++++++
>  .../bindings/regulator/max77802.txt           | 111 ----------
>  .../bindings/regulator/maxim,max77802.yaml    |  97 +++++++++
>  MAINTAINERS                                   |   2 +-
>  6 files changed, 299 insertions(+), 139 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max77802.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> 

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
