Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FA31B619B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 19:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbgDWRJB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 13:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729719AbgDWRJB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2020 13:09:01 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E975AC09B044
        for <linux-leds@vger.kernel.org>; Thu, 23 Apr 2020 10:09:00 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e26so7211009wmk.5
        for <linux-leds@vger.kernel.org>; Thu, 23 Apr 2020 10:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HyYauB8Zb4kPY2jhycDpuK1O3YKpPPWs1jRZhg3W+PY=;
        b=YIzqtZTQ86QFuC3Fm4NBWsdOm0pT4cBdJ7LP5GP2m1Iy0O7jxZ4FN6lCTA4pC3+xEi
         h8VeJgo2IBWMDWo+UMx5OdJyoS3Dq7CwWyqIzw+mpQOoXpKhW6CaDct1MaBX0WFNswe8
         S0Fd49PA/VO1sC7i2qPSiJU2syTaaBJbrhV0dWWNbPVG3KxVQZW1Y6bEZIH9/6cxLJmM
         L/T1dn/jbwKPs4moZuwT8rK7gg6iiHRx4h358kfomBb7V37Y/DqboBHiSGV8uTjXTW1C
         2uJGiuc9P3sMJZlpspCAZFLGblsS6gZqFdijjC7UOcFH8G58rHKZgdYuqVqPEKasyViT
         pdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HyYauB8Zb4kPY2jhycDpuK1O3YKpPPWs1jRZhg3W+PY=;
        b=g8SPlPMDy3ZhKYsyJdI9PxF69Sxe4yejw7uW+vtd5ObqoUNCGtCToXqXTn/ruO4pS+
         su5e1QKZV9wtUVa3D+5Jjtyh5jYF0SWtjuhYaMl8oIUVnj2en2YVU2L6jehk3fsEgoIH
         wCONPfb6ObmPBskFgP0b0YCaSgPHzGXY+6Z18J32wp71OfmeSiYyeqt8foXi6JZ4rpAY
         eym2A+Xp5Ml5G/tJRPG+3ZLm0W+/Uemln6cdXWTclHQtEJAC2kTbB4zBpH/Q5raVuIrU
         /4pmjjcOgTMmOw4AxGf4L8Irirj8qHemiD1ofSOWPik+F1bStj998vMGmudYpnp4bz3d
         Qeew==
X-Gm-Message-State: AGi0PuaxYhlSFsTSIVW+2kZszAu7A6XsKKMQiAystNc67782BXGnVci5
        JhijJZ8BW06IFvjidbv+BILGUw==
X-Google-Smtp-Source: APiQypLTFoqOzEEgVSqQsK2DVwkZLCzK4Qr3KYvzNDTrgnBoJM5h/atmfsvo1wLAjiYN7AmpJR6jMg==
X-Received: by 2002:a1c:40c4:: with SMTP id n187mr5040344wma.28.1587661739472;
        Thu, 23 Apr 2020 10:08:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s30sm4475128wrb.67.2020.04.23.10.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:08:58 -0700 (PDT)
Date:   Thu, 23 Apr 2020 18:08:56 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 4/4] backlight: qcom-wled: Add support for WLED5
 peripheral that is present on PM8150L PMICs
Message-ID: <20200423170856.f4r62iwcg7qtppva@holly.lan>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Apr 23, 2020 at 09:03:37PM +0530, Kiran Gunda wrote:
> From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> 
> PM8150L WLED supports the following:
>     - Two modulators and each sink can use any of the modulator
>     - Multiple CABC selection options from which one can be selected/enabled
>     - Multiple brightness width selection (12 bits to 15 bits)
> 
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
