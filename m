Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA8E1B9B1A
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 10:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgD0I5L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 04:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgD0I5K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 04:57:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA10C061A10;
        Mon, 27 Apr 2020 01:57:10 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y24so19562180wma.4;
        Mon, 27 Apr 2020 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jcofdwz9+t05uTAvna4ymutVAwmekuIi4pNGc9/MH88=;
        b=Q5d4M2jz0Wl+6clQyaBEO2kE27ihpH/n/zKCNoR5NFAAQD625a4A/+auWeg6qrJawA
         jGR2qBn0JrZnYf7qSaaPjd+QHediUI2IHZMSBuRMhYjEYXJF/abFd8uW6qj3Q4k/2FIc
         HfOyQQFh7Om6oOkXvwLf00BmlW6ynC3vAylSpTpgjxiaMSxlssL1culT6yEle+zkt+G7
         VWBMAI6HDXZNoIv1OZLghE1QmeHNhmQ06ca2JAS9uWxvSmCtibky3Aj9f2WMJnQAe9E3
         Wgo4xlTuB9g6fG1VUUti0HpHlJBu1+C5r6cQlAs1aTEfXIAnzU7vlviA5I9kmmKntLoa
         86pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jcofdwz9+t05uTAvna4ymutVAwmekuIi4pNGc9/MH88=;
        b=AKPjCrH4QVE1HqtQef474cgSQ8OqGP/P6gMOb2zC7hbv8jy3NuLf9ODNTNdnZXabN8
         v7SrTifDwJS73XwSjvw1g8dD26yyNuDauei9T1FIpW3URT6FnynXvzdGxXuMz/nVROJM
         UZkrIjQPtnGWVK2Nvg3iG+fFhf130xAW/xEGAChAf9TbCKzkP6od2r8FdoIyVGDKCBEy
         FuzG/1G6eCoNCLqXPC/UFB8UU8X0WpaZdvJj9EqIbUVStcDFnbmSvVuWO4xymPHl4zPO
         +4QT/v+Yr7xsGwwPjANJUxS2y7C/GKYLJeCUucN5l7hS0UNw1R0znzhtO5f8ES4uz7LQ
         RH6Q==
X-Gm-Message-State: AGi0PuZU/RzNQK9cBhVLs7RQtjvCsOSe3SINxDggAfaYJw06HcNx6aNU
        ebPN9js65/LP5QKwt2QTWmdasevH
X-Google-Smtp-Source: APiQypIwXrjjInfbjfDk9B1skhirM2+uI+xE5YfNG3+dy/5UjcY8PBtYZfDkyuRvwRt/tiB7c3z8UQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr25177578wmg.177.1587977829209;
        Mon, 27 Apr 2020 01:57:09 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id i129sm15502103wmi.20.2020.04.27.01.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 01:57:08 -0700 (PDT)
To:     wens@kernel.org
Cc:     devicetree@vger.kernel.org, dmurphy@ti.com, heiko@sntech.de,
        jacek.anaszewski@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rockchip@lists.infradead.org, pavel@ucw.cz,
        robh+dt@kernel.org, wens@csie.org
References: <20200427073132.29997-3-wens@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC
 numbering for LED triggers
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
Date:   Mon, 27 Apr 2020 10:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427073132.29997-3-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Chen-Yu,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> With SDIO now enabled, the numbering of the existing MMC host controllers
> gets incremented by 1, as the SDIO host is the first one.
> 
> Increment the numbering of the MMC LED triggers to match.
> 
> Fixes: cf3c5397835f ("arm64: dts: rockchip: Enable sdio0 and uart0 on rk3399-roc-pc-mezzanine")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts | 8 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi          | 4 ++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> index 2acb3d500fb9..f0686fc276be 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> @@ -38,6 +38,10 @@ vcc3v3_pcie: vcc3v3-pcie {
>  	};
>  };
>  
> +&diy_led {
> +	linux,default-trigger = "mmc2";
> +};
> +
>  &pcie_phy {
>  	status = "okay";
>  };
> @@ -91,3 +95,7 @@ &uart0 {
>  	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
>  	status = "okay";
>  };
> +
> +&yellow_led {
> +	linux,default-trigger = "mmc1";
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> index 9f225e9c3d54..bc060ac7972d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> @@ -70,14 +70,14 @@ work-led {
>  			linux,default-trigger = "heartbeat";
>  		};
>  

> -		diy-led {
> +		diy_led: diy-led {

This changes an existing nodename into something that is still not the
preferred way. In the current Rockchip dts there are nodenames like
'work', 'yellow' that causing warnings with the command:

make -k ARCH=arm dtbs_check

Could you give a generic guide line/example, so all these changes are
treated the same way? As if the naming follows the preferred 'led-0' line.

>  			label = "red:diy";
>  			gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  			linux,default-trigger = "mmc1";
>  		};
>  
> -		yellow-led {
> +		yellow_led: yellow-led {
>  			label = "yellow:yellow-led";
>  			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
> -- 
> 2.26.0

