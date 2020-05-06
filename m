Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D371C6E01
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 12:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgEFKIE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 May 2020 06:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728399AbgEFKIA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2020 06:08:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A57CC0610D5
        for <linux-leds@vger.kernel.org>; Wed,  6 May 2020 03:08:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x17so1482593wrt.5
        for <linux-leds@vger.kernel.org>; Wed, 06 May 2020 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eh6CjI5qlJbfI0/vhnP4eL4p9yTZrlT7LtScBoT0wAA=;
        b=eF9rRF3kORznrWQ6Ryu3DYtV+uP9iro81Ds3jDSv9PZLgiljc8BeSRWDmWt0EHcu1v
         yc+OcrRTIVK4KIEKG2ikX9qJ8Ghwpv37guMlIDqPMIcxKbAhnIJcMNAhv9kJlNRvZg8w
         ykbxXQtCjh3XePczObskArBb5wqVbvEHrUG0+/SvqwTj6TCpkTovV4JUcDamaefrtQtY
         x4HuBqf7vxVZ800ryyJamkeyn2bNyQmHLUk6N3TcgjgX7pvosP8KzVB7qmbCZ1q3Tu6M
         /ZDNTK1t9ymxM0/a3RWi4RgJxJAv8Sh5+CWOiB44foLpnAMliiporE/qh/wlrfCK0qzO
         1PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eh6CjI5qlJbfI0/vhnP4eL4p9yTZrlT7LtScBoT0wAA=;
        b=KL3SGKnBRG3CTXwplPfApwticVCMuj7NvFjz3HebuEXS/FyGEM0dvVavKDQYqPqlig
         EMWRIFMwntt4Oe8vHWM1L+TOMPZazq0KY3z1uHEhszN/B9AIZnk+jtzW7Xo30iPa9+BO
         JjNnwxe3+m+NhCyE+nVEAEYwtf1M8eAaajN8z64HbhSzHHtNirgoKi6T+CyOPjl2j2Zh
         OWcvR4PEch9C/uszwp7WfhauTFS9jz2A5zh3Wbcw3YPZjYV6rje1n0BvPrS3Jmnkm8DT
         bshfvG7DhS+WtfuTTkYcUcw7FxRoQidgljH19047ibNPCmO1S6JIGV1CP/UNs7tUPLHz
         7hfQ==
X-Gm-Message-State: AGi0PuYc2Cd4ZykvQd7WxZOwXIZ/xa+0PjzZpIP3MLDGNed9r+X6TZzl
        haWGfNrpP8iwZtSc0nIeuwVXfg==
X-Google-Smtp-Source: APiQypKuj4JYfxO8nKTrw9i4Yi3jaNONI0rOK9zdGpxB6OGfTP8PMtsRVxoevWRNas/XupOIzfnd5A==
X-Received: by 2002:adf:f207:: with SMTP id p7mr8527397wro.20.1588759678524;
        Wed, 06 May 2020 03:07:58 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id x5sm1820447wro.12.2020.05.06.03.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 03:07:57 -0700 (PDT)
Date:   Wed, 6 May 2020 11:07:48 +0100
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
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200506100748.GD823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> Convert the qcom-wled bindings from .txt to .yaml format.
> Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 ---------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 208 +++++++++++++++++++++
>  2 files changed, 208 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
