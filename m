Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64690532CC9
	for <lists+linux-leds@lfdr.de>; Tue, 24 May 2022 17:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238570AbiEXPDG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 May 2022 11:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238517AbiEXPDF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 May 2022 11:03:05 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA79E8A33F
        for <linux-leds@vger.kernel.org>; Tue, 24 May 2022 08:03:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y13so35197391eje.2
        for <linux-leds@vger.kernel.org>; Tue, 24 May 2022 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlQEZ/gCc3QpUXehaN1GEEfOCVI81XCJ2rd4OltFdLY=;
        b=CbNc1wxia4KBEnPojOwiwyFFW4lhBKRf4AQt/+oQ3TR8JoKODULUGG36Ybz8lklHLj
         L6zd81OhoNFtQdzWk3JnSpvvQeD9/k+wmO7sOhIrSK0u/1YI/HJngN7SSxXuQ9A23p0/
         PBjADz9nDQP9Py1zA+vYmC/eIvp1CfMTlYZN0zZ1Wxx+rIxWfIc6Umoo1SMLcZVFwvHL
         +8Rg9i8OTAnChsU+N3sBsft+ZwPVVRVipal3rAR2RxAv0D+b1O9anbkY6UfjcMkyHzi0
         zbrTbd7o8+x9SZDqISgByUttWLIFYko/kvdNsMpBgxE9GAw28KiuSo/i2w15EPbM1r4t
         io9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlQEZ/gCc3QpUXehaN1GEEfOCVI81XCJ2rd4OltFdLY=;
        b=bcyh5qRagEVIwxicB+waP5ddlmgX2rfmgbjE//ahCWN7LbP8zDpNvb6UegCXG4J7DX
         i/JhPEH4Qgs+1UvwQ3TpeP9SZLgvH5uXbPoE3PJqLs2Z5tB2jj0F6qHO1EwRiWMWpVsU
         A6Ml2IiN7hUEE0896MMXUN4wfnKdfq/TiRYbJEO2lbv5udJxctpSkJQJ6tzjifm/unf3
         Z0R7Du1DL83TFyYYRQoZtnB32l3DBjLAfWVuOCT5BkIpr7PJtgcO/ZJ59U7n1garcCNa
         rDrpxmmXTWGlDlfmcaxTKl9PEZ/pwbGByb672WMWyFQOpFPL5B5M7L/Ni7sEo6ravHCc
         lT4w==
X-Gm-Message-State: AOAM530kec7MMysGO7KEiB7IeGcz1R4q3ZupBP66b8J1PivoqWYZexyj
        6DKj4rj9i/X9n3QkGaDHHexCUmZaW6J4+kyH5BUAjA==
X-Google-Smtp-Source: ABdhPJzT/FI/PkyFzW9TIbfxwAFTxWm8y8bCfFXrNT9T+t7BemqsE+qUfpfq2j+/xSzZ88zaoNI8smzlJkq8rYwpRc0=
X-Received: by 2002:a17:906:974c:b0:6fa:8c68:62a8 with SMTP id
 o12-20020a170906974c00b006fa8c6862a8mr25615119ejy.293.1653404582161; Tue, 24
 May 2022 08:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20170323055435.29197-1-bjorn.andersson@linaro.org> <20220523163038.GA9124@duo.ucw.cz>
In-Reply-To: <20220523163038.GA9124@duo.ucw.cz>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Tue, 24 May 2022 10:02:51 -0500
Message-ID: <CAOCOHw7N9EHcxSSe6n8828oy2fh6xNxRYf9OUXkY4SQh6gtVLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
To:     Pavel Machek <pavel@ucw.cz>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
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

On Mon, May 23, 2022 at 11:30 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > PMICs from Qualcomm. It can operate on fixed parameters or based on a
> > lookup-table, altering the duty cycle over time - which provides the
> > means for e.g. hardware assisted transitions of LED brightness.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> I'd really like to see the patch fixing the pattern interface (or
> disabling it). I don't want to push the tree to Linus with that bug.
>

Please find a proposed update to lpg_pattern_set() and the documentation at:
https://lore.kernel.org/linux-arm-msm/20220523233719.1496297-1-bjorn.andersson@linaro.org/T/#u

@Marijn, would love to get your input on this proposal.

Regards,
Bjorn
