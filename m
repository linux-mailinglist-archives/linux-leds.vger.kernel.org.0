Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2041C6E02
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 12:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgEFKIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 May 2020 06:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726354AbgEFKIM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2020 06:08:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D63DC061A0F
        for <linux-leds@vger.kernel.org>; Wed,  6 May 2020 03:08:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x25so1926328wmc.0
        for <linux-leds@vger.kernel.org>; Wed, 06 May 2020 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d0Mbz4IlNlOD6NWoBttZxtAzOi0yfZP1EXWbU1DQp9Q=;
        b=Z7R1iFysNju6kMVpM8kSyPU9reJ3/lCVZfmYivHjP+o137oLI+OylHjmc+n4PogcNm
         a5Na1bKrSFh6vqcnnuyaGJXMn8AIo2J4Xoib4FDqLFuOJ47GPL2MCqOJM+kyU50i0C90
         86E8mtAD6WruBAVwV+XhgAw1BjN7NhphyxxHRobpypSlG7WtDiL9CNPwcrvE4rD3wSLh
         kMEv+XbPGaRXlXsk71fHXekWGfjwn791PsvSjKJ2OqopNMTtubyn6xDVaruvPm8TL6ml
         SwlHtTh7QVMALH3cydlLNFggmlqWjM5Zi3uDdG5SVVh4C5IF1axFqDJpteLirg8vclOn
         OIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d0Mbz4IlNlOD6NWoBttZxtAzOi0yfZP1EXWbU1DQp9Q=;
        b=GK+RC8ZGkydvbgKYgpOu4NKDv188IQfH0La/Udzitt9YFlLvXOMDmWphlSHwy07qbc
         V/UtTZ2ORPvaOnUbKEhr9nYJBTOJ7tIXHiBIKVrYIL7pHnXQ8yKfowWFBIaXI+MM2N2C
         T0zH6gFM7fU40IEh2DlTzbtBKs2C9q8F6w/Shi9SPv7wwUxEwRHa07xPVOQF/iCE/+Ro
         JAMa0QF1Z+6HDFpLvprQaS5uLtFB6vVC2OCe0/wes4QWHs/804T+l7i4w68o11K4YxU0
         3idFde0BfSBlRdOK/9CIsXi9z0/izg/mzOLJ/0P0MgxzG+1H4E8S8ZkJ9XFrKrnpyaFJ
         bCXg==
X-Gm-Message-State: AGi0Pua22jbwjxHLj9871jS51mfwggRibALYgdH9k33tNTXX9axMD7UO
        9OvB1HOWGcpMQevQpNJQDuMU5A==
X-Google-Smtp-Source: APiQypL3RUgh074vMzPhOQV/+cRFmEYLPRligBsdSST97UzRQldJjqnOSxvZmUKsze74rOGtmCISQg==
X-Received: by 2002:a05:600c:220c:: with SMTP id z12mr3580308wml.84.1588759691135;
        Wed, 06 May 2020 03:08:11 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id 138sm2440363wmb.14.2020.05.06.03.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 03:08:10 -0700 (PDT)
Date:   Wed, 6 May 2020 11:08:08 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200506100808.GE823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-3-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> Add wled_cabc_config, wled_sync_toggle, wled_ovp_fault_status
> and wled_ovp_delay and wled_auto_detection_required callback
> functions to prepare the driver for adding WLED5 support.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 213 ++++++++++++++++++++++++------------
>  1 file changed, 141 insertions(+), 72 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
