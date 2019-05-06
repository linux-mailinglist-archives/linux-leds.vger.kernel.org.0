Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7711146BE
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 10:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfEFIs4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 04:48:56 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:60087 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725883AbfEFIsz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 04:48:55 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 235002380CE1;
        Mon,  6 May 2019 10:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557132533;
        bh=g4sR3KEmp55jpRuuCimyu8BzhQ9orUACKVz1gzcoCTg=; l=1254;
        h=Subject:To:From;
        b=p6QJR8o4h0GQORWPtnBToS88/JxMAoS5s7nkzW67pxrzgXID6CeE4/HG7JGsSzUZQ
         C9EOpFBuX/jA/P2CO9XgX7upu88yyk+Zj+lZ63tvdbz7FI3SUCU50S1aiDiSMA9Iu/
         dtrBevMXdTvRPy5qaw6qB5ehSkQJhCMyh0YtEcyo=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com> <20190505201218.GA21957@amd>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <911128ec-1327-5895-d101-97801e9c777a@c-mauderer.de>
Date:   Mon, 6 May 2019 10:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505201218.GA21957@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155713253346.79061.7737743055362938840@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/05/2019 22:12, Pavel Machek wrote:
> Hi!
> 
>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>> +	if (!led)
>>> +		return -ENOMEM;
>>> +
>>> +	led->spi = spi;
>>> +	strlcpy(led->name, name, sizeof(led->name));
>>> +	mutex_init(&led->mutex);
>>> +	led->off_value = off_value;
>>> +	led->max_value = max_value;
>>> +	led->ldev.name = led->name;
>>> +	led->ldev.brightness = LED_OFF;
>>
>> This line is redundant - already zeroed by kzalloc.
> 
> Actually I'd prefer to leave it in. Yes, LED_OFF == 0, and will
> probably stay == 0 in future, but...
> 									Pavel
> 

Before I send v4: Currently the initial value isn't written to the LED
anywhere. The state that is set by U-Boot is just kept till the first
write to the brightness file.

I didn't implement "default-state" because the OpenWRT user space sets
the LED anyway a few seconds later (which is still my use case for that
driver). But now I noted that there is a remark in the documentation of
the option "default-state" in devicetree/bindings/leds/common.txt: "The
default is off if this property is not present."

Should I send an initial value to the device during initialization or is
it OK to just keep the original state?

Best regards

Christian
