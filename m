Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCA9403B01
	for <lists+linux-leds@lfdr.de>; Wed,  8 Sep 2021 15:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351689AbhIHNyF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Sep 2021 09:54:05 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:47003 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhIHNyE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Sep 2021 09:54:04 -0400
Received: by mail-ot1-f42.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso3010996ott.13;
        Wed, 08 Sep 2021 06:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D6Tk2L9d02zWcHjBsqwH5fQA/xlfNx8obSAv+tztxzw=;
        b=iVjnYpr7XaquqXoB74lonwUaN8hHYyIqL0Uin+xdi4mbre2VUz9IsRsvxIjlzF2erc
         wl8qfZebDbwiXdrg118BIFgMa7r/fJB2K8XfPZfGvKUa1BHuNGemW8/uRIg4q8dFqizI
         qKOSaDtMs/898wNi4LN/m0RsGUGMner+VKn1nCbLY9KMZhKPtmVUlP/IoR5l0aTtkEvm
         L1Me5FOIOp7JxL5hlxjHPx/oTfJdUF16dCyw97XTNRY+JKHJ/c4JortCBrCLp023UN5L
         Rg/YGIrlfxMpYHTnF+1PZK1RwjAggsfUvLzL9Kvbg5K5jcvf3UhwZ44mI/Of8B/cCIMj
         cIqQ==
X-Gm-Message-State: AOAM533Bt94/tmgWTb9s722IjwLC5oRKDtTe5InljUNet0cY1cl+L46+
        orGI/aWQ1Qh1J8u+OyFFiQ==
X-Google-Smtp-Source: ABdhPJzsjefa19vIHWqwFsi5sJeji2sL77qKdvvKctwQIEKoetqysxJdXmdkeh/57JybJ8xeCYQDiA==
X-Received: by 2002:a9d:4d85:: with SMTP id u5mr3224135otk.51.1631109176129;
        Wed, 08 Sep 2021 06:52:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i1sm468634oiy.25.2021.09.08.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 06:52:55 -0700 (PDT)
Received: (nullmailer pid 2030549 invoked by uid 1000);
        Wed, 08 Sep 2021 13:52:54 -0000
Date:   Wed, 8 Sep 2021 08:52:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>, mka@chromium.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        kgunda@codeaurora.org, swboyd@chromium.org,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add pm8350c pmic support
Message-ID: <YTjANsE8Oh/ThEvj@robh.at.kernel.org>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 06 Sep 2021 16:11:05 +0530, satya priya wrote:
> Add pm8350c pmic pwm support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
