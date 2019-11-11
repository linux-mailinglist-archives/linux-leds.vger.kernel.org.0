Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02108F7097
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfKKJZm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:25:42 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42661 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfKKJZj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:25:39 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so13734614wrf.9
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4p0qtiatlV0SP4T6lSPVHVPXlgHULFnSfHizAyGU0hg=;
        b=XRCUl0ntONH7UguamnyewxwL8FNRl5jKFpvkjL2XRuqeAejncL98iTV2xLCkpWbQSr
         xBN25JtyymE8a0XBGrYbJI5pHr8jvfi0oM24AqCtNC6LxJle9FvadHt/1gNdE3v0GMOu
         PtJMlSAGdQc/4xD3d1HmBJ3IY1rsgmEOP8jxOtf8VMGGc+riDbT9UFXW500Axiv1SEfi
         0bRZFvpuzSv3jHUUzJhoB9NVmj50aPYp5xy7XWDvbOINxxrUj2MjSW6qg8nReOpGUj5Y
         dhuqErqUx3hv3Y17uJUEdWu8XNeW9ln1h57kAE62ZheE7LKr2WhsS1Y89TThUjnCQ5uZ
         cDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4p0qtiatlV0SP4T6lSPVHVPXlgHULFnSfHizAyGU0hg=;
        b=b/YAhSJ/cVgNVl5cPCQgIzA5hAxd8cxk5UY/bsfaks8b572HPc5yLDu7CqAwcfAFAr
         gijiWrcZTxjd1CZFqrmrtqRKMBFtuZF4D6+KUhR27iDUtwb4U9bwSmMGt406m9NyNXmG
         cku/7+Xpy7s5fo32dXBwLaRbtvJZUw2FYtsVf2JJd5ATM8WkkSylK0Ms2hItvZMKY6LJ
         U80HSCCVTS0yqjGOBvBbLp09U7Ae+1MxffalIynMjS7Yi5/snA6qQ7jozyKrvrC8AABj
         m7d7PpBE2tBVPCfi8wOgDTqyelPm6iGAgLvsjJgNU7bmrVCI1EMLurWVGvguw+jH3L5V
         Ldhg==
X-Gm-Message-State: APjAAAXIZ1odThDjN+gaxWf0ytwy/3C8uQFX50n9nihPt20UbU9CPjuf
        w4Kix28V6L8mqBxXrpGeK5H8bA==
X-Google-Smtp-Source: APXvYqz33HioT48RXV/AkDamtjCdumAIK3ppi3Q+UqUVT538LwYEY3/vW7NqUhgVByAGLe4va+taaA==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr15491628wrr.177.1573464337262;
        Mon, 11 Nov 2019 01:25:37 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id c144sm17688792wmd.1.2019.11.11.01.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:36 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V10 6/8] backlight: qcom-wled: Add support for WLED4
 peripheral.
Message-ID: <20191111092529.GT18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-7-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> WLED4 peripheral is present on some PMICs like pmi8998 and
> pm660l. It has a different register map and configurations
> are also different. Add support for it.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 255 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 253 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
