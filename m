Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DF6333899
	for <lists+linux-leds@lfdr.de>; Wed, 10 Mar 2021 10:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhCJJVy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Mar 2021 04:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhCJJVp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Mar 2021 04:21:45 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0BCC061760
        for <linux-leds@vger.kernel.org>; Wed, 10 Mar 2021 01:21:45 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id 7so22479416wrz.0
        for <linux-leds@vger.kernel.org>; Wed, 10 Mar 2021 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1dMDsRJi6X7RFDQQQ96QgnONRBTG+sEDdR1IWXfZlxI=;
        b=W+DJoNj9bBYATgZUAqeGOcJC+D6Hm0fUTfpOX/nfrQorUYX0n4GMgTKiGPm9maOEGo
         jJEbPk9YxrksTMIUWEKLTMMPZUE3K3JD1uzy2/YgERbc+DtReqEclprcHzcXbUZkCtgK
         dofcYGgRLjspqQ02wswCtKFFlcgHYCG7pI64jxsoFj6wjEdDKRS1gt8ucvtPMr1+wiXH
         V/ZWINFeo54CPqxA/rG5FASsH7SuIr/xMoPbF+VsDdIRqKv/UxlwLwcteDBdVTSJWc0O
         mMDifDG6brOm+PToPYN85FgTl6AZyRU9xfUh9opj8fWJz2+IRQ0JWOsQc08QN5F0mrcp
         5KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1dMDsRJi6X7RFDQQQ96QgnONRBTG+sEDdR1IWXfZlxI=;
        b=t3+ZmmrhsxEhELDy3s74Qaqaneod99/w1f0pvordRkSTZmMmRNou290rSgMZOku7fK
         ljuEbyi+6TO97P1IU9FhS99e7542MWsrXP3Nf7pFi3yUOo6EkN9+I4QITMmXscWaLS1/
         AqhjEbpDw7zPsYsmkhveqE0ITXfS44dyU4UZKZhfmmCm5ZOFAenOEQggF/pHCIw4kxi1
         +u2/AqBl2qB8hVAfYO4Lid6wqTkzEVjMHJH2eEBQn7LgmY7fgGng7yn9Gp1sbU1H6jZT
         r4NzeHP48IjjqF7Ae7eeeR3P/bKf1FJry4PiQWMwIX0K+GJNZe8bMlIbeMj2QXSq9nFo
         lK+g==
X-Gm-Message-State: AOAM533tGCHaQVbncz4254StX8fozZrO61v6pdsqvtacyoG73f4GWsd3
        mvc2f8kdMTTIFQkFj4QLYKcceQ==
X-Google-Smtp-Source: ABdhPJxuPtNe3ElR6uJROL0vscwDtpq5CtKpwKbdJ63dZObdhgzH/OA+daBodljwBXleRgt+pFfpUg==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr2393819wrq.339.1615368104145;
        Wed, 10 Mar 2021 01:21:44 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id a131sm8233043wmc.48.2021.03.10.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 01:21:43 -0800 (PST)
Date:   Wed, 10 Mar 2021 09:21:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: qcom-wled: Add PMI8994
 compatible
Message-ID: <20210310092141.GO4931@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 28 Feb 2021, Konrad Dybcio wrote:

> Document the newly added PMI8994 compatible.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
