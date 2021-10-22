Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC3A437BC4
	for <lists+linux-leds@lfdr.de>; Fri, 22 Oct 2021 19:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbhJVRXS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Oct 2021 13:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbhJVRXQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Oct 2021 13:23:16 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D27AC061348
        for <linux-leds@vger.kernel.org>; Fri, 22 Oct 2021 10:20:58 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id g125so5887339oif.9
        for <linux-leds@vger.kernel.org>; Fri, 22 Oct 2021 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z4mIXFa4iFtG0/3MwjffVdtreROCML6cO1oSaovl7kw=;
        b=XOzPRrO+Dvgdv3N4+FSroOWjBFonbuNYcEmpzvPV6UGjh253V/4q5E9p8PiTGIBpHC
         rOILz6x6sIFB9QWjRemrSUyUcvHTStC+p5kboTvkRdIwK4F07acGSnS6RUa+aq0CodDx
         04hutEYEf4NNzk0mCmzM3/lVOITwnf8xljYzwwEhF06r5W2jIMvc+Zbh+ixBi/5ZjqIB
         9g7HFYayHuHrepHGvKKOXbgp6yWBjT3e/mpUwRbb+43i9U2C37hUvL55kyhWd9gwwDsl
         I/8YdJzBjaDSHAKBgCLhb64AHVu3+pqDpdrNJjWI30WsyEQw9XefCACVP3kJpw4iaXTF
         U7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z4mIXFa4iFtG0/3MwjffVdtreROCML6cO1oSaovl7kw=;
        b=t7jq0y4/E84+038KkeBYaAQX/VLnm53RGQyf7b95EEWdl/Cp8nn1CTr1QxgIL2+8Aj
         RpbxqEj2OH9v1v8VIDbpbhDIyoZWBgf8Z8XAtC0dzbSw5AgibbszEqcifAoSV5Zy3ogL
         yKviaQ2h32wEY0vxKSBzrM+dMy9zl1cdquh9TeA4uzIn1tu9oqeOmkO8FTmu7TnAWYi9
         NL3fs+hgRBLxiRitM9ogGYVceK+Ts2gvjAopKzBUbsFZsfMkCjrCIUR8iml8sJ1v8VwI
         6eDfqFjfhwPVn2l5OlUwJ2dBEuyQ9PI+ETuv8pw6SRliFqxBBlvGRBT79Du7VsbtiGZ6
         EUBQ==
X-Gm-Message-State: AOAM5300XReiR/8hAiA7nWPsjykVVMtHA8FuuEglyV95iLvR/PFmSxHB
        9zURtrOlAZSlv8tJ+68q1uelqg==
X-Google-Smtp-Source: ABdhPJyR2plvLY6BCo2Ofj58TKpqgSWaXCB+Dm622BxD1FqjVK5Fs30d1anipkQ7nPlZrg6E+bkBFw==
X-Received: by 2002:a05:6808:188a:: with SMTP id bi10mr11093696oib.9.1634923255751;
        Fri, 22 Oct 2021 10:20:55 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id c37sm1871895otu.36.2021.10.22.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:20:55 -0700 (PDT)
Date:   Fri, 22 Oct 2021 10:22:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>, swboyd@chromium.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/3] leds: Add pm8350c support to Qualcomm LPG driver
Message-ID: <YXLzXWzq6BQqZsmY@ripper>
References: <1634640531-15813-1-git-send-email-skakit@codeaurora.org>
 <1634640531-15813-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634640531-15813-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue 19 Oct 03:48 PDT 2021, Satya Priya wrote:

> From: satya priya <skakit@codeaurora.org>
> 
> Add pm8350c compatible and lpg_data to the driver.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V2:
>  - Added const for lpg_channel_data[] struct.
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 45ef4ec..99235af 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1275,9 +1275,19 @@ static const struct lpg_data pm8150l_lpg_data = {
>  	},
>  };
>  
> +static const struct lpg_data pm8350c_pwm_data = {
> +	.pwm_9bit_mask = BIT(2),
> +
> +	.num_channels = 1,

No, this should be 4. The fact that you only care about the first
channel in your product should be reflected in the dts, not in the
driver.

Thanks,
Bjorn

> +	.channels = (const struct lpg_channel_data[]) {
> +		{ .base = 0xeb00 },
> +	},
> +};
> +
>  static const struct of_device_id lpg_of_table[] = {
>  	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
>  	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
> +	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
>  	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
>  	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
>  	{ .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
