Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF09F25E8CE
	for <lists+linux-leds@lfdr.de>; Sat,  5 Sep 2020 17:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgIEPkB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Sep 2020 11:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbgIEPjv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2020 11:39:51 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE05FC061244;
        Sat,  5 Sep 2020 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=OJk9TTLQ9xgrA+aOjdmiWfTtS6Aas0vmcrYJZyJpaCo=; b=pOsRHej6am5MpflUAsLFgYEMvL
        xPCt3aJ+T7xH0h11aoZKHrcMp2S8iOjo2pPa9fAEhXCWMuSo3MZSwIT21KlY+iUnv5BlcN81fVcD2
        wl/bDJovHBudLkBHzyj9gTXg+oYXguT8Spf3nKgJ7+ifbWAJlOKiEtpean43Mig4to6Oehs2KJOhg
        k/Rocsq7R5cSClq4zv4KZ6YrhPXhO5+rUgH9ptV3W2VYHvsXYumE2b1Z1fumgdjNs+5crGklPaP+1
        7nCqDCsUGTNlS4xW0K5Y1YzfDP6aFUtYHRiQTJn6EqPhtN7y93v1/ezoRsMLBLCyO2RX/e+2SWwWP
        iGm8qQpQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kEaHj-00031B-Qp; Sat, 05 Sep 2020 15:39:24 +0000
Subject: Re: [PATCH 2/7] drivers: mfd: Add a driver for iEi WT61P803 PUZZLE
 MCU
To:     Luka Kovacic <luka.kovacic@sartura.hr>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-3-luka.kovacic@sartura.hr>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <69860c3a-722a-05d9-ab35-5ede7dc35b71@infradead.org>
Date:   Sat, 5 Sep 2020 08:39:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200905130336.967622-3-luka.kovacic@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/5/20 6:03 AM, Luka Kovacic wrote:
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 33df0837ab41..3fcda95f07a3 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2118,5 +2118,13 @@ config SGI_MFD_IOC3
>  	  If you have an SGI Origin, Octane, or a PCI IOC3 card,
>  	  then say Y. Otherwise say N.
>  
> +config MFD_IEI_WT61P803_PUZZLE
> +	tristate "iEi WT61P803 PUZZLE MCU driver"
> +	depends on SERIAL_DEV_BUS
> +	help
> +	  iEi WT61P803 PUZZLE is a system power management microcontroller
> +	  used for fan control, temperature sensor reading, led control

	                                                    LED
please.

> +	  and system identification.
> +
>  endmenu
>  endif


thanks.
-- 
~Randy

