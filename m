Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5973314A6
	for <lists+linux-leds@lfdr.de>; Mon,  8 Mar 2021 18:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhCHRXZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Mar 2021 12:23:25 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:40194 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCHRXV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Mar 2021 12:23:21 -0500
Received: by mail-io1-f52.google.com with SMTP id i8so10762436iog.7;
        Mon, 08 Mar 2021 09:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t87CCa35bqPyH+5rtehXh9/9TmKJVxVWgeAklXE4G9w=;
        b=JIIfgWYUPphtYUHNOzHspEeLPnoTc4brx6QR9AWZHrRkDhuIZmAhdI/Ym3mW0PHuLi
         yHmW4LShMwb9OCftFLysKxzcHUP7dLUb5i/dL3FiMvHuh4JEZf/H3K6dSBMMdf09ZRxF
         OmNixuA2IXcQtm+LH1WJhqCva6RExfpg9dwf3x7aWGFVODIV7eb2xunZnyUqcuU84NdZ
         HrVvsxGTVQEY7qr69e7zV5hQDKH5lwV4KinyHvBrkzxuo5k8Xf1FwYo40VVcUCovNDdA
         GhQMnPmAxzRr28dZNy+hub2gxdnP1Yqwhmib9+Nb/ZzlWKiYpmvozHV+o3A/UNCxIm44
         SMtg==
X-Gm-Message-State: AOAM5337/mji/kKPpUDA5EGO4vxjG3WAqwG6mbrQgWl4vYJmEk55TI5f
        FLu+bFeZ48TZewGj72LmTg==
X-Google-Smtp-Source: ABdhPJwWpjx/LAtFOUHhB6Mb5nbd8qSM0nlIGMyripcZWJpKoFzXah9JI1UE8tDmOeBEHk/3qrkLSQ==
X-Received: by 2002:a6b:c997:: with SMTP id z145mr18975688iof.36.1615224201004;
        Mon, 08 Mar 2021 09:23:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id x2sm6479656ilj.31.2021.03.08.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:23:20 -0800 (PST)
Received: (nullmailer pid 2657444 invoked by uid 1000);
        Mon, 08 Mar 2021 17:23:16 -0000
Date:   Mon, 8 Mar 2021 10:23:16 -0700
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: qcom-wled: Add PMI8994
 compatible
Message-ID: <20210308172316.GA2657398@robh.at.kernel.org>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 28 Feb 2021 13:41:04 +0100, Konrad Dybcio wrote:
> Document the newly added PMI8994 compatible.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
