Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 441DFF709E
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfKKJZx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:25:53 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37585 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKKJZx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:25:53 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so4142524wmj.2
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OhCha09COfgKPtZLiOdmeCfAFANdSRBnfQoI436vAFc=;
        b=kZPZiQyy9gd/WCmfdT0wc6TN4JLHAvMXmaxLilUQegA2YhfTRSZrmqW7TKLSuPyMDn
         +x8tdXkQ7PW4Br2k0sinujFdrQ7SCrG+PpDq/RZ542MrG9L57mfRQnYkxFm0lbRJ30VI
         uFRc/EUwu7WA2upRC0lelKTE0WBo2EFku5QrFMhqrmseZP5tpMzx71G7sBUu/Tuep6fL
         XLjOFAKVzoLmN+LRE6grlpQ68CMD7HFDTvnFkdZsoY2GQE1KHAzDacRGr3QY2x1ALXNm
         tJH6MLLOlVJgyyU+bOjZ4u35qcxklOqbZnAyB4jRfJdcQJVleJPk6/IahsD0Mt7FdA23
         u+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OhCha09COfgKPtZLiOdmeCfAFANdSRBnfQoI436vAFc=;
        b=aEbrviY8XVlZC/WQcejOwFtNASWI0eQeWAuvegjF11hkLP9mMnn1mbyw254TYgv9UR
         UW2wpqQ2eECuw8orgAdYVbufemcL+1OkVzkc5cmc0jGSeCVk6oiTliSWfgcO2llxhrtY
         9cGpQSdAUEu1HljoAQIRDccylhbjAmn4N+LXaIgcpr1PTaTv/4wdTgKQld4ydwvmuFfA
         kMnOFhUjrfXq1l2SvKzipFfF+15FxqmefMr0rM7hH95Wzj9ufNZiY4AmiiPs6LkoQ1t1
         ikDjbx0BQ6btT1aSCduB6pC90H7SbMdKcT9tMIlo5G3+xl5sSu3vfeb2Ga9b4ayIbhqw
         +6bQ==
X-Gm-Message-State: APjAAAUDcDzL0/ndd6P6m3BO04tNSZHMWzxpZOzBZu8UkEzHVXrZKkV+
        elG5VzjV5jJok6q7rIYiH3LIfA==
X-Google-Smtp-Source: APXvYqx9qAByoszcpaFD12J1nUjhRfEepvndPETih1nX2g0RiujoIcYX0NEsOgXnWOvGeTz1TgEM2w==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr19985324wmb.102.1573464351581;
        Mon, 11 Nov 2019 01:25:51 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id a5sm15368078wrv.56.2019.11.11.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:51 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V10 8/8] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191111092543.GV18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-9-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-9-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> The auto string detection algorithm checks if the current WLED
> sink configuration is valid. It tries enabling every sink and
> checks if the OVP fault is observed. Based on this information
> it detects and enables the valid sink configuration.
> Auto calibration will be triggered when the OVP fault interrupts
> are seen frequently thereby it tries to fix the sink configuration.
> 
> The auto-detection also kicks in when the connected LED string
> of the display-backlight malfunctions (because of damage) and
> requires the damaged string to be turned off to prevent the
> complete panel and/or board from being damaged.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 400 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 394 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
