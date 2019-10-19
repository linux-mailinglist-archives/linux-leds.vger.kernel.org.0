Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0561DD9C2
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2019 19:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfJSRNG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Oct 2019 13:13:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53790 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfJSRNG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Oct 2019 13:13:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id i16so9127163wmd.3
        for <linux-leds@vger.kernel.org>; Sat, 19 Oct 2019 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vgrO/HwhHDD8Uj/4o5QdclhRIA4cb+1ZstoyfFd3g4o=;
        b=PHlAzg8gP0bOGOiGmUKxv1dn8ff4WMUssFlfOwO4EVD39JUm+U0vkENgd6kPfXz/Bm
         d35rZH0JPVjnETwyH0rdBP/4a3z9WLUjfCcKZsFVT4gxpYoDsqPegGjiEjWBqDZe6cBT
         pqPdhml3CbztAkzRUIObFldvuKA/AIF6e/S/xDhTC/2HutIOQiCljiyZHGuTuzbfRaHq
         jZepTKIqTD+1EhzMN8ve64pvcrKHdFXEmXCmYG0lPEK9IiPfl4IS46oaUdSm/LL9BHFd
         OjqvtqUnNc/9bT+r30WF5fJz5O3ZmuqnUUVvXS6TIB4uY7QLGzFQVmHfts++WPb1HzWk
         dm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vgrO/HwhHDD8Uj/4o5QdclhRIA4cb+1ZstoyfFd3g4o=;
        b=EzWdaegdB0r2G0Yr8WWMdiqRPHTV6GSWttvfZLpMXgLdp/3TnEzW4NLznwM2XmhBgt
         2RGyqsXxboHmaGG0H61rsJL5woqLNLvTQBZpDx15bKLEbtx/WlQIZmAkSuJrXqZlKSWM
         /XN8i9cySEKlOg3Ty94OUHp7cY6WDLaztBAT8740feE0DBQ4k0wu1WhnGl3fwMjyQd+O
         40fji3PIXCmZlxqPZckW5/nbcS36twKJ8LPAL0SDouHQAVFY282ifLoGfZJhDazc7vEZ
         3Xu6B+q6N0aOpMAQ2ELh7/epgQEByHrpYT4+gB0+PA7KA2RfZUVb/k8zmsj5vYWHV/xG
         U1Zg==
X-Gm-Message-State: APjAAAVg8vWRd3oElcLf/5lZNq28KtLjlFoqPD63A7N4LNn96veUqSP1
        SLzIcb2s47rTQ2rcTkuBy3H31Bgg
X-Google-Smtp-Source: APXvYqzslVajqCLxSyk+UpM3OolgtECqXSrboQuUWzuaBEJXJuxyl2xsKOhUykhOqnN0aloBTa832w==
X-Received: by 2002:a1c:990a:: with SMTP id b10mr12039046wme.39.1571505182998;
        Sat, 19 Oct 2019 10:13:02 -0700 (PDT)
Received: from [192.168.1.19] (bdt81.neoplus.adsl.tpnet.pl. [83.28.5.81])
        by smtp.gmail.com with ESMTPSA id 3sm8360459wmo.22.2019.10.19.10.13.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Oct 2019 10:13:02 -0700 (PDT)
Subject: Re: [PATCH v12 06/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org
References: <20191011130657.4713-7-dmurphy@ti.com>
 <201910141723.wxRNtgEe%lkp@intel.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b71aa86c-515d-2ad3-2d1b-da312d9b3f1f@gmail.com>
Date:   Sat, 19 Oct 2019 19:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910141723.wxRNtgEe%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

Below compilation errors are occurring also for v14.
Did you compile-test it at least?

On 10/14/19 11:17 AM, kbuild test robot wrote:
> Hi Dan,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on j.anaszewski-leds/for-next]
> [cannot apply to v5.4-rc3 next-20191011]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v12/20191014-103058
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
> config: sparc64-allmodconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sparc64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers//leds/leds-lp50xx.c:360:27: error: initializer element is not constant
>       .lp50xx_regmap_config = lp5012_regmap_config,
>                               ^~~~~~~~~~~~~~~~~~~~
>    drivers//leds/leds-lp50xx.c:360:27: note: (near initialization for 'lp50xx_chip_info_tbl[0].lp50xx_regmap_config')
>    drivers//leds/leds-lp50xx.c:371:27: error: initializer element is not constant
>       .lp50xx_regmap_config = lp5012_regmap_config,
>                               ^~~~~~~~~~~~~~~~~~~~
>    drivers//leds/leds-lp50xx.c:371:27: note: (near initialization for 'lp50xx_chip_info_tbl[1].lp50xx_regmap_config')
>    drivers//leds/leds-lp50xx.c:382:27: error: initializer element is not constant
>       .lp50xx_regmap_config = lp5024_regmap_config,
>                               ^~~~~~~~~~~~~~~~~~~~
>    drivers//leds/leds-lp50xx.c:382:27: note: (near initialization for 'lp50xx_chip_info_tbl[2].lp50xx_regmap_config')
>    drivers//leds/leds-lp50xx.c:393:27: error: initializer element is not constant
>       .lp50xx_regmap_config = lp5024_regmap_config,
>                               ^~~~~~~~~~~~~~~~~~~~
>    drivers//leds/leds-lp50xx.c:393:27: note: (near initialization for 'lp50xx_chip_info_tbl[3].lp50xx_regmap_config')
>    drivers//leds/leds-lp50xx.c:404:27: error: initializer element is not constant
>       .lp50xx_regmap_config = lp5036_regmap_config,
>                               ^~~~~~~~~~~~~~~~~~~~
>    drivers//leds/leds-lp50xx.c:404:27: note: (near initialization for 'lp50xx_chip_info_tbl[4].lp50xx_regmap_config')
>    drivers//leds/leds-lp50xx.c:415:27: error: initializer element is not constant
>       .lp50xx_regmap_config = lp5036_regmap_config,
>                               ^~~~~~~~~~~~~~~~~~~~
>    drivers//leds/leds-lp50xx.c:415:27: note: (near initialization for 'lp50xx_chip_info_tbl[5].lp50xx_regmap_config')
> 

-- 
Best regards,
Jacek Anaszewski
