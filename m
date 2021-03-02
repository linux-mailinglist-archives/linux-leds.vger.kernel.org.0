Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCF432B21D
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhCCCie (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376812AbhCBH6n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Mar 2021 02:58:43 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B29C061788;
        Mon,  1 Mar 2021 23:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=rhlwE/b5Kqhduod4L+O1ILEhT3IDuhaH906wqzPYzww=; b=miw/oSZpMOA0MeKHSnFBuvn5wm
        5ohigUePTxsp/wzvywTrHd+Rjr4UFEn/ZhyjMwUGzMrc3smeIXIGM8FHqQgHVPqq8ZL3iX5gm+KBk
        DGy7YupoHvd+o1wTnB1utod4+57mN7qhAFKAxzb40yL2+qD4Vi0tJtwrxVX1KPLHL1w5vHQAdi92w
        tzqEevwGjs6c43EtsXUxD7r/5NQOif2v68JVZplBc5uQZ/IHKoueT+0eYiL2XLgZujFNGtxILUwwW
        KP2fwWcZExd22v8NegrfDS2U/AtljqS8FI8liIn07I2FsOvwC2l9ttJn3W8gThaOkRA/kcxc+CWny
        9DknZx4w==;
Received: from [2601:1c0:6280:3f0::297d]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lGzuE-0000CF-Lm; Tue, 02 Mar 2021 07:57:22 +0000
Subject: Re: drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has
 incomplete type 'struct gpio_chip'
To:     Pavel Machek <pavel@ucw.cz>, kernel test robot <lkp@intel.com>,
        linux-leds@vger.kernel.org
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
References: <202102280329.hv7RoHLA-lkp@intel.com> <20210228082913.GA27151@amd>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c4071c07-e882-96ca-a8fb-34ad1525305f@infradead.org>
Date:   Mon, 1 Mar 2021 23:57:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210228082913.GA27151@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2/28/21 12:29 AM, Pavel Machek wrote:
> Hi!
> 
>>>> drivers/leds/blink/leds-lgm-sso.c:263:3: error: implicit declaration of function 'gpiod_set_value' [-Werror,-Wimplicit-function-declaration]
>>                    gpiod_set_value(led->gpiod, val);
>>                    ^
>>    drivers/leds/blink/leds-lgm-sso.c:263:3: note: did you mean
>>                    'gpio_set_value'?
> 
> 
> It looks like missing #include?
> 
> While at it, can you do something with Kconfig help text? Move
> existing one into comment in the driver, add something useful for end-users.

The .config file does not set/enable GPIOLIB nor OF.

AFAICT, this driver needs the addition of:

#include <linux/gpio/consumer.h>
#include <linux/gpio/driver.h>
#include <linux/of.h>

and the reference to
	gc->of_node           = dev->of_node;
needs to be inside an
#ifdef CONFIG_GPIO/#endif block.

Also, <linux/gpio/driver.h> needs a stub for gpiochip_get_data().

I have most of that ready (it's in the margin) but I can't
send it tonight. Feel free to fix it up however you want to.

-- 
~Randy
