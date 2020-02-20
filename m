Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99C6166445
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 18:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgBTRV4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 12:21:56 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45578 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgBTRV4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 12:21:56 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KHLnpW048277;
        Thu, 20 Feb 2020 11:21:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582219309;
        bh=4j5Z5QPrsJ4mX7f3bvBAa5VKci5vukcFYVXBqcHYffU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y6qp5VTC2QjGw285jZKuCXZE9iY2qG3ip/0lZybTHgeNUwSifVGaY3oXroFml3BNa
         1gO9xYP0pCENHUUuzKXOgcozOJGRsrGrIRY1LYBp5ZNR7MhzgjitJ1xEdRK69aDTkk
         av3qMm0JArN5b9wbdX9y54A7OSEDm/9BaSfaQU8I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KHLnAc057372
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Feb 2020 11:21:49 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 11:21:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 11:21:48 -0600
Received: from [128.247.59.107] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KHLmZ2017634;
        Thu, 20 Feb 2020 11:21:48 -0600
Subject: Re: [PATCH 2/2 v3] leds: ns2: Convert to GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
References: <20200220150833.56542-1-linus.walleij@linaro.org>
 <20200220150833.56542-2-linus.walleij@linaro.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2c94137f-e31a-8cc5-2a4f-d508e0dd276e@ti.com>
Date:   Thu, 20 Feb 2020 11:16:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220150833.56542-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 2/20/20 9:08 AM, Linus Walleij wrote:
> This converts the NS2 LED driver to use GPIO descriptors.
> We take care to request the GPIOs "as is" which is what
> the current driver goes to lengths to achieve, then we use
> GPIOs throughout.
>
> As the nodes for each LED does not have any corresponding
> device, we need to use the DT-specific accessors to get these
> GPIO descriptors from the device tree.
>
> Cc: Vincent Donnefort <vdonnefort@gmail.com>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Dan Murphy <dmurphy@ti.com>


