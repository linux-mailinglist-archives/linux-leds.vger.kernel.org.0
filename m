Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86274BFDE2
	for <lists+linux-leds@lfdr.de>; Tue, 22 Feb 2022 16:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbiBVP6x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Feb 2022 10:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiBVP6w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Feb 2022 10:58:52 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7463FA41BC
        for <linux-leds@vger.kernel.org>; Tue, 22 Feb 2022 07:58:26 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id w10-20020a4ae08a000000b0031bdf7a6d76so18124950oos.10
        for <linux-leds@vger.kernel.org>; Tue, 22 Feb 2022 07:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B8JvjaTjY5x6FwC5XX0Xd9tUnU5yJOAD3HFMx9LpIc4=;
        b=pmLvMCn79H7B2eRv3+Kd/CI2tWqZXsbSZHvVjq3KluzTud013tfjdnH0aDZFn/YcAU
         TnS3i/6WWYrSGhGvpEsfQI3DJ90i0K56rWIkz8AkZm904ee9V3Nt+axQI2Za5RRaMP7q
         1FQ+Fw5RGYL3zMs/NUCVYpEI+ZQCgWQ9YTfrCfWCvXKgquypYM69fRUyn1B15Vpv1iKO
         ooFAjtG0eO478wsXEg/22/CS3OkhD2MKBSwJZAddVgszf56RgC4voWAc1KiXUlzSB6L0
         5kVziciEi2tQdeDQw8epnt3ORdgCqjpAjVUcqIGeMm+vzYMHfojt9Uhj/ZoOiexBNuAo
         ZA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B8JvjaTjY5x6FwC5XX0Xd9tUnU5yJOAD3HFMx9LpIc4=;
        b=g6k3a0xp+m/YL33ka7KnoSwqbMNZyqP/NUEIas1a6c4fzl3bUD1H8d8HnKE3mjD3yq
         faikAKDdIkkvJkQ9xYEWLkgxOrgeT8n3pKoD5E0WlGgdrZHn6WBTYP//rfMTJ/xbmJ+V
         KAgycpZzulsC2Nwcins3H/FFV5mrb9dzt/sqAt7SurIp/Wjhz61MYUnv4Uf7SbvA9NyQ
         tz+sMEiucgAedlCOeCL27aU8EnvpbVw++OWKKfNjsyp3B8j/HSx6js1EOK70JyHhzJjr
         pwIWdy5ZQhY0Waj8jaZgIxPmSnWCWyTqH6Ay3Bzr5zzQOkV7r0gOKEAM0VpQ7LOqoZno
         9poA==
X-Gm-Message-State: AOAM533TVhL/jpLRzG48BfQ0yZqxestVQrSMkjCJ+YIQsJFgiUay8uC5
        JY2aZKeAWef9lk4Um9doSJJyIQ==
X-Google-Smtp-Source: ABdhPJyJZnjfzwYKwwBjFXFsbKZkFdI/kcs9GDvW6zW0kYCxeBlnlEvCaOPBKOhD3Z6BuldBL/JXPA==
X-Received: by 2002:a4a:d415:0:b0:31c:3fc0:74ce with SMTP id n21-20020a4ad415000000b0031c3fc074cemr4375349oos.47.1645545505563;
        Tue, 22 Feb 2022 07:58:25 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id o22sm7499468otp.21.2022.02.22.07.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:58:25 -0800 (PST)
Date:   Tue, 22 Feb 2022 08:00:26 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 1/4] dt-bindings: leds: Add pm8350c pmic support
Message-ID: <YhUImreyfDf9xMmq@ripper>
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
 <1645509309-16142-2-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645509309-16142-2-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon 21 Feb 21:55 PST 2022, Satya Priya wrote:

> Add pm8350c pmic pwm support.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes in V2:
>  - No changes.
> 
> Changes in V3:
>  - No changes.
> 
> Changes in V4:
>  - No changes.
> 
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> index 336bd8e..409a4c7 100644
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - qcom,pm8150b-lpg
>        - qcom,pm8150l-lpg
> +      - qcom,pm8350c-pwm
>        - qcom,pm8916-pwm
>        - qcom,pm8941-lpg
>        - qcom,pm8994-lpg
> -- 
> 2.7.4
> 
