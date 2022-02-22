Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7C4C00B2
	for <lists+linux-leds@lfdr.de>; Tue, 22 Feb 2022 18:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbiBVR6Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Feb 2022 12:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbiBVR6X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Feb 2022 12:58:23 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9485317184F
        for <linux-leds@vger.kernel.org>; Tue, 22 Feb 2022 09:57:57 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id w16-20020a056830281000b005ad480e8dd5so8680370otu.9
        for <linux-leds@vger.kernel.org>; Tue, 22 Feb 2022 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G0sUZOsALD4UFQRtotXeV1X/0UXxK/QgZJrwgrz4140=;
        b=DuBuoIvHryLqfPzS6MUwZmm8TXoIyuiEhXAwbXz7hAjfXtKOrQqrNGMrOC4e0ZnGdn
         MDzAuW67IdjnXtJiKXYTr3TR+V6nS1Ce1gRJ1gnidhgeDPf10+ouGQFtco1Sxj91Ggl0
         Px4NqnZQSzwAunJ8g674YPvxFPLI1Lfm0gqZGUpyMMdQ91SDTtdkKAjLYiHXd6aqtExV
         f+zC1/dUOTWi/Aw14z3VhX4uBJVEf5HZT4TvEbv33Cs1bBFEMdkiGt5L9PJ5nvk2MnDX
         S08H+4kvv/c4Gou/bgLi8sj8/jJZYVziSShs6DnMDr3CoYZ2/vy+6aLw+Fk547wkckVV
         KgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G0sUZOsALD4UFQRtotXeV1X/0UXxK/QgZJrwgrz4140=;
        b=wJatYwK22g/TXaH/FiajcMKmxCvwE/VPjOczXpRxASD+7xEcynzqDYfvuIefFhrAeC
         uZ7Ceqx0ZgP6tYmdgjNkr07yO66SViZhdkWhhKDIoYZOuU9j1wR1KLhxHgRHG1vGz7B+
         1liVmKI8sUIRrh9e0cVb1dV/XpZq7ZJow3MScjXwz8SVhwDcoCmK+Ff2WZwpKHSvDvAR
         //rW6dBq9RGK+zeBXUHBY+FUwMU/GKeFDCjstLc+ZKJO/52zhkXccFpFMfaVlnjP6Kzh
         ZiEyoIBAHs1m2qx9mgvP9bIiRysxnENIqeEJJa9JZCQQ94qWGaFMgzfsGBGZMJlYZsp/
         GAAQ==
X-Gm-Message-State: AOAM530owL0lErf9LdXlyrt5JAinFk+BshZdV+NQypdRcaqpZzSfLEj4
        VzkeYq1taBTjgKpi4RDx/JcJ5w==
X-Google-Smtp-Source: ABdhPJzgNVbuqWvG0y4QCgsWwA62N0RoFgKktuJ+mZPR6ZTZLHD7UoHJh8DYuBkKlA+3WBA+XP3Kmw==
X-Received: by 2002:a9d:2e6:0:b0:5a3:ccab:78f6 with SMTP id 93-20020a9d02e6000000b005a3ccab78f6mr8788756otl.160.1645552676590;
        Tue, 22 Feb 2022 09:57:56 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id x22sm5662928ooo.20.2022.02.22.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 09:57:56 -0800 (PST)
Date:   Tue, 22 Feb 2022 09:59:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: pm8350c: Add pwm support
Message-ID: <YhUkndDDSSync29w@ripper>
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
 <1645509309-16142-4-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645509309-16142-4-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon 21 Feb 21:55 PST 2022, Satya Priya wrote:

> Add pwm support for PM8350C pmic.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes in V2:
>  - Dropped suffix '4' from pwm phandle and removed "status=ok".
> 
> Changes in V3:
>  - Add reg property.
> 
> Changes in V4:
>  - No Changes.
> 
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index e1b75ae..1ba6318 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -29,6 +29,13 @@
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pm8350c_pwm: pwm@e800 {
> +			compatible = "qcom,pm8350c-pwm";
> +			reg = <0xe800>;
> +			#pwm-cells = <2>;
> +			status = "disabled";
> +		};
>  	};
>  };
>  
> -- 
> 2.7.4
> 
