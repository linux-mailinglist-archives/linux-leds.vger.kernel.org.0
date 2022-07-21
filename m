Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02CC57D172
	for <lists+linux-leds@lfdr.de>; Thu, 21 Jul 2022 18:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbiGUQZV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Jul 2022 12:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbiGUQZU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jul 2022 12:25:20 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FBA1181D
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 09:25:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u19so3664116lfs.0
        for <linux-leds@vger.kernel.org>; Thu, 21 Jul 2022 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=+5w2kCWbiC330rvkCcrHBwYtYDOwOOIM+ek+CZX2IZU=;
        b=C2dPGVdib4gHSgKqXWo7lbP32kBLTZ7m3VCnfUZF9ZBYMVkBBPoCycUxE6tZpnuSB8
         a01yTy5UrA46lfth+mpOkBCkemrjiLReKj1CywlHWTJrZB5gwA1D8kCNdmtaLbqUdmHE
         6cqin0NYm8xABa+3ip+w7KQK28HcEITRfAqvTqkH05DtuQQrGYXR6Ffv1mWUjCeNyPFD
         A8lmDyjOka7tV7C7l2H2UlxWg3IAyAh7eSUlpyNtR7tQrtb7X6sjUTYhVy7+yL8BNhZW
         Jv2UKQpxGNl4j6m4c5EK7AgLA5GtPC2YQdT0LDgfFGQ56hFkLH6aFjMxWUju1+Yp44HB
         z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=+5w2kCWbiC330rvkCcrHBwYtYDOwOOIM+ek+CZX2IZU=;
        b=xwGPB6jQ706o6zD5MLzuvLUu/vB0XoltDaG0hQsLQAgircS4DVAZNqcx0kUjgms9cC
         7uB4xt+9k87j9BdsBy7I7QVDPIu9JvhLLCw/BD1hg1Wb+pkpaDYfReHTBPTrkOIPBARM
         BrEywWnhzP08RvsuZJSTvioBlxJMFlStV2VASI56KrUD+qe4OzWU3VH2ZS4kqNL18sNs
         Q2CCz0ZwcydM8ZLxUtbiQNC7faKbSWkKPPgEyO1kO6moXGC+TkE3HhpQNpOZhCLLNGlc
         4gKOVaRn8RyxxIsMfFCX6B0DwS4L5cUCK+w5M975RAgIY2Fh5U/SX5PkyTFedTM4/P94
         RS3w==
X-Gm-Message-State: AJIora+c6bsCHkR7zr/N4RxaUYJx3MsSEmZE+niYHOIxtzC5bhoNCubw
        PWczDja1cGpWOzBmQ68AuPQz06HP3vxSseci
X-Google-Smtp-Source: AGRyM1tjmebrMpVdPOqP5Prs+9RUuOZB2mA105NFmj9S+Uy3RFoTqwkXo++oShwTLQmC1gsnXShKmg==
X-Received: by 2002:ac2:494f:0:b0:48a:6875:f8f1 with SMTP id o15-20020ac2494f000000b0048a6875f8f1mr2126512lfi.47.1658420716550;
        Thu, 21 Jul 2022 09:25:16 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s2-20020a19ad42000000b00489cc0dd59esm528810lfd.90.2022.07.21.09.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:25:15 -0700 (PDT)
Message-ID: <58ce0419-7da7-7528-9afc-822e3f4ab40b@linaro.org>
Date:   Thu, 21 Jul 2022 18:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: DT bindings patches for LEDs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Rob,

It seems Pavel is recently quite busy [A] and few DT bindings patches
are still pending. Maybe you could pick up instead:

1.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220607075247.58048-2-krzysztof.kozlowski@linaro.org/
2.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220721160611.250274-1-krzysztof.kozlowski@linaro.org/
3.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220719074542.24581-1-krzysztof.kozlowski@linaro.org/

4.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220719211848.1653920-1-marijn.suijten@somainline.org/
5.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220705163136.2278662-2-vincent.knecht@mailoo.org/
6.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220705163136.2278662-3-vincent.knecht@mailoo.org/

Optionally:
7.
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220607075247.58048-1-krzysztof.kozlowski@linaro.org/
which was sent some time ago, to correct example with the bindings.
However in LEDs tree there is a commit (multicolor) which exposes issue
in original example, thus this maybe should go via LEDs tree as well.
They are not strictly related, as this patch makes sense on its own.

[A] https://lore.kernel.org/lkml/20220714222541.232eadfb@thinkpad/

Best regards,
Krzysztof
