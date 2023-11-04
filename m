Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FFA7E1159
	for <lists+linux-leds@lfdr.de>; Sat,  4 Nov 2023 23:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjKDW0V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Nov 2023 18:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjKDW0U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Nov 2023 18:26:20 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1B9D6A
        for <linux-leds@vger.kernel.org>; Sat,  4 Nov 2023 15:26:18 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7eef0b931so38139977b3.0
        for <linux-leds@vger.kernel.org>; Sat, 04 Nov 2023 15:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699136777; x=1699741577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFddYtCCcf1uWTg2daUt4KqHC4rRdcekNan46WctVmQ=;
        b=SmhJfnYD30EwCmksN2U55VxhwW/y1rY0EsJ9UgphxlkK9FvNbn8qIaM0Z75TCb5HxS
         U/2ns0BUKTO7A4UQ1zWbt29faUKaifyEQPP6xtLok4owMfV6nlf/s7RGINDD8FaSUxNJ
         aQm/RPCce9GvjKjHtTMuocHOuKsuzkZqVZkucc7xNb0XN4COKTuCpBCDO5MJV4Txhhh5
         mUXlhy2XXmGKSfjidz2nYJRefClhl7TF/wGVqxEtmmCI5UBtq5RnhDwcy/nC77nK92Qp
         3Qv04nn6FpikbELYmycnbWBzABK5cpvggVqEeHuBNUTuTbBPsCUSFs3978tT/pYrlrb3
         P/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699136777; x=1699741577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFddYtCCcf1uWTg2daUt4KqHC4rRdcekNan46WctVmQ=;
        b=C9nKjN0ZdVYWtmFgEbqg2/XaT16XLMVm0rVlO0KQRkwoxqfB09onsPdYNLRGewof/j
         QBFge634efHDhwhgrQP6VUAVmkJdbTtRKcwIV2TokQ+P8nCEXUi6Yc3h1wJ0gEmI+Ikd
         CSNtRkRpU2qwbclp5xqV0NSBrfhoiHCQ/XRJG2OMp0GQ/oX8yGZlJ/NzI3hIufBJ55ak
         sw2Sq6P2HnJ67KaxhRRnjqF8s5SIKLSz8n3fhZ83c2CtpiS3OmXfF30zhNsDSBsgK24Z
         xn+gfmCPamP9hT/4ThMw1WWpgEznknwA95MSkY+TW6gyGi/J8FZ5S5hQJiK/yS6dOPIe
         G9eQ==
X-Gm-Message-State: AOJu0YwGba+uO0nTk4M4kLOLsjWRnXd7NsO/NtzJRq8yjhhI6uFEiIrv
        +g4qJS2feZb855o9EositPd1q+raHKpV/6zxBHRslg==
X-Google-Smtp-Source: AGHT+IG7ooOyodxG2Gl6rtRWI8g5woVPz7G3j5POn2CVv6+O1HkJVZPcJtx4r/8Eo45pTP1yD9KvNZlB728bTknKn20=
X-Received: by 2002:a81:7984:0:b0:59b:ce0b:7829 with SMTP id
 u126-20020a817984000000b0059bce0b7829mr6348697ywc.35.1699136777680; Sat, 04
 Nov 2023 15:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231103195310.948327-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231103195310.948327-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Nov 2023 23:26:06 +0100
Message-ID: <CACRpkdaxvKwodyiXOYfOdyLYNzqKuVKPK3AtoC6HaRPdB4tLNA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] leds: trigger: gpio: Replace custom code for gpiod_get_optional()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Nov 3, 2023 at 8:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> gpiod_get_optional() and currently used fwnode_gpiod_get_index()
> are both wrappers against the same engine internally. Since we
> have a pointer to struct device there is no reason to use fwnode
> type of GPIO call. So, replace the current fwnode call by respective
> gpiod ones.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I don't know what I was thinking here. Probably I was thinking that
the nodes doesn't always have a device, but hey, it does...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
