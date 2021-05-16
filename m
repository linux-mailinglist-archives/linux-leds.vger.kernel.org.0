Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5E5381FA5
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 18:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhEPQNf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 12:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhEPQNa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 May 2021 12:13:30 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451B8C061573;
        Sun, 16 May 2021 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=d4OZD5riXl65efBOBwCRlO9nqI7E8GwVLu0CAdMjZhg=; b=c/vrhmw6yq8QTXzFKzSKuvcW82
        WgFJrNvo4Hze5poZQKSFTJLhfVAnDeLH79tbMgkGjfGqvibY8K3C+SiPosz823nw80KH9Fqm/blhc
        yr4ZaJ5X80WRxWD64H64zLt48ovonAYV65qKDTENWec/kKgDMpF1eY0dUrBtZn99TVTESC42GzeRk
        zOe7KvGCJQYfLwhYzqpqaPZuKrKaaF8OYCSsx/28qvOauS4YlwOFMvsGUG8yBhFn3wQmSDiSo4Sov
        ZHIG4G+xmqzMRHmSa3/K7hByFggKAlyegFmlz1TdYFA1RSmIkOqBLeK/YUQbioLnSetM43op5/Kfl
        Uv0+K9Eg==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liJNC-00D1u3-BA; Sun, 16 May 2021 16:12:10 +0000
Subject: Re: [PATCH 01/17] staging: add support for NUC WMI LEDs
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <7cec257fcc6e5789e5620495674e442a727a766f.1621161037.git.mchehab+huawei@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <585a7a4d-29dd-669a-fc0e-d4fdab84b3f1@infradead.org>
Date:   Sun, 16 May 2021 09:12:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7cec257fcc6e5789e5620495674e442a727a766f.1621161037.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Mauro,

On 5/16/21 3:53 AM, Mauro Carvalho Chehab wrote:
> diff --git a/drivers/staging/nuc-led/Kconfig b/drivers/staging/nuc-led/Kconfig
> new file mode 100644
> index 000000000000..0f870f45bf44
> --- /dev/null
> +++ b/drivers/staging/nuc-led/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config LEDS_NUC_WMI
> +	tristate "Intel NUC WMI support for LEDs"
> +	depends on LEDS_CLASS
> +	depends on ACPI_WMI
> +	help
> +	  Enable this to support the Intel NUC WMI support for

Don't use "support" 2 times. Maybe:

	  Enable this to support the Intel NUC WMI interface for
or
	  Enable this to build the Intel NUC WMI support for


> +	  LEDs, starting from NUCi8 and upper devices.

Does "upper" mean "later"?  Or more advanced?  Not clear.


> +
> +	  To compile this driver as a module, choose M here.

thanks.
-- 
~Randy

