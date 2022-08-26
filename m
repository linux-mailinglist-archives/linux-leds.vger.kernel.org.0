Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3235A3136
	for <lists+linux-leds@lfdr.de>; Fri, 26 Aug 2022 23:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiHZVmp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Aug 2022 17:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237878AbiHZVmo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Aug 2022 17:42:44 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A49B5E5A
        for <linux-leds@vger.kernel.org>; Fri, 26 Aug 2022 14:42:42 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-33dbbf69b3dso68038887b3.1
        for <linux-leds@vger.kernel.org>; Fri, 26 Aug 2022 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=stVd1kvtLgfEmwVkeFj+I3sq6eTvN2FbTADCLAaKivY=;
        b=cpORBdKyDf9E+dMF/M1oISvK5qEa/G3NcnVQrFQbWWjMPCPEJBCAUOq6kNgiNOCTLd
         1X40iUjQ1XZA8MuboIiSjjtJ7r0Pcd2l4s2Ti8Y61EqTHP0UQm9w+egw8igqv/EezsXb
         Ia3GrgGZN9B7BQLEdSeHRWs9aY5C00jVW9xuD+jb0Jay6fZngjiYlOK4MphbusgD1Aro
         Fps9c2cm18M7TBXnqPY8SNC7LpLUZMzm3ZgUIaqdmXxtdO3HM/8LVJ2nGutNpze43pzt
         dl0cK9uU6uUfc0prCPyIQhDt0jTyvIhoGYcG3lNWc4lFT/osLNNWPvyfXjrd1EEVUChR
         RUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=stVd1kvtLgfEmwVkeFj+I3sq6eTvN2FbTADCLAaKivY=;
        b=fOGjGyianZTyCO44QLQwUV6nzx9XlIqcGvGusx3yS2eRbllpv5ePFpCgw0Zcq8DwD3
         JwB7YzShHeb8wiBif16DUq4PdPifzrcRhleEU8QGXrsoPbN/EtxKx0/vt0h6XSk6Ibb1
         Z89dIt8uRzyDK02+lzmAt+Ubs8P24mghIPx5g6Oe/xdGkzeV6CFeV0//t90iyDT25aNt
         FaSgZAqBVkz2VihuXx59q+L4oBSE9+Wn9tKWEr3B+8AVP7kwggrNkPRTcv9TfiM3WA3C
         eRwC6k2Moex5fnGrq6eV9bcz5QOyCRfXHspBvIEEHA6znexIXFI1OwBz21asTTIYNHFm
         1Ccg==
X-Gm-Message-State: ACgBeo1Hn9v9NjmnrUeQL4WUCz/NrEu9W2bzVv0NTQPoj1MLv4TosQ2E
        yFRyUhGql6q/qpB1M5v8jdT5OXoSlZKcIg15+M73Iw==
X-Google-Smtp-Source: AA6agR7MUxUWlWIUrcYRP1p+BJKCa/BwK4c0Lfj4vCbAboDXjIK3nknSMyrkg2wxgWFegS5KCUPLDRxJTC7ctbNQrx0=
X-Received: by 2002:a05:6902:3c6:b0:694:1088:5448 with SMTP id
 g6-20020a05690203c600b0069410885448mr1577517ybs.410.1661550162253; Fri, 26
 Aug 2022 14:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104422.14156-1-henning.schild@siemens.com> <20220825104422.14156-2-henning.schild@siemens.com>
In-Reply-To: <20220825104422.14156-2-henning.schild@siemens.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 23:42:30 +0200
Message-ID: <CACRpkdZgcLsP+q_jRkKX6gXfXErnnF6DPUzLMzVEtZui24chyQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] gpio-f7188x: switch over to using pr_fmt
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Aug 25, 2022 at 12:44 PM Henning Schild
<henning.schild@siemens.com> wrote:

> Subsequent patches will touch that file, apply some nice to have style
> changes before actually adding functional changes.
>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
