Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC141C6E09
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 12:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgEFKIZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 May 2020 06:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729159AbgEFKIZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2020 06:08:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3381C061A41
        for <linux-leds@vger.kernel.org>; Wed,  6 May 2020 03:08:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z8so1494311wrw.3
        for <linux-leds@vger.kernel.org>; Wed, 06 May 2020 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=S5wjK64FTvIBUVGDVz6eqN0rnGF+I8hoKjMUDtYZWj8=;
        b=qrtC2sCMpZ60MCnJYVqgIBCr1c4yVFgq0J7IINfi6C2o3ZpkjkmQH+yah9iqks+c0t
         o93h8LJ/SLc7b30VAnD+RH07r6ktNXmtE535lCnuJHRCK5+SXdkPicCLbwSKDL7HiB38
         9sH5eO69Ic7cZTvCU2NqJVvty1qJgb0VUin+wHtLhnjyMEI1NLhfzO9zoGHNKjlcuxi4
         DAbJIzabXgD56W1vmUcEsX5A/BEH1EJ+mb4F5H8O7EzHUjVkS6b4WU5yeaWO5z5NV1NM
         C8p++DwtqPtBl2X2YdsbKARE37kagvNQEGAWK/OEGI0ET4dVoszmnqmpOlqsO9QSE+es
         LIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=S5wjK64FTvIBUVGDVz6eqN0rnGF+I8hoKjMUDtYZWj8=;
        b=ZaOq7d3szPpACsvisCd10TtV2c82EAMJcOjkCHoBQyR/K7vJK06u0ZWYcnCEdLG6Vy
         A5gOEzzXqpb//ZjqqdTwjEGkK/Y3qyeCaG8PUj1zMWudkLBe8qW+lvAie5WyKmvnFjnH
         J/mGuTsFZA6PNXR04mxMO7gnwc0I8/5cZRH2NXy33u2l0Uh0Zx+Nr4Kr2DFmrLMkoMx5
         C7vVHXZr8dj3MWZqzNcvnWbrgeoe7zdu285FTyY8YNJzNhInrV8wIU/xikql9bH2pWVf
         igjzMdDa44NI4nippnCbycAPxjzyuBZjkzR5apRLk/f8Z6XUF/SR7gq4g/HHzoPSVYIs
         nISg==
X-Gm-Message-State: AGi0PuYXbDvcyb1VHiOK6+I8knaBGkb5IWu4IEELzOoMSzpLA15O8Si0
        pTNvoZRru39VrzqeaHGFY/Sabg==
X-Google-Smtp-Source: APiQypLG3DH7DJNZShRtgYXyoOjxP+TIAMjAS7WtIWfxoyMmVGs10rGkH6+s+On16puojbDyPclMEA==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr8780517wrj.269.1588759703535;
        Wed, 06 May 2020 03:08:23 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id j13sm1920029wrx.5.2020.05.06.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 03:08:22 -0700 (PDT)
Date:   Wed, 6 May 2020 11:08:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200506100821.GF823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 59 ++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
