Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EE85AD45A
	for <lists+linux-leds@lfdr.de>; Mon,  5 Sep 2022 15:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbiIEN4j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Sep 2022 09:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236361AbiIEN4i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Sep 2022 09:56:38 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A421A5927F
        for <linux-leds@vger.kernel.org>; Mon,  5 Sep 2022 06:56:36 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id w5so11462060wrn.12
        for <linux-leds@vger.kernel.org>; Mon, 05 Sep 2022 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VT+d8Sbd5W8mLqa1j12zk4P3E6vPQDfHFgu8wV0c8kU=;
        b=KQBkL8+LUCINiBlGPu96tzFBLuXNzE4riXvwmM+vXKMQFcBgsRUtPqCEr9GTtspFfs
         2GF5jEmayQUJQJg9eZhXvVztrWbQwUI5ymbTWJRv/O3d+TSiX7ZNKIaW3/ceHMxkPsF+
         nLZHRLUkPdNIggmbms6AGxLyWIL5xj+U/us6OiPHqla1R0mfccSmG/8V0a66Uzc6Ls2y
         A9TtdU/FZDlF1KN8PcbU5Q8fI84vL2T1olUwRM4I6Mp0nzuUWLb9K9VTlZ3xoUmvTpY0
         k81vE2RyR8tTOpzuixJPQujvaN5jcNeRAlUv+wvr1mqpe5foFwM5+SB4CeRMCAuE8r8u
         PvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VT+d8Sbd5W8mLqa1j12zk4P3E6vPQDfHFgu8wV0c8kU=;
        b=kFIPaEQmW4N1YTFsJLk/JHWVYMjQ3kahm7IkT9Aov1IS054Nl39nH/WdwbCnZ4Dux6
         PoYEhYtZrvP7Tc3yFtocWQWcANMUqvl3uj0hMh/4JlAYAtzca/rhQaEyZk8OVgEqLsQA
         hEjR35+rqaTPJ2OrlSLajnT9pY+YuwEp23fxX7fZe2idPfBu11bvk3GZUiujlkYLnvLP
         kooBV+cgi4iR37ypRFvjbOnQwFAkJYo8+rmPxA+YUIE+33L3YRl1GCMlHkHFtbXG2C3S
         FvxsjZxe3oibzYi8SoRkB31VTFryWVbdP5KSYRRvk7cRhrjp9X20YlLOPaAgy2wXppei
         9aUg==
X-Gm-Message-State: ACgBeo1zskH9RDSUIgxqhQ90Pdx18eGGK23iNbqQKAVGjETGPJn+H2Tr
        wANgHXKuCOpWov2XeoRomgWiWg==
X-Google-Smtp-Source: AA6agR7Emswl4TxFnmpI+2Jss4ARLU9twp2S5tGeirFuYf0ymQXCu5X1srK1xfcsCVgZNqNABJ8ABg==
X-Received: by 2002:a5d:48c2:0:b0:228:6226:381a with SMTP id p2-20020a5d48c2000000b002286226381amr5239315wrs.366.1662386195132;
        Mon, 05 Sep 2022 06:56:35 -0700 (PDT)
Received: from google.com (ec2-18-168-47-91.eu-west-2.compute.amazonaws.com. [18.168.47.91])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4e08000000b002254b912727sm8820342wrt.26.2022.09.05.06.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 06:56:34 -0700 (PDT)
Date:   Mon, 5 Sep 2022 14:56:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of
 addresses
Message-ID: <YxYACwJmo/FlbVgk@google.com>
References: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
 <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 25 Aug 2022, Krzysztof Kozlowski wrote:

> On 20/07/2022 19:37, Krzysztof Kozlowski wrote:
> > On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> > also fixes dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> 
> The resent was a month ago. I assume this won't go via LEDs tree, so I
> will resend (again) without Rob's review, so it could go via Rob's tree.

If you have not already done so, please resend this and Cc my
kernel.org address, as per MAINTAINERS.  Thanks Krzysztof.

-- 
DEPRECATED: Please use lee@kernel.org
