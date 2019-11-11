Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9304AF7099
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfKKJZq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:25:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41842 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbfKKJZq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:25:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id p4so13748064wrm.8
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QGA/xqmQWev+0NFe4O1TN1YKQ6mW88MJOuhnNp+1ZuI=;
        b=Dfb6+7G14s79tYoH7BzweIeHFTtFG/h2mFENKgZ0C0904ffsK6FkL59yC85qrY1nR5
         q+uIXQu2za9et+lvd+dfO/dSzilQY7Iit+HH4PRs+fPNg5lruFzEJ1m2cjQHE1gvtLV3
         HigANxoBR/CSRpKK2yMZfdhcM2YUBY11kovpoubO7X5Cu5uVVkGWuWzlQjiii04p+91T
         NbfSb1MFU8zaLi1WFs5y9QM4YIoT7bbAPhzLzmez+UNK1vAbSgIgILevTFRAggx9goFM
         qwon6dX5/ysVYJmJZUP0943hXU4mNrBYplzITJSJRO2e/RvC+5X8WVXsidjpxUXLFR2t
         adbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QGA/xqmQWev+0NFe4O1TN1YKQ6mW88MJOuhnNp+1ZuI=;
        b=HImggQ/9DSeMmp3lJhEGtHx7bAfiQDoppvnbTOhmLmvuDgxEOXOAWnkG36c67uN/VY
         ibFX5zBMdCoRBoiZTIoozvNrudnJAjSA7G5V3xHlvdod/Q0nwJN0q6uOOP2Bm+u4IEM/
         31P/hiCDWh1ntN80xvMrVXziFhOA/vU1vH1kIh/fljP2VKxByCRIi9ZqzddzE/AUto1n
         BNU/gaw2PRT6y5yhj64kJf6gz4ZAzQjVA0SW+V+rXUmjarckPxN32l1BcynDFuKKJXGI
         wsZj+A6q2nBxzB0b0MwpVWv8GKMXsOm0A/8/NihhK0zRRshonNBQOlkabescaEZgNzBc
         UGTQ==
X-Gm-Message-State: APjAAAUYe3I9ZSAATAGXh2x1l7WB3UNGmjVBz8lIHwYQECumcetJu4iH
        eqdtto2s9UI6N7KlX6txaNRcdQ==
X-Google-Smtp-Source: APXvYqx6jDtFgEhErFSeyKkbV8ZV9CUx1Pyx244vdqrZIIvJ1ES7y4XaSdZ6WWpMzxcI9s4XD6bHhA==
X-Received: by 2002:adf:ef0e:: with SMTP id e14mr4205640wro.204.1573464344370;
        Mon, 11 Nov 2019 01:25:44 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id x6sm13916940wrw.34.2019.11.11.01.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:43 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:36 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V10 7/8] backlight: qcom-wled: add support for short
 circuit handling.
Message-ID: <20191111092536.GU18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-8-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-8-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> Handle the short circuit interrupt and check if the short circuit
> interrupt is valid. Re-enable the module to check if it goes
> away. Disable the module altogether if the short circuit event
> persists.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 144 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
