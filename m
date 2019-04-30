Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36EEA10042
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfD3TX7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:23:59 -0400
Received: from merlin.infradead.org ([205.233.59.134]:40490 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbfD3TX6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=K0RNjyUll5aDCjmRwi+J20LGvjFWiTJEeYNpCB4vcxA=; b=f1AUFZQmUWk5VKCf9u613FlVxt
        nMEFPXCeWeZQU/wTKt9PhTYkapuMYhbNOhXSP0VRaXgaE2TE3Io+J0b9P3ND8WCsQNBitIaBqLqJv
        s4nanC0nv8ECigLtKlIGFQdXbmrt4NCF5VEpOlon78579/PxdtbWLboOtQMO4VLQsGtkkkI0zR8zS
        FxAdqbLTnC82HsihCQlhY0pNV2Zf+xlUbvzfpVL39nffsHPb66K+CHZ/Y/Uv8boqcJg2Eg1Tye9dc
        ULrvxF9eqvPrVfenJklbHf7esxKN3a4asInvO2oc4afEg1jCHpJWXVjtk+Zqz3Be81T1P0QmblWN4
        /T0j6aaw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hLYM7-0002w9-TQ; Tue, 30 Apr 2019 19:23:56 +0000
Subject: Re: [PATCH v3 4/7] leds: TI LMU: Add common code for TI LMU devices
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-5-dmurphy@ti.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
Date:   Tue, 30 Apr 2019 12:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430191730.19450-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/30/19 12:17 PM, Dan Murphy wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index da00b9ed5a5c..3ae24eaf4cde 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -776,6 +776,14 @@ config LEDS_NIC78BX
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-nic78bx.
>  
> +config LEDS_TI_LMU_COMMON
> +	tristate "LED driver for TI LMU"

what does LMU mean?

> +	depends on REGMAP
> +	help
> +          Say Y to enable the LED driver for TI LMU devices.
> +          This supports common features between the TI LM3532, LM3631, LM3632,
> +	  LM3633, LM3695 and LM3697.

Fix help indentation above to use tab + 2 spaces consistently.

>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"


thanks.
-- 
~Randy
