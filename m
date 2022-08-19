Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715435997CE
	for <lists+linux-leds@lfdr.de>; Fri, 19 Aug 2022 10:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347566AbiHSIhl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Aug 2022 04:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347052AbiHSIhE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Aug 2022 04:37:04 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC25EA179
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 01:35:16 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y13so7477754ejp.13
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 01:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=DV93+9CDlMs3+b6wexal1K4EfE3UGIHbZ5A0PaXjMRw=;
        b=YcTBwL8D8ZaIOzUaYOQ9W6C3Z9dweRALI9C8v6mdkvunolwwvFuEFHVAOhiGTHyltB
         NtIpylnUPfF7iYHFq/AdoQF9qcyxulcJeaVuNqf3X+eX296NYjk6tUr68ORMEmV3wg1p
         60WGkH09R+wAGMkoxfVwtpjMs8CbecoQKuyVbIL+HIMMHfgsZqwqQdBVIqx87wlFa4uQ
         s1idDEL+dYSyzo2+clHHpPHxor4bjIxcr/B2YYmGWw3ssWtBGvwbD0cUv5Ti3KIPi920
         o7r8dG01DyAcA3frXuRu+v3mLo16ulwEVSHpEwciVklOUkWVSmWKi9frEcLEYDRA6RFZ
         3/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=DV93+9CDlMs3+b6wexal1K4EfE3UGIHbZ5A0PaXjMRw=;
        b=gpTNnVtlW3hguNqveX1ysD8b0pz1qJcWTeGqvkYe5Bw8OaiE+kUIyYcDzHXzotldds
         qPUqO5ecQDxWGR0uwpLYKsNwIHonqw9XeOBvstD5ri6x+Z072qqJCpwp0FnEDd9jWYN6
         Xc/a894H7V804H3tiZWkzkQe5vfYhqUe/MKNWqCzoqxFqysSbGK8jZ2xU510y6TZXfgx
         gUDoIdo1XJzrub6S1s/odor9wbikc9v8aA4bBMaAuKSJzahf4aZOZjZ/8J4AyCs0pWIQ
         3NuMVYUO/6lL51CXn5cZh0BamQoKYVi279ZnOhXFkkXT238dqYWj9m6KNvE2oAprC9kD
         haqw==
X-Gm-Message-State: ACgBeo0PYxVvGRiIK6PkTgkAJDEQMULcAajZuxrqf1R3hxsVn/zRaQoR
        ySr5tQn1w1BItoc4Tllubus6PBPb4oa+xkMSG0Ykgg==
X-Google-Smtp-Source: AA6agR5K0jXVIyA1JXZ8RFyxVMQPaV5C3j6L3eKXdGwC6NC8OEM7WIOdL7pKlKknXW8ZHnbpjynj8UnR6XLw0++DhaY=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr4364947ejs.190.1660898114844; Fri, 19
 Aug 2022 01:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220818172528.23062-1-pali@kernel.org>
In-Reply-To: <20220818172528.23062-1-pali@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 19 Aug 2022 10:35:03 +0200
Message-ID: <CACRpkdZV9K3ir9hsudbJwbJyqg510jGEKYDy+dmDgqxyW6p+kQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: register-bit-led: Add active-low property
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Aug 18, 2022 at 7:25 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:

> Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
> active-low property.
>
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>

This looks helpful and solves a real-world problem.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
