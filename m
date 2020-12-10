Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521D42D5165
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 04:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbgLJDct (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Dec 2020 22:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729219AbgLJDcs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2020 22:32:48 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEA2C0613D6
        for <linux-leds@vger.kernel.org>; Wed,  9 Dec 2020 19:32:08 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id e2so2914265pgi.5
        for <linux-leds@vger.kernel.org>; Wed, 09 Dec 2020 19:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kei1zI7Wc1yA9DIt1u6wEo8G7ei+JB/TuTW/pNfEG38=;
        b=GXW8aihJdzl/BXXv+P3XGw3leUud7Fus0B3jXf8co2YxUx7CxB7wwgkxkgTAhRDc3n
         N4+9lVP50nG43dew+HEw2geYOqZtcn3hCJahGwvPUfUvxr52HWsdsE8pdtOsHkz9HHVx
         FqW21EY2dq5i9P/B+xWHVfGmkfoNdCbwEY7ySLvXfNKqa5hsl6P6vQh+puxHMfTtTPoO
         HB6ydqFv+nYyV2LS91STJWoW7jrwgtqW2w6UUSu3RQ4c67kNz5HEA6LeykLwnznZKJBO
         2nBi1FRFVQO5gvfJqSX51BkSLJ3uq1jtuljmqgzLvEnNHWlBKDezfBz7aRzsdzVUhhqu
         +lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kei1zI7Wc1yA9DIt1u6wEo8G7ei+JB/TuTW/pNfEG38=;
        b=bZ4HjpidrLW/aSbpMHoMUYJzTiVCqpuF1m4YgLcdEmSpCKu3U2G41uF3g9G+Giq+mn
         hzbrJ/F8EPdwhgMvUx6wYOr/SlSQB7pCy++W1iogAM1yFTPVOkfVvknTdyvZ1BP5Ddqr
         gamXpZzzTkMscH24OwYsLMb8ilKocuaK7L3N0rfZdlsN9/QQDWL4UFYg+KATokFShQE/
         Rq/+8J/NTJ5MGL8Ohd1qZjnjjbswG34Yqlf2gTUyi3zn1SAL1s2Y5umKSwoMPazx8hi9
         iha6WhuLu8gvDQfsfx62jJKypkIh9BvBdwzyT20LZfunwkkQef4ChwFp4RypGtWNhTvP
         xN9Q==
X-Gm-Message-State: AOAM530fiOiL6yuyWqz+RfsjNF7p6ttedNqB029TnZ4V85Jvag8gtz5y
        /dE4OBEh4g4JGl+8AIOOKunA
X-Google-Smtp-Source: ABdhPJzhwTaG20AqfqOFYAIot99tvXjpCBa9y5FySoibVEXxG91zkufEi3DI3EfSwl/CD6db7xR3Jw==
X-Received: by 2002:a17:90a:d145:: with SMTP id t5mr840291pjw.104.1607571128145;
        Wed, 09 Dec 2020 19:32:08 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id w9sm3932422pjq.0.2020.12.09.19.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:32:07 -0800 (PST)
Date:   Thu, 10 Dec 2020 09:01:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Darshak Patel <darshak.patel@einfochips.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guodong Xu <guodong.xu@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/1] dt-bindings: leds: add onboard LED triggers of
 96Boards
Message-ID: <20201210033157.GA6466@thinkpad>
References: <20201210031203.1901-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210031203.1901-1-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 11:12:03AM +0800, Zhen Lei wrote:
> For all 96Boards, the following standard is used for onboard LEDs.
> 
> green:user1  default-trigger: heartbeat
> green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
> green:user3  default-trigger: mmc1 (SD-card)
> green:user4  default-trigger: none, panic-indicator
> yellow:wlan  default-trigger: phy0tx
> blue:bt      default-trigger: hci0-power
> 
> Link to 96Boards CE Specification: https://linaro.co/ce-specification
> 

This is just a board configuration and there is absolutely no need to document
this in common LED binding. But if your intention is to document the missing
triggers, then you should look at the patch I submitted long ago.

https://lore.kernel.org/patchwork/patch/1146359/

Maybe I should resubmit it again in YAML format. (thanks for reminding me :P)

Thanks,
Mani

> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Darshak Patel <darshak.patel@einfochips.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index f1211e7045f12f3..525752d6c5c84fd 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -97,6 +97,16 @@ properties:
>          # LED alters the brightness for the specified duration with one software
>          # timer (requires "led-pattern" property)
>        - pattern
> +        #For all 96Boards, Green, disk-activity(onboard-storage)
> +      - mmc0
> +        #For all 96Boards, Green, SD-card
> +      - mmc1
> +        #For all 96Boards, Green, panic-indicator
> +      - none
> +        #For all 96Boards, Yellow, WiFi activity LED
> +      - phy0tx
> +        #For all 96Boards, Blue, Bluetooth activity LED
> +      - hci0-power
>  
>    led-pattern:
>      description: |
> -- 
> 1.8.3
> 
> 
